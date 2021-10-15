/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <bpf_helpers.h>
#include <linux/in.h>
#include <bpf_endian.h>

#include "../common/parsing_helpers.h"
// #include "../common/netif_tools.h"

#define COUNT_MAP_MAX_SIZE 65535

struct datarec
{
    char src_ip[128];
    __u64 src_timestamp;
    __u64 recv_timestamp;
};

struct bpf_map_def SEC("maps") counter_map = {
    .type = BPF_MAP_TYPE_HASH,
    .key_size = sizeof(__u32),
    .value_size = sizeof(__u32),
    .max_entries = COUNT_MAP_MAX_SIZE,
};

#ifndef lock_xadd
#define lock_xadd(ptr, val) ((void)__sync_fetch_and_add(ptr, val))
#endif

SEC("counter")
int counter_func(struct xdp_md *ctx)
{
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;

    struct hdr_cursor nh;
    int nh_type;
    nh.pos = data;

    struct ethhdr *eth;

    nh_type = parse_ethhdr(&nh, data_end, &eth);

    if (__bpf_htons(ETH_P_IP) == nh_type)
    {
        struct iphdr *iph;
        if (__bpf_htons(IPPROTO_IP) == parse_iphdr(&nh, data_end, &iph))
        {
            const char msg[] = "recv ip %d src-addr %s\r\n";
            bpf_trace_printk(msg, sizeof(msg), iph->saddr, iph->saddr);
        }

        struct icmphdr *icmph;
        if (__bpf_htons(IPPROTO_IP) == parse_icmphdr(&nh, data_end, &icmph))
        {
            const char msg[] = "recc icmp code %d type %d gateway %d\r\n";
            bpf_trace_printk(msg, sizeof(msg), icmph->code, icmph->type, icmph->un.gateway);
        }
    }

    // if (nh_type == bpf_htons(ETH_P_IPV6))
    // {
    //     struct ipv6hdr *ip6h;
    //     // struct icmp6hdr *icmp6h;

    //     nh_type = parse_ip6hdr(&nh, data_end, &ip6h);
    //     if (nh_type != IPPROTO_ICMPV6)
    //     {
    //     }
    // }
    // else if (nh_type == bpf_htons(ETH_P_IP))
    // {
    //     struct iphdr *iph;
    //     // struct icmphdr *icmph;

    //     nh_type = parse_iphdr(&nh, data_end, &iph);
    //     if (nh_type != IPPROTO_ICMP)
    //     {
    //         const char msg[] = "recv ip %s";
    //         bpf_trace_printk(msg, sizeof(msg), iph->saddr);
    //     }
    // }
    return XDP_PASS;
}

SEC("counter1")
int counter1_func(struct xdp_md *ctx)
{
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;

    struct hdr_cursor nh;
    int nh_type;
    nh.pos = data;

    struct ethhdr *eth;

    nh_type = parse_ethhdr(&nh, data_end, &eth);

    if (__bpf_htons(ETH_P_IP) == nh_type)
    {
        struct iphdr *iph;
        if (__bpf_htons(IPPROTO_IP) == parse_iphdr(&nh, data_end, &iph))
        {
            const char msg[] = "recv ip %d src-addr %s\r\n";
            bpf_trace_printk(msg, sizeof(msg), iph->saddr, iph->saddr);
        }

        struct icmphdr *icmph;
        if (__bpf_htons(IPPROTO_IP) == parse_icmphdr(&nh, data_end, &icmph))
        {
            const char msg[] = "recc icmp code %d type %d gateway %d\r\n";
            bpf_trace_printk(msg, sizeof(msg), icmph->code, icmph->type, icmph->un.gateway);
        }
    }

    // if (nh_type == bpf_htons(ETH_P_IPV6))
    // {
    //     struct ipv6hdr *ip6h;
    //     // struct icmp6hdr *icmp6h;

    //     nh_type = parse_ip6hdr(&nh, data_end, &ip6h);
    //     if (nh_type != IPPROTO_ICMPV6)
    //     {
    //     }
    // }
    // else if (nh_type == bpf_htons(ETH_P_IP))
    // {
    //     struct iphdr *iph;
    //     // struct icmphdr *icmph;

    //     nh_type = parse_iphdr(&nh, data_end, &iph);
    //     if (nh_type != IPPROTO_ICMP)
    //     {
    //         const char msg[] = "recv ip %s";
    //         bpf_trace_printk(msg, sizeof(msg), iph->saddr);
    //     }
    // }
    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";