package xdppingcount

import (
	"context"
	"log"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go pingcount ../../ebpf/xdp_ping_count.c -- -I../../ebpf/include -O2 -Wall

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *pingcountObjects
	data  *pingcountMapSpecs
	links []string
}

func NewXDPPingCountApp() (*App, error) {
	c := &App{
		objs:  &pingcountObjects{},
		links: make([]string, 0),
	}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadPingcountObjects(c.objs, &ebpf.CollectionOptions{})
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
		default:
			if err := c.withHandle(nil, nil, nil); err != nil {
				log.Fatalf("Handle Failed: %s", err)
			}
		}
	}
}

type Handle func(k, v interface{}) error

func (c *App) withHandle(k, v interface{}, f Handle) error {
	if err := c.objs.pingcountMaps.XdpPingCountMap.NextKey(k, v); err != nil {
		return err
	}
	return f(k, v)
}
