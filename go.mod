module github.com/laik/ebpf-app

go 1.17

require github.com/cilium/ebpf v0.6.2

require github.com/vishvananda/netlink v1.1.0

require (
	github.com/hashicorp/go-multierror v1.1.1
	github.com/vishvananda/netns v0.0.0-20191106174202-0a2b9b5464df // indirect
)

require (
	github.com/hashicorp/errwrap v1.0.0 // indirect
	github.com/spf13/pflag v1.0.5
	golang.org/x/sys v0.0.0-20210124154548-22da62e12c0c
	gopkg.in/fsnotify.v1 v1.4.7
	gopkg.in/yaml.v2 v2.4.0
)

require github.com/spf13/flag v0.0.0-20140426202619-916eaf9e2dc5 // indirect
