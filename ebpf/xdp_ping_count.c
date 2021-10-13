/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/in.h>
#include "../common/parsing_helpers.h"

struct bpf_map_def SEC("maps") xdp_ping_count_map = {
    .type = BPF_MAP_TYPE_HASH,
    .key_size = sizeof(__u32),
    .value_size = sizeof(__u64),
    .max_entries = 65535,
};

#ifndef lock_xadd
#define lock_xadd(ptr, val) ((void)__sync_fetch_and_add(ptr, val))
#endif

SEC("xdp_ping_count")
int xdp_ping_count_func(struct xdp_md *ctx)
{

    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;

    /* Default action XDP_PASS, imply everything we couldn't parse, or that
	 * we don't want to deal with, we just pass up the stack and let the
	 * kernel deal with it.
	 */
    __u32 action = XDP_PASS; /* Default action */

    /* These keep track of the next header type and iterator pointer */
    struct hdr_cursor nh;
    int nh_type;
    nh.pos = data;

    struct ethhdr *eth;

    /* Packet parsing in steps: Get each header one at a time, aborting if
	 * parsing fails. Each helper function does sanity checking (is the
	 * header type in the packet correct?), and bounds checking.
	 */
    nh_type = parse_ethhdr(&nh, data_end, &eth);

    if (nh_type == bpf_htons(ETH_P_IPV6))
    {
        struct ipv6hdr *ip6h;
        struct icmp6hdr *icmp6h;

        nh_type = parse_ip6hdr(&nh, data_end, &ip6h);
        if (nh_type != IPPROTO_ICMPV6)
            goto out;

        nh_type = parse_icmp6hdr(&nh, data_end, &icmp6h);
        if (nh_type != ICMPV6_ECHO_REQUEST)
            goto out;

        if (bpf_ntohs(icmp6h->icmp6_sequence) % 2 == 0)
            action = XDP_DROP;
    }
    else if (nh_type == bpf_htons(ETH_P_IP))
    {
        struct iphdr *iph;
        struct icmphdr *icmph;

        nh_type = parse_iphdr(&nh, data_end, &iph);
        if (nh_type != IPPROTO_ICMP)
            goto out;

        nh_type = parse_icmphdr(&nh, data_end, &icmph);
        if (nh_type != ICMP_ECHO)
            goto out;

        if (bpf_ntohs(icmph->un.echo.sequence) % 2 == 0)
            action = XDP_DROP;
    }
out:
    return xdp_stats_record_action(ctx, action);
}

char _license[] SEC("license") = "GPL";