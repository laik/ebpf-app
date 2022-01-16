#include "../common/bpf_helpers.h"
#include "../common/bpf_endian.h"
#include "../common/vmlinux.h"

SEC("sockops")
int program(struct bpf_sock_ops *skops)
{
	bpfprintf("direct %d src-> %d dest-> %d\r\n", skops->op, skops->local_ip4, skops->remote_ip4);
	return 0;
}

char _license[] SEC("license") = "GPL";
