# XDPCOUNT_TARGETS  	  := xdp_ping_count
XDP_TARGETS  := ringbuf

LLC ?= llc
CLANG ?= clang
CC := gcc

LIBBPF_DIR = ../libbpf/src
COMMON_DIR = ../common

include $(COMMON_DIR)/common.mk


# make
# ip link set dev lo xdpgeneric off
# ip link set dev lo xdpgeneric obj xdp_ping_count.o sec counter
# cat /sys/kernel/debug/tracing/trace_pipe