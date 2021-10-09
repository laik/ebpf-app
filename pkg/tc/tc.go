package tc

import (
	"context"

	"github.com/cilium/ebpf"
	"github.com/laik/ebpf-app/pkg/common"
	"github.com/vishvananda/netlink"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go clsact ../../ebpf/clsact.c -- -I../../ebpf/include -O2 -Wall

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs    *clsactObjects
	input   map[string]string
	linkMap map[string]*netlink.Link
}

func NewClsactApp(input map[string]string) (*App, error) {

	c := &App{
		objs:    &clsactObjects{},
		input:   make(map[string]string),
		linkMap: make(map[string]*netlink.Link),
	}

	c.input = common.MakeSymm(input)

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadClsactObjects(c.objs, &ebpf.CollectionOptions{})
	if err != nil {
		return nil, err
	}

	if err := c.init(); err != nil {
		return nil, err
	}

	return c, nil
}

func (c *App) init() error {
	return nil
}

func (c *App) Launch(ctx context.Context, updateCh chan map[string]string) {
	var links []string
	for link := range c.linkMap {
		links = append(links, link)
	}
	// if err := c.addXdpToLink(links); err != nil {
	// 	log.Fatalf("Failed to set up XDP on links: %s", err)
	// }

	// for {
	// 	select {
	// 	case <-ctx.Done():
	// 		log.Printf("ctx.Done")
	// 		if err := c.cleanup(); err != nil {
	// 			log.Fatalf("Cleanup Failed: %s", err)
	// 		}
	// 		return
	// 	case config := <-updateCh:
	// 		if err := c.update(config); err != nil {
	// 			log.Printf("Error updating eBPF: %s", err)
	// 		}
	// 	}
	// }
}
