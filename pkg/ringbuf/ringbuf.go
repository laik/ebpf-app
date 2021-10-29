package ringbuf

import (
	"context"
	"log"
	"time"

	"github.com/cilium/ebpf"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go ringbuf ../../ebpf/src/ringbuf.c -- -I../../ebpf/libbpf/src -O2 -Wall

type App struct {
	objs  *ringbufObjects
	links []string
}

func NewApp() (*App, error) {
	app := &App{
		objs:  &ringbufObjects{},
		links: make([]string, 0),
	}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadRingbufObjects(app.objs, &ebpf.CollectionOptions{
		Maps: ebpf.MapOptions{
			PinPath: "/sys/fs/bpf/",
		},
		Programs: ebpf.ProgramOptions{},
	})

	if err != nil {
		return nil, err
	}

	return app, nil
}

// func (c *App) cleanup() error {
// 	var errs error

// 	if err := c.delXdpFromLink(c.links); err != nil {
// 		errs = multierror.Append(errs, err)
// 	}

// 	if err := c.objs.Close(); err != nil {
// 		errs = multierror.Append(errs, err)
// 	}

// 	return errs
// }

func (c *App) Launch(ctx context.Context, links []string) error {
	// if err := c.addXdpToLink(links); err != nil {
	// 	return fmt.Errorf("Failed to set up XDP on links: %s", err)
	// }

	ticker := time.NewTicker(1 * time.Second)
	for {
		select {
		case <-ctx.Done():
			log.Printf("ctx.Done")
			// if err := c.cleanup(); err != nil {
			// 	return fmt.Errorf("Cleanup Failed: %s", err)
			// }
			return nil
		case <-ticker.C:
			// c.printResult()
		}
	}
}

// func (c *App) printResult() error {
// 	// var key uint32
// 	// var value uint32
// 	// if err := c.objs.MonitorMap.NextKey(key, value); err != nil {
// 	// 	return err
// 	// }

// 	// fmt.Printf("recv key %d value %d\r\n", key, value)
// 	return nil
// }
