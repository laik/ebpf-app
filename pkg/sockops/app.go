package sockops

import (
	"syscall"

	"github.com/cilium/ebpf"
	"github.com/laik/ebpf-app/pkg/common"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go sockops ../../ebpf/sockops/sockops.c -- -I../../ebpf/common -O2 -Wall

// // App stores ebpf programs and maps together with the desired state
type App struct {
	objs  *sockopsObjects
	fdmap map[int]int // program fd -> socket fd
}

// Input expects a map between existing pairs of interface names that will be cross-connected.
func NewApp() (*App, error) {
	c := &App{
		objs:  &sockopsObjects{},
		fdmap: make(map[int]int),
	}
	if err := common.IncreaseResourceLimits(); err != nil {
		return nil, err
	}

	err := loadSockopsObjects(c.objs, &ebpf.CollectionOptions{})
	if err != nil {
		return nil, err
	}

	if err := c.init(); err != nil {
		return nil, err
	}

	return c, nil
}

// init populates linkMap and eBPF map
func (c *App) init() error {
	for p1, p2 := range c.fdmap {
		if err := syscall.SetsockoptInt(p1, syscall.SOL_SOCKET, syscall.SO_REUSEPORT, 0); err != nil {
			return err
		}
		if err := syscall.SetsockoptInt(p2, syscall.SOL_SOCKET, syscall.SO_ATTACH_FILTER, 1); err != nil {
			return err
		}
	}

	return nil
}

// // cleanup clears netlink XDP configuration and closes eBPF objects
// func (c *App) cleanup() error {

// 	var errs error

// 	var removed []string
// 	for intf := range c.linkMap {
// 		removed = append(removed, intf)
// 	}

// 	if err := c.delXdpFromLink(removed); err != nil {
// 		errs = multierror.Append(errs, err)
// 	}

// 	if err := c.objs.Close(); err != nil {
// 		errs = multierror.Append(errs, err)
// 	}

// 	c.cleanupLinkMap(removed)

// 	return errs
// }

// // update ensures running state matches the candidate
// func (c *App) update(candidates map[string]string) error {

// 	candidates = common.MakeSymm(candidates)

// 	added, changed, orphaned := common.ConfDiff(c.input, candidates)

// 	// Dealing with added interfaces
// 	err := c.updateLinkMap(added)
// 	if err != nil {
// 		return err
// 	}
// 	if err := c.addXdpToLink(added); err != nil {
// 		return err
// 	}

// 	// Updating eBPF map
// 	c.input = candidates
// 	err = c.updateBpfMap(added, changed, orphaned)
// 	if err != nil {
// 		return err
// 	}

// 	// Dealing with removed interfaces
// 	if err := c.delXdpFromLink(orphaned); err != nil {
// 		return err
// 	}
// 	c.cleanupLinkMap(orphaned)

// 	return nil
// }

// // updateBpfMap adjusts Bpf Map based on detected changes
// func (c *App) updateBpfMap(added, changed, removed []string) error {
// 	var errs error

// 	for _, intf := range added {
// 		link1 := c.linkMap[intf]
// 		link2 := c.linkMap[c.input[intf]]
// 		if err := c.objs.XdpRedirectMap.Put(uint32((*link1).Attrs().Index), uint32((*link2).Attrs().Index)); err != nil {
// 			errs = multierror.Append(errs, err)
// 		}
// 	}

// 	for _, intf := range changed {
// 		link1 := c.linkMap[intf]
// 		link2 := c.linkMap[c.input[intf]]
// 		if err := c.objs.XdpRedirectMap.Put(uint32((*link1).Attrs().Index), uint32((*link2).Attrs().Index)); err != nil {
// 			errs = multierror.Append(errs, err)
// 		}
// 	}

// 	for _, intf := range removed {
// 		link1 := c.linkMap[intf]
// 		if err := c.objs.XdpRedirectMap.Delete(uint32((*link1).Attrs().Index)); err != nil {
// 			errs = multierror.Append(errs, err)
// 		}
// 	}

// 	return errs
// }

// // Launch app, watch for changes and perform "warm" reloads.
// // This function blocks forever and context can be used to gracefully stop it.
// // updateCh expects a map between interfaces, similar to input of NewXconnectApp.
// func (c *App) Launch(ctx context.Context, updateCh chan map[string]string) {

// 	var links []string
// 	for link := range c.linkMap {
// 		links = append(links, link)
// 	}
// 	if err := c.addXdpToLink(links); err != nil {
// 		log.Fatalf("Failed to set up XDP on links: %s", err)
// 	}

// 	for {
// 		select {
// 		case <-ctx.Done():
// 			log.Printf("ctx.Done")
// 			if err := c.cleanup(); err != nil {
// 				log.Fatalf("Cleanup Failed: %s", err)
// 			}
// 			return
// 		case config := <-updateCh:
// 			if err := c.update(config); err != nil {
// 				log.Printf("Error updating eBPF: %s", err)
// 			}
// 		}
// 	}
// }
