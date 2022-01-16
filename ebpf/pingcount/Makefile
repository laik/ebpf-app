XDP_TARGETS  	  := xdppingcount

LLC ?= llc
CLANG ?= clang
CC := gcc

LIBBPF_DIR = ../common
COMMON_DIR = ../common

include $(COMMON_DIR)/common.mk

# make
# ip link set dev lo xdpgeneric off
# ip link set dev lo xdpgeneric obj xdppingcount.o sec counter
# cat /sys/kernel/debug/tracing/trace_pipe