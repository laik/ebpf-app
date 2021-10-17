#ifndef __SRV6_HELPERS_H
#define __SRV6_HELPERS_H

#include <stdbool.h>
#include <linux/types.h>
#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/udp.h>
#include <linux/ipv6.h>
#include <linux/socket.h>
#include <linux/seg6.h>
#include <linux/seg6_local.h>

#include "bpf_helpers.h"
#include "bpf_endian.h"
#include "srv6_consts.h"

__attribute__((__always_inline__)) static inline void read_v6addr_in_pyload(
    __u8 *payload, struct in6_addr *v6addr, __u16 payload_size, __u16 offset, __u16 shift)
{
    offset = offset & 0xf;
    payload_size = payload_size & 0xf;
    if (sizeof(struct in6_addr) <= offset ||
        sizeof(struct in6_addr) <= payload_size + offset ||
        offset < 0)
        return;

    if (shift == 0)
    {
#pragma clang loop unroll(disable)
        for (__u16 index = 0; index < sizeof(struct in6_addr); index++)
        {
            index = index & 0xf;

            if (payload_size <= index)
                break;

            __u8 *payval1 = (__u8 *)(void *)payload + index;
            __u8 *v6val = (__u8 *)(void *)v6addr + offset + index;
            if (offset + index + 1 >= sizeof(struct in6_addr))
                break;

            *payval1 = *v6val;
        }
    }
    else
    {
#pragma clang loop unroll(disable)
        for (__u16 index = 0; index < sizeof(struct in6_addr); index++)
        {
            index = index & 0xf;

            if (payload_size <= index || payload_size <= index + 1)
                break;

            __u8 *payval1 = (__u8 *)(void *)payload + index;
            __u8 *payval2 = (__u8 *)(void *)payload + index + 1;
            __u8 *v6val = (__u8 *)(void *)v6addr + offset + index;
            if (offset + index + 1 >= sizeof(struct in6_addr))
                break;

            *payval1 |= *v6val >> shift;
            *payval2 |= *v6val << (8 - shift);
        }
    }
}

__attribute__((__always_inline__)) static inline void read_v6addr_in_pkt_pyload(
    __u8 *payload, struct in6_addr *v6addr, __u16 payload_size, __u16 offset, __u16 shift, const __u32 *data_end)
{
    offset = offset & 0xffff;
    payload_size = payload_size & 0xffff;
    if (sizeof(struct in6_addr) <= offset ||
        sizeof(struct in6_addr) <= payload_size + offset ||
        offset < 0)
        return;

    if (shift == 0)
    {
        if ((void *)payload + payload_size > data_end)
            return;

        __builtin_memcpy(payload, &v6addr->in6_u.u6_addr8[offset], payload_size);
    }
    else
    {
#pragma clang loop unroll(disable)
        for (__u16 index = 0; index < sizeof(struct in6_addr); index++)
        {
            index = index & 0xf;

            if (payload_size <= index)
                break;

            __u8 *payval1 = (__u8 *)(void *)payload + index;
            __u8 *payval2 = (__u8 *)(void *)payload + index + 1;
            __u8 *v6val = (__u8 *)(void *)v6addr + offset + index;
            if ((void *)payval1 + 1 > data_end || payval2 + 1 > data_end || offset + index + 1 >= sizeof(struct in6_addr))
                break;

            *payval1 |= *v6val >> shift;
            *payval2 |= *v6val << (8 - shift);
        }
    }
}

__attribute__((__always_inline__)) static inline void write_v6addr_in_pyload(
    struct in6_addr *v6addr, __u8 *payload, __u16 payload_size, __u16 offset, __u16 shift, const __u32 *data_end)
{
    offset = offset & 0xfff;
    payload_size = payload_size & 0xffff;
    if (sizeof(struct in6_addr) <= offset ||
        sizeof(struct in6_addr) <= payload_size + offset ||
        offset < 0)
        return;

