/* SPDX-License-Identifier: GPL-2.0 */

#include "../common/bpf_helpers.h"
#include "../common/bpf_endian.h"
#include "../common/vmlinux.h"
#include "pingcount.h"

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

SEC("xdp_ping")
int xdp_ping_func(struct xdp_md *ctx)
{
    __u32 key = 123;
    char value[5] = "wocao";

    bpfprintf("xdp working\r\n");

    bpf_map_update_elem(&counter_map, &key, &value, BPF_ANY);

    char *ret;
    ret = bpf_map_lookup_elem(&other_map, &key);

    bpfprintf("recv other map %s\r\n", ret);

    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";