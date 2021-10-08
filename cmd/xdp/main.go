package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"syscall"

	"os/signal"

	flag "github.com/spf13/pflag"

	"github.com/laik/ebpf-app/pkg/xdp"
	"gopkg.in/fsnotify.v1"
	"gopkg.in/yaml.v2"
)

var (
	configFlag = flag.String("cfg", "", "[mandatory] xdp configuration file (YAML)")
	version    = flag.Bool("v", false, "Display version")
)

func setupSigHandlers(cancel context.CancelFunc) {
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGTERM, syscall.SIGINT, syscall.SIGHUP)

	go func() {
		sig := <-sigs
		log.Printf("Received syscall:%+v", sig)
		cancel()
	}()

}

func printVersion(gitCommit string) {
	fmt.Printf("Version: %s\n", gitCommit)
	os.Exit(0)
}

func Run(commit string) error {
	fmt.Println("eBPF app")

	ctx, cancel := context.WithCancel(context.Background())

	setupSigHandlers(cancel)

	flag.Parse()

	if *version {
		printVersion(commit)
	}

	if *configFlag == "" {
		flag.Usage()
		return fmt.Errorf("-conf flag was not provided")
	}

	cfg, err := newFromFile(*configFlag)
	if err != nil {
		return fmt.Errorf("Parsing configuration file: %s", err)
	}

	updateCh := make(chan map[string]string, 1)
	go configWatcher(*configFlag, updateCh)

	app, err := xdp.NewXDPRedirectApp(cfg.Links)
	if err != nil {
		return fmt.Errorf("Loading eBPF: %s", err)
	}

	app.Launch(ctx, updateCh)

	return nil
}

// Config holds the parsed configuration file
type Config struct {
	Links map[string]string `yaml:"links"`
}

func newFromFile(file string) (*Config, error) {
	var cfg Config
	log.Printf("Parsing config file: %s", file)

	f, err := os.Open(file)
	if err != nil {
		return nil, err
	}
	defer f.Close()

	decoder := yaml.NewDecoder(f)
	err = decoder.Decode(&cfg)
	if err != nil {
		return nil, err
	}

	log.Printf("App configuration: %+v", cfg)
	return &cfg, nil
}

func configWatcher(file string, out chan map[string]string) {

	watcher, err := fsnotify.NewWatcher()
	if err != nil {
		log.Panicf("Failed to initialise fsnotify: %s", err)
	}
	defer watcher.Close()

	if err := watcher.Add(file); err != nil {
		log.Panicf("Error watching the configuration file: %s", err)
	}

	for {
		select {
		case <-watcher.Events:
			cfg, err := newFromFile(file)
			if err != nil {
				log.Printf("Error parsing the configuration file: %s", err)
			} else {
				out <- cfg.Links
			}

		case err := <-watcher.Errors:
			log.Printf("Received watcher.Error: %s", err)
		}
	}
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
