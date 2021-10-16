; ModuleID = 'xdpcount.c'
source_filename = "xdpcount.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@xdp_stats_map = dso_local global %struct.bpf_map_def { i32 2, i32 4, i32 8, i32 5, i32 0 }, section "maps", align 4, !dbg !0
@xdp_stats1_func.____fmt = internal constant [8 x i8] c"test %d\00", align 1, !dbg !15
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !46
@llvm.used = appending global [3 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_stats1_func to i8*), i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @xdp_stats1_func(%struct.xdp_md* nocapture readnone %0) #0 section "xdp_stats1" !dbg !17 {
  %2 = alloca i32, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !32, metadata !DIExpression()), !dbg !79
  %3 = bitcast i32* %2 to i8*, !dbg !80
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #3, !dbg !80
  call void @llvm.dbg.value(metadata i32 2, metadata !40, metadata !DIExpression()), !dbg !79
  store i32 2, i32* %2, align 4, !dbg !81, !tbaa !82
  call void @llvm.dbg.value(metadata i32* %2, metadata !40, metadata !DIExpression(DW_OP_deref)), !dbg !79
  %4 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.bpf_map_def* @xdp_stats_map to i8*), i8* nonnull %3) #3, !dbg !86
  call void @llvm.dbg.value(metadata i8* %4, metadata !33, metadata !DIExpression()), !dbg !79
  %5 = icmp eq i8* %4, null, !dbg !87
  br i1 %5, label %10, label %6, !dbg !89

6:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i8* %4, metadata !33, metadata !DIExpression()), !dbg !79
  %7 = bitcast i8* %4 to i64*, !dbg !90
  %8 = atomicrmw add i64* %7, i64 1 seq_cst, !dbg !90
  %9 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @xdp_stats1_func.____fmt, i64 0, i64 0), i32 8, i32 1234) #3, !dbg !91
  br label %10, !dbg !93

10:                                               ; preds = %1, %6
  %11 = phi i32 [ 2, %6 ], [ 0, %1 ], !dbg !79
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #3, !dbg !94
  ret i32 %11, !dbg !94
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdp_stats_map", scope: !2, file: !3, line: 17, type: !67, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "xdpcount.c", directory: "/root/workspace/ebpf-app/ebpf/src")
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
!14 = !{!0, !15, !46, !51, !60}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "____fmt", scope: !17, file: !3, line: 46, type: !41, isLocal: true, isDefinition: true)
!17 = distinct !DISubprogram(name: "xdp_stats1_func", scope: !3, file: !3, line: 32, type: !18, scopeLine: 33, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !31)
!18 = !DISubroutineType(types: !19)
!19 = !{!20, !21}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3161, size: 160, elements: !23)
!23 = !{!24, !27, !28, !29, !30}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !22, file: !6, line: 3162, baseType: !25, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !26, line: 27, baseType: !7)
!26 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!27 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !22, file: !6, line: 3163, baseType: !25, size: 32, offset: 32)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !22, file: !6, line: 3164, baseType: !25, size: 32, offset: 64)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !22, file: !6, line: 3166, baseType: !25, size: 32, offset: 96)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !22, file: !6, line: 3167, baseType: !25, size: 32, offset: 128)
!31 = !{!32, !33, !40}
!32 = !DILocalVariable(name: "ctx", arg: 1, scope: !17, file: !3, line: 32, type: !21)
!33 = !DILocalVariable(name: "rec", scope: !17, file: !3, line: 37, type: !34)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "datarec", file: !3, line: 7, size: 64, elements: !36)
!36 = !{!37}
!37 = !DIDerivedType(tag: DW_TAG_member, name: "rx_packets", scope: !35, file: !3, line: 9, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !26, line: 31, baseType: !39)
!39 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocalVariable(name: "key", scope: !17, file: !3, line: 38, type: !25)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 64, elements: !44)
!42 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !43)
!43 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!44 = !{!45}
!45 = !DISubrange(count: 8)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 51, type: !48, isLocal: false, isDefinition: true)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !43, size: 32, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 4)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !53, line: 50, type: !54, isLocal: true, isDefinition: true)
!53 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !57, !58}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !53, line: 171, type: !62, isLocal: true, isDefinition: true)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !66, !25, null}
!65 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64)
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !68, line: 130, size: 160, elements: !69)
!68 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!69 = !{!70, !71, !72, !73, !74}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !67, file: !68, line: 131, baseType: !7, size: 32)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !67, file: !68, line: 132, baseType: !7, size: 32, offset: 32)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !67, file: !68, line: 133, baseType: !7, size: 32, offset: 64)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !67, file: !68, line: 134, baseType: !7, size: 32, offset: 96)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !67, file: !68, line: 135, baseType: !7, size: 32, offset: 128)
!75 = !{i32 7, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{!"clang version 10.0.0-4ubuntu1 "}
!79 = !DILocation(line: 0, scope: !17)
!80 = !DILocation(line: 38, column: 5, scope: !17)
!81 = !DILocation(line: 38, column: 11, scope: !17)
!82 = !{!83, !83, i64 0}
!83 = !{!"int", !84, i64 0}
!84 = !{!"omnipotent char", !85, i64 0}
!85 = !{!"Simple C/C++ TBAA"}
!86 = !DILocation(line: 40, column: 11, scope: !17)
!87 = !DILocation(line: 41, column: 10, scope: !88)
!88 = distinct !DILexicalBlock(scope: !17, file: !3, line: 41, column: 9)
!89 = !DILocation(line: 41, column: 9, scope: !17)
!90 = !DILocation(line: 44, column: 5, scope: !17)
!91 = !DILocation(line: 46, column: 5, scope: !92)
!92 = distinct !DILexicalBlock(scope: !17, file: !3, line: 46, column: 5)
!93 = !DILocation(line: 48, column: 5, scope: !17)
!94 = !DILocation(line: 49, column: 1, scope: !17)
