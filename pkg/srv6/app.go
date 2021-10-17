package srv6

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go srv6 ../../ebpf/srv6/srv6.c -- -I../../ebpf/libbpf/src -O2 -Wall

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *srv6Objects
	links []string
}