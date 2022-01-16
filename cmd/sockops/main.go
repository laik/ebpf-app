package main

import (
	"context"
	"fmt"
	"os"

	flag "github.com/spf13/pflag"

	"github.com/laik/ebpf-app/pkg/sockops"
	"github.com/laik/ebpf-app/utils"
)

var (
	version    = flag.Bool("v", false, "Display version")
)

func Run(commit string) error {
	fmt.Println("eBPF app")

	ctx, cancel := context.WithCancel(context.Background())

	utils.SetupSigHandlers(cancel)

	flag.Parse()

	if *version {
		utils.PrintVersion(commit)
	}

	app, err := sockops.NewApp()
	if err != nil {
		return err
	}

	return app.Run(ctx)
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
