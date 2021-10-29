#include <linux/bpf.h>
#include "../common/bpf_helpers.h"
#include "../common/helper.h"
#include "trace.h"

struct bpf_map_def SEC("maps") prog_map = {
    .type = BPF_MAP_TYPE_PROG_ARRAY,
    .key_size = sizeof(__u32),
    .value_size = sizeof(__u32),
    .max_entries = MAX_PROG,
};

__attribute__((__always_inline__)) static inline int prog_chioce(struct xdp_md *ctx)
{
    return UNKONW;
}

SEC("xdp")
int prog(struct xdp_md *ctx)
{
    bpfprintf("call prog i am start\r\n");
    switch (prog_chioce(ctx))
    {
    case IP_PROG:
        bpf_tail_call(ctx, &prog_map, IP_PROG);
        break;
    case ARP_PROG:
        bpf_tail_call(ctx, &prog_map, ARP_PROG);
        break;
    }
    return XDP_PASS;
}

SEC("xdp/ip")
int prog_ip(struct xdp_md *ctx)
{
    bpfprintf("call ip\r\n");
    return XDP_PASS;
}

SEC("xdp/arp")
int prog_arp(struct xdp_md *ctx)
{
    bpfprintf("call arp\r\n");
    return XDP_PASS;
}

SEC("xdp/tcp")
int prog_tcp(struct xdp_md *ctx)
{
    bpfprintf("call tcp\r\n");
    return XDP_PASS;
}

SEC("xdp/udp")
int prog_udp(struct xdp_md *ctx)
{
    bpfprintf("call udp\r\n");
    return XDP_PASS;
}

SEC("xdp/unknow")
int prog_unkonw(struct xdp_md *ctx)
{
    bpfprintf("call unknow\r\n");
    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
