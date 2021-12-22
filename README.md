# ebpf-app

init porject

cd ebpf/
git clone git@github.com:libbpf/libbpf.git



# generate vmlinux use co-re env kernel > 5.2
cd ebpf/common/
bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h



# install 
clang 11
golang > 1.15