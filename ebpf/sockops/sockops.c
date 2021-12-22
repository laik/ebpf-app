#include "../common/vmlinux.h"
#include "../common/bpf_helpers.h"
#include "../common/bpf_endian.h"
#include "../common/helper.h"

#define SOCK_REDIRECT_MAP_SIZE 65535

struct sock_key
{
	uint32_t sip4;	// 源 IP
	uint32_t dip4;	// 目的 IP
	uint8_t family; // 协议类型
	uint8_t pad1;	// this padding required for 64bit alignment
	uint16_t pad2;	// else ebpf kernel verifier rejects loading of the program
	uint32_t pad3;
	uint32_t sport; // 源端口
	uint32_t dport; // 目的端口
} __attribute__((packed));

struct bpf_map_def SEC("maps") sock_ops_map = {
	.type = BPF_MAP_TYPE_SOCKHASH,
	.key_size = sizeof(struct sock_key),
	.value_size = sizeof(int), // 存储 socket
	.max_entries = SOCK_REDIRECT_MAP_SIZE,
	.map_flags = 0,
};

static inline void extract_key4_from_ops(struct bpf_sock_ops *ops, struct sock_key *key)
{
	// keep ip and port in network byte order
	key->dip4 = ops->remote_ip4;
	key->sip4 = ops->local_ip4;
	key->family = 1;

	// local_port is in host byte order, and remote_port is in network byte order
	key->sport = (bpf_htonl(ops->local_port) >> 16);
	key->dport = (bpf_htonl(ops->remote_port) >> 16);
}

static inline void bpf_sock_ops_ipv4(struct bpf_sock_ops *skops)
{
	// struct sock_key key = {};
	// // int ret;

	// extract_key4_from_ops(skops, &key);

	// ret = sock_hash_update(skops, &sock_ops_map, &key, BPF_NOEXIST);
	// if (ret != 0)
	// {
	// 	printk("sock_hash_update() failed, ret: %d\n", ret);
	// }

	bpfprintf("sockmap: op %d, port %d --> %d\n", skops->op, skops->local_port, bpf_ntohl(skops->remote_port));
}

SEC("sockops")
int program(struct bpf_sock_ops *skops)
{
	switch (skops->op)
	{
	case BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB: // 被动建连
	case BPF_SOCK_OPS_ACTIVE_ESTABLISHED_CB:  // 主动建连
		if (skops->family == 2)
		{							  // AF_INET
			bpf_sock_ops_ipv4(skops); // 将 socket 信息记录到到 sockmap
		}
		break;
	default:
		break;
	}
	return 0;
}

char _license[] SEC("license") = "GPL";
