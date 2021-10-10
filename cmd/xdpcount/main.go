package main

import (
	"context"
	"fmt"
	"os"

	"github.com/laik/ebpf-app/pkg/xdpcount"
	"github.com/laik/ebpf-app/utils"
	flag "github.com/spf13/pflag"
)

var (
	links   = flag.StringArray("links", []string{}, "--links lo,eht0")
	version = flag.Bool("v", false, "Display version")
)

func Run(commit string) error {
	fmt.Println("eBPF xdpcount app")

	ctx, cancel := context.WithCancel(context.Background())

	utils.SetupSigHandlers(cancel)

	flag.Parse()

	if *version {
		utils.PrintVersion(commit)
	}

	app, err := xdpcount.NewXDPCountApp()
	if err != nil {
		return fmt.Errorf("Loading eBPF: %s", err)
	}

	app.Launch(ctx, *links)

	return nil
}

var (
	GitCommit = "latest"
)

func main() {
	if err := Run(GitCommit); err != nil {
		fmt.Fprintf(os.Stderr, "Error:\n%s\n", err.Error())
		os.Exit(1)
	}
}
