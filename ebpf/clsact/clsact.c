#include "../common/vmlinux.h"
#include "../common/bpf_helpers.h"
#include "../common/bpf_endian.h"

#define CLS_ACT_MAP_SIZE 1024

int process_packet(struct __sk_buff *skb)
{
    
    bpfprintf("call process_packet src %d\r\n");
    return -1;
}

SEC("c1")
int classifier(struct __sk_buff *skb)
{
    void *data_end = (void *)(unsigned long long)skb->data_end;
    void *data = (void *)(unsigned long long)skb->data;
    struct ethhdr *eth = data;

    if (data + sizeof(struct ethhdr) > data_end)
        return TC_ACT_SHOT;

    if (eth->h_proto == bpf_htons(ETH_P_IP))
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

char _license[] SEC("license") = "GPL";
