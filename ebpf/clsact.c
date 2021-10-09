#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/pkt_cls.h>
#include <linux/swab.h>
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

#define CLS_ACT_MAP_SIZE 1024

struct object
{
    __u32 ip;
    __u32 port;
} __object;

struct bpf_map_def SEC("maps") clsact_map = {
    .type = BPF_MAP_TYPE_HASH,
    .key_size = sizeof(__object),
    .value_size = sizeof(int),
    .max_entries = CLS_ACT_MAP_SIZE,
};

int process_packet(struct __sk_buff *skb)
{
    return -1;
}

int classifier(struct __sk_buff *skb)
{
    void *data_end = (void *)(unsigned long long)skb->data_end;
    void *data = (void *)(unsigned long long)skb->data;
    struct ethhdr *eth = data;

    if (data + sizeof(struct ethhdr) > data_end)
        return TC_ACT_SHOT;

    if (eth->h_proto == ___constant_swab16(ETH_P_IP))
        /*
         * Packet processing is not implemented in this sample. Parse
         * IPv4 header, possibly push/pop encapsulation headers, update
         * header fields, drop or transmit based on network policy,
         * collect statistics and store them in a eBPF map...
         */
        return process_packet(skb);
    else
        return TC_ACT_OK;
}