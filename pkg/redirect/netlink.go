package redirect

import (
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
	"github.com/vishvananda/netlink"
)

func (c *App) updateLinkMap(intfs []string) error {
	return c.addXdpToLink(intfs)
}

func (c *App) cleanupLinkMap(intfs []string) {
	for _, intf := range intfs {
		delete(c.linkMap, intf)
	}
}

func (c *App) addXdpToLink(intfs []string) error {
	var errs error
	for _, intf := range intfs {
		link := c.linkMap[intf]
		err := netlink.LinkSetXdpFdWithFlags(*link, c.objs.XdpRedirect.FD(), common.XdpFlags((*link).Type()))
		if err != nil {
			errs = multierror.Append(errs, err)
		}
	}

	return errs
}

func (c *App) delXdpFromLink(intfs []string) error {
	var errs error
	for _, intf := range intfs {
		link := c.linkMap[intf]
		err := netlink.LinkSetXdpFdWithFlags(*link, -1, common.XdpFlags((*link).Type()))
		if err != nil {
			errs = multierror.Append(errs, err)
		}
	}

	return errs
}
