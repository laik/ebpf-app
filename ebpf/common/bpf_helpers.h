/* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */
#ifndef __BPF_HELPERS__
#define __BPF_HELPERS__

/*
 * Note that bpf programs need to include either
 * vmlinux.h (auto-generated from BTF) or linux/types.h
 * in advance since bpf_helper_defs.h uses such types
 * as __u64.
 */
#include "bpf_helper_defs.h"

#define __uint(name, val) int (*name)[val]
#define __type(name, val) typeof(val) *name
#define __array(name, val) typeof(val) *name[]

/*
 * Helper macro to place programs, maps, license in
 * different sections in elf_bpf file. Section names
 * are interpreted by libbpf depending on the context (BPF programs, BPF maps,
 * extern variables, etc).
 * To allow use of SEC() with externs (e.g., for extern .maps declarations),
 * make sure __attribute__((unused)) doesn't trigger compilation warning.
 */
#define SEC(name) \
	_Pragma("GCC diagnostic push")					    \
	_Pragma("GCC diagnostic ignored \"-Wignored-attributes\"")	    \
	__attribute__((section(name), used))				    \
	_Pragma("GCC diagnostic pop")					    \

/* Avoid 'linux/stddef.h' definition of '__always_inline'. */
#undef __always_inline
#define __always_inline inline __attribute__((always_inline))

#ifndef __noinline
#define __noinline __attribute__((noinline))
#endif
#ifndef __weak
#define __weak __attribute__((weak))
#endif

/*
 * Use __hidden attribute to mark a non-static BPF subprogram effectively
 * static for BPF verifier's verification algorithm purposes, allowing more
 * extensive and permissive BPF verification process, taking into account
 * subprogram's caller context.
 */
#define __hidden __attribute__((visibility("hidden")))

/* When utilizing vmlinux.h with BPF CO-RE, user BPF programs can't include
 * any system-level headers (such as stddef.h, linux/version.h, etc), and
 * commonly-used macros like NULL and KERNEL_VERSION aren't available through
 * vmlinux.h. This just adds unnecessary hurdles and forces users to re-define
 * them on their own. So as a convenience, provide such definitions here.
 */
#ifndef NULL
#define NULL ((void *)0)
#endif

#ifndef KERNEL_VERSION
#define KERNEL_VERSION(a, b, c) (((a) << 16) + ((b) << 8) + ((c) > 255 ? 255 : (c)))
#endif

/*
 * Helper macros to manipulate data structures
 */
#ifndef offsetof
#define offsetof(TYPE, MEMBER)	((unsigned long)&((TYPE *)0)->MEMBER)
#endif
#ifndef container_of
#define container_of(ptr, type, member)				\
	({							\
		void *__mptr = (void *)(ptr);			\
		((type *)(__mptr - offsetof(type, member)));	\
	})
#endif

/*
 * Helper macro to throw a compilation error if __bpf_unreachable() gets
 * built into the resulting code. This works given BPF back end does not
 * implement __builtin_trap(). This is useful to assert that certain paths
 * of the program code are never used and hence eliminated by the compiler.
 *
 * For example, consider a switch statement that covers known cases used by
 * the program. __bpf_unreachable() can then reside in the default case. If
 * the program gets extended such that a case is not covered in the switch
 * statement, then it will throw a build error due to the default case not
 * being compiled out.
 */
#ifndef __bpf_unreachable
# define __bpf_unreachable()	__builtin_trap()
#endif

/*
 * Helper function to perform a tail call with a constant/immediate map slot.
 */
#if __clang_major__ >= 8 && defined(__bpf__)
static __always_inline void
bpf_tail_call_static(void *ctx, const void *map, const __u32 slot)
{
	if (!__builtin_constant_p(slot))
		__bpf_unreachable();

	/*
	 * Provide a hard guarantee that LLVM won't optimize setting r2 (map
	 * pointer) and r3 (constant map index) from _different paths_ ending
	 * up at the _same_ call insn as otherwise we won't be able to use the
	 * jmpq/nopl retpoline-free patching by the x86-64 JIT in the kernel
	 * given they mismatch. See also d2e4c1e6c294 ("bpf: Constant map key
	 * tracking for prog array pokes") for details on verifier tracking.
	 *
	 * Note on clobber list: we need to stay in-line with BPF calling
	 * convention, so even if we don't end up using r0, r4, r5, we need
	 * to mark them as clobber so that LLVM doesn't end up using them
	 * before / after the call.
	 */
	asm volatile("r1 = %[ctx]\n\t"
		     "r2 = %[map]\n\t"
		     "r3 = %[slot]\n\t"
		     "call 12"
		     :: [ctx]"r"(ctx), [map]"r"(map), [slot]"i"(slot)
		     : "r0", "r1", "r2", "r3", "r4", "r5");
}
#endif

