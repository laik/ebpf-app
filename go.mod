module github.com/laik/ebpf-app

go 1.17

require github.com/cilium/ebpf v0.7.0

require github.com/vishvananda/netlink v1.1.0

require (
	github.com/hashicorp/go-multierror v1.1.1
	github.com/vishvananda/netns v0.0.0-20191106174202-0a2b9b5464df // indirect
)

require (
	github.com/hashicorp/errwrap v1.0.0 // indirect
	github.com/spf13/pflag v1.0.5
	golang.org/x/sys v0.0.0-20210906170528-6f6e22806c34
	gopkg.in/fsnotify.v1 v1.4.7
	gopkg.in/yaml.v2 v2.4.0
)

require github.com/fsnotify/fsnotify v1.5.1 // indirect