    if (shift == 0)
    {
        if ((void *)v6addr + offset + payload_size > data_end)
            return;

        __builtin_memcpy(&v6addr->in6_u.u6_addr8[offset], payload, payload_size);
    }
    else
    {
#pragma clang loop unroll(disable)
        for (__u16 index = 0; index < sizeof(struct in6_addr); index++)
        {
            index = index & 0xf;

            if (payload_size <= index)
                break;

            __u8 *v6val1 = (__u8 *)(void *)v6addr + offset + index;
            __u8 *v6val2 = (__u8 *)(void *)v6addr + offset + index + 1;
            if (v6val1 + 1 <= data_end && v6val2 + 1 <= data_end)
            {
                *v6val1 |= payload[index] >> shift;
                *v6val2 |= payload[index] << (8 - shift);
            }
            else
                break;
        }
    }
}

/* from include/net/ip.h */
__attribute__((__always_inline__)) static inline int ip_decrease_ttl(struct iphdr *iph)
{
    __u32 check = (__u32)iph->check;

    check += (__u32)bpf_htons(0x0100);
    iph->check = (__sum16)(check + (check >= 0xFFFF));
    return --iph->ttl;
};
__attribute__((__always_inline__)) static inline __u16 wrapsum(__u32 sum)
{
    sum = ~sum & 0xFFFF;
    return (sum);
}

// cf. https://github.com/iovisor/bcc/issues/2463#issuecomment-718800510
__attribute__((__always_inline__)) static inline void ipv4_udp_csum_build(struct udphdr *uh, struct iphdr *iph, __u32 *data_end)
{
    uh->check = 0;
    __u32 csum = 0;

    csum = (iph->saddr >> 16) & 0xffff;
    csum += (iph->saddr) & 0xffff;
    csum += (iph->daddr >> 16) & 0xffff;
    csum += (iph->daddr) & 0xffff;
    csum += (iph->protocol) << 8;
    csum += uh->len;

    __u16 *buf = (__u16 *)uh;
    // Compute checksum on udp header + payload
    for (__u32 i = 0; i < LOOP_MAX_RANGE; i += 2)
    {
        if ((void *)(buf + 1) > data_end)
            break;

        csum += *buf;
        buf++;
    }
    if ((void *)buf + 1 <= data_end)
        // In case payload is not 2 bytes aligned
        csum += *(__u8 *)buf;

    csum = ~csum;
    uh->check = csum;
    // csum = (csum >> 16) + (csum & 0xffff);
    // csum += csum >> 16;
    // uh->check = wrapsum(csum);
}

__attribute__((__always_inline__)) static inline void csum_build(struct iphdr *iph)
{
    __u16 *next_iph_u16;
    __u32 csum = 0;
    int i;
    iph->check = 0;
    next_iph_u16 = (__u16 *)iph;
#pragma clang loop unroll(disable)
    for (i = 0; i < (sizeof(*iph) >> 1); i++)
        csum += *next_iph_u16++;

    iph->check = ~((csum & 0xffff) + (csum >> 16));
}

/* Function to set source and destination mac of the packet */
__attribute__((__always_inline__)) static inline void set_src_dst_mac(void *data, void *src, void *dst)
{
    unsigned short *source = src;
    unsigned short *dest = dst;
    unsigned short *p = data;

    __builtin_memcpy(p, dest, ETH_ALEN);
    __builtin_memcpy(p + 3, source, ETH_ALEN);
}

__attribute__((__always_inline__)) static inline struct ethhdr *get_eth(struct xdp_md *xdp)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;

    struct ethhdr *eth = data;
    if (eth + 1 > data_end)
        return NULL;

    return eth;
}
__attribute__((__always_inline__)) static inline struct ipv6hdr *get_ipv6(struct xdp_md *xdp)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;

    struct ipv6hdr *v6h = data + sizeof(struct ethhdr);

    if (v6h + 1 > data_end)
        return NULL;

    return v6h;
};

__attribute__((__always_inline__)) static inline struct iphdr *get_ipv4(struct xdp_md *xdp)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;

    struct iphdr *iph = data + sizeof(struct ethhdr);
    if (iph + 1 > data_end)
        return NULL;

    return iph;
};

