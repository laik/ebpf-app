; ModuleID = 'xdp_ping_count.c'
source_filename = "xdp_ping_count.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.S = type { [6 x i8], [6 x i8] }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }

@counter_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 12, i32 65535, i32 0 }, section "maps", align 4, !dbg !0
@__const.xpd_ping_count_func.__fmt = private unnamed_addr constant [12 x i8] c"xdp working\00", align 1
@__const.xpd_ping_count_func.__fmt.1 = private unnamed_addr constant [23 x i8] c"update count map error\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !21
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xpd_ping_count_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xpd_ping_count_func(%struct.xdp_md* nocapture readonly %0) #0 section "xdp_ping_count" !dbg !57 {
  %2 = alloca i32, align 4
  %3 = alloca [12 x i8], align 1
  %4 = alloca %struct.S, align 1
  %5 = alloca [23 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !70, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i32 undef, metadata !71, metadata !DIExpression()), !dbg !111
  %6 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !112
  %7 = load i32, i32* %6, align 4, !dbg !112, !tbaa !113
  %8 = zext i32 %7 to i64, !dbg !118
  call void @llvm.dbg.value(metadata i64 %8, metadata !72, metadata !DIExpression()), !dbg !111
  call void @llvm.dbg.value(metadata i64 %8, metadata !73, metadata !DIExpression()), !dbg !111
  %9 = bitcast i32* %2 to i8*, !dbg !119
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %9) #3, !dbg !119
  call void @llvm.dbg.value(metadata i32 2, metadata !79, metadata !DIExpression()), !dbg !111
  store i32 2, i32* %2, align 4, !dbg !120, !tbaa !121
  %10 = getelementptr inbounds [12 x i8], [12 x i8]* %3, i64 0, i64 0, !dbg !122
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %10) #3, !dbg !122
  call void @llvm.dbg.declare(metadata [12 x i8]* %3, metadata !80, metadata !DIExpression()), !dbg !122
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(12) %10, i8* nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @__const.xpd_ping_count_func.__fmt, i64 0, i64 0), i64 12, i1 false), !dbg !122
  %11 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %10, i32 12) #3, !dbg !122
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %10) #3, !dbg !123
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !124, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata i32 undef, metadata !131, metadata !DIExpression()), !dbg !133
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !135, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i32 undef, metadata !147, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !149, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i64 %8, metadata !150, metadata !DIExpression()), !dbg !160
  call void @llvm.dbg.value(metadata i32 14, metadata !151, metadata !DIExpression()), !dbg !160
  %12 = inttoptr i64 %8 to %struct.ethhdr*, !dbg !162
  call void @llvm.dbg.value(metadata i32 undef, metadata !78, metadata !DIExpression()), !dbg !111
  %13 = getelementptr inbounds %struct.S, %struct.S* %4, i64 0, i32 0, i64 0, !dbg !163
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %13) #3, !dbg !163
  call void @llvm.dbg.declare(metadata %struct.S* %4, metadata !99, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.value(metadata %struct.ethhdr* %12, metadata !85, metadata !DIExpression()), !dbg !111
  %14 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 0, i64 0, !dbg !165
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %13, i8* nonnull align 1 dereferenceable(6) %14, i64 6, i1 false), !dbg !165
  %15 = getelementptr inbounds %struct.S, %struct.S* %4, i64 0, i32 1, i64 0, !dbg !166
  %16 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %12, i64 0, i32 1, i64 0, !dbg !166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %15, i8* nonnull align 1 dereferenceable(6) %16, i64 6, i1 false), !dbg !166
  call void @llvm.dbg.value(metadata i32* %2, metadata !79, metadata !DIExpression(DW_OP_deref)), !dbg !111
  %17 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_map_def* @counter_map to i8*), i8* nonnull %9, i8* nonnull %13, i64 0) #3, !dbg !167
  %18 = icmp eq i64 %17, -1, !dbg !168
  br i1 %18, label %19, label %22, !dbg !169

19:                                               ; preds = %1
  %20 = getelementptr inbounds [23 x i8], [23 x i8]* %5, i64 0, i64 0, !dbg !170
  call void @llvm.lifetime.start.p0i8(i64 23, i8* nonnull %20) #3, !dbg !170
  call void @llvm.dbg.declare(metadata [23 x i8]* %5, metadata !104, metadata !DIExpression()), !dbg !170
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(23) %20, i8* nonnull align 1 dereferenceable(23) getelementptr inbounds ([23 x i8], [23 x i8]* @__const.xpd_ping_count_func.__fmt.1, i64 0, i64 0), i64 23, i1 false), !dbg !170
  %21 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %20, i32 23) #3, !dbg !170
  call void @llvm.lifetime.end.p0i8(i64 23, i8* nonnull %20) #3, !dbg !171
  br label %22, !dbg !172

