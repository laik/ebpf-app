package tc

import (
	"context"

	"github.com/cilium/ebpf"
	"github.com/laik/ebpf-app/pkg/common"
	"github.com/vishvananda/netlink"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go clsact ../../ebpf/clsact/clsact.c -- -I../../ebpf/common -O2 -Wall

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs    *clsactObjects
	input   map[string]string
	linkMap map[string]*netlink.Link
	TcFilter
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

	c.TcFilter = NewTcFilter()

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

func (c *App) addFilter(intf uint32, d Driect) error {
	return c.Attach(intf, d, ebpf.ProgramID(c.objs.Classifier1.FD()))
}
