package ringbuf

import (
	"bytes"
	"context"
	"encoding/binary"
	"errors"
	"log"

	"github.com/cilium/ebpf"
	"github.com/cilium/ebpf/link"
	"github.com/cilium/ebpf/ringbuf"
	"github.com/cilium/ebpf/rlimit"
	"golang.org/x/sys/unix"
)

//go:generate go run github.com/cilium/ebpf/cmd/bpf2go ringbuf ../../ebpf/ringbuf/ringbuf.c -- -I../../ebpf/common -O2 -Wall -Wno-unused-variable

// An Event represents a ringbuf event sent to userspace from the eBPF program
// running in the kernel. Note that this must match the C event_t structure,
// and that both C and Go structs must be aligned same way.
type Event struct {
	PID  uint32
	Comm [80]byte
}

// Name of the kernel function to trace.
const fn = "sys_execve"

type App struct {
	objs   *ringbufObjects
	kpLink link.Link
}

func NewApp() (*App, error) {
	app := &App{
		objs: &ringbufObjects{},
	}

	if err := rlimit.RemoveMemlock(); err != nil {
		log.Fatal(err)
	}

	err := loadRingbufObjects(app.objs, &ebpf.CollectionOptions{
		Maps: ebpf.MapOptions{
			PinPath: "/sys/fs/bpf/",
		},
		Programs: ebpf.ProgramOptions{},
	})
	if err != nil {
		return nil, err
	}

	kpLink, err := link.Kprobe(fn, app.objs.KprobeExecve)
	if err != nil {
		log.Fatalf("opening kprobe: %s", err)
	}
	if err != nil {
		return nil, err
	}

	app.kpLink = kpLink

	return app, nil
}

func (c *App) cleanup() error {
	var errs error

	if err := c.kpLink.Close(); err != nil {
		return err
	}

	if err := c.objs.Close(); err != nil {
		return err
	}

	return errs
}

func (c *App) Launch(ctx context.Context) error {
	// Open a ringbuf reader from userspace RINGBUF map described in the
	// eBPF C program.
	rd, err := ringbuf.NewReader(c.objs.Events)
	if err != nil {
		log.Fatalf("opening ringbuf reader: %s", err)
	}
	defer rd.Close()

	// Close the reader when the process receives a signal, which will exit
	// the read loop.
	go func() {
		<-ctx.Done()
		if err := rd.Close(); err != nil {
			log.Fatalf("closing ringbuf reader: %s", err)
		}
	}()

	log.Println("Waiting for events..")

	for {
		record, err := rd.Read()
		if err != nil {
			if errors.Is(err, ringbuf.ErrClosed) {
				log.Println("Received signal, exiting..")
				return err
			}
			log.Printf("reading from reader: %s", err)
			continue
		}

		// Parse the ringbuf event entry into an Event structure.
		var event Event
		if err := binary.Read(bytes.NewBuffer(record.RawSample), binary.LittleEndian, &event); err != nil {
			log.Printf("parsing ringbuf event: %s", err)
			continue
		}

		log.Printf("pid: %d\tcomm: %s\n", event.PID, unix.ByteSliceToString(event.Comm[:]))
	}
}

// func (c *App) printResult() error {
// 	// var key uint32
// 	// var value uint32
// 	// if err := c.objs.MonitorMap.NextKey(key, value); err != nil {
// 	// 	return err
// 	// }

// 	// fmt.Printf("recv key %d value %d\r\n", key, value)
// 	return nil
// }
