; ModuleID = 'xdp_ping_count.c'
source_filename = "xdp_ping_count.c"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "bpf"

%struct.bpf_map_def = type { i32, i32, i32, i32, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.hdr_cursor = type { i8* }
%struct.collect_vlans = type { [2 x i16] }
%struct.vlan_hdr = type { i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon }
%union.anon = type { i32 }

@counter_map = dso_local global %struct.bpf_map_def { i32 1, i32 4, i32 4, i32 65535, i32 0 }, section "maps", align 4, !dbg !0
@__const.counter1_func.msg = private unnamed_addr constant [25 x i8] c"recv ip %d src-addr %s\0D\0A\00", align 1
@__const.counter1_func.msg.2 = private unnamed_addr constant [39 x i8] c"recc icmp code %d type %d gateway %d\0D\0A\00", align 1
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !21
@llvm.used = appending global [4 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (i32 (%struct.xdp_md*)* @counter1_func to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @counter_func to i8*), i8* bitcast (%struct.bpf_map_def* @counter_map to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @counter_func(%struct.xdp_md* nocapture readonly %0) #0 section "counter" !dbg !48 {
  %2 = alloca [25 x i8], align 1
  %3 = alloca [39 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !61, metadata !DIExpression()), !dbg !141
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !142
  %5 = load i32, i32* %4, align 4, !dbg !142, !tbaa !143
  %6 = zext i32 %5 to i64, !dbg !148
  %7 = inttoptr i64 %6 to i8*, !dbg !149
  call void @llvm.dbg.value(metadata i8* %7, metadata !62, metadata !DIExpression()), !dbg !141
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !150
  %9 = load i32, i32* %8, align 4, !dbg !150, !tbaa !151
  %10 = zext i32 %9 to i64, !dbg !152
  %11 = inttoptr i64 %10 to i8*, !dbg !153
  call void @llvm.dbg.value(metadata i8* %11, metadata !63, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i8* %11, metadata !64, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !70, metadata !DIExpression(DW_OP_deref)), !dbg !141
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !154, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata i8* %7, metadata !161, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !162, metadata !DIExpression()), !dbg !163
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !165, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i8* %7, metadata !177, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !178, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !179, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i8* %11, metadata !180, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i32 14, metadata !181, metadata !DIExpression()), !dbg !190
  %12 = getelementptr i8, i8* %11, i64 14, !dbg !192
  %13 = icmp ugt i8* %12, %7, !dbg !194
  br i1 %13, label %81, label %14, !dbg !195

14:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %11, metadata !180, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i8* %12, metadata !64, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i8* %12, metadata !182, metadata !DIExpression()), !dbg !190
  %15 = getelementptr inbounds i8, i8* %11, i64 12, !dbg !196
  %16 = bitcast i8* %15 to i16*, !dbg !196
  call void @llvm.dbg.value(metadata i16 undef, metadata !188, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i32 0, metadata !189, metadata !DIExpression()), !dbg !190
  %17 = load i16, i16* %16, align 1, !dbg !190, !tbaa !197
  call void @llvm.dbg.value(metadata i16 %17, metadata !188, metadata !DIExpression()), !dbg !190
  %18 = inttoptr i64 %6 to %struct.vlan_hdr*, !dbg !199
  %19 = getelementptr i8, i8* %11, i64 22, !dbg !204
  %20 = bitcast i8* %19 to %struct.vlan_hdr*, !dbg !204
  switch i16 %17, label %35 [
    i16 -22392, label %21
    i16 129, label %21
  ], !dbg !205

21:                                               ; preds = %14, %14
  %22 = getelementptr i8, i8* %11, i64 18, !dbg !206
  %23 = bitcast i8* %22 to %struct.vlan_hdr*, !dbg !206
  %24 = icmp ugt %struct.vlan_hdr* %23, %18, !dbg !207
  br i1 %24, label %35, label %25, !dbg !208

25:                                               ; preds = %21
  call void @llvm.dbg.value(metadata i16 undef, metadata !188, metadata !DIExpression()), !dbg !190
  %26 = getelementptr i8, i8* %11, i64 16, !dbg !209
  %27 = bitcast i8* %26 to i16*, !dbg !209
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %23, metadata !182, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i32 1, metadata !189, metadata !DIExpression()), !dbg !190
  %28 = load i16, i16* %27, align 1, !dbg !190, !tbaa !197
  call void @llvm.dbg.value(metadata i16 %28, metadata !188, metadata !DIExpression()), !dbg !190
  switch i16 %28, label %35 [
    i16 -22392, label %29
    i16 129, label %29
  ], !dbg !205

29:                                               ; preds = %25, %25
  %30 = icmp ugt %struct.vlan_hdr* %20, %18, !dbg !207
  br i1 %30, label %35, label %31, !dbg !208

31:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i16 undef, metadata !188, metadata !DIExpression()), !dbg !190
  %32 = getelementptr i8, i8* %11, i64 20, !dbg !209
  %33 = bitcast i8* %32 to i16*, !dbg !209
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %20, metadata !182, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i32 2, metadata !189, metadata !DIExpression()), !dbg !190
  %34 = load i16, i16* %33, align 1, !dbg !190, !tbaa !197
  call void @llvm.dbg.value(metadata i16 %34, metadata !188, metadata !DIExpression()), !dbg !190
  br label %35