__attribute__((__always_inline__)) static inline struct srhhdr *get_srh(struct xdp_md *xdp)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;

    struct srhhdr *srh;
    int len, srhoff = 0;

    srh = data + sizeof(struct ethhdr) + sizeof(struct ipv6hdr);
    if (srh + 1 > data_end)
    {
        return NULL;
    }
    // len = (srh->hdrlen + 1) << 3;

    return srh;
}

__attribute__((__always_inline__)) static inline struct udphdr *get_v4_udp(struct xdp_md *xdp)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;

    struct udphdr *uh = data + sizeof(struct ethhdr) + sizeof(struct iphdr);

    if ((void *)uh + sizeof(struct udphdr) > data_end)
        return NULL;

    return uh;
};

__attribute__((__always_inline__)) static inline struct gtp1hdr *get_v4_gtp1(struct xdp_md *xdp)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;

    struct gtp1hdr *gtp1 = data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct udphdr);

    if ((void *)gtp1 + sizeof(struct gtp1hdr) > data_end)
        return NULL;

    return gtp1;
};

__attribute__((__always_inline__)) static inline struct srhhdr *get_and_validate_srh(struct xdp_md *xdp)
{
    struct srhhdr *srh;

    srh = get_srh(xdp);
    if (!srh)
        return NULL;

    if (srh->segmentsLeft == 0)
        return NULL;

    // TODO
    // #ifdef CONFIG_IPV6_SEG6_HMAC
    // 	if (!seg6_hmac_validate_skb(skb))
    // 		return NULL;
    // #endif

    return srh;
}

__attribute__((__always_inline__)) static inline bool advance_nextseg(struct srhhdr *srh, struct in6_addr *daddr, struct xdp_md *xdp)
{
    struct in6_addr *addr;
    void *data_end = (void *)(long)xdp->data_end;

    srh->segmentsLeft--;
    if ((void *)(long)srh + sizeof(struct srhhdr) + sizeof(struct in6_addr) * (srh->segmentsLeft + 1) > data_end)
        return false;

    addr = srh->segments + srh->segmentsLeft;
    if (addr + 1 > data_end)
        return false;

    *daddr = *addr;
    return true;
}

