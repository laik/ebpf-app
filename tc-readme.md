# base iproute2 

```
cd ebpf
tc qdisc add dev eth0 clsact
tc filter add dev eth0 ingress bpf direct-action obj clsact.o sec .text

# check
tc filter show dev eth0
tc filter show dev eth0 ingress
```