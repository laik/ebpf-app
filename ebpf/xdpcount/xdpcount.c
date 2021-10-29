/* SPDX-License-Identifier: GPL-2.0 */
#include "../common/vmlinux.h"
// local dependence
#include "../common/bpf_helpers.h"
#include "../common/bpf_endian.h"
#include "../common/helper.h"

/* This is the data record stored in the map */
struct datarec
{
    __u64 rx_packets;
    __u64 rx_bytes;
    /* Assignment#1: Add byte counters */
};

#ifndef XDP_ACTION_MAX
#define XDP_ACTION_MAX (XDP_REDIRECT + 1)
#endif

struct bpf_map_def SEC("maps") xdp_stats_map = {
    .type = BPF_MAP_TYPE_ARRAY,
    .key_size = sizeof(__u32),
    .value_size = sizeof(struct datarec),
    .max_entries = XDP_ACTION_MAX,
};

SEC("xdp_stats1")
int xdp_stats1_func(struct xdp_md *ctx)
{
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;

    struct datarec *rec;
    __u32 key = XDP_PASS; /* XDP_PASS = 2 */

    rec = bpf_map_lookup_elem(&xdp_stats_map, &key);
    if (!rec)
        return XDP_ABORTED;

    lock_xadd(&rec->rx_packets, 1);
    lock_xadd(&rec->rx_bytes, data_end - data + 1);

    bpf_map_update_elem(&xdp_stats_map, &key, rec, BPF_ANY);

    bpfprintf("recv package %d bytes %d \r\n", rec->rx_packets, rec->rx_bytes);

    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";