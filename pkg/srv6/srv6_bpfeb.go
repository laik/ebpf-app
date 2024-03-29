// Code generated by bpf2go; DO NOT EDIT.
//go:build arm64be || armbe || mips || mips64 || mips64p32 || ppc64 || s390 || s390x || sparc || sparc64
// +build arm64be armbe mips mips64 mips64p32 ppc64 s390 s390x sparc sparc64

package srv6

import (
	"bytes"
	_ "embed"
	"fmt"
	"io"

	"github.com/cilium/ebpf"
)

// loadSrv6 returns the embedded CollectionSpec for srv6.
func loadSrv6() (*ebpf.CollectionSpec, error) {
	reader := bytes.NewReader(_Srv6Bytes)
	spec, err := ebpf.LoadCollectionSpecFromReader(reader)
	if err != nil {
		return nil, fmt.Errorf("can't load srv6: %w", err)
	}

	return spec, err
}

// loadSrv6Objects loads srv6 and converts it into a struct.
//
// The following types are suitable as obj argument:
//
//     *srv6Objects
//     *srv6Programs
//     *srv6Maps
//
// See ebpf.CollectionSpec.LoadAndAssign documentation for details.
func loadSrv6Objects(obj interface{}, opts *ebpf.CollectionOptions) error {
	spec, err := loadSrv6()
	if err != nil {
		return err
	}

	return spec.LoadAndAssign(obj, opts)
}

// srv6Specs contains maps and programs before they are loaded into the kernel.
//
// It can be passed ebpf.CollectionSpec.Assign.
type srv6Specs struct {
	srv6ProgramSpecs
	srv6MapSpecs
}

// srv6Specs contains programs before they are loaded into the kernel.
//
// It can be passed ebpf.CollectionSpec.Assign.
type srv6ProgramSpecs struct {
	Srv6Handler *ebpf.ProgramSpec `ebpf:"srv6_handler"`
	XdpPassFunc *ebpf.ProgramSpec `ebpf:"xdp_pass_func"`
}

// srv6MapSpecs contains maps before they are loaded into the kernel.
//
// It can be passed ebpf.CollectionSpec.Assign.
type srv6MapSpecs struct {
	FunctionTable  *ebpf.MapSpec `ebpf:"function_table"`
	InTapleV6Addr  *ebpf.MapSpec `ebpf:"in_taple_v6_addr"`
	TransitTableV4 *ebpf.MapSpec `ebpf:"transit_table_v4"`
	TransitTableV6 *ebpf.MapSpec `ebpf:"transit_table_v6"`
	TxPort         *ebpf.MapSpec `ebpf:"tx_port"`
	XdpcapHook     *ebpf.MapSpec `ebpf:"xdpcap_hook"`
}

// srv6Objects contains all objects after they have been loaded into the kernel.
//
// It can be passed to loadSrv6Objects or ebpf.CollectionSpec.LoadAndAssign.
type srv6Objects struct {
	srv6Programs
	srv6Maps
}

func (o *srv6Objects) Close() error {
	return _Srv6Close(
		&o.srv6Programs,
		&o.srv6Maps,
	)
}

// srv6Maps contains all maps after they have been loaded into the kernel.
//
// It can be passed to loadSrv6Objects or ebpf.CollectionSpec.LoadAndAssign.
type srv6Maps struct {
	FunctionTable  *ebpf.Map `ebpf:"function_table"`
	InTapleV6Addr  *ebpf.Map `ebpf:"in_taple_v6_addr"`
	TransitTableV4 *ebpf.Map `ebpf:"transit_table_v4"`
	TransitTableV6 *ebpf.Map `ebpf:"transit_table_v6"`
	TxPort         *ebpf.Map `ebpf:"tx_port"`
	XdpcapHook     *ebpf.Map `ebpf:"xdpcap_hook"`
}

func (m *srv6Maps) Close() error {
	return _Srv6Close(
		m.FunctionTable,
		m.InTapleV6Addr,
		m.TransitTableV4,
		m.TransitTableV6,
		m.TxPort,
		m.XdpcapHook,
	)
}

// srv6Programs contains all programs after they have been loaded into the kernel.
//
// It can be passed to loadSrv6Objects or ebpf.CollectionSpec.LoadAndAssign.
type srv6Programs struct {
	Srv6Handler *ebpf.Program `ebpf:"srv6_handler"`
	XdpPassFunc *ebpf.Program `ebpf:"xdp_pass_func"`
}

func (p *srv6Programs) Close() error {
	return _Srv6Close(
		p.Srv6Handler,
		p.XdpPassFunc,
	)
}

func _Srv6Close(closers ...io.Closer) error {
	for _, closer := range closers {
		if err := closer.Close(); err != nil {
			return err
		}
	}
	return nil
}

// Do not access this directly.
//go:embed srv6_bpfeb.o
var _Srv6Bytes []byte
