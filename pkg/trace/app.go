package trace

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
	"github.com/vishvananda/netlink"
)

/*
#include "../../ebpf/trace/trace.h"
*/
import "C"

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go trace ../../ebpf/trace/trace.c -- -I../../ebpf/libbpf/src -O2 -Wall
type App struct {
	objs    *traceObjects
	links   []string
	linkMap map[string]*netlink.Link
}

func NewApp() (*App, error) {
	app := &App{objs: &traceObjects{}}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadTraceObjects(app.objs, &ebpf.CollectionOptions{
		Maps: ebpf.MapOptions{
			PinPath: "/sys/fs/bpf/xdp/globals",
		},
		Programs: ebpf.ProgramOptions{},
	})

	if err != nil {
		return nil, err
	}

	// setup tail call prog
	if err := app.objs.ProgMap.Put(uint32(C.IP_PROG), uint32(app.objs.ProgIp.FD())); err != nil {
		return nil, fmt.Errorf("setup ip error: %s", err)
	}
	if err := app.objs.ProgMap.Put(uint32(C.ARP_PROG), uint32(app.objs.ProgArp.FD())); err != nil {
		return nil, fmt.Errorf("setup ip error: %s", err)
	}
	if err := app.objs.ProgMap.Put(uint32(C.TCP_PROG), uint32(app.objs.ProgTcp.FD())); err != nil {
		return nil, fmt.Errorf("setup tcp error: %s", err)
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
			c.printResult()
		}
	}
	// return nil
}

func (c *App) printResult() error {
	// var key uint32
	// var value uint32
	// if err := c.objs.MonitorMap.NextKey(key, value); err != nil {
	// 	return err
	// }

	// fmt.Printf("recv key %d value %d\r\n", key, value)
	return nil
}
