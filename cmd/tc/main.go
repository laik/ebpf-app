package main

import (
	"context"
	"fmt"
	"os"

	"github.com/laik/ebpf-app/pkg/tc"
	"github.com/laik/ebpf-app/utils"
	flag "github.com/spf13/pflag"
)

var (
	configFlag = flag.String("cfg", "", "[mandatory] tc configuration file (YAML)")
	version    = flag.Bool("v", false, "Display version")
)

func Run(commit string) error {
	fmt.Println("eBPF tc app")

	ctx, cancel := context.WithCancel(context.Background())

	utils.SetupSigHandlers(cancel)

	flag.Parse()

	if *version {
		utils.PrintVersion(commit)
	}

	if *configFlag == "" {
		flag.Usage()
		return fmt.Errorf("-conf flag was not provided")
	}

	updateCh := make(chan map[string]string)

	app, err := tc.NewClsactApp(map[string]string{})
	if err != nil {
		return fmt.Errorf("Loading eBPF: %s", err)
	}

	app.Launch(ctx, updateCh)

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