22:                                               ; preds = %19, %1
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %13) #3, !dbg !173
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %9) #3, !dbg !173
  ret i32 2, !dbg !174
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!53, !54, !55}
!llvm.ident = !{!56}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter_map", scope: !2, file: !3, line: 18, type: !45, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !14, globals: !20, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_ping_count.c", directory: "/root/workspace/ebpf-app/ebpf/src")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 3150, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/linux/bpf.h", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !{!15, !16, !17}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !18, line: 24, baseType: !19)
!18 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !{!0, !21, !27, !36}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 86, type: !23, isLocal: false, isDefinition: true)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 32, elements: !25)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !{!26}
!26 = !DISubrange(count: 4)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !29, line: 171, type: !30, isLocal: true, isDefinition: true)
!29 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DISubroutineType(types: !32)
!32 = !{!16, !33, !35, null}
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !18, line: 27, baseType: !7)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !29, line: 72, type: !38, isLocal: true, isDefinition: true)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DISubroutineType(types: !40)
!40 = !{!16, !15, !41, !41, !43}
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!42 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !18, line: 31, baseType: !44)
!44 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !46, line: 130, size: 160, elements: !47)
!46 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!47 = !{!48, !49, !50, !51, !52}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !45, file: !46, line: 131, baseType: !7, size: 32)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !45, file: !46, line: 132, baseType: !7, size: 32, offset: 32)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !45, file: !46, line: 133, baseType: !7, size: 32, offset: 64)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !45, file: !46, line: 134, baseType: !7, size: 32, offset: 96)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !45, file: !46, line: 135, baseType: !7, size: 32, offset: 128)
!53 = !{i32 7, !"Dwarf Version", i32 4}
!54 = !{i32 2, !"Debug Info Version", i32 3}
!55 = !{i32 1, !"wchar_size", i32 4}
!56 = !{!"clang version 10.0.0-4ubuntu1 "}
!57 = distinct !DISubprogram(name: "xpd_ping_count_func", scope: !3, file: !3, line: 26, type: !58, scopeLine: 27, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !69)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !61}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3161, size: 160, elements: !63)
!63 = !{!64, !65, !66, !67, !68}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !62, file: !6, line: 3162, baseType: !35, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !62, file: !6, line: 3163, baseType: !35, size: 32, offset: 32)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !62, file: !6, line: 3164, baseType: !35, size: 32, offset: 64)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !62, file: !6, line: 3166, baseType: !35, size: 32, offset: 96)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !62, file: !6, line: 3167, baseType: !35, size: 32, offset: 128)
!69 = !{!70, !71, !72, !73, !78, !79, !80, !85, !99, !104}
!70 = !DILocalVariable(name: "ctx", arg: 1, scope: !57, file: !3, line: 26, type: !61)
!71 = !DILocalVariable(name: "data_end", scope: !57, file: !3, line: 28, type: !15)
!72 = !DILocalVariable(name: "data", scope: !57, file: !3, line: 29, type: !15)
!73 = !DILocalVariable(name: "nh", scope: !57, file: !3, line: 31, type: !74)
!74 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !75, line: 33, size: 64, elements: !76)
!75 = !DIFile(filename: "./parsing_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!76 = !{!77}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !74, file: !75, line: 34, baseType: !15, size: 64)
!78 = !DILocalVariable(name: "nh_type", scope: !57, file: !3, line: 32, type: !60)
!79 = !DILocalVariable(name: "action", scope: !57, file: !3, line: 35, type: !35)
!80 = !DILocalVariable(name: "__fmt", scope: !81, file: !3, line: 37, type: !82)
!81 = distinct !DILexicalBlock(scope: !57, file: !3, line: 37, column: 5)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 96, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 12)
!85 = !DILocalVariable(name: "eth", scope: !57, file: !3, line: 38, type: !86)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!87 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !88, line: 163, size: 112, elements: !89)
!88 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!89 = !{!90, !95, !96}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !87, file: !88, line: 164, baseType: !91, size: 48)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 48, elements: !93)
!92 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!93 = !{!94}
!94 = !DISubrange(count: 6)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !87, file: !88, line: 165, baseType: !91, size: 48, offset: 48)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !87, file: !88, line: 166, baseType: !97, size: 16, offset: 96)
!97 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !98, line: 25, baseType: !17)
!98 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!99 = !DILocalVariable(name: "record", scope: !57, file: !3, line: 42, type: !100)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "S", file: !3, line: 12, size: 96, elements: !101)
!101 = !{!102, !103}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !100, file: !3, line: 14, baseType: !91, size: 48)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "src", scope: !100, file: !3, line: 15, baseType: !91, size: 48, offset: 48)
!104 = !DILocalVariable(name: "__fmt", scope: !105, file: !3, line: 49, type: !108)
!105 = distinct !DILexicalBlock(scope: !106, file: !3, line: 49, column: 9)
!106 = distinct !DILexicalBlock(scope: !107, file: !3, line: 48, column: 5)
!107 = distinct !DILexicalBlock(scope: !57, file: !3, line: 47, column: 9)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 184, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 23)
!111 = !DILocation(line: 0, scope: !57)
!112 = !DILocation(line: 29, column: 37, scope: !57)
!113 = !{!114, !115, i64 0}
!114 = !{!"xdp_md", !115, i64 0, !115, i64 4, !115, i64 8, !115, i64 12, !115, i64 16}
!115 = !{!"int", !116, i64 0}
!116 = !{!"omnipotent char", !117, i64 0}
!117 = !{!"Simple C/C++ TBAA"}
!118 = !DILocation(line: 29, column: 26, scope: !57)
!119 = !DILocation(line: 35, column: 5, scope: !57)
!120 = !DILocation(line: 35, column: 11, scope: !57)
!121 = !{!115, !115, i64 0}
!122 = !DILocation(line: 37, column: 5, scope: !81)
!123 = !DILocation(line: 37, column: 5, scope: !57)
!124 = !DILocalVariable(name: "nh", arg: 1, scope: !125, file: !75, line: 124, type: !128)
!125 = distinct !DISubprogram(name: "parse_ethhdr", scope: !75, file: !75, line: 124, type: !126, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !130)
!126 = !DISubroutineType(types: !127)
!127 = !{!60, !128, !15, !129}
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !74, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !86, size: 64)
!130 = !{!124, !131, !132}
!131 = !DILocalVariable(name: "data_end", arg: 2, scope: !125, file: !75, line: 125, type: !15)
!132 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !125, file: !75, line: 126, type: !129)
!133 = !DILocation(line: 0, scope: !125, inlinedAt: !134)
!134 = distinct !DILocation(line: 40, column: 15, scope: !57)
!135 = !DILocalVariable(name: "nh", arg: 1, scope: !136, file: !75, line: 79, type: !128)
!136 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !75, file: !75, line: 79, type: !137, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !146)
!137 = !DISubroutineType(types: !138)
!138 = !{!60, !128, !15, !129, !139}
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !140, size: 64)
!140 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !75, line: 64, size: 32, elements: !141)
!141 = !{!142}
!142 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !140, file: !75, line: 65, baseType: !143, size: 32)
!143 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !144)
!144 = !{!145}
!145 = !DISubrange(count: 2)
!146 = !{!135, !147, !148, !149, !150, !151, !152, !158, !159}
!147 = !DILocalVariable(name: "data_end", arg: 2, scope: !136, file: !75, line: 80, type: !15)
!148 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !136, file: !75, line: 81, type: !129)
!149 = !DILocalVariable(name: "vlans", arg: 4, scope: !136, file: !75, line: 82, type: !139)
!150 = !DILocalVariable(name: "eth", scope: !136, file: !75, line: 84, type: !86)
!151 = !DILocalVariable(name: "hdrsize", scope: !136, file: !75, line: 85, type: !60)
!152 = !DILocalVariable(name: "vlh", scope: !136, file: !75, line: 86, type: !153)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !75, line: 42, size: 32, elements: !155)
!155 = !{!156, !157}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !154, file: !75, line: 43, baseType: !97, size: 16)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !154, file: !75, line: 44, baseType: !97, size: 16, offset: 16)
!158 = !DILocalVariable(name: "h_proto", scope: !136, file: !75, line: 87, type: !17)
!159 = !DILocalVariable(name: "i", scope: !136, file: !75, line: 88, type: !60)
!160 = !DILocation(line: 0, scope: !136, inlinedAt: !161)
!161 = distinct !DILocation(line: 129, column: 9, scope: !125, inlinedAt: !134)
!162 = !DILocation(line: 93, column: 6, scope: !136, inlinedAt: !161)
!163 = !DILocation(line: 42, column: 5, scope: !57)
!164 = !DILocation(line: 42, column: 14, scope: !57)
!165 = !DILocation(line: 44, column: 5, scope: !57)
!166 = !DILocation(line: 45, column: 5, scope: !57)
!167 = !DILocation(line: 47, column: 15, scope: !107)
!168 = !DILocation(line: 47, column: 12, scope: !107)
!169 = !DILocation(line: 47, column: 9, scope: !57)
!170 = !DILocation(line: 49, column: 9, scope: !105)
!171 = !DILocation(line: 49, column: 9, scope: !106)
!172 = !DILocation(line: 50, column: 5, scope: !106)
!173 = !DILocation(line: 84, column: 1, scope: !57)
!174 = !DILocation(line: 83, column: 5, scope: !57)
