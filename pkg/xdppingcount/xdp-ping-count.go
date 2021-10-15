package xdppingcount

import (
	"context"
	"log"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go xdppingcount ../../ebpf/src/xdp_ping_count.c -- -I../../ebpf/libbpf/src  -O2 -Walls

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *xdppingcountObjects
	links []string
}

func NewXDPPingCountApp() (*App, error) {
	c := &App{
		objs:  &xdppingcountObjects{},
		links: make([]string, 0),
	}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadXdppingcountObjects(c.objs, &ebpf.CollectionOptions{})
	if err != nil {
		return nil, err
	}

	return c, nil
}

func (c *App) cleanup() error {
	var errs error

	if err := c.delXdpFromLink(c.links); err != nil {
		errs = multierror.Append(errs, err)
	}

	if err := c.objs.Close(); err != nil {
		errs = multierror.Append(errs, err)
	}

	return errs
}

func (c *App) Launch(ctx context.Context, links []string) {
	if err := c.addXdpToLink(links); err != nil {
		log.Fatalf("Failed to set up XDP on links: %s", err)
	}

	for {
		select {
		case <-ctx.Done():
			log.Printf("ctx.Done")
			if err := c.cleanup(); err != nil {
				log.Fatalf("Cleanup Failed: %s", err)
			}
			return
			// default:
			// 	if err := c.withHandle(nil, nil, nil); err != nil {
			// 		log.Fatalf("Handle Failed: %s", err)
			// 	}
		}
	}
}

type Handle func(k, v interface{}) error

func (c *App) withHandle(k, v interface{}, f Handle) error {
	if err := c.objs.xdppingcountMaps.PingCntMap.NextKey(k, v); err != nil {
		return err
	}
	return f(k, v)
}
