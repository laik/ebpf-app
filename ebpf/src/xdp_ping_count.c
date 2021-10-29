/* SPDX-License-Identifier: GPL-2.0 */

#include "../common/bpf_helpers.h"
#include "../common/bpf_endian.h"
#include "../common/parsing_helpers.h"
#include "../common/helper.h"
#include "../common/vmlinux.h"

#define COUNT_MAP_MAX_SIZE 1024

struct S
{
    unsigned char dest[6]; // ETH_ALEN
    unsigned char src[6];
} __packed;

struct bpf_map_def SEC("maps") counter_map = {
    .type = BPF_MAP_TYPE_HASH,
    .key_size = sizeof(__u32),
    .value_size = 5,
    .max_entries = COUNT_MAP_MAX_SIZE,
};

struct bpf_map_def SEC("maps") other_map = {
    .type = BPF_MAP_TYPE_HASH,
    .key_size = sizeof(__u32),
    .value_size = 5,
    .max_entries = COUNT_MAP_MAX_SIZE,
};

SEC("xdp_ping_count")
int xpd_ping_count_func(struct xdp_md *ctx)
{
    // void *data_end = (void *)(long)ctx->data_end;
    // void *data = (void *)(long)ctx->data;

    // struct hdr_cursor nh;
    // int nh_type;
    // nh.pos = data;

    __u32 key = 123;
    char value[5] = "wocao";

    bpfprintf("xdp working\r\n");

    // struct ethhdr *eth;

    // nh_type = parse_ethhdr(&nh, data_end, &eth);

    // struct S record = {
    //     .dest = "123",
    //     .src = "321",
    // };

    // memcpy(&record.dest, eth->h_dest, ETH_ALEN);
    // memcpy(&record.src, eth->h_source, ETH_ALEN);

    bpf_map_update_elem(&counter_map, &key, &value, BPF_ANY);

    char *ret;
    ret = bpf_map_lookup_elem(&other_map, &key);

    bpfprintf("recv other map %s\r\n", ret);

    // if (__bpf_htons(ETH_P_IP) == nh_type)
    // {
    //     struct iphdr *iph;
    //     if (__bpf_htons(IPPROTO_IP) == parse_iphdr(&nh, data_end, &iph))
    //     {
    //         bpfprintf("recv ip %d src-addr %s\r\n", iph->daddr, iph->saddr);
    //     }

    //     struct icmphdr *icmph;
    //     if (__bpf_htons(IPPROTO_ICMP) == parse_icmphdr(&nh, data_end, &icmph))
    //     {

    //         bpfprintf("recc icmp code %d type %d gateway %d\r\n", icmph->code, icmph->type, icmph->un.gateway);
    //     }
    // }
    // else if (__bpf_htons(ETH_P_IPV6) == nh_type)
    // {
    //     struct ipv6hdr *ip6h;
    //     if (__bpf_htons(IPPROTO_IPV6) == parse_ip6hdr(&nh, data_end, &ip6h))
    //     {
    //         bpfprintf("recv ip %d src-addr %s\r\n", ip6h->saddr, ip6h->daddr);
    //     }

    //     struct icmp6hdr *icmp6h;

    //     if (__bpf_htons(IPPROTO_ICMPV6) == parse_icmp6hdr(&nh, data_end, &icmp6h))
    //     {
    //         bpfprintf("recc icmp code %d type %d\r\n", icmp6h->icmp6_code, icmp6h->icmp6_type);
    //     }
    // }

    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";