35:                                               ; preds = %14, %21, %25, %29, %31
  %36 = phi i8* [ %12, %14 ], [ %12, %21 ], [ %22, %25 ], [ %22, %29 ], [ %19, %31 ], !dbg !190
  %37 = phi i16 [ %17, %14 ], [ %17, %21 ], [ %28, %25 ], [ %28, %29 ], [ %34, %31 ], !dbg !190
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !182, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !182, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !182, metadata !DIExpression()), !dbg !190
  call void @llvm.dbg.value(metadata i8* %36, metadata !64, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i8* %36, metadata !64, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.value(metadata i16 %37, metadata !69, metadata !DIExpression()), !dbg !141
  %38 = icmp eq i16 %37, 8, !dbg !210
  br i1 %38, label %39, label %81, !dbg !211

39:                                               ; preds = %35
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !212, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.value(metadata i8* %7, metadata !218, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.value(metadata i8* %36, metadata !220, metadata !DIExpression()), !dbg !222
  %40 = getelementptr inbounds i8, i8* %36, i64 20, !dbg !224
  %41 = icmp ugt i8* %40, %7, !dbg !226
  br i1 %41, label %61, label %42, !dbg !227

42:                                               ; preds = %39
  %43 = load i8, i8* %36, align 4, !dbg !228
  %44 = shl i8 %43, 2, !dbg !229
  %45 = and i8 %44, 60, !dbg !229
  call void @llvm.dbg.value(metadata i8 %45, metadata !221, metadata !DIExpression()), !dbg !222
  %46 = icmp ult i8 %45, 20, !dbg !230
  br i1 %46, label %61, label %47, !dbg !232

47:                                               ; preds = %42
  %48 = zext i8 %45 to i64, !dbg !233
  call void @llvm.dbg.value(metadata i64 %48, metadata !221, metadata !DIExpression()), !dbg !222
  %49 = getelementptr i8, i8* %36, i64 %48, !dbg !234
  %50 = icmp ugt i8* %49, %7, !dbg !236
  br i1 %50, label %61, label %51, !dbg !237

51:                                               ; preds = %47
  call void @llvm.dbg.value(metadata i8* %49, metadata !64, metadata !DIExpression()), !dbg !141
  %52 = getelementptr inbounds i8, i8* %36, i64 9, !dbg !238
  %53 = load i8, i8* %52, align 1, !dbg !238, !tbaa !239
  call void @llvm.dbg.value(metadata i8* %49, metadata !64, metadata !DIExpression()), !dbg !141
  %54 = icmp eq i8 %53, 0, !dbg !241
  br i1 %54, label %55, label %61, !dbg !242

55:                                               ; preds = %51
  %56 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i64 0, i64 0, !dbg !243
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %56) #3, !dbg !243
  call void @llvm.dbg.declare(metadata [25 x i8]* %2, metadata !105, metadata !DIExpression()), !dbg !244
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(25) %56, i8* nonnull align 1 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @__const.counter1_func.msg, i64 0, i64 0), i64 25, i1 false), !dbg !244
  call void @llvm.dbg.value(metadata i8* %36, metadata !84, metadata !DIExpression()), !dbg !245
  %57 = getelementptr inbounds i8, i8* %36, i64 12, !dbg !246
  %58 = bitcast i8* %57 to i32*, !dbg !246
  %59 = load i32, i32* %58, align 4, !dbg !246, !tbaa !247
  %60 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %56, i32 25, i32 %59, i32 %59) #3, !dbg !248
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %56) #3, !dbg !249
  br label %61, !dbg !250

61:                                               ; preds = %47, %42, %39, %55, %51
  %62 = phi i8* [ %49, %55 ], [ %49, %51 ], [ %36, %39 ], [ %36, %42 ], [ %36, %47 ]
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !251, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.value(metadata i8* %7, metadata !257, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.value(metadata i8* %62, metadata !259, metadata !DIExpression()), !dbg !260
  %63 = getelementptr inbounds i8, i8* %62, i64 8, !dbg !262
  %64 = bitcast i8* %63 to %struct.icmphdr*, !dbg !262
  %65 = inttoptr i64 %6 to %struct.icmphdr*, !dbg !264
  %66 = icmp ugt %struct.icmphdr* %64, %65, !dbg !265
  br i1 %66, label %81, label %67, !dbg !266

67:                                               ; preds = %61
  call void @llvm.dbg.value(metadata %struct.icmphdr* %64, metadata !64, metadata !DIExpression()), !dbg !141
  %68 = load i8, i8* %62, align 4, !dbg !267, !tbaa !268
  %69 = icmp eq i8 %68, 0, !dbg !270
  br i1 %69, label %70, label %81, !dbg !271

70:                                               ; preds = %67
  %71 = getelementptr inbounds [39 x i8], [39 x i8]* %3, i64 0, i64 0, !dbg !272
  call void @llvm.lifetime.start.p0i8(i64 39, i8* nonnull %71) #3, !dbg !272
  call void @llvm.dbg.declare(metadata [39 x i8]* %3, metadata !135, metadata !DIExpression()), !dbg !273
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(39) %71, i8* nonnull align 1 dereferenceable(39) getelementptr inbounds ([39 x i8], [39 x i8]* @__const.counter1_func.msg.2, i64 0, i64 0), i64 39, i1 false), !dbg !273
  call void @llvm.dbg.value(metadata i8* %62, metadata !111, metadata !DIExpression()), !dbg !245
  %72 = getelementptr inbounds i8, i8* %62, i64 1, !dbg !274
  %73 = load i8, i8* %72, align 1, !dbg !274, !tbaa !275
  %74 = zext i8 %73 to i32, !dbg !276
  %75 = load i8, i8* %62, align 4, !dbg !277, !tbaa !268
  %76 = zext i8 %75 to i32, !dbg !278
  %77 = getelementptr inbounds i8, i8* %62, i64 4, !dbg !279
  %78 = bitcast i8* %77 to i32*, !dbg !279
  %79 = load i32, i32* %78, align 4, !dbg !279, !tbaa !280
  %80 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %71, i32 39, i32 %74, i32 %76, i32 %79) #3, !dbg !281
  call void @llvm.lifetime.end.p0i8(i64 39, i8* nonnull %71) #3, !dbg !282
  br label %81, !dbg !283

