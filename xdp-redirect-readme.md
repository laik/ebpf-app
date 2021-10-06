
## Demo

创建三个网络命名空间和三个 veth 链接：
```
sudo ip link add dev sc-1 type veth peer name dc-1
sudo ip link add dev sc-2 type veth peer name dc-2
sudo ip link add dev sc-3 type veth peer name dc-3
sudo ip netns add ns1
sudo ip netns add ns2
sudo ip netns add ns3
```

将每个 veth 链接的一侧移动到相应的命名空间中，并配置来自“169.254.0.0/16”子网的 IP 地址：

```
sudo ip link set dc-1 netns ns1
sudo ip link set dc-2 netns ns2
sudo ip link set dc-3 netns ns3
sudo ip netns exec ns1 ip addr add 169.254.1.10/24 dev dc-1
sudo ip netns exec ns2 ip addr add 169.254.1.20/24 dev dc-2
sudo ip netns exec ns3 ip addr add 169.254.1.30/24 dev dc-3
```

Bring up both sides of veth links

```
sudo ip link set dev sc-1 up
sudo ip link set dev sc-2 up
sudo ip link set dev sc-3 up
sudo ip netns exec ns1 ip link set dev dc-1 up
sudo ip netns exec ns2 ip link set dev dc-2 up
sudo ip netns exec ns3 ip link set dev dc-3 up
```

此时，各个命名空间中的 IP 之间应该没有连接，即以下命令将不返回任何输出：

```
sudo ip netns exec ns1 ping 169.254.1.20 &
sudo ip netns exec ns1 ping 169.254.1.30 &
```

start xdp-redirect
```
make build
./xdp-redirect -conf config/cfg.yaml
```