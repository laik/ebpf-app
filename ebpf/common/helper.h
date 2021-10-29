#ifndef __HELPER_H
#define __HELPER_H

#define bpfprintf(fmt, args...)                         \
    ({                                                  \
        const char __fmt[] = fmt;                       \
        bpf_trace_printk(__fmt, sizeof(__fmt), ##args); \
    })

#ifndef lock_xadd
#define lock_xadd(ptr, val) ((void)__sync_fetch_and_add(ptr, val))
#endif

#ifndef __packed
#define __packed __attribute__((packed))
#endif

#ifndef memset
#define memset(dest, chr, n) __builtin_memset((dest), (chr), (n))
#endif

#ifndef memcpy
#define memcpy(dest, src, n) __builtin_memcpy((dest), (src), (n))
#endif

#ifndef memmove
#define memmove(dest, src, n) __builtin_memmove((dest), (src), (n))
#endif

#endif