81:                                               ; preds = %61, %1, %67, %70, %35
  ret i32 2, !dbg !284
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
define dso_local i32 @counter1_func(%struct.xdp_md* nocapture readonly %0) #0 section "counter1" !dbg !285 {
  %2 = alloca [25 x i8], align 1
  %3 = alloca [39 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !287, metadata !DIExpression()), !dbg !303
  %4 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 1, !dbg !304
  %5 = load i32, i32* %4, align 4, !dbg !304, !tbaa !143
  %6 = zext i32 %5 to i64, !dbg !305
  %7 = inttoptr i64 %6 to i8*, !dbg !306
  call void @llvm.dbg.value(metadata i8* %7, metadata !288, metadata !DIExpression()), !dbg !303
  %8 = getelementptr inbounds %struct.xdp_md, %struct.xdp_md* %0, i64 0, i32 0, !dbg !307
  %9 = load i32, i32* %8, align 4, !dbg !307, !tbaa !151
  %10 = zext i32 %9 to i64, !dbg !308
  %11 = inttoptr i64 %10 to i8*, !dbg !309
  call void @llvm.dbg.value(metadata i8* %11, metadata !289, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.value(metadata i8* %11, metadata !290, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !292, metadata !DIExpression(DW_OP_deref)), !dbg !303
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !154, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i8* %7, metadata !161, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !162, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !165, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* %7, metadata !177, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata %struct.ethhdr** undef, metadata !178, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata %struct.collect_vlans* null, metadata !179, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* %11, metadata !180, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i32 14, metadata !181, metadata !DIExpression()), !dbg !312
  %12 = getelementptr i8, i8* %11, i64 14, !dbg !314
  %13 = icmp ugt i8* %12, %7, !dbg !315
  br i1 %13, label %81, label %14, !dbg !316

14:                                               ; preds = %1
  call void @llvm.dbg.value(metadata i8* %11, metadata !180, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* %12, metadata !290, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.value(metadata i8* %12, metadata !182, metadata !DIExpression()), !dbg !312
  %15 = getelementptr inbounds i8, i8* %11, i64 12, !dbg !317
  %16 = bitcast i8* %15 to i16*, !dbg !317
  call void @llvm.dbg.value(metadata i16 undef, metadata !188, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i32 0, metadata !189, metadata !DIExpression()), !dbg !312
  %17 = load i16, i16* %16, align 1, !dbg !312, !tbaa !197
  call void @llvm.dbg.value(metadata i16 %17, metadata !188, metadata !DIExpression()), !dbg !312
  %18 = inttoptr i64 %6 to %struct.vlan_hdr*, !dbg !318
  %19 = getelementptr i8, i8* %11, i64 22, !dbg !319
  %20 = bitcast i8* %19 to %struct.vlan_hdr*, !dbg !319
  switch i16 %17, label %35 [
    i16 -22392, label %21
    i16 129, label %21
  ], !dbg !320

21:                                               ; preds = %14, %14
  %22 = getelementptr i8, i8* %11, i64 18, !dbg !321
  %23 = bitcast i8* %22 to %struct.vlan_hdr*, !dbg !321
  %24 = icmp ugt %struct.vlan_hdr* %23, %18, !dbg !322
  br i1 %24, label %35, label %25, !dbg !323

25:                                               ; preds = %21
  call void @llvm.dbg.value(metadata i16 undef, metadata !188, metadata !DIExpression()), !dbg !312
  %26 = getelementptr i8, i8* %11, i64 16, !dbg !324
  %27 = bitcast i8* %26 to i16*, !dbg !324
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %23, metadata !182, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i32 1, metadata !189, metadata !DIExpression()), !dbg !312
  %28 = load i16, i16* %27, align 1, !dbg !312, !tbaa !197
  call void @llvm.dbg.value(metadata i16 %28, metadata !188, metadata !DIExpression()), !dbg !312
  switch i16 %28, label %35 [
    i16 -22392, label %29
    i16 129, label %29
  ], !dbg !320

29:                                               ; preds = %25, %25
  %30 = icmp ugt %struct.vlan_hdr* %20, %18, !dbg !322
  br i1 %30, label %35, label %31, !dbg !323

31:                                               ; preds = %29
  call void @llvm.dbg.value(metadata i16 undef, metadata !188, metadata !DIExpression()), !dbg !312
  %32 = getelementptr i8, i8* %11, i64 20, !dbg !324
  %33 = bitcast i8* %32 to i16*, !dbg !324
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* %20, metadata !182, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i32 2, metadata !189, metadata !DIExpression()), !dbg !312
  %34 = load i16, i16* %33, align 1, !dbg !312, !tbaa !197
  call void @llvm.dbg.value(metadata i16 %34, metadata !188, metadata !DIExpression()), !dbg !312
  br label %35

35:                                               ; preds = %14, %21, %25, %29, %31
  %36 = phi i8* [ %12, %14 ], [ %12, %21 ], [ %22, %25 ], [ %22, %29 ], [ %19, %31 ], !dbg !312
  %37 = phi i16 [ %17, %14 ], [ %17, %21 ], [ %28, %25 ], [ %28, %29 ], [ %34, %31 ], !dbg !312
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !182, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !182, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata %struct.vlan_hdr* undef, metadata !182, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* %36, metadata !290, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.value(metadata i8* %36, metadata !290, metadata !DIExpression()), !dbg !303
  call void @llvm.dbg.value(metadata i16 %37, metadata !291, metadata !DIExpression()), !dbg !303
  %38 = icmp eq i16 %37, 8, !dbg !325
  br i1 %38, label %39, label %81, !dbg !326

39:                                               ; preds = %35
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !212, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.value(metadata i8* %7, metadata !218, metadata !DIExpression()), !dbg !327
  call void @llvm.dbg.value(metadata i8* %36, metadata !220, metadata !DIExpression()), !dbg !327
  %40 = getelementptr inbounds i8, i8* %36, i64 20, !dbg !329
  %41 = icmp ugt i8* %40, %7, !dbg !330
  br i1 %41, label %61, label %42, !dbg !331

42:                                               ; preds = %39
  %43 = load i8, i8* %36, align 4, !dbg !332
  %44 = shl i8 %43, 2, !dbg !333
  %45 = and i8 %44, 60, !dbg !333
  call void @llvm.dbg.value(metadata i8 %45, metadata !221, metadata !DIExpression()), !dbg !327
  %46 = icmp ult i8 %45, 20, !dbg !334
  br i1 %46, label %61, label %47, !dbg !335

47:                                               ; preds = %42
  %48 = zext i8 %45 to i64, !dbg !336
  call void @llvm.dbg.value(metadata i64 %48, metadata !221, metadata !DIExpression()), !dbg !327
  %49 = getelementptr i8, i8* %36, i64 %48, !dbg !337
  %50 = icmp ugt i8* %49, %7, !dbg !338
  br i1 %50, label %61, label %51, !dbg !339

