package xdpcount

import (
	"context"
	"log"
	"time"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go xdpcount ../../ebpf/src/xdpcount.c -- -I../../ebpf/libbpf/src -O2 -Wall

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *xdpcountObjects
	links []string
}

func NewXDPCountApp() (*App, error) {

	c := &App{
		objs:  &xdpcountObjects{},
		links: make([]string, 0),
	}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadXdpcountObjects(c.objs, &ebpf.CollectionOptions{})
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

	ticker := time.NewTicker(1 * time.Second)
	for {
		select {
		case <-ctx.Done():
			log.Printf("ctx.Done")
			if err := c.cleanup(); err != nil {
				log.Fatalf("Cleanup Failed: %s", err)
			}
			return
		case <-ticker.C:
			c.printResult()
		}
	}
}

func (c *App) printResult() {
}
