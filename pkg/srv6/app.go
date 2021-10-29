package srv6

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/cilium/ebpf"
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go srv6 ../../ebpf/srv6/srv6.c -- -I../../ebpf/common -O2 -Wall

// App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *srv6Objects
	links []string
}

func NewSRV6App() (*App, error) {
	c := &App{
		objs:  &srv6Objects{},
		links: make([]string, 0),
	}

	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadSrv6Objects(c.objs, &ebpf.CollectionOptions{})
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

func (c *App) pinMap() error {
	if err := c.objs.srv6Maps.FunctionTable.Pin("/sys/fs/bpf/xdp/globals/function_table"); err != nil {
		return fmt.Errorf("pin function_table map error: %s", err)
	}
	if err := c.objs.srv6Maps.InTapleV6Addr.Pin("/sys/fs/bpf/xdp/globals/in_taple_v6_addr"); err != nil {
		return fmt.Errorf("pin in_taple_v6_addr map error: %s", err)
	}
	if err := c.objs.srv6Maps.TransitTableV4.Pin("/sys/fs/bpf/xdp/globals/transit_table_v4"); err != nil {
		return fmt.Errorf("pin transit_table_v4 map error: %s", err)
	}
	if err := c.objs.srv6Maps.TransitTableV6.Pin("/sys/fs/bpf/xdp/globals/transit_table_v6"); err != nil {
		return fmt.Errorf("pin transit_table_v6 map error: %s", err)
	}
	if err := c.objs.srv6Maps.TxPort.Pin("/sys/fs/bpf/xdp/globals/tx_port"); err != nil {
		return fmt.Errorf("pin tx_port map error: %s", err)
	}
	if err := c.objs.srv6Maps.XdpcapHook.Pin("/sys/fs/bpf/xdp/globals/xdpcap_hook"); err != nil {
		return fmt.Errorf("pin xdpcap_hook map error: %s", err)
	}

	return nil
}

func (c *App) Launch(ctx context.Context, links []string) error {
	if err := c.addXdpToLink(links); err != nil {
		return fmt.Errorf("Failed to set up XDP on links: %s", err)
	}

	if err := c.pinMap(); err != nil {
		return err
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