51:                                               ; preds = %47
  call void @llvm.dbg.value(metadata i8* %49, metadata !290, metadata !DIExpression()), !dbg !303
  %52 = getelementptr inbounds i8, i8* %36, i64 9, !dbg !340
  %53 = load i8, i8* %52, align 1, !dbg !340, !tbaa !239
  call void @llvm.dbg.value(metadata i8* %49, metadata !290, metadata !DIExpression()), !dbg !303
  %54 = icmp eq i8 %53, 0, !dbg !341
  br i1 %54, label %55, label %61, !dbg !342

55:                                               ; preds = %51
  %56 = getelementptr inbounds [25 x i8], [25 x i8]* %2, i64 0, i64 0, !dbg !343
  call void @llvm.lifetime.start.p0i8(i64 25, i8* nonnull %56) #3, !dbg !343
  call void @llvm.dbg.declare(metadata [25 x i8]* %2, metadata !296, metadata !DIExpression()), !dbg !344
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(25) %56, i8* nonnull align 1 dereferenceable(25) getelementptr inbounds ([25 x i8], [25 x i8]* @__const.counter1_func.msg, i64 0, i64 0), i64 25, i1 false), !dbg !344
  call void @llvm.dbg.value(metadata i8* %36, metadata !293, metadata !DIExpression()), !dbg !345
  %57 = getelementptr inbounds i8, i8* %36, i64 12, !dbg !346
  %58 = bitcast i8* %57 to i32*, !dbg !346
  %59 = load i32, i32* %58, align 4, !dbg !346, !tbaa !247
  %60 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %56, i32 25, i32 %59, i32 %59) #3, !dbg !347
  call void @llvm.lifetime.end.p0i8(i64 25, i8* nonnull %56) #3, !dbg !348
  br label %61, !dbg !349

61:                                               ; preds = %47, %42, %39, %55, %51
  %62 = phi i8* [ %49, %55 ], [ %49, %51 ], [ %36, %39 ], [ %36, %42 ], [ %36, %47 ]
  call void @llvm.dbg.value(metadata %struct.hdr_cursor* undef, metadata !251, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.value(metadata i8* %7, metadata !257, metadata !DIExpression()), !dbg !350
  call void @llvm.dbg.value(metadata i8* %62, metadata !259, metadata !DIExpression()), !dbg !350
  %63 = getelementptr inbounds i8, i8* %62, i64 8, !dbg !352
  %64 = bitcast i8* %63 to %struct.icmphdr*, !dbg !352
  %65 = inttoptr i64 %6 to %struct.icmphdr*, !dbg !353
  %66 = icmp ugt %struct.icmphdr* %64, %65, !dbg !354
  br i1 %66, label %81, label %67, !dbg !355

67:                                               ; preds = %61
  call void @llvm.dbg.value(metadata %struct.icmphdr* %64, metadata !290, metadata !DIExpression()), !dbg !303
  %68 = load i8, i8* %62, align 4, !dbg !356, !tbaa !268
  %69 = icmp eq i8 %68, 0, !dbg !357
  br i1 %69, label %70, label %81, !dbg !358

70:                                               ; preds = %67
  %71 = getelementptr inbounds [39 x i8], [39 x i8]* %3, i64 0, i64 0, !dbg !359
  call void @llvm.lifetime.start.p0i8(i64 39, i8* nonnull %71) #3, !dbg !359
  call void @llvm.dbg.declare(metadata [39 x i8]* %3, metadata !300, metadata !DIExpression()), !dbg !360
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(39) %71, i8* nonnull align 1 dereferenceable(39) getelementptr inbounds ([39 x i8], [39 x i8]* @__const.counter1_func.msg.2, i64 0, i64 0), i64 39, i1 false), !dbg !360
  call void @llvm.dbg.value(metadata i8* %62, metadata !299, metadata !DIExpression()), !dbg !345
  %72 = getelementptr inbounds i8, i8* %62, i64 1, !dbg !361
  %73 = load i8, i8* %72, align 1, !dbg !361, !tbaa !275
  %74 = zext i8 %73 to i32, !dbg !362
  %75 = load i8, i8* %62, align 4, !dbg !363, !tbaa !268
  %76 = zext i8 %75 to i32, !dbg !364
  %77 = getelementptr inbounds i8, i8* %62, i64 4, !dbg !365
  %78 = bitcast i8* %77 to i32*, !dbg !365
  %79 = load i32, i32* %78, align 4, !dbg !365, !tbaa !280
  %80 = call i64 (i8*, i32, ...) inttoptr (i64 6 to i64 (i8*, i32, ...)*)(i8* nonnull %71, i32 39, i32 %74, i32 %76, i32 %79) #3, !dbg !366
  call void @llvm.lifetime.end.p0i8(i64 39, i8* nonnull %71) #3, !dbg !367
  br label %81, !dbg !368

