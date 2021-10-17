#ifndef __SRV6_CONSTS_H
#define __SRV6_CONSTS_H
#include "bpf_endian.h"

// user define fib ctl value
#define NextFIBCheck 10000

// max mtusize
#define LOOP_MAX_RANGE 4000

// linux/socket.h
#define AF_INET 2   /* Internet IP Protocol 	*/
#define AF_INET6 10 /* IP version 6			*/

#define ETH_P_8021Q 0x8100  /* 802.1Q VLAN Extended Header  */
#define ETH_P_8021AD 0x88A8 /* 802.1ad Service VLAN     */
#define ETH_P_ARP 0x0806
#define ETH_P_IPV4 0x0800
#define ETH_P_IPV6 0x86DD

// net/ipv6.h
#define NEXTHDR_ROUTING 43 /* Routing header. */

// Entry size
#define MAX_TXPORT_DEVICE 64
#define MAX_TRANSIT_ENTRIES 256
#define MAX_END_FUNCTION_ENTRIES 65536
#define MAX_SEGMENTS 5
#define MAX_GTP4_SRCADDR_PREFIX 96
#define MAX_GTP4_DSTADDR_PREFIX 56

// srh flag
#define SR6_FLAG1_PROTECTED (1 << 6)
#define SR6_FLAG1_OAM (1 << 5)
#define SR6_FLAG1_ALERT (1 << 4)
#define SR6_FLAG1_HMAC (1 << 3)

#define SR6_TLV_INGRESS 1
#define SR6_TLV_EGRESS 2
#define SR6_TLV_OPAQUE 3
#define SR6_TLV_PADDING 4
#define SR6_TLV_HMAC 5

#define sr_has_hmac(srh) ((srh)->flags & SR6_FLAG1_HMAC)

//Encap define
#define SEG6_IPTUN_MODE_INLINE 0
#define SEG6_IPTUN_MODE_ENCAP 1
#define SEG6_IPTUN_MODE_L2ENCAP 2
#define SEG6_IPTUN_MODE_ENCAP_T_M_GTP6_D 3
#define SEG6_IPTUN_MODE_ENCAP_T_M_GTP6_D_Di 4
#define SEG6_IPTUN_MODE_ENCAP_H_M_GTP4_D 5

// END($|X|T) case using
#define SEG6_LOCAL_FLAVER_NONE 1
#define SEG6_LOCAL_FLAVER_PSP 2
#define SEG6_LOCAL_FLAVER_USP 3
#define SEG6_LOCAL_FLAVER_USD 4

// Function define(e.g. Decap, segleft...)
#define SEG6_LOCAL_ACTION_END 1
#define SEG6_LOCAL_ACTION_END_X 2
#define SEG6_LOCAL_ACTION_END_T 3
#define SEG6_LOCAL_ACTION_END_DX2 4
#define SEG6_LOCAL_ACTION_END_DX6 5
#define SEG6_LOCAL_ACTION_END_DX4 6
#define SEG6_LOCAL_ACTION_END_DT6 7
#define SEG6_LOCAL_ACTION_END_DT4 8
#define SEG6_LOCAL_ACTION_END_B6 9
#define SEG6_LOCAL_ACTION_END_B6_ENCAPS 10
#define SEG6_LOCAL_ACTION_END_BM 11
#define SEG6_LOCAL_ACTION_END_S 12
#define SEG6_LOCAL_ACTION_END_AS 13
#define SEG6_LOCAL_ACTION_END_AM 14
#define SEG6_LOCAL_ACTION_END_M_GTP6_E 15
#define SEG6_LOCAL_ACTION_END_M_GTP4_E 16

#define IPV6_FLOWINFO_MASK __bpf_htonl(0x0FFFFFFF)

// GTP User Data Messages (GTPv1)
// 3GPP TS 29.060 "Table 1: Messages in GTP"
#define GTPV1_ECHO 1    // Echo Request
#define GTPV1_ECHORES 2 // Echo Response
#define GTPV1_ERROR 26  // Error Indication
#define GTPV1_END 254   // End Marker
#define GTPV1_GPDU 255  // G-PDU

#define GTP_V1 1
#define GTP1U_PORT 2152

/* from net/ip.h */
#define IP_DF 0x4000 /* Flag: "Don't Fragment"	*/

// from net/tcp.h
#define TCPOPT_EOL 0 /* End of options */
#define TCPOPT_NOP 1 /* Padding */
#define TCPOPT_MSS 2 /* Segment size negotiating */

#define DEFAULT_TTL 255

#endif
