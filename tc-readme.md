# base iproute2 

```
cd ebpf/clsact
clang -I ../common/ -O2 -target bpf -c clsact.c -o clsact.o

tc qdisc add dev eth0 clsact
tc filter add dev eth0 ingress bpf direct-action obj clsact.o sec c1

# check
tc filter show dev eth0 ingress
```

# output 
```
cat  /sys/kernel/debug/tracing/trace_pipe
```