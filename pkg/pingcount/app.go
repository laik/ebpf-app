package pingcount

import (
	"context"
	"fmt"
	"log"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go pingcount ../../ebpf/pingcount/pingcount.c -- -I../../ebpf/common  -O2 -Walls

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *pingcountObjects
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
			var k uint32 = 123
			// var v uint32
			// if err := c.withHandle(&k, &v, h); err != nil {
			// 	log.Fatalf("Handle Failed: %s", err)
			// }
			if err := c.objs.pingcountMaps.OtherMap.Put(uint32(123), "wocao"); err != nil {
				log.Fatalf("put Failed: %s", err)
			}
			bs, err := c.objs.pingcountMaps.CounterMap.NextKeyBytes(k)
			if err != nil {
				log.Fatalf("Handle Failed: %s", err)
			}
			fmt.Printf("look value %s\r\n", bs)
		}
	}
}

func h(k, v *uint32) error {
	fmt.Printf("key %d value %d\r\n", k, v)
	return nil
}

type Handle func(k, v *uint32) error

func (c *App) withHandle(key, value *uint32, f Handle) error {
	if err := c.objs.pingcountMaps.CounterMap.Lookup(key, value); err != nil {
		fmt.Printf("next ket error %s\r\n", err)
		return nil
	}
	return f(key, value)
}
