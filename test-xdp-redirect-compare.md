
创建两个网络命名空间和两个 veth 链接：
```
ip link add dev sc-1 type veth peer name dc-1
ip link add dev sc-2 type veth peer name dc-2
ip netns add ns1
ip netns add ns2
```

将每个 veth 链接的一侧移动到相应的命名空间中，并配置来自“169.254.0.0/16”子网的 IP 地址：

```
ip link set dc-1 netns ns1
ip link set dc-2 netns ns2
ip netns exec ns1 ip addr add 169.254.1.10/24 dev dc-1
ip netns exec ns2 ip addr add 169.254.1.20/24 dev dc-2
```

Bring up both sides of veth links

```
ip link set dev sc-1 up
ip link set dev sc-2 up
ip netns exec ns1 ip link set dev dc-1 up
ip netns exec ns2 ip link set dev dc-2 up
```



```
apt install iperf3 -y
```

```
term1:

make build
./bin/xdp-redirect --cfg config/cfg.yaml

term2:
ip netns exec ns1 iperf3 -s 

term3:
ip netns exec ns2 iperf3 -c 169.254.1.10

```




Lab2
```
apt-get install -y bridge-utils

brctl addbr sw2
ifconfig sw2 up
brctl addif sw2 sc-1
brctl addif sw2 sc-2


term2:
ip netns exec ns1 iperf3 -s 

term3:
ip netns exec ns2 iperf3 -c 169.254.1.10

```


结论： TMD bpf_redirect veth TOS有问题。 什么垃圾玩意