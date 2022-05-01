package sockops

import (
	"context"

	"github.com/cilium/ebpf"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go sockops ../../ebpf/sockops/sockops.c -- -I../../ebpf/common -O2 -Wall

// App stores ebpf programs and maps together with the desired state
// sockops attach use bpftool cgroup attch...
type App struct {
	objs    *sockopsObjects
	cgroups map[string]string
}

// Input expects a map between existing pairs of interface names that will be cross-connected.
func NewApp() (*App, error) {
	c := &App{
		objs:    &sockopsObjects{},
		cgroups: make(map[string]string),
	}
	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadSockopsObjects(c.objs, &ebpf.CollectionOptions{})
	if err != nil {
		return nil, err
	}

	return c, nil
}

func (c *App) AttachToNs(ns string) error {
	return nil
}

func (c *App) Run(ctx context.Context) error {
	for {
		select {
		case <-ctx.Done():
			return nil
		}
	}
}
