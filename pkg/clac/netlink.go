package clac

import (
	"github.com/hashicorp/go-multierror"
	"github.com/laik/ebpf-app/pkg/common"
	"github.com/vishvananda/netlink"
)

func (c *App) addXdpToLink(intfs []string) error {
	var errs error
	for _, intf := range intfs {
		link, err := common.LookupLink(intf)
		if err != nil {
			errs = multierror.Append(errs, err)
			continue
		}
		err = netlink.LinkSetXdpFdWithFlags(*link, c.objs.clacPrograms.Prog.FD(), common.XdpFlags((*link).Type()))
		if err != nil {
			errs = multierror.Append(errs, err)
		}
	}
	c.links = intfs

	return errs
}

func (c *App) delXdpFromLink(intfs []string) error {
	var errs error
	for _, intf := range intfs {
		link, err := common.LookupLink(intf)
		if err != nil {
			errs = multierror.Append(errs, err)
			continue
		}
		err = netlink.LinkSetXdpFdWithFlags(*link, -1, common.XdpFlags((*link).Type()))
		if err != nil {
			errs = multierror.Append(errs, err)
		}
	}

	return errs
}
