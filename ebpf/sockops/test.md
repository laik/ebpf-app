# test

# make
# 加载到内核
```
make
bpftool prog load sockops.o /sys/fs/bpf/sockops type sockops
```

# Attach 到 cgroups
```
mkdir /sys/fs/cgroup/demo
bpftool cgroup attach /sys/fs/cgroup/demo sock_ops pinned /sys/fs/bpf/sockops

bpftool cgroup tree -p 
```

# detach
```
bpftool cgroup detach /sys/fs/cgroup/demo sock_ops pinned /sys/fs/bpf/sockops 
```

# clean
```
rm -rf sockops.o sockops.ll
rm -rf /sys/fs/bpf/sockops
rmdir /sys/fs/cgroup/demo
```


# trace
# tail -f /sys/kernel/debug/tracing/trace_pipe



# [ref] https://cyral.com/blog/how-to-ebpf-accelerating-cloud-native/