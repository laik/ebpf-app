
REDIRECT        = redirect.o
CLSACT     		= clsact.o
CLSACT2    		= clsact2.o
XDPCOUNTER 		= xdpcount.o


# BTF debug data section '.BTF' rejected: Invalid argument (22)!
BPFCC      = clang
BPFCFLAGS  = -target bpf -Wall -O2 -emit-llvm -g -c
BPFCFLAGS += -Iinclude
BPFLC      = llc
BPFLCFLAGS = -march=bpf -mcpu=probe -filetype=obj

all: clean $(REDIRECT) $(CLSACT) $(CLSACT2) $(XDPCOUNTER)

%.o: %.c
	$(BPFCC) $(BPFCFLAGS) -c $< -o - | \
	$(BPFLC) $(BPFLCFLAGS) -o $@

clean:
	rm -f *.o