__attribute__((__always_inline__)) static inline bool lookup_nexthop(struct xdp_md *xdp, void *smac, void *dmac, __u32 *ifindex, __u32 flag)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;
    struct ethhdr *eth = data;
    struct iphdr *iph = get_ipv4(xdp);
    struct ipv6hdr *v6h = get_ipv6(xdp);
    struct bpf_fib_lookup fib_params = {};
    __u16 h_proto;

    //TODO:: impl dot1q proto
    if (data + sizeof(struct ethhdr) > data_end)
        return false;

    h_proto = eth->h_proto;
    __builtin_memset(&fib_params, 0, sizeof(fib_params));

    switch (h_proto)
    {
    case bpf_htons(ETH_P_IP):
        if (!iph)
            return false;

        fib_params.family = AF_INET;
        fib_params.tos = iph->tos;
        fib_params.l4_protocol = iph->protocol;
        fib_params.sport = 0;
        fib_params.dport = 0;
        fib_params.tot_len = bpf_ntohs(iph->tot_len);
        fib_params.ipv4_src = iph->saddr;
        fib_params.ipv4_dst = iph->daddr;
        break;

    case bpf_htons(ETH_P_IPV6):
        if (!v6h)
            return false;

        if (v6h->hop_limit <= 1)
            return false;

        struct in6_addr *src = (struct in6_addr *)fib_params.ipv6_src;
        struct in6_addr *dst = (struct in6_addr *)fib_params.ipv6_dst;

        fib_params.family = AF_INET6;
        fib_params.tos = 0;
        fib_params.flowinfo = *(__be32 *)v6h & IPV6_FLOWINFO_MASK;
        fib_params.l4_protocol = v6h->nexthdr;
        fib_params.sport = 0;
        fib_params.dport = 0;
        fib_params.tot_len = bpf_ntohs(v6h->payload_len);
        *src = v6h->saddr;
        *dst = v6h->daddr;
        break;

    default:
        return false;
    }

    // bpf_fib_lookup
    // flags: BPF_FIB_LOOKUP_DIRECT, BPF_FIB_LOOKUP_OUTPUT
    // https://github.com/torvalds/linux/blob/v4.18/include/uapi/linux/bpf.h#L2611
    fib_params.ifindex = xdp->ingress_ifindex;
    // int rc = bpf_fib_lookup(xdp, &fib_params, sizeof(fib_params), BPF_FIB_LOOKUP_DIRECT | BPF_FIB_LOOKUP_OUTPUT);
    int rc = bpf_fib_lookup(xdp, &fib_params, sizeof(fib_params), flag);

    switch (rc)
    {
    case BPF_FIB_LKUP_RET_SUCCESS: /* lookup successful */
        if (h_proto == bpf_htons(ETH_P_IP))
            ip_decrease_ttl(iph);
        else if (h_proto == bpf_htons(ETH_P_IPV6))
            v6h->hop_limit--;

        *ifindex = fib_params.ifindex;

        __u8 *source = smac;
        __u8 *dest = dmac;
        __builtin_memcpy(dest, fib_params.dmac, ETH_ALEN);
        __builtin_memcpy(source, fib_params.smac, ETH_ALEN);
        return true;
    case BPF_FIB_LKUP_RET_BLACKHOLE: /* dest is blackholed; can be dropped */
        // bpf_printk("BPF_FIB_LKUP_RET_BLACKHOLE");
        break;
    case BPF_FIB_LKUP_RET_UNREACHABLE: /* dest is unreachable; can be dropped */
        // bpf_printk("BPF_FIB_LKUP_RET_UNREACHABLE");
        break;
    case BPF_FIB_LKUP_RET_PROHIBIT: /* dest not allowed; can be dropped */
        // bpf_printk("BPF_FIB_LKUP_RET_PROHIBIT");
        break;
        // action = XDP_DROP;
        // return false;
    case BPF_FIB_LKUP_RET_NOT_FWDED: /* packet is not forwarded */
        // bpf_printk("BPF_FIB_LKUP_RET_NOT_FWDED");
        break;
    case BPF_FIB_LKUP_RET_FWD_DISABLED: /* fwding is not enabled on ingress */
        // bpf_printk("BPF_FIB_LKUP_RET_FWD_DISABLED");
        break;
    case BPF_FIB_LKUP_RET_UNSUPP_LWT: /* fwd requires encapsulation */
        // bpf_printk("BPF_FIB_LKUP_RET_UNSUPP_LWT");
        break;
    case BPF_FIB_LKUP_RET_NO_NEIGH: /* no neighbor entry for nh */
        // bpf_printk("BPF_FIB_LKUP_RET_NO_NEIGH");
        break;
    case BPF_FIB_LKUP_RET_FRAG_NEEDED: /* fragmentation required to fwd */
        // bpf_printk("BPF_FIB_LKUP_RET_FRAG_NEEDED");
        break;
        /* PASS */
        return false;
    }
    return false;
}

__attribute__((__always_inline__)) static inline int rewrite_nexthop(struct xdp_md *xdp, __u32 flag)
{
    void *data = (void *)(long)xdp->data;
    void *data_end = (void *)(long)xdp->data_end;
    struct ethhdr *eth = data;

    if (data + 1 > data_end)
        return XDP_PASS;

    // bpf_printk("rewrite_nexthop");

    __u32 ifindex;
    __u8 smac[6], dmac[6];

    bool is_exist = lookup_nexthop(xdp, &smac, &dmac, &ifindex, flag);
    if (is_exist)
    {
        set_src_dst_mac(data, &smac, &dmac);
        // bpf_printk("lockup");
        if (!bpf_map_lookup_elem(&tx_port, &ifindex))
            return XDP_PASS;

        if (xdp->ingress_ifindex == ifindex)
        {
            // bpf_printk("run tx");
            return XDP_TX;
        }
        // bpf_printk("go to redirect");
        return bpf_redirect_map(&tx_port, ifindex, 0);
    }
    // bpf_printk("failed rewrite nhop");
    return XDP_PASS;
}

#endif
