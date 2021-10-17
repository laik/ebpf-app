#ifndef __PGWU_MAPS_H
#define __PGWU_MAPS_H

#include <linux/bpf.h>
#include "bpf_helpers.h"
#include "srv6_consts.h"
#include "srv6_structs.h"
#include "hook.h"

struct
{
    __uint(type, BPF_MAP_TYPE_DEVMAP);
    __uint(key_size, sizeof(int));
    __uint(value_size, sizeof(int));
    __uint(max_entries, MAX_TXPORT_DEVICE);
} tx_port SEC(".maps");

struct
{
    __uint(type, BPF_MAP_TYPE_LPM_TRIE);
    __type(key, struct lpm_key_v6);
    __type(value, struct end_function);
    __uint(max_entries, MAX_END_FUNCTION_ENTRIES);
    __uint(map_flags, BPF_F_NO_PREALLOC);
} function_table SEC(".maps");

struct
{
    __uint(type, BPF_MAP_TYPE_LPM_TRIE);
    __type(key, struct lpm_key_v4);
    __type(value, struct transit_behavior);
    __uint(max_entries, MAX_TRANSIT_ENTRIES);
    __uint(map_flags, BPF_F_NO_PREALLOC);
} transit_table_v4 SEC(".maps");

struct
{
    __uint(type, BPF_MAP_TYPE_LPM_TRIE);
    __type(key, struct lpm_key_v6);
    __type(value, struct transit_behavior);
    __uint(max_entries, MAX_TRANSIT_ENTRIES);
    __uint(map_flags, BPF_F_NO_PREALLOC);
} transit_table_v6 SEC(".maps");

struct
{
    __uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
    __type(key, int);
    __type(value, struct v6addr_heep);
    __uint(max_entries, 1);
} in_taple_v6_addr SEC(".maps");

// https://github.com/cloudflare/xdpcap
// struct bpf_map_def SEC("maps") xdpcap_hook = XDPCAP_HOOK();
struct xdpcap_hook
{
    __uint(type, BPF_MAP_TYPE_PROG_ARRAY);
    __uint(key_size, sizeof(int));
    __uint(value_size, sizeof(int));
    __uint(max_entries, 5);
} xdpcap_hook SEC(".maps");

#endif