/*
 * Helper structure used by eBPF C program
 * to describe BPF map attributes to libbpf loader
 */
struct bpf_map_def {
	unsigned int type;
	unsigned int key_size;
	unsigned int value_size;
	unsigned int max_entries;
	unsigned int map_flags;
};

enum libbpf_pin_type {
	LIBBPF_PIN_NONE,
	/* PIN_BY_NAME: pin maps by name (in /sys/fs/bpf by default) */
	LIBBPF_PIN_BY_NAME,
};

enum libbpf_tristate {
	TRI_NO = 0,
	TRI_YES = 1,
	TRI_MODULE = 2,
};

#define __kconfig __attribute__((section(".kconfig")))
#define __ksym __attribute__((section(".ksyms")))

#ifndef ___bpf_concat
#define ___bpf_concat(a, b) a ## b
#endif
#ifndef ___bpf_apply
#define ___bpf_apply(fn, n) ___bpf_concat(fn, n)
#endif
#ifndef ___bpf_nth
#define ___bpf_nth(_, _1, _2, _3, _4, _5, _6, _7, _8, _9, _a, _b, _c, N, ...) N
#endif
#ifndef ___bpf_narg
#define ___bpf_narg(...) \
	___bpf_nth(_, ##__VA_ARGS__, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)
#endif

#define ___bpf_fill0(arr, p, x) do {} while (0)
#define ___bpf_fill1(arr, p, x) arr[p] = x
#define ___bpf_fill2(arr, p, x, args...) arr[p] = x; ___bpf_fill1(arr, p + 1, args)
#define ___bpf_fill3(arr, p, x, args...) arr[p] = x; ___bpf_fill2(arr, p + 1, args)
#define ___bpf_fill4(arr, p, x, args...) arr[p] = x; ___bpf_fill3(arr, p + 1, args)
#define ___bpf_fill5(arr, p, x, args...) arr[p] = x; ___bpf_fill4(arr, p + 1, args)
#define ___bpf_fill6(arr, p, x, args...) arr[p] = x; ___bpf_fill5(arr, p + 1, args)
#define ___bpf_fill7(arr, p, x, args...) arr[p] = x; ___bpf_fill6(arr, p + 1, args)
#define ___bpf_fill8(arr, p, x, args...) arr[p] = x; ___bpf_fill7(arr, p + 1, args)
#define ___bpf_fill9(arr, p, x, args...) arr[p] = x; ___bpf_fill8(arr, p + 1, args)
#define ___bpf_fill10(arr, p, x, args...) arr[p] = x; ___bpf_fill9(arr, p + 1, args)
#define ___bpf_fill11(arr, p, x, args...) arr[p] = x; ___bpf_fill10(arr, p + 1, args)
#define ___bpf_fill12(arr, p, x, args...) arr[p] = x; ___bpf_fill11(arr, p + 1, args)
#define ___bpf_fill(arr, args...) \
	___bpf_apply(___bpf_fill, ___bpf_narg(args))(arr, 0, args)

/*
 * BPF_SEQ_PRINTF to wrap bpf_seq_printf to-be-printed values
 * in a structure.
 */
#define BPF_SEQ_PRINTF(seq, fmt, args...)			\
({								\
	static const char ___fmt[] = fmt;			\
	unsigned long long ___param[___bpf_narg(args)];		\
								\
	_Pragma("GCC diagnostic push")				\
	_Pragma("GCC diagnostic ignored \"-Wint-conversion\"")	\
	___bpf_fill(___param, args);				\
	_Pragma("GCC diagnostic pop")				\
								\
	bpf_seq_printf(seq, ___fmt, sizeof(___fmt),		\
		       ___param, sizeof(___param));		\
})

/*
 * BPF_SNPRINTF wraps the bpf_snprintf helper with variadic arguments instead of
 * an array of u64.
 */
#define BPF_SNPRINTF(out, out_size, fmt, args...)		\
({								\
	static const char ___fmt[] = fmt;			\
	unsigned long long ___param[___bpf_narg(args)];		\
								\
	_Pragma("GCC diagnostic push")				\
	_Pragma("GCC diagnostic ignored \"-Wint-conversion\"")	\
	___bpf_fill(___param, args);				\
	_Pragma("GCC diagnostic pop")				\
								\
	bpf_snprintf(out, out_size, ___fmt,			\
		     ___param, sizeof(___param));		\
})

#ifdef BPF_NO_GLOBAL_DATA
#define BPF_PRINTK_FMT_MOD
#else
#define BPF_PRINTK_FMT_MOD static const
#endif

#define __bpf_printk(fmt, ...)				\
({							\
	BPF_PRINTK_FMT_MOD char ____fmt[] = fmt;	\
	bpf_trace_printk(____fmt, sizeof(____fmt),	\
			 ##__VA_ARGS__);		\
})

/*
 * __bpf_vprintk wraps the bpf_trace_vprintk helper with variadic arguments
 * instead of an array of u64.
 */
#define __bpf_vprintk(fmt, args...)				\
({								\
	static const char ___fmt[] = fmt;			\
	unsigned long long ___param[___bpf_narg(args)];		\
								\
	_Pragma("GCC diagnostic push")				\
	_Pragma("GCC diagnostic ignored \"-Wint-conversion\"")	\
	___bpf_fill(___param, args);				\
	_Pragma("GCC diagnostic pop")				\
								\
	bpf_trace_vprintk(___fmt, sizeof(___fmt),		\
			  ___param, sizeof(___param));		\
})

/* Use __bpf_printk when bpf_printk call has 3 or fewer fmt args
 * Otherwise use __bpf_vprintk
 */
#define ___bpf_pick_printk(...) \
	___bpf_nth(_, ##__VA_ARGS__, __bpf_vprintk, __bpf_vprintk, __bpf_vprintk,	\
		   __bpf_vprintk, __bpf_vprintk, __bpf_vprintk, __bpf_vprintk,		\
		   __bpf_vprintk, __bpf_vprintk, __bpf_printk /*3*/, __bpf_printk /*2*/,\
		   __bpf_printk /*1*/, __bpf_printk /*0*/)

/* Helper macro to print out debug messages */
#define bpf_printk(fmt, args...) ___bpf_pick_printk(args)(fmt, ##args)

#define bpfprintf(fmt, args...)                             \
	(                                                       \
		{                                                   \
			const char __fmt[] = fmt;                       \
			bpf_trace_printk(__fmt, sizeof(__fmt), ##args); \
		})

#define printk(fmt, ...)                           \
	({                                             \
		const char ____fmt[] = fmt;                \
		bpf_trace_printk(____fmt, sizeof(____fmt), \
						 ##__VA_ARGS__);           \
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

/*
 *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
 *	and FCS/CRC (frame check sequence).
 */

#define ETH_ALEN 6		   /* Octets in one ethernet addr	 */
#define ETH_TLEN 2		   /* Octets in ethernet type field */
#define ETH_HLEN 14		   /* Total octets in header.	 */
#define ETH_ZLEN 60		   /* Min. octets in frame sans FCS */
#define ETH_DATA_LEN 1500  /* Max. octets in payload	 */
#define ETH_FRAME_LEN 1514 /* Max. octets in frame sans FCS */
#define ETH_FCS_LEN 4	   /* Octets in the FCS		 */

#define ETH_MIN_MTU 68		/* Min IPv4 MTU per RFC791	*/
#define ETH_MAX_MTU 0xFFFFU /* 65535, same as IP_MAX_MTU	*/

/*
 *	These are the defined Ethernet Protocol ID's.
 */

#define ETH_P_LOOP 0x0060	   /* Ethernet Loopback packet	*/
#define ETH_P_PUP 0x0200	   /* Xerox PUP packet		*/
#define ETH_P_PUPAT 0x0201	   /* Xerox PUP Addr Trans packet	*/
#define ETH_P_TSN 0x22F0	   /* TSN (IEEE 1722) packet	*/
#define ETH_P_ERSPAN2 0x22EB   /* ERSPAN version 2 (type III)	*/
#define ETH_P_IP 0x0800		   /* Internet Protocol packet	*/
#define ETH_P_X25 0x0805	   /* CCITT X.25			*/
#define ETH_P_ARP 0x0806	   /* Address Resolution packet	*/
#define ETH_P_BPQ 0x08FF	   /* G8BPQ AX.25 Ethernet Packet	[ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_IEEEPUP 0x0a00   /* Xerox IEEE802.3 PUP packet */
#define ETH_P_IEEEPUPAT 0x0a01 /* Xerox IEEE802.3 PUP Addr Trans packet */
#define ETH_P_BATMAN 0x4305	   /* B.A.T.M.A.N.-Advanced packet [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_DEC 0x6000	   /* DEC Assigned proto           */
#define ETH_P_DNA_DL 0x6001	   /* DEC DNA Dump/Load            */
#define ETH_P_DNA_RC 0x6002	   /* DEC DNA Remote Console       */
#define ETH_P_DNA_RT 0x6003	   /* DEC DNA Routing              */
#define ETH_P_LAT 0x6004	   /* DEC LAT                      */
#define ETH_P_DIAG 0x6005	   /* DEC Diagnostics              */
#define ETH_P_CUST 0x6006	   /* DEC Customer use             */
#define ETH_P_SCA 0x6007	   /* DEC Systems Comms Arch       */
#define ETH_P_TEB 0x6558	   /* Trans Ether Bridging		*/
#define ETH_P_RARP 0x8035	   /* Reverse Addr Res packet	*/
#define ETH_P_ATALK 0x809B	   /* Appletalk DDP		*/
#define ETH_P_AARP 0x80F3	   /* Appletalk AARP		*/
#define ETH_P_8021Q 0x8100	   /* 802.1Q VLAN Extended Header  */
#define ETH_P_ERSPAN 0x88BE	   /* ERSPAN type II		*/
#define ETH_P_IPX 0x8137	   /* IPX over DIX			*/
#define ETH_P_IPV6 0x86DD	   /* IPv6 over bluebook		*/
#define ETH_P_PAUSE 0x8808	   /* IEEE Pause frames. See 802.3 31B */
#define ETH_P_SLOW 0x8809	   /* Slow Protocol. See 802.3ad 43B */
#define ETH_P_WCCP 0x883E	   /* Web-cache coordination protocol \
								* defined in draft-wilson-wrec-wccp-v2-00.txt */
#define ETH_P_MPLS_UC 0x8847   /* MPLS Unicast traffic		*/
#define ETH_P_MPLS_MC 0x8848   /* MPLS Multicast traffic	*/
#define ETH_P_ATMMPOA 0x884c   /* MultiProtocol Over ATM	*/
#define ETH_P_PPP_DISC 0x8863  /* PPPoE discovery messages     */
#define ETH_P_PPP_SES 0x8864   /* PPPoE session messages	*/
#define ETH_P_LINK_CTL 0x886c  /* HPNA, wlan link local tunnel */
#define ETH_P_ATMFATE 0x8884   /* Frame-based ATM Transport \
								* over Ethernet             \
								*/
#define ETH_P_PAE 0x888E	   /* Port Access Entity (IEEE 802.1X) */
#define ETH_P_AOE 0x88A2	   /* ATA over Ethernet		*/
#define ETH_P_8021AD 0x88A8	   /* 802.1ad Service VLAN		*/
#define ETH_P_802_EX1 0x88B5   /* 802.1 Local Experimental 1.  */
#define ETH_P_PREAUTH 0x88C7   /* 802.11 Preauthentication */
#define ETH_P_TIPC 0x88CA	   /* TIPC 			*/
#define ETH_P_LLDP 0x88CC	   /* Link Layer Discovery Protocol */
#define ETH_P_MRP 0x88E3	   /* Media Redundancy Protocol	*/
#define ETH_P_MACSEC 0x88E5	   /* 802.1ae MACsec */
#define ETH_P_8021AH 0x88E7	   /* 802.1ah Backbone Service Tag */
#define ETH_P_MVRP 0x88F5	   /* 802.1Q MVRP                  */
#define ETH_P_1588 0x88F7	   /* IEEE 1588 Timesync */
#define ETH_P_NCSI 0x88F8	   /* NCSI protocol		*/
#define ETH_P_PRP 0x88FB	   /* IEC 62439-3 PRP/HSRv0	*/
#define ETH_P_FCOE 0x8906	   /* Fibre Channel over Ethernet  */
#define ETH_P_IBOE 0x8915	   /* Infiniband over Ethernet	*/
#define ETH_P_TDLS 0x890D	   /* TDLS */
#define ETH_P_FIP 0x8914	   /* FCoE Initialization Protocol */
#define ETH_P_80221 0x8917	   /* IEEE 802.21 Media Independent Handover Protocol */
#define ETH_P_HSR 0x892F	   /* IEC 62439-3 HSRv1	*/
#define ETH_P_NSH 0x894F	   /* Network Service Header */
#define ETH_P_LOOPBACK 0x9000  /* Ethernet loopback packet, per IEEE 802.3 */
#define ETH_P_QINQ1 0x9100	   /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_QINQ2 0x9200	   /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_QINQ3 0x9300	   /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_EDSA 0xDADA	   /* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_DSA_8021Q 0xDADB /* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_IFE 0xED3E	   /* ForCES inter-FE LFB type */
#define ETH_P_AF_IUCV 0xFBFB   /* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */

#define ETH_P_802_3_MIN 0x0600 /* If the value in the ethernet type is less than this value \
								* then the frame is Ethernet II. Else it is 802.3 */

/*
 *	Non DIX types. Won't clash for 1500 types.
 */

#define ETH_P_802_3 0x0001		/* Dummy type for 802.3 frames  */
#define ETH_P_AX25 0x0002		/* Dummy protocol id for AX.25  */
#define ETH_P_ALL 0x0003		/* Every packet (be careful!!!) */
#define ETH_P_802_2 0x0004		/* 802.2 frames 		*/
#define ETH_P_SNAP 0x0005		/* Internal only		*/
#define ETH_P_DDCMP 0x0006		/* DEC DDCMP: Internal only     */
#define ETH_P_WAN_PPP 0x0007	/* Dummy type for WAN PPP frames*/
#define ETH_P_PPP_MP 0x0008		/* Dummy type for PPP MP frames */
#define ETH_P_LOCALTALK 0x0009	/* Localtalk pseudo type 	*/
#define ETH_P_CAN 0x000C		/* CAN: Controller Area Network */
#define ETH_P_CANFD 0x000D		/* CANFD: CAN flexible data rate*/
#define ETH_P_PPPTALK 0x0010	/* Dummy type for Atalk over PPP*/
#define ETH_P_TR_802_2 0x0011	/* 802.2 frames 		*/
#define ETH_P_MOBITEX 0x0015	/* Mobitex (kaz@cafe.net)	*/
#define ETH_P_CONTROL 0x0016	/* Card specific control frames */
#define ETH_P_IRDA 0x0017		/* Linux-IrDA			*/
#define ETH_P_ECONET 0x0018		/* Acorn Econet			*/
#define ETH_P_HDLC 0x0019		/* HDLC frames			*/
#define ETH_P_ARCNET 0x001A		/* 1A for ArcNet :-)            */
#define ETH_P_DSA 0x001B		/* Distributed Switch Arch.	*/
#define ETH_P_TRAILER 0x001C	/* Trailer switch tagging	*/
#define ETH_P_PHONET 0x00F5		/* Nokia Phonet frames          */
#define ETH_P_IEEE802154 0x00F6 /* IEEE802.15.4 frame		*/
#define ETH_P_CAIF 0x00F7		/* ST-Ericsson CAIF protocol	*/
#define ETH_P_XDSA 0x00F8		/* Multiplexed DSA protocol	*/
#define ETH_P_MAP 0x00F9		/* Qualcomm multiplexing and \
								 * aggregation protocol      \
								 */

// TC Action

#define TCA_ACT_FLAGS_NO_PERCPU_STATS 1 /* Don't use percpu allocator for \
										 * actions stats.                 \
										 */

/* tca HW stats type
 * When user does not pass the attribute, he does not care.
 * It is the same as if he would pass the attribute with
 * all supported bits set.
 * In case no bits are set, user is not interested in getting any HW statistics.
 */
#define TCA_ACT_HW_STATS_IMMEDIATE (1 << 0) /* Means that in dump, user  \
											 * gets the current HW stats \
											 * state from the device     \
											 * queried at the dump time. \
											 */
#define TCA_ACT_HW_STATS_DELAYED (1 << 1)	/* Means that in dump, user gets      \
											 * HW stats that might be out of date \
											 * for some time, maybe couple of     \
											 * seconds. This is the case when     \
											 * driver polls stats updates         \
											 * periodically or when it gets async \
											 * stats update from the device.      \
											 */

#define TCA_ACT_MAX __TCA_ACT_MAX
#define TCA_OLD_COMPAT (TCA_ACT_MAX + 1)
#define TCA_ACT_MAX_PRIO 32
#define TCA_ACT_BIND 1
#define TCA_ACT_NOBIND 0
#define TCA_ACT_UNBIND 1
#define TCA_ACT_NOUNBIND 0
#define TCA_ACT_REPLACE 1
#define TCA_ACT_NOREPLACE 0

#define TC_ACT_UNSPEC (-1)
#define TC_ACT_OK 0
#define TC_ACT_RECLASSIFY 1
#define TC_ACT_SHOT 2
#define TC_ACT_PIPE 3
#define TC_ACT_STOLEN 4
#define TC_ACT_QUEUED 5
#define TC_ACT_REPEAT 6
#define TC_ACT_REDIRECT 7
#define TC_ACT_TRAP 8 /* For hw path, this means "trap to cpu" \
					   * and don't further process the frame   \
					   * in hardware. For sw path, this is     \
					   * equivalent of TC_ACT_STOLEN - drop    \
					   * the skb and act like everything       \
					   * is alright.                           \
					   */
#define TC_ACT_VALUE_MAX TC_ACT_TRAP

/* There is a special kind of actions called "extended actions",
 * which need a value parameter. These have a local opcode located in
 * the highest nibble, starting from 1. The rest of the bits
 * are used to carry the value. These two parts together make
 * a combined opcode.
 */
#define __TC_ACT_EXT_SHIFT 28
#define __TC_ACT_EXT(local) ((local) << __TC_ACT_EXT_SHIFT)
#define TC_ACT_EXT_VAL_MASK ((1 << __TC_ACT_EXT_SHIFT) - 1)
#define TC_ACT_EXT_OPCODE(combined) ((combined) & (~TC_ACT_EXT_VAL_MASK))
#define TC_ACT_EXT_CMP(combined, opcode) (TC_ACT_EXT_OPCODE(combined) == opcode)

#define TC_ACT_JUMP __TC_ACT_EXT(1)
#define TC_ACT_GOTO_CHAIN __TC_ACT_EXT(2)
#define TC_ACT_EXT_OPCODE_MAX TC_ACT_GOTO_CHAIN

/* These macros are put here for binary compatibility with userspace apps that
 * make use of them. For kernel code and new userspace apps, use the TCA_ID_*
 * versions.
 */
#define TCA_ACT_GACT 5
#define TCA_ACT_IPT 6
#define TCA_ACT_PEDIT 7
#define TCA_ACT_MIRRED 8
#define TCA_ACT_NAT 9
#define TCA_ACT_XT 10
#define TCA_ACT_SKBEDIT 11
#define TCA_ACT_VLAN 12
#define TCA_ACT_BPF 13
#define TCA_ACT_CONNMARK 14
#define TCA_ACT_SKBMOD 15
#define TCA_ACT_CSUM 16
#define TCA_ACT_TUNNEL_KEY 17
#define TCA_ACT_SIMP 22
#define TCA_ACT_IFE 25
#define TCA_ACT_SAMPLE 26

#endif
