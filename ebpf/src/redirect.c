#include <linux/bpf.h>
#include <bpf_helpers.h>

#define XDP_REDIRECT_MAP_SIZE 1024

struct bpf_map_def SEC("maps") xdp_redirect_map = {
	.type = BPF_MAP_TYPE_DEVMAP,
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.max_entries = XDP_REDIRECT_MAP_SIZE,
};

SEC("xdp")
int xdp_redirect(struct xdp_md *ctx)
{
	return bpf_redirect_map(&xdp_redirect_map, ctx->ingress_ifindex, 0);
}

char _license[] SEC("license") = "GPL";