81:                                               ; preds = %61, %1, %67, %70, %35
  ret i32 2, !dbg !369
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!44, !45, !46}
!llvm.ident = !{!47}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "counter_map", scope: !2, file: !3, line: 19, type: !36, isLocal: false, isDefinition: true)
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
!20 = !{!0, !21, !27}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 142, type: !23, isLocal: false, isDefinition: true)
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
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map_def", file: !37, line: 130, size: 160, elements: !38)
!37 = !DIFile(filename: "../libbpf/src/bpf_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!38 = !{!39, !40, !41, !42, !43}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !36, file: !37, line: 131, baseType: !7, size: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !36, file: !37, line: 132, baseType: !7, size: 32, offset: 32)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !36, file: !37, line: 133, baseType: !7, size: 32, offset: 64)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !36, file: !37, line: 134, baseType: !7, size: 32, offset: 96)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !36, file: !37, line: 135, baseType: !7, size: 32, offset: 128)
!44 = !{i32 7, !"Dwarf Version", i32 4}
!45 = !{i32 2, !"Debug Info Version", i32 3}
!46 = !{i32 1, !"wchar_size", i32 4}
!47 = !{!"clang version 10.0.0-4ubuntu1 "}
!48 = distinct !DISubprogram(name: "counter_func", scope: !3, file: !3, line: 31, type: !49, scopeLine: 32, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !60)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 3161, size: 160, elements: !54)
!54 = !{!55, !56, !57, !58, !59}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !53, file: !6, line: 3162, baseType: !35, size: 32)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !53, file: !6, line: 3163, baseType: !35, size: 32, offset: 32)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !53, file: !6, line: 3164, baseType: !35, size: 32, offset: 64)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !53, file: !6, line: 3166, baseType: !35, size: 32, offset: 96)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !53, file: !6, line: 3167, baseType: !35, size: 32, offset: 128)
!60 = !{!61, !62, !63, !64, !69, !70, !84, !105, !111, !135}
!61 = !DILocalVariable(name: "ctx", arg: 1, scope: !48, file: !3, line: 31, type: !52)
!62 = !DILocalVariable(name: "data_end", scope: !48, file: !3, line: 33, type: !15)
!63 = !DILocalVariable(name: "data", scope: !48, file: !3, line: 34, type: !15)
!64 = !DILocalVariable(name: "nh", scope: !48, file: !3, line: 36, type: !65)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !66, line: 33, size: 64, elements: !67)
!66 = !DIFile(filename: "./../common/parsing_helpers.h", directory: "/root/workspace/ebpf-app/ebpf/src")
!67 = !{!68}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !65, file: !66, line: 34, baseType: !15, size: 64)
!69 = !DILocalVariable(name: "nh_type", scope: !48, file: !3, line: 37, type: !51)
!70 = !DILocalVariable(name: "eth", scope: !48, file: !3, line: 40, type: !71)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !73, line: 163, size: 112, elements: !74)
!73 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "")
!74 = !{!75, !80, !81}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !72, file: !73, line: 164, baseType: !76, size: 48)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !77, size: 48, elements: !78)
!77 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!78 = !{!79}
!79 = !DISubrange(count: 6)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !72, file: !73, line: 165, baseType: !76, size: 48, offset: 48)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !72, file: !73, line: 166, baseType: !82, size: 16, offset: 96)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !83, line: 25, baseType: !17)
!83 = !DIFile(filename: "/usr/include/linux/types.h", directory: "")
!84 = !DILocalVariable(name: "iph", scope: !85, file: !3, line: 46, type: !87)
!85 = distinct !DILexicalBlock(scope: !86, file: !3, line: 45, column: 5)
!86 = distinct !DILexicalBlock(scope: !48, file: !3, line: 44, column: 9)
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !89, line: 86, size: 160, elements: !90)
!89 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "")
!90 = !{!91, !93, !94, !95, !96, !97, !98, !99, !100, !102, !104}
!91 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !88, file: !89, line: 88, baseType: !92, size: 4, flags: DIFlagBitField, extraData: i64 0)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !18, line: 21, baseType: !77)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !88, file: !89, line: 89, baseType: !92, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !88, file: !89, line: 96, baseType: !92, size: 8, offset: 8)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !88, file: !89, line: 97, baseType: !82, size: 16, offset: 16)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !88, file: !89, line: 98, baseType: !82, size: 16, offset: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !88, file: !89, line: 99, baseType: !82, size: 16, offset: 48)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !88, file: !89, line: 100, baseType: !92, size: 8, offset: 64)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !88, file: !89, line: 101, baseType: !92, size: 8, offset: 72)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !88, file: !89, line: 102, baseType: !101, size: 16, offset: 80)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !83, line: 31, baseType: !17)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !88, file: !89, line: 103, baseType: !103, size: 32, offset: 96)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !83, line: 27, baseType: !35)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !88, file: !89, line: 104, baseType: !103, size: 32, offset: 128)
!105 = !DILocalVariable(name: "msg", scope: !106, file: !3, line: 49, type: !108)
!106 = distinct !DILexicalBlock(scope: !107, file: !3, line: 48, column: 9)
!107 = distinct !DILexicalBlock(scope: !85, file: !3, line: 47, column: 13)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 200, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 25)
!111 = !DILocalVariable(name: "icmph", scope: !85, file: !3, line: 53, type: !112)
!112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !113, size: 64)
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !114, line: 69, size: 64, elements: !115)
!114 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "")
!115 = !{!116, !117, !118, !119}
!116 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !113, file: !114, line: 70, baseType: !92, size: 8)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !113, file: !114, line: 71, baseType: !92, size: 8, offset: 8)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !113, file: !114, line: 72, baseType: !101, size: 16, offset: 16)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !113, file: !114, line: 84, baseType: !120, size: 32, offset: 32)
!120 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !113, file: !114, line: 73, size: 32, elements: !121)
!121 = !{!122, !127, !128, !133}
!122 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !120, file: !114, line: 77, baseType: !123, size: 32)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !120, file: !114, line: 74, size: 32, elements: !124)
!124 = !{!125, !126}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !123, file: !114, line: 75, baseType: !82, size: 16)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !123, file: !114, line: 76, baseType: !82, size: 16, offset: 16)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !120, file: !114, line: 78, baseType: !103, size: 32)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !120, file: !114, line: 82, baseType: !129, size: 32)
!129 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !120, file: !114, line: 79, size: 32, elements: !130)
!130 = !{!131, !132}
!131 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !129, file: !114, line: 80, baseType: !82, size: 16)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !129, file: !114, line: 81, baseType: !82, size: 16, offset: 16)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !120, file: !114, line: 83, baseType: !134, size: 32)
!134 = !DICompositeType(tag: DW_TAG_array_type, baseType: !92, size: 32, elements: !25)
!135 = !DILocalVariable(name: "msg", scope: !136, file: !3, line: 56, type: !138)
!136 = distinct !DILexicalBlock(scope: !137, file: !3, line: 55, column: 9)
!137 = distinct !DILexicalBlock(scope: !85, file: !3, line: 54, column: 13)
!138 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 312, elements: !139)
!139 = !{!140}
!140 = !DISubrange(count: 39)
!141 = !DILocation(line: 0, scope: !48)
!142 = !DILocation(line: 33, column: 41, scope: !48)
!143 = !{!144, !145, i64 4}
!144 = !{!"xdp_md", !145, i64 0, !145, i64 4, !145, i64 8, !145, i64 12, !145, i64 16}
!145 = !{!"int", !146, i64 0}
!146 = !{!"omnipotent char", !147, i64 0}
!147 = !{!"Simple C/C++ TBAA"}
!148 = !DILocation(line: 33, column: 30, scope: !48)
!149 = !DILocation(line: 33, column: 22, scope: !48)
!150 = !DILocation(line: 34, column: 37, scope: !48)
!151 = !{!144, !145, i64 0}
!152 = !DILocation(line: 34, column: 26, scope: !48)
!153 = !DILocation(line: 34, column: 18, scope: !48)
!154 = !DILocalVariable(name: "nh", arg: 1, scope: !155, file: !66, line: 124, type: !158)
!155 = distinct !DISubprogram(name: "parse_ethhdr", scope: !66, file: !66, line: 124, type: !156, scopeLine: 127, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !160)
!156 = !DISubroutineType(types: !157)
!157 = !{!51, !158, !15, !159}
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!160 = !{!154, !161, !162}
!161 = !DILocalVariable(name: "data_end", arg: 2, scope: !155, file: !66, line: 125, type: !15)
!162 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !155, file: !66, line: 126, type: !159)
!163 = !DILocation(line: 0, scope: !155, inlinedAt: !164)
!164 = distinct !DILocation(line: 42, column: 15, scope: !48)
!165 = !DILocalVariable(name: "nh", arg: 1, scope: !166, file: !66, line: 79, type: !158)
!166 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !66, file: !66, line: 79, type: !167, scopeLine: 83, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !176)
!167 = !DISubroutineType(types: !168)
!168 = !{!51, !158, !15, !159, !169}
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !66, line: 64, size: 32, elements: !171)
!171 = !{!172}
!172 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !170, file: !66, line: 65, baseType: !173, size: 32)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 32, elements: !174)
!174 = !{!175}
!175 = !DISubrange(count: 2)
!176 = !{!165, !177, !178, !179, !180, !181, !182, !188, !189}
!177 = !DILocalVariable(name: "data_end", arg: 2, scope: !166, file: !66, line: 80, type: !15)
!178 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !166, file: !66, line: 81, type: !159)
!179 = !DILocalVariable(name: "vlans", arg: 4, scope: !166, file: !66, line: 82, type: !169)
!180 = !DILocalVariable(name: "eth", scope: !166, file: !66, line: 84, type: !71)
!181 = !DILocalVariable(name: "hdrsize", scope: !166, file: !66, line: 85, type: !51)
!182 = !DILocalVariable(name: "vlh", scope: !166, file: !66, line: 86, type: !183)
!183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !184, size: 64)
!184 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !66, line: 42, size: 32, elements: !185)
!185 = !{!186, !187}
!186 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !184, file: !66, line: 43, baseType: !82, size: 16)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !184, file: !66, line: 44, baseType: !82, size: 16, offset: 16)
!188 = !DILocalVariable(name: "h_proto", scope: !166, file: !66, line: 87, type: !17)
!189 = !DILocalVariable(name: "i", scope: !166, file: !66, line: 88, type: !51)
!190 = !DILocation(line: 0, scope: !166, inlinedAt: !191)
!191 = distinct !DILocation(line: 129, column: 9, scope: !155, inlinedAt: !164)
!192 = !DILocation(line: 93, column: 14, scope: !193, inlinedAt: !191)
!193 = distinct !DILexicalBlock(scope: !166, file: !66, line: 93, column: 6)
!194 = !DILocation(line: 93, column: 24, scope: !193, inlinedAt: !191)
!195 = !DILocation(line: 93, column: 6, scope: !166, inlinedAt: !191)
!196 = !DILocation(line: 99, column: 17, scope: !166, inlinedAt: !191)
!197 = !{!198, !198, i64 0}
!198 = !{!"short", !146, i64 0}
!199 = !DILocation(line: 0, scope: !200, inlinedAt: !191)
!200 = distinct !DILexicalBlock(scope: !201, file: !66, line: 109, column: 7)
!201 = distinct !DILexicalBlock(scope: !202, file: !66, line: 105, column: 39)
!202 = distinct !DILexicalBlock(scope: !203, file: !66, line: 105, column: 2)
!203 = distinct !DILexicalBlock(scope: !166, file: !66, line: 105, column: 2)
!204 = !DILocation(line: 105, column: 2, scope: !203, inlinedAt: !191)
!205 = !DILocation(line: 106, column: 7, scope: !201, inlinedAt: !191)
!206 = !DILocation(line: 109, column: 11, scope: !200, inlinedAt: !191)
!207 = !DILocation(line: 109, column: 15, scope: !200, inlinedAt: !191)
!208 = !DILocation(line: 109, column: 7, scope: !201, inlinedAt: !191)
!209 = !DILocation(line: 112, column: 18, scope: !201, inlinedAt: !191)
!210 = !DILocation(line: 44, column: 31, scope: !86)
!211 = !DILocation(line: 44, column: 9, scope: !48)
!212 = !DILocalVariable(name: "nh", arg: 1, scope: !213, file: !66, line: 151, type: !158)
!213 = distinct !DISubprogram(name: "parse_iphdr", scope: !66, file: !66, line: 151, type: !214, scopeLine: 154, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !217)
!214 = !DISubroutineType(types: !215)
!215 = !{!51, !158, !15, !216}
!216 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !87, size: 64)
!217 = !{!212, !218, !219, !220, !221}
!218 = !DILocalVariable(name: "data_end", arg: 2, scope: !213, file: !66, line: 152, type: !15)
!219 = !DILocalVariable(name: "iphdr", arg: 3, scope: !213, file: !66, line: 153, type: !216)
!220 = !DILocalVariable(name: "iph", scope: !213, file: !66, line: 155, type: !87)
!221 = !DILocalVariable(name: "hdrsize", scope: !213, file: !66, line: 156, type: !51)
!222 = !DILocation(line: 0, scope: !213, inlinedAt: !223)
!223 = distinct !DILocation(line: 47, column: 40, scope: !107)
!224 = !DILocation(line: 158, column: 10, scope: !225, inlinedAt: !223)
!225 = distinct !DILexicalBlock(scope: !213, file: !66, line: 158, column: 6)
!226 = !DILocation(line: 158, column: 14, scope: !225, inlinedAt: !223)
!227 = !DILocation(line: 158, column: 6, scope: !213, inlinedAt: !223)
!228 = !DILocation(line: 161, column: 17, scope: !213, inlinedAt: !223)
!229 = !DILocation(line: 161, column: 21, scope: !213, inlinedAt: !223)
!230 = !DILocation(line: 163, column: 13, scope: !231, inlinedAt: !223)
!231 = distinct !DILexicalBlock(scope: !213, file: !66, line: 163, column: 5)
!232 = !DILocation(line: 163, column: 5, scope: !213, inlinedAt: !223)
!233 = !DILocation(line: 163, column: 5, scope: !231, inlinedAt: !223)
!234 = !DILocation(line: 167, column: 14, scope: !235, inlinedAt: !223)
!235 = distinct !DILexicalBlock(scope: !213, file: !66, line: 167, column: 6)
!236 = !DILocation(line: 167, column: 24, scope: !235, inlinedAt: !223)
!237 = !DILocation(line: 167, column: 6, scope: !213, inlinedAt: !223)
!238 = !DILocation(line: 173, column: 14, scope: !213, inlinedAt: !223)
!239 = !{!240, !146, i64 9}
!240 = !{!"iphdr", !146, i64 0, !146, i64 0, !146, i64 1, !198, i64 2, !198, i64 4, !198, i64 6, !146, i64 8, !146, i64 9, !198, i64 10, !145, i64 12, !145, i64 16}
!241 = !DILocation(line: 47, column: 37, scope: !107)
!242 = !DILocation(line: 47, column: 13, scope: !85)
!243 = !DILocation(line: 49, column: 13, scope: !106)
!244 = !DILocation(line: 49, column: 24, scope: !106)
!245 = !DILocation(line: 0, scope: !85)
!246 = !DILocation(line: 50, column: 53, scope: !106)
!247 = !{!240, !145, i64 12}
!248 = !DILocation(line: 50, column: 13, scope: !106)
!249 = !DILocation(line: 51, column: 9, scope: !107)
!250 = !DILocation(line: 51, column: 9, scope: !106)
!251 = !DILocalVariable(name: "nh", arg: 1, scope: !252, file: !66, line: 191, type: !158)
!252 = distinct !DISubprogram(name: "parse_icmphdr", scope: !66, file: !66, line: 191, type: !253, scopeLine: 194, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !256)
!253 = !DISubroutineType(types: !254)
!254 = !{!51, !158, !15, !255}
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !112, size: 64)
!256 = !{!251, !257, !258, !259}
!257 = !DILocalVariable(name: "data_end", arg: 2, scope: !252, file: !66, line: 192, type: !15)
!258 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !252, file: !66, line: 193, type: !255)
!259 = !DILocalVariable(name: "icmph", scope: !252, file: !66, line: 195, type: !112)
!260 = !DILocation(line: 0, scope: !252, inlinedAt: !261)
!261 = distinct !DILocation(line: 54, column: 40, scope: !137)
!262 = !DILocation(line: 197, column: 12, scope: !263, inlinedAt: !261)
!263 = distinct !DILexicalBlock(scope: !252, file: !66, line: 197, column: 6)
!264 = !DILocation(line: 197, column: 18, scope: !263, inlinedAt: !261)
!265 = !DILocation(line: 197, column: 16, scope: !263, inlinedAt: !261)
!266 = !DILocation(line: 197, column: 6, scope: !252, inlinedAt: !261)
!267 = !DILocation(line: 203, column: 16, scope: !252, inlinedAt: !261)
!268 = !{!269, !146, i64 0}
!269 = !{!"icmphdr", !146, i64 0, !146, i64 1, !198, i64 2, !146, i64 4}
!270 = !DILocation(line: 54, column: 37, scope: !137)
!271 = !DILocation(line: 54, column: 13, scope: !85)
!272 = !DILocation(line: 56, column: 13, scope: !136)
!273 = !DILocation(line: 56, column: 24, scope: !136)
!274 = !DILocation(line: 57, column: 55, scope: !136)
!275 = !{!269, !146, i64 1}
!276 = !DILocation(line: 57, column: 48, scope: !136)
!277 = !DILocation(line: 57, column: 68, scope: !136)
!278 = !DILocation(line: 57, column: 61, scope: !136)
!279 = !DILocation(line: 57, column: 84, scope: !136)
!280 = !{!146, !146, i64 0}
!281 = !DILocation(line: 57, column: 13, scope: !136)
!282 = !DILocation(line: 58, column: 9, scope: !137)
!283 = !DILocation(line: 58, column: 9, scope: !136)
!284 = !DILocation(line: 83, column: 5, scope: !48)
!285 = distinct !DISubprogram(name: "counter1_func", scope: !3, file: !3, line: 87, type: !49, scopeLine: 88, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !286)
!286 = !{!287, !288, !289, !290, !291, !292, !293, !296, !299, !300}
!287 = !DILocalVariable(name: "ctx", arg: 1, scope: !285, file: !3, line: 87, type: !52)
!288 = !DILocalVariable(name: "data_end", scope: !285, file: !3, line: 89, type: !15)
!289 = !DILocalVariable(name: "data", scope: !285, file: !3, line: 90, type: !15)
!290 = !DILocalVariable(name: "nh", scope: !285, file: !3, line: 92, type: !65)
!291 = !DILocalVariable(name: "nh_type", scope: !285, file: !3, line: 93, type: !51)
!292 = !DILocalVariable(name: "eth", scope: !285, file: !3, line: 96, type: !71)
!293 = !DILocalVariable(name: "iph", scope: !294, file: !3, line: 102, type: !87)
!294 = distinct !DILexicalBlock(scope: !295, file: !3, line: 101, column: 5)
!295 = distinct !DILexicalBlock(scope: !285, file: !3, line: 100, column: 9)
!296 = !DILocalVariable(name: "msg", scope: !297, file: !3, line: 105, type: !108)
!297 = distinct !DILexicalBlock(scope: !298, file: !3, line: 104, column: 9)
!298 = distinct !DILexicalBlock(scope: !294, file: !3, line: 103, column: 13)
!299 = !DILocalVariable(name: "icmph", scope: !294, file: !3, line: 109, type: !112)
!300 = !DILocalVariable(name: "msg", scope: !301, file: !3, line: 112, type: !138)
!301 = distinct !DILexicalBlock(scope: !302, file: !3, line: 111, column: 9)
!302 = distinct !DILexicalBlock(scope: !294, file: !3, line: 110, column: 13)
!303 = !DILocation(line: 0, scope: !285)
!304 = !DILocation(line: 89, column: 41, scope: !285)
!305 = !DILocation(line: 89, column: 30, scope: !285)
!306 = !DILocation(line: 89, column: 22, scope: !285)
!307 = !DILocation(line: 90, column: 37, scope: !285)
!308 = !DILocation(line: 90, column: 26, scope: !285)
!309 = !DILocation(line: 90, column: 18, scope: !285)
!310 = !DILocation(line: 0, scope: !155, inlinedAt: !311)
!311 = distinct !DILocation(line: 98, column: 15, scope: !285)
!312 = !DILocation(line: 0, scope: !166, inlinedAt: !313)
!313 = distinct !DILocation(line: 129, column: 9, scope: !155, inlinedAt: !311)
!314 = !DILocation(line: 93, column: 14, scope: !193, inlinedAt: !313)
!315 = !DILocation(line: 93, column: 24, scope: !193, inlinedAt: !313)
!316 = !DILocation(line: 93, column: 6, scope: !166, inlinedAt: !313)
!317 = !DILocation(line: 99, column: 17, scope: !166, inlinedAt: !313)
!318 = !DILocation(line: 0, scope: !200, inlinedAt: !313)
!319 = !DILocation(line: 105, column: 2, scope: !203, inlinedAt: !313)
!320 = !DILocation(line: 106, column: 7, scope: !201, inlinedAt: !313)
!321 = !DILocation(line: 109, column: 11, scope: !200, inlinedAt: !313)
!322 = !DILocation(line: 109, column: 15, scope: !200, inlinedAt: !313)
!323 = !DILocation(line: 109, column: 7, scope: !201, inlinedAt: !313)
!324 = !DILocation(line: 112, column: 18, scope: !201, inlinedAt: !313)
!325 = !DILocation(line: 100, column: 31, scope: !295)
!326 = !DILocation(line: 100, column: 9, scope: !285)
!327 = !DILocation(line: 0, scope: !213, inlinedAt: !328)
!328 = distinct !DILocation(line: 103, column: 40, scope: !298)
!329 = !DILocation(line: 158, column: 10, scope: !225, inlinedAt: !328)
!330 = !DILocation(line: 158, column: 14, scope: !225, inlinedAt: !328)
!331 = !DILocation(line: 158, column: 6, scope: !213, inlinedAt: !328)
!332 = !DILocation(line: 161, column: 17, scope: !213, inlinedAt: !328)
!333 = !DILocation(line: 161, column: 21, scope: !213, inlinedAt: !328)
!334 = !DILocation(line: 163, column: 13, scope: !231, inlinedAt: !328)
!335 = !DILocation(line: 163, column: 5, scope: !213, inlinedAt: !328)
!336 = !DILocation(line: 163, column: 5, scope: !231, inlinedAt: !328)
!337 = !DILocation(line: 167, column: 14, scope: !235, inlinedAt: !328)
!338 = !DILocation(line: 167, column: 24, scope: !235, inlinedAt: !328)
!339 = !DILocation(line: 167, column: 6, scope: !213, inlinedAt: !328)
!340 = !DILocation(line: 173, column: 14, scope: !213, inlinedAt: !328)
!341 = !DILocation(line: 103, column: 37, scope: !298)
!342 = !DILocation(line: 103, column: 13, scope: !294)
!343 = !DILocation(line: 105, column: 13, scope: !297)
!344 = !DILocation(line: 105, column: 24, scope: !297)
!345 = !DILocation(line: 0, scope: !294)
!346 = !DILocation(line: 106, column: 53, scope: !297)
!347 = !DILocation(line: 106, column: 13, scope: !297)
!348 = !DILocation(line: 107, column: 9, scope: !298)
!349 = !DILocation(line: 107, column: 9, scope: !297)
!350 = !DILocation(line: 0, scope: !252, inlinedAt: !351)
!351 = distinct !DILocation(line: 110, column: 40, scope: !302)
!352 = !DILocation(line: 197, column: 12, scope: !263, inlinedAt: !351)
!353 = !DILocation(line: 197, column: 18, scope: !263, inlinedAt: !351)
!354 = !DILocation(line: 197, column: 16, scope: !263, inlinedAt: !351)
!355 = !DILocation(line: 197, column: 6, scope: !252, inlinedAt: !351)
!356 = !DILocation(line: 203, column: 16, scope: !252, inlinedAt: !351)
!357 = !DILocation(line: 110, column: 37, scope: !302)
!358 = !DILocation(line: 110, column: 13, scope: !294)
!359 = !DILocation(line: 112, column: 13, scope: !301)
!360 = !DILocation(line: 112, column: 24, scope: !301)
!361 = !DILocation(line: 113, column: 55, scope: !301)
!362 = !DILocation(line: 113, column: 48, scope: !301)
!363 = !DILocation(line: 113, column: 68, scope: !301)
!364 = !DILocation(line: 113, column: 61, scope: !301)
!365 = !DILocation(line: 113, column: 84, scope: !301)
!366 = !DILocation(line: 113, column: 13, scope: !301)
!367 = !DILocation(line: 114, column: 9, scope: !302)
!368 = !DILocation(line: 114, column: 9, scope: !301)
!369 = !DILocation(line: 139, column: 5, scope: !285)
