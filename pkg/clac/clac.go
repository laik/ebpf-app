package clac

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go clac ../../ebpf/src/clac.c -- -I../../ebpf/libbpf/src -O2 -Wall

type App struct {
	objs  *clacObjects
	links []string
}

func NewApp() (*App, error) {
	app := &App{
		objs:  &clacObjects{},
		links: make([]string, 0),
	}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadClacObjects(app.objs, &ebpf.CollectionOptions{})
	if err != nil {
		return nil, err
	}

	app.objs.clacMaps.ProgMap.Pin("/sys/fs/bpf/xdp/globals/prog_map")

	// setup tail call prog
	if err := app.objs.clacMaps.ProgMap.Put(uint32(0), uint32(app.objs.clacPrograms.Prog0.FD())); err != nil {
		return nil, fmt.Errorf("setup prog0 error: %s", err)
	}

	return app, nil
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

func (c *App) Launch(ctx context.Context, links []string) error {
	if err := c.addXdpToLink(links); err != nil {
		return fmt.Errorf("Failed to set up XDP on links: %s", err)
	}

	ticker := time.NewTicker(1 * time.Second)
	for {
		select {
		case <-ctx.Done():
			log.Printf("ctx.Done")
			if err := c.cleanup(); err != nil {
				return fmt.Errorf("Cleanup Failed: %s", err)
			}
			return nil
		case <-ticker.C:
			// c.printResult()
		}
	}
}
