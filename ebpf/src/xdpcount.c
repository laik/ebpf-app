/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <bpf_helpers.h>
#include <bpf_endian.h>
#include "helper.h"

/* This is the data record stored in the map */
struct datarec
{
    __u64 rx_packets;
    /* Assignment#1: Add byte counters */
};

#ifndef XDP_ACTION_MAX
#define XDP_ACTION_MAX (XDP_REDIRECT + 1)
#endif

struct bpf_map_def SEC("maps") xdp_stats_map = {
    .type = BPF_MAP_TYPE_ARRAY,
    .key_size = sizeof(__u32),
    .value_size = sizeof(struct datarec),
    .max_entries = 1024,
};

SEC("xdp_stats1")
int xdp_stats1_func(struct xdp_md *ctx)
{
    // void *data_end = (void *)(long)ctx->data_end;
    // void *data = (void *)(long)ctx->data;

    struct datarec *rec;
    __u32 key = XDP_PASS; /* XDP_PASS = 2 */

    rec = bpf_map_lookup_elem(&xdp_stats_map, &key);
    if (!rec)
        return XDP_ABORTED;

    lock_xadd(&rec->rx_packets, 1);

    bpfprintf("test %d", 1234);

    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";