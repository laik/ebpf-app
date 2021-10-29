# SPDX-License-Identifier: (GPL-2.0)
CC := gcc

all:

CFLAGS := -g -Wall

LIBBPF_DIR = .
CFLAGS += -I$(LIBBPF_DIR)

.PHONY: clean

clean:
	rm -f *.o
