#include <linux/bpf.h>
#include <bpf_helpers.h>
#include "helper.h"

// linux 5.4 latest
#define MAX_PROG 4096
// multi prog
#define PROG_0 0

struct bpf_map_def SEC("maps") prog_map = {
    .type = BPF_MAP_TYPE_PROG_ARRAY,
    .key_size = sizeof(__u32),
    .value_size = sizeof(__u32),
    .max_entries = MAX_PROG,
};

struct bpf_map_def SEC("maps") monitor_map = {
    .type = BPF_MAP_TYPE_RINGBUF,
    .key_size = sizeof(__u32),
    .value_size = sizeof(__u32),
    .max_entries = MAX_PROG,
};

SEC("xdp")
int prog(struct xdp_md *ctx)
{
    bpfprintf("call prog i am start\r\n");
    bpf_tail_call(ctx, &prog_map, 0);
    return XDP_PASS;
}

SEC("xdp/0")
int prog0(struct xdp_md *ctx)
{
    bpfprintf("call prog0 jmp to me\r\n");
    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
