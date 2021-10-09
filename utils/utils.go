package utils

import (
	"context"
	"fmt"
	"log"
	"os"
	"os/signal"
	"syscall"
)

func SetupSigHandlers(cancel context.CancelFunc) {
	sigs := make(chan os.Signal, 1)
	signal.Notify(sigs, syscall.SIGTERM, syscall.SIGINT, syscall.SIGHUP)

	go func() {
		sig := <-sigs
		log.Printf("Received syscall:%+v", sig)
		cancel()
	}()

}

func PrintVersion(gitCommit string) {
	fmt.Printf("Version: %s\n", gitCommit)
	os.Exit(0)
}
