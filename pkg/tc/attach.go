package tc

import (
	"github.com/cilium/ebpf"
	"github.com/vishvananda/netlink"
)

type Driect uint32

const (
	INGRESS Driect = iota
	EGRESS
)

type TcFilter interface {
	Attach(intif uint32, d Driect, id ebpf.ProgramID) error
}

func NewTcFilter() TcFilter {
	return &defaultAttacher{}
}

var _ TcFilter = &defaultAttacher{}

type defaultAttacher struct{}

// Attach implements Attacher
func (*defaultAttacher) Attach(intif uint32, d Driect, id ebpf.ProgramID) error {
	var filter netlink.Filter
	return netlink.FilterReplace(filter)
}
