; ModuleID = 'xdp_ping_count.c'
source_filename = "xdp_ping_count.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@counter_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 5, i32 1024, i32 0 }, section "maps", align 4, !dbg !0
@other_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 5, i32 1024, i32 0 }, section "maps", align 4, !dbg !15
@__const.xpd_ping_count_func.value = private unnamed_addr constant [5 x i8] c"wocao", align 1
@__const.xpd_ping_count_func.__fmt = private unnamed_addr constant [14 x i8] c"xdp working\0D\0A\00", align 1
@__const.xpd_ping_count_func.__fmt.1 = private unnamed_addr constant [20 x i8] c"recv other map %s\0D\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !25
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter_map to i8*), i8* bitcast (%struct.bpf_map_def* @other_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xpd_ping_count_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xpd_ping_count_func(%struct.xdp_md* nocapture readnone %0) #0 section "xdp_ping_count" !dbg !61 {
  %2 = alloca i32, align 4
  %3 = alloca [5 x i8], align 1
  %4 = alloca [14 x i8], align 1
  %5 = alloca [20 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !74, metadata !DIExpression()), !dbg !92
  %6 = getelementptr inbounds [5 x i8], [5 x i8]* %3, i64 0, i64 0
  %7 = bitcast i32* %2 to i8*, !dbg !93
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #3, !dbg !93
  call void @llvm.dbg.value(metadata i32 123, metadata !75, metadata !DIExpression()), !dbg !92
  store i32 123, i32* %2, align 4, !dbg !94, !tbaa !95
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %6) #3, !dbg !99
  call void @llvm.dbg.declare(metadata [5 x i8]* undef, metadata !76, metadata !DIExpression()), !dbg !100
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %6, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([5 x i8], [5 x i8]* @__const.xpd_ping_count_func.value, i64 0, i64 0), i64 5, i1 false), !dbg !100
  %8 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 0, !dbg !101
  call void @llvm.lifetime.start.p0i8(i64 14, i8* nonnull %8) #3, !dbg !101
  call void @llvm.dbg.declare(metadata [14 x i8]* %4, metadata !80, metadata !DIExpression()), !dbg !101
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %8, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([14 x i8], [14 x i8]* @__const.xpd_ping_count_func.__fmt, i64 0, i64 0), i64 14, i1 false), !dbg !101
  %9 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %8, i32 14) #3, !dbg !101
  call void @llvm.lifetime.end.p0i8(i64 14, i8* nonnull %8) #3, !dbg !102
  call void @llvm.dbg.value(metadata i32* %2, metadata !75, metadata !DIExpression(DW_OP_deref)), !dbg !92
  %10 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_map_def* @counter_map to i8*), i8* nonnull %7, i8* nonnull %6, i64 0) #3, !dbg !103
  call void @llvm.dbg.value(metadata i32* %2, metadata !75, metadata !DIExpression(DW_OP_deref)), !dbg !92
  %11 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @other_map to i8*), i8* nonnull %7) #3, !dbg !104
  call void @llvm.dbg.value(metadata i8* %11, metadata !85, metadata !DIExpression()), !dbg !92
  %12 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i64 0, i64 0, !dbg !105
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %12) #3, !dbg !105
  call void @llvm.dbg.declare(metadata [20 x i8]* %5, metadata !87, metadata !DIExpression()), !dbg !105
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(20) %12, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.xpd_ping_count_func.__fmt.1, i64 0, i64 0), i64 20, i1 false), !dbg !105
  %13 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %12, i32 20, i8* %11) #3, !dbg !105
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %12) #3, !dbg !106
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %6) #3, !dbg !107
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #3, !dbg !107
  ret i32 2, !dbg !108
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
!llvm.module.flags = !{!57, !58, !59}
!llvm.ident = !{!60}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter_map", scope: !2, file: !3, line: 18, type: !17, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
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
!14 = !{!0, !15, !25, !31, !42, !52}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "other_map", scope: !2, file: !3, line: 25, type: !17, isLocal: false, isDefinition: true)
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !18, line: 130, size: 160, elements: !19)
!18 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!19 = !{!20, !21, !22, !23, !24}
!20 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !17, file: !18, line: 131, baseType: !7, size: 32)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !17, file: !18, line: 132, baseType: !7, size: 32, offset: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !17, file: !18, line: 133, baseType: !7, size: 32, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !17, file: !18, line: 134, baseType: !7, size: 32, offset: 96)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !17, file: !18, line: 135, baseType: !7, size: 32, offset: 128)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 100, type: !27, isLocal: false, isDefinition: true)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 32, elements: !29)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !{!30}
!30 = !DISubrange(count: 4)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !33, line: 171, type: !34, isLocal: true, isDefinition: true)
!33 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DISubroutineType(types: !36)
!36 = !{!37, !38, !40, null}
!37 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !28)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !41, line: 27, baseType: !7)
!41 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !33, line: 72, type: !44, isLocal: true, isDefinition: true)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DISubroutineType(types: !46)
!46 = !{!37, !47, !48, !48, !50}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !41, line: 31, baseType: !51)
!51 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !33, line: 50, type: !54, isLocal: true, isDefinition: true)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DISubroutineType(types: !56)
!56 = !{!47, !47, !48}
!57 = !{i32 7, !"Dwarf Version", i32 4}
!58 = !{i32 2, !"Debug Info Version", i32 3}
!59 = !{i32 1, !"wchar_size", i32 4}
!60 = !{!"clang version 10.0.0-4ubuntu1 "}
!61 = distinct !DISubprogram(name: "xpd_ping_count_func", scope: !3, file: !3, line: 33, type: !62, scopeLine: 34, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !73)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3161, size: 160, elements: !67)
!67 = !{!68, !69, !70, !71, !72}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !66, file: !6, line: 3162, baseType: !40, size: 32)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !66, file: !6, line: 3163, baseType: !40, size: 32, offset: 32)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !66, file: !6, line: 3164, baseType: !40, size: 32, offset: 64)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !66, file: !6, line: 3166, baseType: !40, size: 32, offset: 96)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !66, file: !6, line: 3167, baseType: !40, size: 32, offset: 128)
!73 = !{!74, !75, !76, !80, !85, !87}
!74 = !DILocalVariable(name: "ctx", arg: 1, scope: !61, file: !3, line: 33, type: !65)
!75 = !DILocalVariable(name: "key", scope: !61, file: !3, line: 42, type: !40)
!76 = !DILocalVariable(name: "value", scope: !61, file: !3, line: 43, type: !77)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 40, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 5)
!80 = !DILocalVariable(name: "__fmt", scope: !81, file: !3, line: 45, type: !82)
!81 = distinct !DILexicalBlock(scope: !61, file: !3, line: 45, column: 5)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 112, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 14)
!85 = !DILocalVariable(name: "ret", scope: !61, file: !3, line: 61, type: !86)
!86 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!87 = !DILocalVariable(name: "__fmt", scope: !88, file: !3, line: 64, type: !89)
!88 = distinct !DILexicalBlock(scope: !61, file: !3, line: 64, column: 5)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !39, size: 160, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 20)
!92 = !DILocation(line: 0, scope: !61)
!93 = !DILocation(line: 42, column: 5, scope: !61)
!94 = !DILocation(line: 42, column: 11, scope: !61)
!95 = !{!96, !96, i64 0}
!96 = !{!"int", !97, i64 0}
!97 = !{!"omnipotent char", !98, i64 0}
!98 = !{!"Simple C/C++ TBAA"}
!99 = !DILocation(line: 43, column: 5, scope: !61)
!100 = !DILocation(line: 43, column: 10, scope: !61)
!101 = !DILocation(line: 45, column: 5, scope: !81)
!102 = !DILocation(line: 45, column: 5, scope: !61)
!103 = !DILocation(line: 59, column: 5, scope: !61)
!104 = !DILocation(line: 62, column: 11, scope: !61)
!105 = !DILocation(line: 64, column: 5, scope: !88)
!106 = !DILocation(line: 64, column: 5, scope: !61)
!107 = !DILocation(line: 98, column: 1, scope: !61)
!108 = !DILocation(line: 97, column: 5, scope: !61)
