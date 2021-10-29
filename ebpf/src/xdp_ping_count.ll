; ModuleID = 'xdp_ping_count.c'
source_filename = "xdp_ping_count.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }

@counter_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 5, i32 1024, i32 0 }, section "maps", align 4, !dbg !0
@other_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 5, i32 1024, i32 0 }, section "maps", align 4, !dbg !21
@__const.xpd_ping_count_func.value = private unnamed_addr constant [5 x i8] c"wocao", align 1
@__const.xpd_ping_count_func.__fmt = private unnamed_addr constant [14 x i8] c"xdp working\0D\0A\00", align 1
@__const.xpd_ping_count_func.__fmt.1 = private unnamed_addr constant [20 x i8] c"recv other map %s\0D\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !31
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.bpf_map_def* @counter_map to i8*), i8* bitcast (%struct.bpf_map_def* @other_map to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xpd_ping_count_func to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xpd_ping_count_func(%struct.xdp_md* nocapture readnone %0) #0 section "xdp_ping_count" !dbg !66 {
  %2 = alloca i32, align 4
  %3 = alloca [5 x i8], align 1
  %4 = alloca [14 x i8], align 1
  %5 = alloca [20 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !80, metadata !DIExpression()), !dbg !98
  %6 = getelementptr inbounds [5 x i8], [5 x i8]* %3, i64 0, i64 0
  %7 = bitcast i32* %2 to i8*, !dbg !99
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7) #3, !dbg !99
  call void @llvm.dbg.value(metadata i32 123, metadata !81, metadata !DIExpression()), !dbg !98
  store i32 123, i32* %2, align 4, !dbg !100, !tbaa !101
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %6) #3, !dbg !105
  call void @llvm.dbg.declare(metadata [5 x i8]* undef, metadata !82, metadata !DIExpression()), !dbg !106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %6, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([5 x i8], [5 x i8]* @__const.xpd_ping_count_func.value, i64 0, i64 0), i64 5, i1 false), !dbg !106
  %8 = getelementptr inbounds [14 x i8], [14 x i8]* %4, i64 0, i64 0, !dbg !107
  call void @llvm.lifetime.start.p0i8(i64 14, i8* nonnull %8) #3, !dbg !107
  call void @llvm.dbg.declare(metadata [14 x i8]* %4, metadata !86, metadata !DIExpression()), !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(14) %8, i8* nonnull align 1 dereferenceable(14) getelementptr inbounds ([14 x i8], [14 x i8]* @__const.xpd_ping_count_func.__fmt, i64 0, i64 0), i64 14, i1 false), !dbg !107
  %9 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %8, i32 14) #3, !dbg !107
  call void @llvm.lifetime.end.p0i8(i64 14, i8* nonnull %8) #3, !dbg !108
  call void @llvm.dbg.value(metadata i32* %2, metadata !81, metadata !DIExpression(DW_OP_deref)), !dbg !98
  %10 = call i64 inttoptr (i64 2 to i64 (i8*, i8*, i8*, i64)*)(i8* bitcast (%struct.bpf_map_def* @counter_map to i8*), i8* nonnull %7, i8* nonnull %6, i64 0) #3, !dbg !109
  %11 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @other_map to i8*), i8* nonnull %7) #3, !dbg !110
  call void @llvm.dbg.value(metadata i8* %11, metadata !91, metadata !DIExpression()), !dbg !98
  %12 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i64 0, i64 0, !dbg !111
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %12) #3, !dbg !111
  call void @llvm.dbg.declare(metadata [20 x i8]* %5, metadata !93, metadata !DIExpression()), !dbg !111
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(20) %12, i8* nonnull align 1 dereferenceable(20) getelementptr inbounds ([20 x i8], [20 x i8]* @__const.xpd_ping_count_func.__fmt.1, i64 0, i64 0), i64 20, i1 false), !dbg !111
  %13 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %12, i32 20, i8* %11) #3, !dbg !111
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %12) #3, !dbg !112
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %6) #3, !dbg !113
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7) #3, !dbg !113
  ret i32 2, !dbg !114
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

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!62, !63, !64}
!llvm.ident = !{!65}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter_map", scope: !2, file: !3, line: 17, type: !23, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Debian clang version 11.0.1-2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !20, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdp_ping_count.c", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/src")
!4 = !{!5, !13}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 30019, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./../common/vmlinux.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/src")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "BPF_ANY", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "BPF_NOEXIST", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "BPF_EXIST", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "BPF_F_LOCK", value: 4, isUnsigned: true)
!13 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 29782, baseType: !7, size: 32, elements: !14)
!14 = !{!15, !16, !17, !18, !19}
!15 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!16 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!17 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!18 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!19 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!20 = !{!0, !21, !31, !37, !47, !57}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "other_map", scope: !2, file: !3, line: 24, type: !23, isLocal: false, isDefinition: true)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !24, line: 130, size: 160, elements: !25)
!24 = !DIFile(filename: "./../common/bpf_helpers.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/src")
!25 = !{!26, !27, !28, !29, !30}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !23, file: !24, line: 131, baseType: !7, size: 32)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !23, file: !24, line: 132, baseType: !7, size: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !23, file: !24, line: 133, baseType: !7, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !23, file: !24, line: 134, baseType: !7, size: 32, offset: 96)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !23, file: !24, line: 135, baseType: !7, size: 32, offset: 128)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 99, type: !33, isLocal: false, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 32, elements: !35)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!35 = !{!36}
!36 = !DISubrange(count: 4)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !39, line: 173, type: !40, isLocal: true, isDefinition: true)
!39 = !DIFile(filename: "./../common/bpf_helper_defs.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/src")
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DISubroutineType(types: !42)
!42 = !{!43, !44, !46, null}
!43 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 16, baseType: !7)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !39, line: 74, type: !49, isLocal: true, isDefinition: true)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!50 = !DISubroutineType(types: !51)
!51 = !{!43, !52, !53, !53, !55}
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 20, baseType: !56)
!56 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !39, line: 52, type: !59, isLocal: true, isDefinition: true)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DISubroutineType(types: !61)
!61 = !{!52, !52, !53}
!62 = !{i32 7, !"Dwarf Version", i32 4}
!63 = !{i32 2, !"Debug Info Version", i32 3}
!64 = !{i32 1, !"wchar_size", i32 4}
!65 = !{!"Debian clang version 11.0.1-2"}
!66 = distinct !DISubprogram(name: "xpd_ping_count_func", scope: !3, file: !3, line: 32, type: !67, scopeLine: 33, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !79)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 32700, size: 192, elements: !72)
!72 = !{!73, !74, !75, !76, !77, !78}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !71, file: !6, line: 32701, baseType: !46, size: 32)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !71, file: !6, line: 32702, baseType: !46, size: 32, offset: 32)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !71, file: !6, line: 32703, baseType: !46, size: 32, offset: 64)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !71, file: !6, line: 32704, baseType: !46, size: 32, offset: 96)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !71, file: !6, line: 32705, baseType: !46, size: 32, offset: 128)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !71, file: !6, line: 32706, baseType: !46, size: 32, offset: 160)
!79 = !{!80, !81, !82, !86, !91, !93}
!80 = !DILocalVariable(name: "ctx", arg: 1, scope: !66, file: !3, line: 32, type: !70)
!81 = !DILocalVariable(name: "key", scope: !66, file: !3, line: 41, type: !46)
!82 = !DILocalVariable(name: "value", scope: !66, file: !3, line: 42, type: !83)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 40, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 5)
!86 = !DILocalVariable(name: "__fmt", scope: !87, file: !3, line: 44, type: !88)
!87 = distinct !DILexicalBlock(scope: !66, file: !3, line: 44, column: 5)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 112, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 14)
!91 = !DILocalVariable(name: "ret", scope: !66, file: !3, line: 60, type: !92)
!92 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!93 = !DILocalVariable(name: "__fmt", scope: !94, file: !3, line: 63, type: !95)
!94 = distinct !DILexicalBlock(scope: !66, file: !3, line: 63, column: 5)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 160, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 20)
!98 = !DILocation(line: 0, scope: !66)
!99 = !DILocation(line: 41, column: 5, scope: !66)
!100 = !DILocation(line: 41, column: 11, scope: !66)
!101 = !{!102, !102, i64 0}
!102 = !{!"int", !103, i64 0}
!103 = !{!"omnipotent char", !104, i64 0}
!104 = !{!"Simple C/C++ TBAA"}
!105 = !DILocation(line: 42, column: 5, scope: !66)
!106 = !DILocation(line: 42, column: 10, scope: !66)
!107 = !DILocation(line: 44, column: 5, scope: !87)
!108 = !DILocation(line: 44, column: 5, scope: !66)
!109 = !DILocation(line: 58, column: 5, scope: !66)
!110 = !DILocation(line: 61, column: 11, scope: !66)
!111 = !DILocation(line: 63, column: 5, scope: !94)
!112 = !DILocation(line: 63, column: 5, scope: !66)
!113 = !DILocation(line: 97, column: 1, scope: !66)
!114 = !DILocation(line: 96, column: 5, scope: !66)
