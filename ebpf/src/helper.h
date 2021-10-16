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

#endif