; ModuleID = 'clac.c'
source_filename = "clac.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }

@prog_map = dso_local global %struct.bpf_map_def { i32 3, i32 4, i32 4, i32 4096, i32 0 }, section "maps", align 4, !dbg !0
@__const.prog.__fmt = private unnamed_addr constant [12 x i8] c"call prog\0D\0A\00", align 1
@__const.prog.__fmt.1 = private unnamed_addr constant [18 x i8] c"tail call prog0\0D\0A\00", align 1
@__const.prog0.__fmt = private unnamed_addr constant [13 x i8] c"call prog0\0D\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !15
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @prog to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @prog0 to i8*), i8* bitcast (%struct.bpf_map_def* @prog_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @prog(%struct.xdp_md* %0) #0 section "xdp" !dbg !50 {
  %2 = alloca [12 x i8], align 1
  %3 = alloca [18 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !63, metadata !DIExpression()), !dbg !74
  %4 = getelementptr inbounds [12 x i8], [12 x i8]* %2, i64 0, i64 0, !dbg !75
  call void @llvm.lifetime.start.p0i8(i64 12, i8* nonnull %4) #3, !dbg !75
  call void @llvm.dbg.declare(metadata [12 x i8]* %2, metadata !64, metadata !DIExpression()), !dbg !75
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(12) %4, i8* nonnull align 1 dereferenceable(12) getelementptr inbounds ([12 x i8], [12 x i8]* @__const.prog.__fmt, i64 0, i64 0), i64 12, i1 false), !dbg !75
  %5 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %4, i32 12) #3, !dbg !75
  call void @llvm.lifetime.end.p0i8(i64 12, i8* nonnull %4) #3, !dbg !76
  %6 = bitcast %struct.xdp_md* %0 to i8*, !dbg !77
  %7 = call i64 inttoptr (i64 12 to i64 (i8*, i8*, i32)*)(i8* %6, i8* bitcast (%struct.bpf_map_def* @prog_map to i8*), i32 0) #3, !dbg !78
  %8 = getelementptr inbounds [18 x i8], [18 x i8]* %3, i64 0, i64 0, !dbg !79
  call void @llvm.lifetime.start.p0i8(i64 18, i8* nonnull %8) #3, !dbg !79
  call void @llvm.dbg.declare(metadata [18 x i8]* %3, metadata !69, metadata !DIExpression()), !dbg !79
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(18) %8, i8* nonnull align 1 dereferenceable(18) getelementptr inbounds ([18 x i8], [18 x i8]* @__const.prog.__fmt.1, i64 0, i64 0), i64 18, i1 false), !dbg !79
  %9 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %8, i32 18) #3, !dbg !79
  call void @llvm.lifetime.end.p0i8(i64 18, i8* nonnull %8) #3, !dbg !80
  ret i32 2, !dbg !81
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @prog0(%struct.xdp_md* nocapture readnone %0) #0 section "xdp/0" !dbg !82 {
  %2 = alloca [13 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !84, metadata !DIExpression()), !dbg !90
  %3 = getelementptr inbounds [13 x i8], [13 x i8]* %2, i64 0, i64 0, !dbg !91
  call void @llvm.lifetime.start.p0i8(i64 13, i8* nonnull %3) #3, !dbg !91
  call void @llvm.dbg.declare(metadata [13 x i8]* %2, metadata !85, metadata !DIExpression()), !dbg !91
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(13) %3, i8* nonnull align 1 dereferenceable(13) getelementptr inbounds ([13 x i8], [13 x i8]* @__const.prog0.__fmt, i64 0, i64 0), i64 13, i1 false), !dbg !91
  %4 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %3, i32 13) #3, !dbg !91
  call void @llvm.lifetime.end.p0i8(i64 13, i8* nonnull %3) #3, !dbg !92
  ret i32 2, !dbg !93
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!46, !47, !48}
!llvm.ident = !{!49}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "prog_map", scope: !2, file: !3, line: 10, type: !38, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !14, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "clac.c", directory: "/root/workspace/ebpf-app/ebpf/src")
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
!14 = !{!0, !15, !21, !32}
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 33, type: !17, isLocal: false, isDefinition: true)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 32, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 4)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "bpf_trace_printk", scope: !2, file: !23, line: 171, type: !24, isLocal: true, isDefinition: true)
!23 = !DIFile(filename: "../libbpf/src/bpf_helper_defs.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DISubroutineType(types: !26)
!26 = !{!27, !28, !30, null}
!27 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !31, line: 27, baseType: !7)
!31 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "")
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "bpf_tail_call", scope: !2, file: !23, line: 321, type: !34, isLocal: true, isDefinition: true)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 64)
!35 = !DISubroutineType(types: !36)
!36 = !{!27, !37, !37, !30}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !39, line: 130, size: 160, elements: !40)
!39 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!40 = !{!41, !42, !43, !44, !45}
!41 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !38, file: !39, line: 131, baseType: !7, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !38, file: !39, line: 132, baseType: !7, size: 32, offset: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !38, file: !39, line: 133, baseType: !7, size: 32, offset: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !38, file: !39, line: 134, baseType: !7, size: 32, offset: 96)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !38, file: !39, line: 135, baseType: !7, size: 32, offset: 128)
!46 = !{i32 7, !"Dwarf Version", i32 4}
!47 = !{i32 2, !"Debug Info Version", i32 3}
!48 = !{i32 1, !"wchar_size", i32 4}
!49 = !{!"clang version 10.0.0-4ubuntu1 "}
!50 = distinct !DISubprogram(name: "prog", scope: !3, file: !3, line: 18, type: !51, scopeLine: 19, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !62)
!51 = !DISubroutineType(types: !52)
!52 = !{!53, !54}
!53 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3161, size: 160, elements: !56)
!56 = !{!57, !58, !59, !60, !61}
!57 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !55, file: !6, line: 3162, baseType: !30, size: 32)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !55, file: !6, line: 3163, baseType: !30, size: 32, offset: 32)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !55, file: !6, line: 3164, baseType: !30, size: 32, offset: 64)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !55, file: !6, line: 3166, baseType: !30, size: 32, offset: 96)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !55, file: !6, line: 3167, baseType: !30, size: 32, offset: 128)
!62 = !{!63, !64, !69}
!63 = !DILocalVariable(name: "ctx", arg: 1, scope: !50, file: !3, line: 18, type: !54)
!64 = !DILocalVariable(name: "__fmt", scope: !65, file: !3, line: 20, type: !66)
!65 = distinct !DILexicalBlock(scope: !50, file: !3, line: 20, column: 5)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 96, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 12)
!69 = !DILocalVariable(name: "__fmt", scope: !70, file: !3, line: 22, type: !71)
!70 = distinct !DILexicalBlock(scope: !50, file: !3, line: 22, column: 5)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 144, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 18)
!74 = !DILocation(line: 0, scope: !50)
!75 = !DILocation(line: 20, column: 5, scope: !65)
!76 = !DILocation(line: 20, column: 5, scope: !50)
!77 = !DILocation(line: 21, column: 19, scope: !50)
!78 = !DILocation(line: 21, column: 5, scope: !50)
!79 = !DILocation(line: 22, column: 5, scope: !70)
!80 = !DILocation(line: 22, column: 5, scope: !50)
!81 = !DILocation(line: 23, column: 5, scope: !50)
!82 = distinct !DISubprogram(name: "prog0", scope: !3, file: !3, line: 27, type: !51, scopeLine: 28, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !83)
!83 = !{!84, !85}
!84 = !DILocalVariable(name: "ctx", arg: 1, scope: !82, file: !3, line: 27, type: !54)
!85 = !DILocalVariable(name: "__fmt", scope: !86, file: !3, line: 29, type: !87)
!86 = distinct !DILexicalBlock(scope: !82, file: !3, line: 29, column: 5)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !29, size: 104, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 13)
!90 = !DILocation(line: 0, scope: !82)
!91 = !DILocation(line: 29, column: 5, scope: !86)
!92 = !DILocation(line: 29, column: 5, scope: !82)
!93 = !DILocation(line: 30, column: 5, scope: !82)
