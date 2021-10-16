package common

import (
	"sort"

	"github.com/vishvananda/netlink"
	"golang.org/x/sys/unix"
)

// IncreaseResourceLimits https://prototype-kernel.readthedocs.io/en/latest/bpf/troubleshooting.html#memory-ulimits
func IncreaseResourceLimits() error {
	return unix.Setrlimit(unix.RLIMIT_MEMLOCK, &unix.Rlimit{
		Cur: unix.RLIM_INFINITY,
		Max: unix.RLIM_INFINITY,
	})
}

func LookupLink(intf string) (*netlink.Link, error) {
	link, err := netlink.LinkByName(intf)
	if err != nil {
		return nil, err
	}
	return &link, nil
}

// forcing xdpgeneric for veth because https://www.netdevconf.org/0x13/session.html?talk-veth-xdp
// tuntap also requires this probably for the same reasons
func XdpFlags(linkType string) int {
	if linkType == "veth" || linkType == "tuntap" {
		return 2
	}
	return 0 // native xdp (xdpdrv) by default
}

// MakeSymm enforces symmetricity of map[string]string
// first k/v pair wins, repeated values are discarded
func MakeSymm(inMap map[string]string) map[string]string {
	res := make(map[string]string)

	var keys []string
	for k := range inMap {
		keys = append(keys, k)
	}
	sort.Strings(keys)

	for _, k := range keys {
		v := inMap[k]
		_, keyFound := res[k]
		_, valFound := res[v]
		if !keyFound && !valFound {
			res[k] = v
			res[v] = k
		}
	}

	return res
}

// ConfDiff compares the running and candidate configurations
// and returns any new, changed or removed interface names
func ConfDiff(running, candidates map[string]string) ([]string, []string, []string) {
	var new, changed, orphaned []string
	for c1, c2 := range candidates {
		p2, ok := running[c1]
		if !ok {
			new = append(new, c1)
		} else if p2 != c2 {
			changed = append(changed, c1)
		}
	}

	for p1 := range running {
		_, ok := candidates[p1]
		if !ok {
			orphaned = append(orphaned, p1)
		}
	}
	return new, changed, orphaned
}
