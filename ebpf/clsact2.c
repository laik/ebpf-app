#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/pkt_cls.h>
#include <linux/swab.h>
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

int classifier(struct __sk_buff *skb)
{
    void *data_end = (void *)(unsigned long long)skb->data_end;
    void *data = (void *)(unsigned long long)skb->data;
    struct ethhdr *eth = data;

    if (data + sizeof(struct ethhdr) > data_end)
        return TC_ACT_SHOT;

    if (eth->h_proto == ___constant_swab16(ETH_P_IP))
        return TC_ACT_PIPE;

    return TC_ACT_OK;
}

char _license[] SEC("license") = "GPL";
