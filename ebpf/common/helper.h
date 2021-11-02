#ifndef __HELPER_H
#define __HELPER_H

#define bpfprintf(fmt, args...)                             \
    (                                                       \
        {                                                   \
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

/*
 *	IEEE 802.3 Ethernet magic constants.  The frame sizes omit the preamble
 *	and FCS/CRC (frame check sequence).
 */

#define ETH_ALEN 6         /* Octets in one ethernet addr	 */
#define ETH_TLEN 2         /* Octets in ethernet type field */
#define ETH_HLEN 14        /* Total octets in header.	 */
#define ETH_ZLEN 60        /* Min. octets in frame sans FCS */
#define ETH_DATA_LEN 1500  /* Max. octets in payload	 */
#define ETH_FRAME_LEN 1514 /* Max. octets in frame sans FCS */
#define ETH_FCS_LEN 4      /* Octets in the FCS		 */

#define ETH_MIN_MTU 68      /* Min IPv4 MTU per RFC791	*/
#define ETH_MAX_MTU 0xFFFFU /* 65535, same as IP_MAX_MTU	*/

/*
 *	These are the defined Ethernet Protocol ID's.
 */

#define ETH_P_LOOP 0x0060      /* Ethernet Loopback packet	*/
#define ETH_P_PUP 0x0200       /* Xerox PUP packet		*/
#define ETH_P_PUPAT 0x0201     /* Xerox PUP Addr Trans packet	*/
#define ETH_P_TSN 0x22F0       /* TSN (IEEE 1722) packet	*/
#define ETH_P_ERSPAN2 0x22EB   /* ERSPAN version 2 (type III)	*/
#define ETH_P_IP 0x0800        /* Internet Protocol packet	*/
#define ETH_P_X25 0x0805       /* CCITT X.25			*/
#define ETH_P_ARP 0x0806       /* Address Resolution packet	*/
#define ETH_P_BPQ 0x08FF       /* G8BPQ AX.25 Ethernet Packet	[ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_IEEEPUP 0x0a00   /* Xerox IEEE802.3 PUP packet */
#define ETH_P_IEEEPUPAT 0x0a01 /* Xerox IEEE802.3 PUP Addr Trans packet */
#define ETH_P_BATMAN 0x4305    /* B.A.T.M.A.N.-Advanced packet [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_DEC 0x6000       /* DEC Assigned proto           */
#define ETH_P_DNA_DL 0x6001    /* DEC DNA Dump/Load            */
#define ETH_P_DNA_RC 0x6002    /* DEC DNA Remote Console       */
#define ETH_P_DNA_RT 0x6003    /* DEC DNA Routing              */
#define ETH_P_LAT 0x6004       /* DEC LAT                      */
#define ETH_P_DIAG 0x6005      /* DEC Diagnostics              */
#define ETH_P_CUST 0x6006      /* DEC Customer use             */
#define ETH_P_SCA 0x6007       /* DEC Systems Comms Arch       */
#define ETH_P_TEB 0x6558       /* Trans Ether Bridging		*/
#define ETH_P_RARP 0x8035      /* Reverse Addr Res packet	*/
#define ETH_P_ATALK 0x809B     /* Appletalk DDP		*/
#define ETH_P_AARP 0x80F3      /* Appletalk AARP		*/
#define ETH_P_8021Q 0x8100     /* 802.1Q VLAN Extended Header  */
#define ETH_P_ERSPAN 0x88BE    /* ERSPAN type II		*/
#define ETH_P_IPX 0x8137       /* IPX over DIX			*/
#define ETH_P_IPV6 0x86DD      /* IPv6 over bluebook		*/
#define ETH_P_PAUSE 0x8808     /* IEEE Pause frames. See 802.3 31B */
#define ETH_P_SLOW 0x8809      /* Slow Protocol. See 802.3ad 43B */
#define ETH_P_WCCP 0x883E      /* Web-cache coordination protocol \
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
#define ETH_P_PAE 0x888E       /* Port Access Entity (IEEE 802.1X) */
#define ETH_P_AOE 0x88A2       /* ATA over Ethernet		*/
#define ETH_P_8021AD 0x88A8    /* 802.1ad Service VLAN		*/
#define ETH_P_802_EX1 0x88B5   /* 802.1 Local Experimental 1.  */
#define ETH_P_PREAUTH 0x88C7   /* 802.11 Preauthentication */
#define ETH_P_TIPC 0x88CA      /* TIPC 			*/
#define ETH_P_LLDP 0x88CC      /* Link Layer Discovery Protocol */
#define ETH_P_MRP 0x88E3       /* Media Redundancy Protocol	*/
#define ETH_P_MACSEC 0x88E5    /* 802.1ae MACsec */
#define ETH_P_8021AH 0x88E7    /* 802.1ah Backbone Service Tag */
#define ETH_P_MVRP 0x88F5      /* 802.1Q MVRP                  */
#define ETH_P_1588 0x88F7      /* IEEE 1588 Timesync */
#define ETH_P_NCSI 0x88F8      /* NCSI protocol		*/
#define ETH_P_PRP 0x88FB       /* IEC 62439-3 PRP/HSRv0	*/
#define ETH_P_FCOE 0x8906      /* Fibre Channel over Ethernet  */
#define ETH_P_IBOE 0x8915      /* Infiniband over Ethernet	*/
#define ETH_P_TDLS 0x890D      /* TDLS */
#define ETH_P_FIP 0x8914       /* FCoE Initialization Protocol */
#define ETH_P_80221 0x8917     /* IEEE 802.21 Media Independent Handover Protocol */
#define ETH_P_HSR 0x892F       /* IEC 62439-3 HSRv1	*/
#define ETH_P_NSH 0x894F       /* Network Service Header */
#define ETH_P_LOOPBACK 0x9000  /* Ethernet loopback packet, per IEEE 802.3 */
#define ETH_P_QINQ1 0x9100     /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_QINQ2 0x9200     /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_QINQ3 0x9300     /* deprecated QinQ VLAN [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_EDSA 0xDADA      /* Ethertype DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_DSA_8021Q 0xDADB /* Fake VLAN Header for DSA [ NOT AN OFFICIALLY REGISTERED ID ] */
#define ETH_P_IFE 0xED3E       /* ForCES inter-FE LFB type */
#define ETH_P_AF_IUCV 0xFBFB   /* IBM af_iucv [ NOT AN OFFICIALLY REGISTERED ID ] */

#define ETH_P_802_3_MIN 0x0600 /* If the value in the ethernet type is less than this value \
                                * then the frame is Ethernet II. Else it is 802.3 */

/*
 *	Non DIX types. Won't clash for 1500 types.
 */

#define ETH_P_802_3 0x0001      /* Dummy type for 802.3 frames  */
#define ETH_P_AX25 0x0002       /* Dummy protocol id for AX.25  */
#define ETH_P_ALL 0x0003        /* Every packet (be careful!!!) */
#define ETH_P_802_2 0x0004      /* 802.2 frames 		*/
#define ETH_P_SNAP 0x0005       /* Internal only		*/
#define ETH_P_DDCMP 0x0006      /* DEC DDCMP: Internal only     */
#define ETH_P_WAN_PPP 0x0007    /* Dummy type for WAN PPP frames*/
#define ETH_P_PPP_MP 0x0008     /* Dummy type for PPP MP frames */
#define ETH_P_LOCALTALK 0x0009  /* Localtalk pseudo type 	*/
#define ETH_P_CAN 0x000C        /* CAN: Controller Area Network */
#define ETH_P_CANFD 0x000D      /* CANFD: CAN flexible data rate*/
#define ETH_P_PPPTALK 0x0010    /* Dummy type for Atalk over PPP*/
#define ETH_P_TR_802_2 0x0011   /* 802.2 frames 		*/
#define ETH_P_MOBITEX 0x0015    /* Mobitex (kaz@cafe.net)	*/
#define ETH_P_CONTROL 0x0016    /* Card specific control frames */
#define ETH_P_IRDA 0x0017       /* Linux-IrDA			*/
#define ETH_P_ECONET 0x0018     /* Acorn Econet			*/
#define ETH_P_HDLC 0x0019       /* HDLC frames			*/
#define ETH_P_ARCNET 0x001A     /* 1A for ArcNet :-)            */
#define ETH_P_DSA 0x001B        /* Distributed Switch Arch.	*/
#define ETH_P_TRAILER 0x001C    /* Trailer switch tagging	*/
#define ETH_P_PHONET 0x00F5     /* Nokia Phonet frames          */
#define ETH_P_IEEE802154 0x00F6 /* IEEE802.15.4 frame		*/
#define ETH_P_CAIF 0x00F7       /* ST-Ericsson CAIF protocol	*/
#define ETH_P_XDSA 0x00F8       /* Multiplexed DSA protocol	*/
#define ETH_P_MAP 0x00F9        /* Qualcomm multiplexing and \
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
#define TCA_ACT_HW_STATS_DELAYED (1 << 1)   /* Means that in dump, user gets      \
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