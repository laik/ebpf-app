; ModuleID = 'srv6.c'
source_filename = "srv6.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.xdpcap_hook = type { [3 x i32]*, [4 x i32]*, [4 x i32]*, [5 x i32]* }
%struct.anon = type { [11 x i32]*, %struct.lpm_key_v4*, %struct.transit_behavior*, [256 x i32]*, [1 x i32]* }
%struct.lpm_key_v4 = type { i32, i32 }
%struct.transit_behavior = type { %struct.in6_addr, %struct.in6_addr, i32, i32, i32, i32, [5 x %struct.in6_addr] }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.anon.1 = type { [11 x i32]*, %struct.lpm_key_v6*, %struct.end_function*, [65536 x i32]*, [1 x i32]* }
%struct.lpm_key_v6 = type { i32, %struct.in6_addr }
%struct.end_function = type { [4 x i32], %union.anon.0, i32, i32, i32, i32 }
%union.anon.0 = type { [4 x i32] }
%struct.anon.2 = type { [11 x i32]*, %struct.lpm_key_v6*, %struct.transit_behavior*, [256 x i32]*, [1 x i32]* }
%struct.anon.3 = type { [14 x i32]*, [4 x i32]*, [4 x i32]*, [64 x i32]* }
%struct.anon.4 = type { [6 x i32]*, i32*, %struct.v6addr_heep*, [1 x i32]* }
%struct.v6addr_heep = type { %struct.in6_addr, %struct.in6_addr }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.args_mob_session = type <{ i8, %union.anon.8 }>
%union.anon.8 = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.srhhdr = type { i8, i8, i8, i8, i8, i8, i16, [0 x %struct.in6_addr] }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.gtp1hdr = type { i8, i8, i16, i32 }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.5, %union.anon.6, %union.anon.7, i16, i16, [6 x i8], [6 x i8] }
%union.anon.5 = type { i32 }
%union.anon.6 = type { [4 x i32] }
%union.anon.7 = type { [4 x i32] }

@xdpcap_hook = dso_local global %struct.xdpcap_hook zeroinitializer, section ".maps", align 8, !dbg !0
@transit_table_v4 = dso_local global %struct.anon zeroinitializer, section ".maps", align 8, !dbg !201
@function_table = dso_local global %struct.anon.1 zeroinitializer, section ".maps", align 8, !dbg !154
@transit_table_v6 = dso_local global %struct.anon.2 zeroinitializer, section ".maps", align 8, !dbg !232
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !131
@tx_port = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !135
@in_taple_v6_addr = dso_local global %struct.anon.4 zeroinitializer, section ".maps", align 8, !dbg !241
@llvm.used = appending global [9 x i8*] [i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_license, i32 0, i32 0), i8* bitcast (%struct.anon.1* @function_table to i8*), i8* bitcast (%struct.anon.4* @in_taple_v6_addr to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @srv6_handler to i8*), i8* bitcast (%struct.anon* @transit_table_v4 to i8*), i8* bitcast (%struct.anon.2* @transit_table_v6 to i8*), i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* bitcast (i32 (%struct.xdp_md*)* @xdp_pass_func to i8*), i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @srv6_handler(%struct.xdp_md* %0) #0 section "xdp_prog" !dbg !297 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.args_mob_session, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.args_mob_session, align 1
  %7 = alloca %struct.lpm_key_v4, align 4
  %8 = alloca %struct.lpm_key_v6, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !301, metadata !DIExpression()), !dbg !345
  %9 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0), !dbg !346, !llvm.preserve.access.index !62
  %10 = load i32, i32* %9, align 4, !dbg !346, !tbaa !347
  %11 = zext i32 %10 to i64, !dbg !352
  %12 = inttoptr i64 %11 to i8*, !dbg !353
  call void @llvm.dbg.value(metadata i8* %12, metadata !302, metadata !DIExpression()), !dbg !345
  %13 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1), !dbg !354, !llvm.preserve.access.index !62
  %14 = load i32, i32* %13, align 4, !dbg !354, !tbaa !355
  %15 = zext i32 %14 to i64, !dbg !356
  %16 = inttoptr i64 %15 to i8*, !dbg !357
  call void @llvm.dbg.value(metadata i8* %16, metadata !303, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i8* %12, metadata !304, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #7, !dbg !367
  call void @llvm.dbg.value(metadata i8* %12, metadata !364, metadata !DIExpression()) #7, !dbg !367
  call void @llvm.dbg.value(metadata i64 %15, metadata !365, metadata !DIExpression()) #7, !dbg !367
  call void @llvm.dbg.value(metadata i8* %12, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !367
  %17 = getelementptr i8, i8* %12, i64 34, !dbg !369
  %18 = bitcast i8* %17 to %struct.iphdr*, !dbg !369
  %19 = inttoptr i64 %15 to %struct.iphdr*, !dbg !371
  %20 = icmp ugt %struct.iphdr* %18, %19, !dbg !372
  %21 = getelementptr i8, i8* %12, i64 14, !dbg !373
  %22 = bitcast i8* %21 to %struct.iphdr*, !dbg !373
  %23 = select i1 %20, %struct.iphdr* null, %struct.iphdr* %22, !dbg !373
  call void @llvm.dbg.value(metadata %struct.iphdr* %23, metadata !312, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #7, !dbg !382
  call void @llvm.dbg.value(metadata i8* %12, metadata !379, metadata !DIExpression()) #7, !dbg !382
  call void @llvm.dbg.value(metadata i64 %15, metadata !380, metadata !DIExpression()) #7, !dbg !382
  call void @llvm.dbg.value(metadata i8* %12, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !382
  %24 = getelementptr i8, i8* %12, i64 54, !dbg !384
  %25 = bitcast i8* %24 to %struct.ipv6hdr*, !dbg !384
  %26 = inttoptr i64 %15 to %struct.ipv6hdr*, !dbg !386
  %27 = icmp ugt %struct.ipv6hdr* %25, %26, !dbg !387
  %28 = bitcast i8* %21 to %struct.ipv6hdr*, !dbg !388
  %29 = select i1 %27, %struct.ipv6hdr* null, %struct.ipv6hdr* %28, !dbg !388
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %29, metadata !327, metadata !DIExpression()), !dbg !345
  %30 = bitcast %struct.lpm_key_v4* %7 to i8*, !dbg !389
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30) #7, !dbg !389
  call void @llvm.dbg.declare(metadata %struct.lpm_key_v4* %7, metadata !342, metadata !DIExpression()), !dbg !390
  %31 = bitcast %struct.lpm_key_v6* %8 to i8*, !dbg !391
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %31) #7, !dbg !391
  call void @llvm.dbg.declare(metadata %struct.lpm_key_v6* %8, metadata !343, metadata !DIExpression()), !dbg !392
  %32 = icmp ugt i8* %21, %16, !dbg !393
  br i1 %32, label %33, label %35, !dbg !395

33:                                               ; preds = %1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !404
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !404
  call void @llvm.dbg.value(metadata i32 2, metadata !403, metadata !DIExpression()) #7, !dbg !404
  %34 = tail call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 2) #7, !dbg !406
  br label %820, !dbg !407

35:                                               ; preds = %1
  %36 = inttoptr i64 %11 to %struct.ethhdr*, !dbg !408
  call void @llvm.dbg.value(metadata %struct.ethhdr* %36, metadata !304, metadata !DIExpression()), !dbg !345
  %37 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %36, i32 2, i32 2), !dbg !409, !llvm.preserve.access.index !306
  %38 = load i16, i16* %37, align 2, !dbg !409, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %38, metadata !344, metadata !DIExpression()), !dbg !345
  switch i16 %38, label %818 [
    i16 8, label %39
    i16 -8826, label %360
  ], !dbg !413

39:                                               ; preds = %35
  %40 = icmp eq %struct.iphdr* %23, null, !dbg !414
  br i1 %40, label %41, label %43, !dbg !418

41:                                               ; preds = %39
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !419
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !419
  call void @llvm.dbg.value(metadata i32 1, metadata !403, metadata !DIExpression()) #7, !dbg !419
  %42 = tail call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 1) #7, !dbg !421
  br label %820, !dbg !422

43:                                               ; preds = %39
  %44 = getelementptr inbounds %struct.lpm_key_v4, %struct.lpm_key_v4* %7, i64 0, i32 0, !dbg !423
  store i32 32, i32* %44, align 4, !dbg !424, !tbaa !425
  %45 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %23, i32 9, i32 10), !dbg !427, !llvm.preserve.access.index !314
  %46 = load i32, i32* %45, align 4, !dbg !427, !tbaa !428
  %47 = getelementptr inbounds %struct.lpm_key_v4, %struct.lpm_key_v4* %7, i64 0, i32 1, !dbg !430
  store i32 %46, i32* %47, align 4, !dbg !431, !tbaa !432
  %48 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @transit_table_v4 to i8*), i8* nonnull %30) #7, !dbg !433
  %49 = bitcast i8* %48 to %struct.transit_behavior*, !dbg !433
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %49, metadata !341, metadata !DIExpression()), !dbg !345
  %50 = icmp eq i8* %48, null, !dbg !434
  br i1 %50, label %818, label %51, !dbg !436

51:                                               ; preds = %43
  %52 = getelementptr inbounds i8, i8* %48, i64 44, !dbg !437
  %53 = bitcast i8* %52 to i32*, !dbg !437
  %54 = load i32, i32* %53, align 4, !dbg !437, !tbaa !439
  switch i32 %54, label %818 [
    i32 1, label %55
    i32 5, label %62
  ], !dbg !442

55:                                               ; preds = %51
  %56 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %23, i32 2, i32 3), !dbg !443, !llvm.preserve.access.index !314
  %57 = load i16, i16* %56, align 2, !dbg !443, !tbaa !445
  %58 = lshr i16 %57, 8, !dbg !443
  %59 = trunc i16 %58 to i8, !dbg !443
  %60 = call fastcc i32 @transit_encap(%struct.xdp_md* %0, %struct.transit_behavior* nonnull %49, i8 zeroext 4, i8 zeroext %59), !dbg !446
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !447
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !447
  call void @llvm.dbg.value(metadata i32 %60, metadata !403, metadata !DIExpression()) #7, !dbg !447
  %61 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %60) #7, !dbg !449
  br label %820, !dbg !450

62:                                               ; preds = %51
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !451, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %49, metadata !456, metadata !DIExpression()) #7, !dbg !518
  %63 = load i32, i32* %9, align 4, !dbg !520, !tbaa !347
  %64 = zext i32 %63 to i64, !dbg !521
  %65 = inttoptr i64 %64 to i8*, !dbg !522
  call void @llvm.dbg.value(metadata i8* %65, metadata !457, metadata !DIExpression()) #7, !dbg !518
  %66 = load i32, i32* %13, align 4, !dbg !523, !tbaa !355
  call void @llvm.dbg.value(metadata i32 %66, metadata !458, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !518
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #7, !dbg !524
  call void @llvm.dbg.value(metadata i8* %65, metadata !364, metadata !DIExpression()) #7, !dbg !524
  %67 = zext i32 %66 to i64, !dbg !526
  call void @llvm.dbg.value(metadata i64 %67, metadata !365, metadata !DIExpression()) #7, !dbg !524
  call void @llvm.dbg.value(metadata i8* %65, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !524
  %68 = getelementptr i8, i8* %65, i64 34, !dbg !527
  %69 = bitcast i8* %68 to %struct.iphdr*, !dbg !527
  %70 = inttoptr i64 %67 to %struct.iphdr*, !dbg !528
  %71 = icmp ugt %struct.iphdr* %69, %70, !dbg !529
  %72 = getelementptr i8, i8* %65, i64 14, !dbg !530
  %73 = bitcast i8* %72 to %struct.iphdr*, !dbg !530
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !459, metadata !DIExpression()) #7, !dbg !518
  %74 = bitcast i32* %4 to i8*, !dbg !531
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %74) #7, !dbg !531
  %75 = bitcast i32* %5 to i8*, !dbg !531
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %75) #7, !dbg !531
  %76 = icmp eq i8* %72, null, !dbg !532
  %77 = or i1 %76, %71, !dbg !532
  br i1 %77, label %357, label %78, !dbg !534

78:                                               ; preds = %62
  call void @llvm.dbg.value(metadata i64 %67, metadata !458, metadata !DIExpression()) #7, !dbg !518
  %79 = inttoptr i64 %67 to i8*, !dbg !535
  call void @llvm.dbg.value(metadata i8* %79, metadata !458, metadata !DIExpression()) #7, !dbg !518
  %80 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %73, i32 6, i32 7) #7, !dbg !536, !llvm.preserve.access.index !314
  %81 = load i8, i8* %80, align 1, !dbg !536, !tbaa !538
  %82 = icmp ne i8 %81, 17, !dbg !539
  %83 = getelementptr i8, i8* %65, i64 50
  %84 = icmp ugt i8* %83, %79
  %85 = or i1 %84, %82, !dbg !540
  call void @llvm.dbg.value(metadata i8* %65, metadata !484, metadata !DIExpression(DW_OP_plus_uconst, 42, DW_OP_stack_value)) #7, !dbg !518
  br i1 %85, label %357, label %86, !dbg !540

86:                                               ; preds = %78
  call void @llvm.dbg.value(metadata i8* %65, metadata !484, metadata !DIExpression(DW_OP_plus_uconst, 42, DW_OP_stack_value)) #7, !dbg !518
  %87 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %73, i32 8, i32 9) #7, !dbg !541, !llvm.preserve.access.index !314
  call void @llvm.dbg.value(metadata i32* %4, metadata !482, metadata !DIExpression(DW_OP_deref)) #7, !dbg !518
  %88 = load i32, i32* %87, align 4, !dbg !542
  store i32 %88, i32* %4, align 4, !dbg !542
  %89 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %73, i32 9, i32 10) #7, !dbg !543, !llvm.preserve.access.index !314
  call void @llvm.dbg.value(metadata i32* %5, metadata !483, metadata !DIExpression(DW_OP_deref)) #7, !dbg !518
  %90 = load i32, i32* %89, align 4, !dbg !544
  store i32 %90, i32* %5, align 4, !dbg !544
  call void @llvm.dbg.value(metadata i16 36, metadata !479, metadata !DIExpression()) #7, !dbg !518
  %91 = getelementptr i8, i8* %65, i64 46, !dbg !545
  %92 = bitcast i8* %91 to i32*, !dbg !545
  %93 = load i32, i32* %92, align 4, !dbg !545, !tbaa !546
  call void @llvm.dbg.value(metadata i32 %93, metadata !461, metadata !DIExpression()) #7, !dbg !518
  %94 = getelementptr i8, i8* %65, i64 43, !dbg !548
  %95 = load i8, i8* %94, align 1, !dbg !548, !tbaa !549
  call void @llvm.dbg.value(metadata i8 %95, metadata !460, metadata !DIExpression()) #7, !dbg !518
  %96 = getelementptr i8, i8* %65, i64 44, !dbg !550
  %97 = bitcast i8* %96 to i16*, !dbg !550
  %98 = load i16, i16* %97, align 2, !dbg !550, !tbaa !551
  %99 = call i16 @llvm.bswap.i16(i16 %98) #7
  call void @llvm.dbg.value(metadata i16 %99, metadata !481, metadata !DIExpression()) #7, !dbg !518
  %100 = icmp eq i8 %95, -1, !dbg !552
  br i1 %100, label %101, label %357, !dbg !554

101:                                              ; preds = %86
  %102 = getelementptr inbounds i8, i8* %48, i64 32, !dbg !555
  %103 = bitcast i8* %102 to i32*, !dbg !555
  %104 = load i32, i32* %103, align 4, !dbg !555, !tbaa !557
  %105 = icmp eq i32 %104, 0, !dbg !558
  br i1 %105, label %357, label %106, !dbg !559

106:                                              ; preds = %101
  %107 = getelementptr inbounds i8, i8* %48, i64 36, !dbg !560
  %108 = bitcast i8* %107 to i32*, !dbg !560
  %109 = load i32, i32* %108, align 4, !dbg !560, !tbaa !561
  %110 = icmp ugt i32 %104, 96
  %111 = add i32 %109, -1, !dbg !562
  %112 = icmp ugt i32 %111, 55, !dbg !562
  %113 = or i1 %110, %112, !dbg !562
  br i1 %113, label %357, label %114, !dbg !562

114:                                              ; preds = %106
  %115 = getelementptr inbounds i8, i8* %48, i64 40, !dbg !563
  %116 = bitcast i8* %115 to i32*, !dbg !563
  %117 = load i32, i32* %116, align 4, !dbg !563, !tbaa !564
  %118 = add i32 %117, 1, !dbg !565
  call void @llvm.dbg.value(metadata i32 %118, metadata !492, metadata !DIExpression()) #7, !dbg !518
  %119 = trunc i32 %118 to i8, !dbg !566
  %120 = shl i8 %119, 4, !dbg !567
  %121 = or i8 %120, 8, !dbg !568
  call void @llvm.dbg.value(metadata i8 %121, metadata !478, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata i8 %121, metadata !480, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus_uconst, 40, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !518
  %122 = and i32 %118, 65535, !dbg !569
  call void @llvm.dbg.value(metadata i32 %122, metadata !492, metadata !DIExpression()) #7, !dbg !518
  %123 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 36) #7, !dbg !570
  %124 = icmp eq i64 %123, 0, !dbg !570
  br i1 %124, label %125, label %357, !dbg !572

125:                                              ; preds = %114
  %126 = zext i8 %121 to i32, !dbg !573
  %127 = add nuw nsw i32 %126, 40, !dbg !574
  call void @llvm.dbg.value(metadata i32 %127, metadata !480, metadata !DIExpression()) #7, !dbg !518
  %128 = sub nsw i32 0, %127, !dbg !575
  %129 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %128) #7, !dbg !577
  %130 = icmp eq i64 %129, 0, !dbg !577
  br i1 %130, label %131, label %357, !dbg !578

131:                                              ; preds = %125
  %132 = load i32, i32* %9, align 4, !dbg !579, !tbaa !347
  %133 = zext i32 %132 to i64, !dbg !580
  call void @llvm.dbg.value(metadata i64 %133, metadata !457, metadata !DIExpression()) #7, !dbg !518
  %134 = load i32, i32* %13, align 4, !dbg !581, !tbaa !355
  %135 = zext i32 %134 to i64, !dbg !582
  %136 = inttoptr i64 %135 to i8*, !dbg !583
  call void @llvm.dbg.value(metadata i8* %136, metadata !458, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata i64 %133, metadata !493, metadata !DIExpression()) #7, !dbg !518
  %137 = add nuw nsw i64 %133, 14, !dbg !584
  %138 = inttoptr i64 %137 to i8*, !dbg !586
  %139 = icmp ugt i8* %138, %136, !dbg !587
  br i1 %139, label %357, label %140, !dbg !588

140:                                              ; preds = %131
  %141 = inttoptr i64 %133 to %struct.ethhdr*, !dbg !589
  call void @llvm.dbg.value(metadata %struct.ethhdr* %141, metadata !493, metadata !DIExpression()) #7, !dbg !518
  %142 = inttoptr i64 %133 to i8*, !dbg !590
  call void @llvm.dbg.value(metadata i8* %142, metadata !457, metadata !DIExpression()) #7, !dbg !518
  %143 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %141, i32 2, i32 2) #7, !dbg !591, !llvm.preserve.access.index !306
  store i16 -8826, i16* %143, align 2, !dbg !592, !tbaa !410
  %144 = getelementptr i8, i8* %142, i64 14, !dbg !593
  %145 = bitcast i8* %144 to %struct.ipv6hdr*, !dbg !594
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %145, metadata !462, metadata !DIExpression()) #7, !dbg !518
  %146 = getelementptr i8, i8* %142, i64 54, !dbg !595
  %147 = icmp ugt i8* %146, %136, !dbg !597
  br i1 %147, label %357, label %148, !dbg !598

148:                                              ; preds = %140
  %149 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 0, i32 1) #7, !dbg !599, !llvm.preserve.access.index !329
  %150 = load i8, i8* %149, align 4, !dbg !600
  %151 = and i8 %150, 15, !dbg !600
  %152 = or i8 %151, 96, !dbg !600
  store i8 %152, i8* %149, align 4, !dbg !600
  %153 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 0, i32 0) #7, !dbg !601, !llvm.preserve.access.index !329
  %154 = load i8, i8* %153, align 4, !dbg !602
  %155 = and i8 %154, -16, !dbg !602
  store i8 %155, i8* %153, align 4, !dbg !602
  %156 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 3, i32 4) #7, !dbg !603, !llvm.preserve.access.index !329
  store i8 43, i8* %156, align 2, !dbg !604, !tbaa !605
  %157 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 4, i32 5) #7, !dbg !607, !llvm.preserve.access.index !329
  store i8 64, i8* %157, align 1, !dbg !608, !tbaa !609
  %158 = zext i8 %121 to i16
  %159 = add i16 %99, %158
  %160 = call i16 @llvm.bswap.i16(i16 %159) #7
  %161 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 2, i32 3) #7, !dbg !610, !llvm.preserve.access.index !329
  store i16 %160, i16* %161, align 4, !dbg !611, !tbaa !612
  %162 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 5, i32 6) #7, !dbg !613, !llvm.preserve.access.index !329
  %163 = bitcast %struct.in6_addr* %162 to i8*, !dbg !614
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %163, i8* nonnull align 4 dereferenceable(16) %48, i64 16, i1 false) #7, !dbg !614
  %164 = add nsw i32 %122, -1, !dbg !615
  %165 = icmp ugt i32 %164, 4, !dbg !615
  br i1 %165, label %357, label %166, !dbg !615

166:                                              ; preds = %148
  %167 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %145, i32 6, i32 7) #7, !dbg !617, !llvm.preserve.access.index !329
  %168 = bitcast %struct.in6_addr* %167 to i8*, !dbg !618
  %169 = getelementptr inbounds i8, i8* %48, i64 48, !dbg !619
  %170 = zext i32 %164 to i64, !dbg !620
  %171 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %49, i64 0, i32 6, i64 %170, !dbg !620
  %172 = bitcast %struct.in6_addr* %171 to i8*, !dbg !618
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %168, i8* nonnull align 4 dereferenceable(16) %172, i64 16, i1 false) #7, !dbg !618
  %173 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %6, i64 0, i32 0, !dbg !621
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %173) #7, !dbg !621
  call void @llvm.dbg.declare(metadata %struct.args_mob_session* %6, metadata !494, metadata !DIExpression()) #7, !dbg !622
  %174 = load i32, i32* %103, align 4, !dbg !623, !tbaa !557
  %175 = lshr i32 %174, 3, !dbg !624
  %176 = trunc i32 %175 to i16, !dbg !625
  call void @llvm.dbg.value(metadata i16 %176, metadata !509, metadata !DIExpression()) #7, !dbg !518
  %177 = trunc i32 %174 to i16, !dbg !626
  %178 = and i16 %177, 7, !dbg !626
  call void @llvm.dbg.value(metadata i16 %178, metadata !510, metadata !DIExpression()) #7, !dbg !518
  %179 = load i32, i32* %108, align 4, !dbg !627, !tbaa !561
  %180 = lshr i32 %179, 3, !dbg !628
  %181 = trunc i32 %180 to i16, !dbg !629
  call void @llvm.dbg.value(metadata i16 %181, metadata !511, metadata !DIExpression()) #7, !dbg !518
  %182 = trunc i32 %179 to i16, !dbg !630
  %183 = and i16 %182, 7, !dbg !630
  call void @llvm.dbg.value(metadata i16 %183, metadata !512, metadata !DIExpression()) #7, !dbg !518
  store i8 0, i8* %173, align 1, !dbg !631
  %184 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %6, i64 0, i32 1, i32 0, !dbg !632
  store i32 %93, i32* %184, align 1, !dbg !633, !tbaa !634
  call void @llvm.dbg.value(metadata i8* %74, metadata !513, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata i8* %75, metadata !514, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata i8* %173, metadata !515, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata i32* %4, metadata !482, metadata !DIExpression(DW_OP_deref)) #7, !dbg !518
  call void @llvm.dbg.value(metadata %struct.in6_addr* %162, metadata !635, metadata !DIExpression()) #7, !dbg !655
  call void @llvm.dbg.value(metadata i8* %74, metadata !642, metadata !DIExpression()) #7, !dbg !655
  call void @llvm.dbg.value(metadata i16 4, metadata !643, metadata !DIExpression()) #7, !dbg !655
  call void @llvm.dbg.value(metadata i16 %176, metadata !644, metadata !DIExpression()) #7, !dbg !655
  call void @llvm.dbg.value(metadata i16 %178, metadata !645, metadata !DIExpression()) #7, !dbg !655
  call void @llvm.dbg.value(metadata i64 %135, metadata !646, metadata !DIExpression()) #7, !dbg !655
  %185 = and i16 %176, 4095, !dbg !657
  call void @llvm.dbg.value(metadata i16 %185, metadata !644, metadata !DIExpression()) #7, !dbg !655
  call void @llvm.dbg.value(metadata i16 4, metadata !643, metadata !DIExpression()) #7, !dbg !655
  %186 = zext i16 %185 to i64, !dbg !658
  %187 = icmp ugt i16 %185, 11
  br i1 %187, label %225, label %188, !dbg !660

188:                                              ; preds = %166
  %189 = zext i16 %178 to i32, !dbg !661
  %190 = icmp eq i16 %178, 0, !dbg !662
  %191 = getelementptr i8, i8* %163, i64 %186, !dbg !663
  br i1 %190, label %194, label %192, !dbg !664

192:                                              ; preds = %188
  call void @llvm.dbg.value(metadata i16 0, metadata !647, metadata !DIExpression()) #7, !dbg !665
  call void @llvm.dbg.value(metadata i16 0, metadata !647, metadata !DIExpression()) #7, !dbg !665
  %193 = sub nuw nsw i32 8, %189, !dbg !666
  br label %203, !dbg !669

194:                                              ; preds = %188
  %195 = getelementptr i8, i8* %191, i64 4, !dbg !670
  %196 = icmp ugt i8* %195, %136, !dbg !673
  br i1 %196, label %225, label %197, !dbg !674

197:                                              ; preds = %194
  %198 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* %162, i32 0, i32 0) #7, !dbg !675, !llvm.preserve.access.index !72
  %199 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %198, i32 0) #7, !dbg !676, !llvm.preserve.access.index !75
  %200 = bitcast %union.anon* %199 to [16 x i8]*, !dbg !676
  %201 = getelementptr inbounds [16 x i8], [16 x i8]* %200, i64 0, i64 %186, !dbg !677
  %202 = bitcast i8* %201 to i32*, !dbg !678
  store i32 %88, i32* %202, align 1, !dbg !678
  br label %225, !dbg !679

203:                                              ; preds = %211, %192
  %204 = phi i64 [ 0, %192 ], [ %223, %211 ]
  call void @llvm.dbg.value(metadata i64 %204, metadata !647, metadata !DIExpression()) #7, !dbg !665
  %205 = getelementptr inbounds i8, i8* %191, i64 %204, !dbg !680
  call void @llvm.dbg.value(metadata i8* %205, metadata !651, metadata !DIExpression()) #7, !dbg !681
  %206 = getelementptr inbounds i8, i8* %205, i64 1, !dbg !682
  call void @llvm.dbg.value(metadata i8* %206, metadata !654, metadata !DIExpression()) #7, !dbg !681
  %207 = icmp ugt i8* %206, %136, !dbg !683
  %208 = getelementptr inbounds i8, i8* %206, i64 1
  %209 = icmp ugt i8* %208, %136
  %210 = or i1 %207, %209, !dbg !684
  br i1 %210, label %225, label %211, !dbg !684

211:                                              ; preds = %203
  %212 = getelementptr inbounds i8, i8* %74, i64 %204, !dbg !685
  %213 = load i8, i8* %212, align 1, !dbg !685, !tbaa !634
  %214 = zext i8 %213 to i32, !dbg !685
  %215 = lshr i32 %214, %189, !dbg !686
  %216 = load i8, i8* %205, align 1, !dbg !687, !tbaa !634
  %217 = trunc i32 %215 to i8, !dbg !687
  %218 = or i8 %216, %217, !dbg !687
  store i8 %218, i8* %205, align 1, !dbg !687, !tbaa !634
  %219 = shl i32 %214, %193, !dbg !688
  %220 = load i8, i8* %206, align 1, !dbg !689, !tbaa !634
  %221 = trunc i32 %219 to i8, !dbg !689
  %222 = or i8 %220, %221, !dbg !689
  store i8 %222, i8* %206, align 1, !dbg !689, !tbaa !634
  %223 = add nuw nsw i64 %204, 1, !dbg !690
  call void @llvm.dbg.value(metadata i64 %223, metadata !647, metadata !DIExpression()) #7, !dbg !665
  %224 = icmp eq i64 %223, 4, !dbg !669
  br i1 %224, label %225, label %203, !dbg !669, !llvm.loop !691

225:                                              ; preds = %211, %203, %197, %194, %166
  call void @llvm.dbg.value(metadata i8* %146, metadata !463, metadata !DIExpression()) #7, !dbg !518
  %226 = getelementptr i8, i8* %142, i64 62, !dbg !694
  %227 = icmp ugt i8* %226, %136, !dbg !696
  br i1 %227, label %355, label %228, !dbg !697

228:                                              ; preds = %225
  store i8 4, i8* %146, align 4, !dbg !698, !tbaa !699
  %229 = lshr exact i8 %121, 3, !dbg !701
  %230 = add nsw i8 %229, -1, !dbg !702
  %231 = getelementptr i8, i8* %142, i64 55, !dbg !703
  store i8 %230, i8* %231, align 1, !dbg !704, !tbaa !705
  %232 = getelementptr i8, i8* %142, i64 56, !dbg !706
  store i8 4, i8* %232, align 2, !dbg !707, !tbaa !708
  %233 = trunc i32 %164 to i8, !dbg !709
  %234 = getelementptr i8, i8* %142, i64 57, !dbg !710
  store i8 %233, i8* %234, align 1, !dbg !711, !tbaa !712
  %235 = getelementptr i8, i8* %142, i64 58, !dbg !713
  store i8 %233, i8* %235, align 4, !dbg !714, !tbaa !715
  %236 = getelementptr i8, i8* %142, i64 59, !dbg !716
  store i8 0, i8* %236, align 1, !dbg !717, !tbaa !718
  %237 = getelementptr i8, i8* %142, i64 60, !dbg !719
  %238 = bitcast i8* %237 to i16*, !dbg !719
  store i16 0, i16* %238, align 2, !dbg !720, !tbaa !721
  %239 = getelementptr i8, i8* %142, i64 79, !dbg !722
  %240 = icmp ugt i8* %239, %136, !dbg !724
  br i1 %240, label %355, label %241, !dbg !725

241:                                              ; preds = %228
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %168, i8* nonnull align 4 dereferenceable(16) %169, i64 16, i1 false) #7, !dbg !726
  %242 = bitcast i8* %226 to [0 x %struct.in6_addr]*, !dbg !727
  %243 = bitcast i8* %226 to %struct.in6_addr*, !dbg !728
  %244 = getelementptr inbounds i8, i8* %48, i64 16, !dbg !729
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %226, i8* nonnull align 4 dereferenceable(16) %244, i64 16, i1 false) #7, !dbg !730
  call void @llvm.dbg.value(metadata i32* %5, metadata !483, metadata !DIExpression(DW_OP_deref)) #7, !dbg !518
  call void @llvm.dbg.value(metadata %struct.in6_addr* %243, metadata !635, metadata !DIExpression()) #7, !dbg !731
  call void @llvm.dbg.value(metadata i8* %75, metadata !642, metadata !DIExpression()) #7, !dbg !731
  call void @llvm.dbg.value(metadata i16 4, metadata !643, metadata !DIExpression()) #7, !dbg !731
  call void @llvm.dbg.value(metadata i16 %181, metadata !644, metadata !DIExpression()) #7, !dbg !731
  call void @llvm.dbg.value(metadata i16 %183, metadata !645, metadata !DIExpression()) #7, !dbg !731
  call void @llvm.dbg.value(metadata i64 %135, metadata !646, metadata !DIExpression()) #7, !dbg !731
  %245 = and i16 %181, 4095, !dbg !733
  call void @llvm.dbg.value(metadata i16 %245, metadata !644, metadata !DIExpression()) #7, !dbg !731
  %246 = zext i16 %245 to i64, !dbg !734
  %247 = icmp ugt i16 %245, 11
  br i1 %247, label %287, label %248, !dbg !735

248:                                              ; preds = %241
  %249 = icmp eq i16 %183, 0, !dbg !736
  %250 = getelementptr i8, i8* %226, i64 %246, !dbg !737
  br i1 %249, label %253, label %251, !dbg !738

251:                                              ; preds = %248
  call void @llvm.dbg.value(metadata i16 0, metadata !647, metadata !DIExpression()) #7, !dbg !739
  %252 = sub nuw nsw i16 8, %183, !dbg !740
  br label %263, !dbg !741

253:                                              ; preds = %248
  %254 = getelementptr i8, i8* %250, i64 4, !dbg !742
  %255 = icmp ugt i8* %254, %136, !dbg !743
  br i1 %255, label %287, label %256, !dbg !744

256:                                              ; preds = %253
  %257 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* %243, i32 0, i32 0) #7, !dbg !745, !llvm.preserve.access.index !72
  %258 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %257, i32 0) #7, !dbg !746, !llvm.preserve.access.index !75
  %259 = bitcast %union.anon* %258 to [16 x i8]*, !dbg !746
  %260 = getelementptr inbounds [16 x i8], [16 x i8]* %259, i64 0, i64 %246, !dbg !747
  %261 = bitcast i8* %260 to i32*, !dbg !748
  %262 = load i32, i32* %5, align 4, !dbg !748
  store i32 %262, i32* %261, align 1, !dbg !748
  br label %287, !dbg !749

263:                                              ; preds = %271, %251
  %264 = phi i64 [ 0, %251 ], [ %285, %271 ]
  call void @llvm.dbg.value(metadata i64 %264, metadata !647, metadata !DIExpression()) #7, !dbg !739
  %265 = getelementptr inbounds i8, i8* %250, i64 %264, !dbg !750
  call void @llvm.dbg.value(metadata i8* %265, metadata !651, metadata !DIExpression()) #7, !dbg !751
  %266 = getelementptr inbounds i8, i8* %265, i64 1, !dbg !752
  call void @llvm.dbg.value(metadata i8* %266, metadata !654, metadata !DIExpression()) #7, !dbg !751
  %267 = icmp ugt i8* %266, %136, !dbg !753
  %268 = getelementptr inbounds i8, i8* %266, i64 1
  %269 = icmp ugt i8* %268, %136
  %270 = or i1 %267, %269, !dbg !754
  br i1 %270, label %287, label %271, !dbg !754

271:                                              ; preds = %263
  %272 = getelementptr inbounds i8, i8* %75, i64 %264, !dbg !755
  %273 = load i8, i8* %272, align 1, !dbg !755, !tbaa !634
  %274 = zext i8 %273 to i16, !dbg !755
  %275 = lshr i16 %274, %183, !dbg !756
  %276 = load i8, i8* %265, align 1, !dbg !757, !tbaa !634
  %277 = trunc i16 %275 to i8, !dbg !757
  %278 = or i8 %276, %277, !dbg !757
  store i8 %278, i8* %265, align 1, !dbg !757, !tbaa !634
  %279 = load i8, i8* %272, align 1, !dbg !758, !tbaa !634
  %280 = zext i8 %279 to i16, !dbg !758
  %281 = shl i16 %280, %252, !dbg !759
  %282 = load i8, i8* %266, align 1, !dbg !760, !tbaa !634
  %283 = trunc i16 %281 to i8, !dbg !760
  %284 = or i8 %282, %283, !dbg !760
  store i8 %284, i8* %266, align 1, !dbg !760, !tbaa !634
  %285 = add nuw nsw i64 %264, 1, !dbg !761
  call void @llvm.dbg.value(metadata i64 %285, metadata !647, metadata !DIExpression()) #7, !dbg !739
  %286 = icmp eq i64 %285, 4, !dbg !741
  br i1 %286, label %287, label %263, !dbg !741, !llvm.loop !762

287:                                              ; preds = %271, %263, %256, %253, %241
  %288 = add i16 %181, 4, !dbg !764
  call void @llvm.dbg.value(metadata i16 %288, metadata !511, metadata !DIExpression()) #7, !dbg !518
  call void @llvm.dbg.value(metadata %struct.in6_addr* %243, metadata !635, metadata !DIExpression()) #7, !dbg !765
  call void @llvm.dbg.value(metadata i8* %173, metadata !642, metadata !DIExpression()) #7, !dbg !765
  call void @llvm.dbg.value(metadata i16 5, metadata !643, metadata !DIExpression()) #7, !dbg !765
  call void @llvm.dbg.value(metadata i16 %288, metadata !644, metadata !DIExpression()) #7, !dbg !765
  call void @llvm.dbg.value(metadata i16 %183, metadata !645, metadata !DIExpression()) #7, !dbg !765
  call void @llvm.dbg.value(metadata i64 %135, metadata !646, metadata !DIExpression()) #7, !dbg !765
  %289 = and i16 %288, 4095, !dbg !767
  call void @llvm.dbg.value(metadata i16 %289, metadata !644, metadata !DIExpression()) #7, !dbg !765
  %290 = zext i16 %289 to i64, !dbg !768
  %291 = icmp ugt i16 %289, 10
  br i1 %291, label %329, label %292, !dbg !769

292:                                              ; preds = %287
  %293 = icmp eq i16 %183, 0, !dbg !770
  %294 = getelementptr i8, i8* %226, i64 %290, !dbg !771
  br i1 %293, label %297, label %295, !dbg !772

295:                                              ; preds = %292
  call void @llvm.dbg.value(metadata i16 0, metadata !647, metadata !DIExpression()) #7, !dbg !773
  %296 = sub nuw nsw i16 8, %183, !dbg !774
  br label %305, !dbg !775

297:                                              ; preds = %292
  %298 = getelementptr i8, i8* %294, i64 5, !dbg !776
  %299 = icmp ugt i8* %298, %136, !dbg !777
  br i1 %299, label %329, label %300, !dbg !778

300:                                              ; preds = %297
  %301 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* %243, i32 0, i32 0) #7, !dbg !779, !llvm.preserve.access.index !72
  %302 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %301, i32 0) #7, !dbg !780, !llvm.preserve.access.index !75
  %303 = bitcast %union.anon* %302 to [16 x i8]*, !dbg !780
  %304 = getelementptr inbounds [16 x i8], [16 x i8]* %303, i64 0, i64 %290, !dbg !781
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %304, i8* nonnull align 1 dereferenceable(5) %173, i64 5, i1 false) #7, !dbg !782
  br label %329, !dbg !783

305:                                              ; preds = %313, %295
  %306 = phi i64 [ 0, %295 ], [ %327, %313 ]
  call void @llvm.dbg.value(metadata i64 %306, metadata !647, metadata !DIExpression()) #7, !dbg !773
  %307 = getelementptr inbounds i8, i8* %294, i64 %306, !dbg !784
  call void @llvm.dbg.value(metadata i8* %307, metadata !651, metadata !DIExpression()) #7, !dbg !785
  %308 = getelementptr inbounds i8, i8* %307, i64 1, !dbg !786
  call void @llvm.dbg.value(metadata i8* %308, metadata !654, metadata !DIExpression()) #7, !dbg !785
  %309 = icmp ugt i8* %308, %136, !dbg !787
  %310 = getelementptr inbounds i8, i8* %308, i64 1
  %311 = icmp ugt i8* %310, %136
  %312 = or i1 %309, %311, !dbg !788
  br i1 %312, label %329, label %313, !dbg !788

313:                                              ; preds = %305
  %314 = getelementptr inbounds i8, i8* %173, i64 %306, !dbg !789
  %315 = load i8, i8* %314, align 1, !dbg !789, !tbaa !634
  %316 = zext i8 %315 to i16, !dbg !789
  %317 = lshr i16 %316, %183, !dbg !790
  %318 = load i8, i8* %307, align 1, !dbg !791, !tbaa !634
  %319 = trunc i16 %317 to i8, !dbg !791
  %320 = or i8 %318, %319, !dbg !791
  store i8 %320, i8* %307, align 1, !dbg !791, !tbaa !634
  %321 = load i8, i8* %314, align 1, !dbg !792, !tbaa !634
  %322 = zext i8 %321 to i16, !dbg !792
  %323 = shl i16 %322, %296, !dbg !793
  %324 = load i8, i8* %308, align 1, !dbg !794, !tbaa !634
  %325 = trunc i16 %323 to i8, !dbg !794
  %326 = or i8 %324, %325, !dbg !794
  store i8 %326, i8* %308, align 1, !dbg !794, !tbaa !634
  %327 = add nuw nsw i64 %306, 1, !dbg !795
  call void @llvm.dbg.value(metadata i64 %327, metadata !647, metadata !DIExpression()) #7, !dbg !773
  %328 = icmp eq i64 %327, 5, !dbg !775
  br i1 %328, label %329, label %305, !dbg !775, !llvm.loop !796

329:                                              ; preds = %313, %305, %300, %297, %287
  call void @llvm.dbg.value(metadata i32 1, metadata !516, metadata !DIExpression()) #7, !dbg !798
  %330 = icmp ugt i32 %122, 1
  call void @llvm.dbg.value(metadata i32 1, metadata !516, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !798
  br i1 %330, label %331, label %353, !dbg !799

331:                                              ; preds = %329
  %332 = getelementptr i8, i8* %142, i64 63, !dbg !800
  br label %333, !dbg !799

333:                                              ; preds = %340, %331
  %334 = phi i32 [ 1, %331 ], [ %349, %340 ]
  %335 = shl nuw nsw i32 %334, 4, !dbg !804
  %336 = add nuw nsw i32 %335, 32, !dbg !804
  %337 = zext i32 %336 to i64, !dbg !804
  %338 = getelementptr i8, i8* %332, i64 %337, !dbg !805
  %339 = icmp ugt i8* %338, %136, !dbg !806
  br i1 %339, label %355, label %340, !dbg !807

340:                                              ; preds = %333
  %341 = zext i32 %334 to i64, !dbg !808
  %342 = getelementptr inbounds [0 x %struct.in6_addr], [0 x %struct.in6_addr]* %242, i64 0, i64 %341, !dbg !808
  %343 = bitcast %struct.in6_addr* %342 to i8*, !dbg !809
  %344 = add nsw i32 %334, -1, !dbg !810
  %345 = sext i32 %344 to i64, !dbg !811
  %346 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %49, i64 0, i32 6, i64 %345, !dbg !811
  %347 = bitcast %struct.in6_addr* %346 to i8*, !dbg !809
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %343, i8* nonnull align 4 dereferenceable(16) %347, i64 16, i1 false) #7, !dbg !809
  %348 = add nuw nsw i32 %334, 1, !dbg !812
  call void @llvm.dbg.value(metadata i32 undef, metadata !516, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #7, !dbg !798
  %349 = and i32 %348, 65535, !dbg !813
  call void @llvm.dbg.value(metadata i32 %348, metadata !516, metadata !DIExpression()) #7, !dbg !798
  %350 = icmp ult i32 %349, 5, !dbg !814
  %351 = icmp ult i32 %349, %122
  %352 = and i1 %350, %351, !dbg !799
  call void @llvm.dbg.value(metadata i32 %348, metadata !516, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !798
  br i1 %352, label %333, label %353, !dbg !799, !llvm.loop !815

353:                                              ; preds = %340, %329
  %354 = call fastcc i32 @rewrite_nexthop(%struct.xdp_md* %0, i32 2) #7, !dbg !817
  br label %355, !dbg !818

355:                                              ; preds = %333, %353, %228, %225
  %356 = phi i32 [ %354, %353 ], [ 2, %225 ], [ 2, %228 ], [ 2, %333 ]
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %173) #7, !dbg !819
  br label %357

357:                                              ; preds = %62, %78, %86, %101, %106, %114, %125, %131, %140, %148, %355
  %358 = phi i32 [ 2, %62 ], [ 2, %78 ], [ 1, %86 ], [ 1, %106 ], [ 1, %101 ], [ 2, %114 ], [ 2, %125 ], [ %356, %355 ], [ 1, %131 ], [ 1, %140 ], [ 1, %148 ], !dbg !518
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %75) #7, !dbg !819
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %74) #7, !dbg !819
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !820
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !820
  call void @llvm.dbg.value(metadata i32 %358, metadata !403, metadata !DIExpression()) #7, !dbg !820
  %359 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %358) #7, !dbg !822
  br label %820, !dbg !823

360:                                              ; preds = %35
  %361 = icmp eq %struct.ipv6hdr* %29, null, !dbg !824
  br i1 %361, label %362, label %364, !dbg !828

362:                                              ; preds = %360
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !829
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !829
  call void @llvm.dbg.value(metadata i32 1, metadata !403, metadata !DIExpression()) #7, !dbg !829
  %363 = tail call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 1) #7, !dbg !831
  br label %820, !dbg !832

364:                                              ; preds = %360
  %365 = getelementptr inbounds %struct.lpm_key_v6, %struct.lpm_key_v6* %8, i64 0, i32 0, !dbg !833
  store i32 128, i32* %365, align 4, !dbg !834, !tbaa !835
  %366 = getelementptr inbounds %struct.lpm_key_v6, %struct.lpm_key_v6* %8, i64 0, i32 1, !dbg !837
  %367 = tail call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %29, i32 6, i32 7), !dbg !838, !llvm.preserve.access.index !329
  %368 = bitcast %struct.in6_addr* %366 to i8*, !dbg !838
  %369 = bitcast %struct.in6_addr* %367 to i8*, !dbg !838
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %368, i8* nonnull align 4 dereferenceable(16) %369, i64 16, i1 false), !dbg !838, !tbaa.struct !839
  %370 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %29, i32 3, i32 4), !dbg !840, !llvm.preserve.access.index !329
  %371 = load i8, i8* %370, align 2, !dbg !840, !tbaa !605
  %372 = icmp eq i8 %371, 43, !dbg !842
  br i1 %372, label %373, label %803, !dbg !843

373:                                              ; preds = %364
  %374 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.1* @function_table to i8*), i8* nonnull %31) #7, !dbg !844
  call void @llvm.dbg.value(metadata i8* %374, metadata !340, metadata !DIExpression()), !dbg !345
  %375 = icmp eq i8* %374, null, !dbg !846
  br i1 %375, label %818, label %376, !dbg !848

376:                                              ; preds = %373
  %377 = getelementptr inbounds i8, i8* %374, i64 32, !dbg !849
  %378 = bitcast i8* %377 to i32*, !dbg !849
  %379 = load i32, i32* %378, align 4, !dbg !849, !tbaa !851
  switch i32 %379, label %818 [
    i32 1, label %380
    i32 6, label %434
    i32 16, label %509
  ], !dbg !853

380:                                              ; preds = %376
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !854, metadata !DIExpression()) #7, !dbg !859
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !862, metadata !DIExpression()) #7, !dbg !868
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !870, metadata !DIExpression()) #7, !dbg !876
  %381 = load i32, i32* %9, align 4, !dbg !878, !tbaa !347
  %382 = zext i32 %381 to i64, !dbg !879
  %383 = inttoptr i64 %382 to i8*, !dbg !880
  call void @llvm.dbg.value(metadata i8* %383, metadata !873, metadata !DIExpression()) #7, !dbg !876
  %384 = load i32, i32* %13, align 4, !dbg !881, !tbaa !355
  %385 = zext i32 %384 to i64, !dbg !882
  call void @llvm.dbg.value(metadata i64 %385, metadata !874, metadata !DIExpression()) #7, !dbg !876
  call void @llvm.dbg.value(metadata i8* %383, metadata !875, metadata !DIExpression(DW_OP_plus_uconst, 54, DW_OP_stack_value)) #7, !dbg !876
  %386 = getelementptr i8, i8* %383, i64 62, !dbg !883
  %387 = bitcast i8* %386 to %struct.srhhdr*, !dbg !883
  %388 = inttoptr i64 %385 to %struct.srhhdr*, !dbg !885
  %389 = icmp ugt %struct.srhhdr* %387, %388, !dbg !886
  %390 = getelementptr i8, i8* %383, i64 54, !dbg !887
  call void @llvm.dbg.value(metadata %struct.srhhdr* undef, metadata !867, metadata !DIExpression()) #7, !dbg !868
  %391 = icmp eq i8* %390, null, !dbg !888
  %392 = or i1 %391, %389, !dbg !888
  br i1 %392, label %399, label %393, !dbg !890

393:                                              ; preds = %380
  %394 = bitcast i8* %390 to %struct.srhhdr*, !dbg !887
  %395 = getelementptr i8, i8* %383, i64 57, !dbg !891
  %396 = load i8, i8* %395, align 1, !dbg !891, !tbaa !712
  %397 = icmp eq i8 %396, 0, !dbg !893
  %398 = select i1 %397, %struct.srhhdr* null, %struct.srhhdr* %394, !dbg !868
  br label %399, !dbg !868

399:                                              ; preds = %393, %380
  %400 = phi %struct.srhhdr* [ null, %380 ], [ %398, %393 ], !dbg !868
  call void @llvm.dbg.value(metadata %struct.srhhdr* %400, metadata !857, metadata !DIExpression()) #7, !dbg !859
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #7, !dbg !894
  call void @llvm.dbg.value(metadata i8* %383, metadata !379, metadata !DIExpression()) #7, !dbg !894
  call void @llvm.dbg.value(metadata i64 %385, metadata !380, metadata !DIExpression()) #7, !dbg !894
  call void @llvm.dbg.value(metadata i8* %383, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !894
  %401 = bitcast i8* %390 to %struct.ipv6hdr*, !dbg !896
  %402 = inttoptr i64 %385 to %struct.ipv6hdr*, !dbg !897
  %403 = icmp ugt %struct.ipv6hdr* %401, %402, !dbg !898
  %404 = getelementptr i8, i8* %383, i64 14, !dbg !899
  %405 = bitcast i8* %404 to %struct.ipv6hdr*, !dbg !899
  %406 = select i1 %403, %struct.ipv6hdr* null, %struct.ipv6hdr* %405, !dbg !899
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %406, metadata !858, metadata !DIExpression()) #7, !dbg !859
  %407 = icmp ne %struct.srhhdr* %400, null, !dbg !900
  %408 = icmp ne %struct.ipv6hdr* %406, null
  %409 = and i1 %408, %407, !dbg !902
  br i1 %409, label %410, label %431, !dbg !902

410:                                              ; preds = %399
  %411 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %406, i32 6, i32 7) #7, !dbg !903, !llvm.preserve.access.index !329
  call void @llvm.dbg.value(metadata %struct.srhhdr* %400, metadata !905, metadata !DIExpression()) #7, !dbg !916
  call void @llvm.dbg.value(metadata %struct.in6_addr* %411, metadata !912, metadata !DIExpression()) #7, !dbg !916
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !913, metadata !DIExpression()) #7, !dbg !916
  %412 = inttoptr i64 %385 to i8*, !dbg !918
  call void @llvm.dbg.value(metadata i8* %412, metadata !915, metadata !DIExpression()) #7, !dbg !916
  %413 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %400, i64 0, i32 3, !dbg !919
  %414 = load i8, i8* %413, align 1, !dbg !920, !tbaa !712
  %415 = add i8 %414, -1, !dbg !920
  store i8 %415, i8* %413, align 1, !dbg !920, !tbaa !712
  %416 = getelementptr %struct.srhhdr, %struct.srhhdr* %400, i64 1, i32 0, !dbg !921
  %417 = zext i8 %415 to i64, !dbg !923
  %418 = shl nuw nsw i64 %417, 4, !dbg !924
  %419 = add nuw nsw i64 %418, 16, !dbg !924
  %420 = getelementptr i8, i8* %416, i64 %419, !dbg !925
  %421 = icmp ugt i8* %420, %412, !dbg !926
  br i1 %421, label %431, label %422, !dbg !927

422:                                              ; preds = %410
  %423 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %400, i64 0, i32 7, i64 %417, !dbg !928
  call void @llvm.dbg.value(metadata %struct.in6_addr* %423, metadata !914, metadata !DIExpression()) #7, !dbg !916
  %424 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %423, i64 1, !dbg !929
  %425 = inttoptr i64 %385 to %struct.in6_addr*, !dbg !931
  %426 = icmp ugt %struct.in6_addr* %424, %425, !dbg !932
  br i1 %426, label %431, label %427, !dbg !933

427:                                              ; preds = %422
  %428 = bitcast %struct.in6_addr* %411 to i8*, !dbg !934
  %429 = bitcast %struct.in6_addr* %423 to i8*, !dbg !934
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %428, i8* nonnull align 4 dereferenceable(16) %429, i64 16, i1 false) #7, !dbg !934, !tbaa.struct !839
  %430 = call fastcc i32 @rewrite_nexthop(%struct.xdp_md* %0, i32 0) #7, !dbg !935
  br label %431, !dbg !936

431:                                              ; preds = %399, %410, %422, %427
  %432 = phi i32 [ %430, %427 ], [ 2, %399 ], [ 2, %410 ], [ 2, %422 ], !dbg !859
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !937
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !937
  call void @llvm.dbg.value(metadata i32 %432, metadata !403, metadata !DIExpression()) #7, !dbg !937
  %433 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %432) #7, !dbg !939
  br label %820, !dbg !940

434:                                              ; preds = %376
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !941, metadata !DIExpression()) #7, !dbg !949
  call void @llvm.dbg.value(metadata i8* %374, metadata !946, metadata !DIExpression()) #7, !dbg !949
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !951, metadata !DIExpression()) #7, !dbg !962
  call void @llvm.dbg.value(metadata i16 2048, metadata !956, metadata !DIExpression()) #7, !dbg !962
  call void @llvm.dbg.value(metadata i32 undef, metadata !957, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !962
  call void @llvm.dbg.value(metadata i32 undef, metadata !958, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !962
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !870, metadata !DIExpression()) #7, !dbg !964
  %435 = load i32, i32* %9, align 4, !dbg !966, !tbaa !347
  %436 = zext i32 %435 to i64, !dbg !967
  %437 = inttoptr i64 %436 to i8*, !dbg !968
  call void @llvm.dbg.value(metadata i8* %437, metadata !873, metadata !DIExpression()) #7, !dbg !964
  %438 = load i32, i32* %13, align 4, !dbg !969, !tbaa !355
  %439 = zext i32 %438 to i64, !dbg !970
  call void @llvm.dbg.value(metadata i64 %439, metadata !874, metadata !DIExpression()) #7, !dbg !964
  call void @llvm.dbg.value(metadata i8* %437, metadata !875, metadata !DIExpression(DW_OP_plus_uconst, 54, DW_OP_stack_value)) #7, !dbg !964
  %440 = getelementptr i8, i8* %437, i64 62, !dbg !971
  %441 = bitcast i8* %440 to %struct.srhhdr*, !dbg !971
  %442 = inttoptr i64 %439 to %struct.srhhdr*, !dbg !972
  %443 = icmp ugt %struct.srhhdr* %441, %442, !dbg !973
  %444 = getelementptr i8, i8* %437, i64 54, !dbg !974
  %445 = bitcast i8* %444 to %struct.srhhdr*, !dbg !974
  %446 = select i1 %443, %struct.srhhdr* null, %struct.srhhdr* %445, !dbg !974
  call void @llvm.dbg.value(metadata %struct.srhhdr* %446, metadata !959, metadata !DIExpression()) #7, !dbg !962
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #7, !dbg !975
  call void @llvm.dbg.value(metadata i8* %437, metadata !379, metadata !DIExpression()) #7, !dbg !975
  call void @llvm.dbg.value(metadata i64 %439, metadata !380, metadata !DIExpression()) #7, !dbg !975
  call void @llvm.dbg.value(metadata i8* %437, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !975
  %447 = bitcast i8* %444 to %struct.ipv6hdr*, !dbg !977
  %448 = inttoptr i64 %439 to %struct.ipv6hdr*, !dbg !978
  %449 = icmp ule %struct.ipv6hdr* %447, %448, !dbg !979
  %450 = getelementptr i8, i8* %437, i64 14, !dbg !980
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* undef, metadata !960, metadata !DIExpression()) #7, !dbg !962
  %451 = icmp ne %struct.srhhdr* %446, null, !dbg !981
  %452 = icmp ne i8* %450, null
  %453 = and i1 %452, %449
  %454 = and i1 %453, %451, !dbg !983
  br i1 %454, label %455, label %506, !dbg !983

455:                                              ; preds = %434
  %456 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %446, i64 0, i32 1, !dbg !984
  %457 = load i8, i8* %456, align 1, !dbg !984, !tbaa !705
  %458 = zext i8 %457 to i32, !dbg !986
  %459 = shl nuw nsw i32 %458, 3, !dbg !987
  %460 = add nuw nsw i32 %459, 48, !dbg !988
  %461 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %460) #7, !dbg !989
  %462 = icmp eq i64 %461, 0, !dbg !989
  br i1 %462, label %463, label %506, !dbg !990

463:                                              ; preds = %455
  %464 = load i32, i32* %9, align 4, !dbg !991, !tbaa !347
  %465 = zext i32 %464 to i64, !dbg !992
  call void @llvm.dbg.value(metadata i64 %465, metadata !958, metadata !DIExpression()) #7, !dbg !962
  %466 = load i32, i32* %13, align 4, !dbg !993, !tbaa !355
  %467 = zext i32 %466 to i64, !dbg !994
  call void @llvm.dbg.value(metadata i64 %467, metadata !957, metadata !DIExpression()) #7, !dbg !962
  %468 = inttoptr i64 %465 to %struct.ethhdr*, !dbg !995
  call void @llvm.dbg.value(metadata %struct.ethhdr* %468, metadata !961, metadata !DIExpression()) #7, !dbg !962
  %469 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %468, i64 1, !dbg !996
  %470 = inttoptr i64 %467 to %struct.ethhdr*, !dbg !998
  %471 = icmp ugt %struct.ethhdr* %469, %470, !dbg !999
  br i1 %471, label %506, label %472, !dbg !1000

472:                                              ; preds = %463
  %473 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %468, i32 2, i32 2) #7, !dbg !1001, !llvm.preserve.access.index !306
  store i16 8, i16* %473, align 2, !dbg !1002, !tbaa !410
  call void @llvm.dbg.value(metadata i32 10000, metadata !947, metadata !DIExpression()) #7, !dbg !949
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #7, !dbg !1003
  %474 = inttoptr i64 %465 to i8*, !dbg !1005
  call void @llvm.dbg.value(metadata i8* %474, metadata !364, metadata !DIExpression()) #7, !dbg !1003
  call void @llvm.dbg.value(metadata i64 %467, metadata !365, metadata !DIExpression()) #7, !dbg !1003
  call void @llvm.dbg.value(metadata i8* %474, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !1003
  %475 = getelementptr i8, i8* %474, i64 34, !dbg !1006
  %476 = bitcast i8* %475 to %struct.iphdr*, !dbg !1006
  %477 = inttoptr i64 %467 to %struct.iphdr*, !dbg !1007
  %478 = icmp ugt %struct.iphdr* %476, %477, !dbg !1008
  %479 = getelementptr i8, i8* %474, i64 14, !dbg !1009
  %480 = bitcast i8* %479 to %struct.iphdr*, !dbg !1009
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !948, metadata !DIExpression()) #7, !dbg !949
  %481 = icmp eq i8* %479, null, !dbg !1010
  %482 = or i1 %481, %478, !dbg !1010
  br i1 %482, label %506, label %483, !dbg !1012

483:                                              ; preds = %472
  %484 = getelementptr inbounds i8, i8* %374, i64 16, !dbg !1013
  %485 = bitcast i8* %484 to i32*, !dbg !1013
  %486 = load i32, i32* %485, align 4, !dbg !1013, !tbaa !634
  %487 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %480, i32 9, i32 10) #7, !dbg !1014, !llvm.preserve.access.index !314
  store i32 %486, i32* %487, align 4, !dbg !1015, !tbaa !428
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !1016, metadata !DIExpression()) #7, !dbg !1024
  call void @llvm.dbg.value(metadata i32 0, metadata !1022, metadata !DIExpression()) #7, !dbg !1024
  %488 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %480, i32 7, i32 8) #7, !dbg !1026, !llvm.preserve.access.index !314
  store i16 0, i16* %488, align 2, !dbg !1027, !tbaa !1028
  %489 = bitcast i8* %479 to i16*, !dbg !1029
  call void @llvm.dbg.value(metadata i16* %489, metadata !1021, metadata !DIExpression()) #7, !dbg !1024
  call void @llvm.dbg.value(metadata i32 0, metadata !1023, metadata !DIExpression()) #7, !dbg !1024
  br label %490, !dbg !1030

490:                                              ; preds = %490, %483
  %491 = phi i32 [ 0, %483 ], [ %498, %490 ]
  %492 = phi i32 [ 0, %483 ], [ %497, %490 ]
  %493 = phi i16* [ %489, %483 ], [ %494, %490 ]
  call void @llvm.dbg.value(metadata i32 %491, metadata !1023, metadata !DIExpression()) #7, !dbg !1024
  call void @llvm.dbg.value(metadata i32 %492, metadata !1022, metadata !DIExpression()) #7, !dbg !1024
  call void @llvm.dbg.value(metadata i16* %493, metadata !1021, metadata !DIExpression()) #7, !dbg !1024
  %494 = getelementptr inbounds i16, i16* %493, i64 1, !dbg !1032
  call void @llvm.dbg.value(metadata i16* %494, metadata !1021, metadata !DIExpression()) #7, !dbg !1024
  %495 = load i16, i16* %493, align 2, !dbg !1034, !tbaa !1035
  %496 = zext i16 %495 to i32, !dbg !1034
  %497 = add i32 %492, %496, !dbg !1036
  call void @llvm.dbg.value(metadata i32 %497, metadata !1022, metadata !DIExpression()) #7, !dbg !1024
  %498 = add nuw nsw i32 %491, 1, !dbg !1037
  call void @llvm.dbg.value(metadata i32 %498, metadata !1023, metadata !DIExpression()) #7, !dbg !1024
  %499 = icmp eq i32 %498, 10, !dbg !1038
  br i1 %499, label %500, label %490, !dbg !1030, !llvm.loop !1039

500:                                              ; preds = %490
  call void @llvm.dbg.value(metadata i32 %497, metadata !1022, metadata !DIExpression()) #7, !dbg !1024
  %501 = lshr i32 %497, 16, !dbg !1041
  %502 = add i32 %501, %497, !dbg !1042
  %503 = trunc i32 %502 to i16, !dbg !1043
  %504 = xor i16 %503, -1, !dbg !1043
  store i16 %504, i16* %488, align 2, !dbg !1044, !tbaa !1028
  %505 = call fastcc i32 @rewrite_nexthop(%struct.xdp_md* %0, i32 0) #7, !dbg !1045
  br label %506, !dbg !1046

506:                                              ; preds = %434, %455, %463, %472, %500
  %507 = phi i32 [ %505, %500 ], [ 2, %472 ], [ 1, %463 ], [ 2, %455 ], [ 2, %434 ], !dbg !949
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !1047
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !1047
  call void @llvm.dbg.value(metadata i32 %507, metadata !403, metadata !DIExpression()) #7, !dbg !1047
  %508 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %507) #7, !dbg !1049
  br label %820, !dbg !1050

509:                                              ; preds = %376
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1051, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i8* %374, metadata !1054, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i32 undef, metadata !1055, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i32 undef, metadata !1056, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !870, metadata !DIExpression()) #7, !dbg !1084
  %510 = load i32, i32* %9, align 4, !dbg !1086, !tbaa !347
  %511 = zext i32 %510 to i64, !dbg !1087
  %512 = inttoptr i64 %511 to i8*, !dbg !1088
  call void @llvm.dbg.value(metadata i8* %512, metadata !873, metadata !DIExpression()) #7, !dbg !1084
  %513 = load i32, i32* %13, align 4, !dbg !1089, !tbaa !355
  %514 = zext i32 %513 to i64, !dbg !1090
  call void @llvm.dbg.value(metadata i64 %514, metadata !874, metadata !DIExpression()) #7, !dbg !1084
  call void @llvm.dbg.value(metadata i8* %512, metadata !875, metadata !DIExpression(DW_OP_plus_uconst, 54, DW_OP_stack_value)) #7, !dbg !1084
  %515 = getelementptr i8, i8* %512, i64 62, !dbg !1091
  %516 = bitcast i8* %515 to %struct.srhhdr*, !dbg !1091
  %517 = inttoptr i64 %514 to %struct.srhhdr*, !dbg !1092
  %518 = icmp ugt %struct.srhhdr* %516, %517, !dbg !1093
  %519 = getelementptr i8, i8* %512, i64 54, !dbg !1094
  %520 = bitcast i8* %519 to %struct.srhhdr*, !dbg !1094
  %521 = select i1 %518, %struct.srhhdr* null, %struct.srhhdr* %520, !dbg !1094
  call void @llvm.dbg.value(metadata %struct.srhhdr* %521, metadata !1057, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #7, !dbg !1095
  call void @llvm.dbg.value(metadata i8* %512, metadata !379, metadata !DIExpression()) #7, !dbg !1095
  call void @llvm.dbg.value(metadata i64 %514, metadata !380, metadata !DIExpression()) #7, !dbg !1095
  call void @llvm.dbg.value(metadata i8* %512, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !1095
  %522 = bitcast i8* %519 to %struct.ipv6hdr*, !dbg !1097
  %523 = inttoptr i64 %514 to %struct.ipv6hdr*, !dbg !1098
  %524 = icmp ugt %struct.ipv6hdr* %522, %523, !dbg !1099
  %525 = getelementptr i8, i8* %512, i64 14, !dbg !1100
  %526 = bitcast i8* %525 to %struct.ipv6hdr*, !dbg !1100
  %527 = select i1 %524, %struct.ipv6hdr* null, %struct.ipv6hdr* %526, !dbg !1100
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %527, metadata !1058, metadata !DIExpression()) #7, !dbg !1082
  %528 = icmp ne %struct.srhhdr* %521, null, !dbg !1101
  %529 = icmp ne %struct.ipv6hdr* %527, null
  %530 = and i1 %528, %529, !dbg !1103
  br i1 %530, label %531, label %800, !dbg !1103

531:                                              ; preds = %509
  %532 = bitcast i32* %2 to i8*, !dbg !1104
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %532) #7, !dbg !1104
  call void @llvm.dbg.value(metadata i32 0, metadata !1061, metadata !DIExpression()) #7, !dbg !1082
  store i32 0, i32* %2, align 4, !dbg !1105, !tbaa !1106
  call void @llvm.dbg.value(metadata i32* %2, metadata !1061, metadata !DIExpression(DW_OP_deref)) #7, !dbg !1082
  %533 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.4* @in_taple_v6_addr to i8*), i8* nonnull %532) #7, !dbg !1107
  call void @llvm.dbg.value(metadata i8* %533, metadata !1062, metadata !DIExpression()) #7, !dbg !1082
  %534 = icmp eq i8* %533, null, !dbg !1108
  br i1 %534, label %798, label %535, !dbg !1110

535:                                              ; preds = %531
  call void @llvm.dbg.value(metadata i8* %533, metadata !1062, metadata !DIExpression()) #7, !dbg !1082
  %536 = bitcast i8* %533 to %struct.in6_addr*, !dbg !1111
  %537 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %527, i32 5, i32 6) #7, !dbg !1112, !llvm.preserve.access.index !329
  %538 = bitcast %struct.in6_addr* %537 to i8*, !dbg !1112
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %533, i8* nonnull align 4 dereferenceable(16) %538, i64 16, i1 false) #7, !dbg !1112, !tbaa.struct !839
  %539 = getelementptr inbounds i8, i8* %533, i64 16, !dbg !1113
  %540 = bitcast i8* %539 to %struct.in6_addr*, !dbg !1113
  %541 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %527, i32 6, i32 7) #7, !dbg !1114, !llvm.preserve.access.index !329
  %542 = bitcast %struct.in6_addr* %541 to i8*, !dbg !1114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %539, i8* nonnull align 4 dereferenceable(16) %542, i64 16, i1 false) #7, !dbg !1114, !tbaa.struct !839
  %543 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %527, i32 2, i32 3) #7, !dbg !1115, !llvm.preserve.access.index !329
  %544 = load i16, i16* %543, align 4, !dbg !1115, !tbaa !612
  %545 = call i16 @llvm.bswap.i16(i16 %544) #7
  %546 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %521, i64 0, i32 1, !dbg !1116
  %547 = load i8, i8* %546, align 1, !dbg !1116, !tbaa !705
  %548 = zext i8 %547 to i32, !dbg !1117
  %549 = shl nuw nsw i32 %548, 3, !dbg !1118
  %550 = trunc i32 %549 to i16, !dbg !1115
  %551 = add i16 %545, -8, !dbg !1115
  %552 = sub i16 %551, %550, !dbg !1115
  call void @llvm.dbg.value(metadata i16 %552, metadata !1059, metadata !DIExpression()) #7, !dbg !1082
  %553 = add nuw nsw i32 %549, 48, !dbg !1119
  %554 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %553) #7, !dbg !1121
  %555 = icmp eq i64 %554, 0, !dbg !1121
  br i1 %555, label %556, label %798, !dbg !1122

556:                                              ; preds = %535
  %557 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 -36) #7, !dbg !1123
  %558 = icmp eq i64 %557, 0, !dbg !1123
  br i1 %558, label %559, label %798, !dbg !1125

559:                                              ; preds = %556
  call void @llvm.dbg.value(metadata i32 undef, metadata !1056, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i32 undef, metadata !1055, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1126, metadata !DIExpression()) #7, !dbg !1134
  %560 = load i32, i32* %9, align 4, !dbg !1136, !tbaa !347
  %561 = zext i32 %560 to i64, !dbg !1137
  call void @llvm.dbg.value(metadata i64 %561, metadata !1131, metadata !DIExpression()) #7, !dbg !1134
  %562 = load i32, i32* %13, align 4, !dbg !1138, !tbaa !355
  %563 = zext i32 %562 to i64, !dbg !1139
  call void @llvm.dbg.value(metadata i64 %563, metadata !1132, metadata !DIExpression()) #7, !dbg !1134
  %564 = inttoptr i64 %561 to %struct.ethhdr*, !dbg !1140
  call void @llvm.dbg.value(metadata %struct.ethhdr* %564, metadata !1133, metadata !DIExpression()) #7, !dbg !1134
  %565 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %564, i64 1, !dbg !1141
  %566 = inttoptr i64 %563 to %struct.ethhdr*, !dbg !1143
  %567 = icmp ugt %struct.ethhdr* %565, %566, !dbg !1144
  %568 = select i1 %567, %struct.ethhdr* null, %struct.ethhdr* %564, !dbg !1134
  call void @llvm.dbg.value(metadata %struct.ethhdr* %568, metadata !1063, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #7, !dbg !1145
  %569 = inttoptr i64 %561 to i8*, !dbg !1147
  call void @llvm.dbg.value(metadata i8* %569, metadata !364, metadata !DIExpression()) #7, !dbg !1145
  call void @llvm.dbg.value(metadata i64 %563, metadata !365, metadata !DIExpression()) #7, !dbg !1145
  call void @llvm.dbg.value(metadata i8* %569, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !1145
  %570 = getelementptr i8, i8* %569, i64 34, !dbg !1148
  %571 = bitcast i8* %570 to %struct.iphdr*, !dbg !1148
  %572 = inttoptr i64 %563 to %struct.iphdr*, !dbg !1149
  %573 = icmp ugt %struct.iphdr* %571, %572, !dbg !1150
  %574 = getelementptr i8, i8* %569, i64 14, !dbg !1151
  %575 = bitcast i8* %574 to %struct.iphdr*, !dbg !1151
  %576 = select i1 %573, %struct.iphdr* null, %struct.iphdr* %575, !dbg !1151
  call void @llvm.dbg.value(metadata %struct.iphdr* %576, metadata !1064, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1152, metadata !DIExpression()) #7, !dbg !1160
  call void @llvm.dbg.value(metadata i8* %569, metadata !1157, metadata !DIExpression()) #7, !dbg !1160
  %577 = inttoptr i64 %563 to i8*, !dbg !1162
  call void @llvm.dbg.value(metadata i8* %577, metadata !1158, metadata !DIExpression()) #7, !dbg !1160
  call void @llvm.dbg.value(metadata i8* %569, metadata !1159, metadata !DIExpression(DW_OP_plus_uconst, 34, DW_OP_stack_value)) #7, !dbg !1160
  %578 = getelementptr i8, i8* %569, i64 42, !dbg !1163
  %579 = icmp ugt i8* %578, %577, !dbg !1165
  %580 = bitcast i8* %570 to %struct.udphdr*, !dbg !1166
  %581 = select i1 %579, %struct.udphdr* null, %struct.udphdr* %580, !dbg !1166
  call void @llvm.dbg.value(metadata %struct.udphdr* %581, metadata !1065, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1167, metadata !DIExpression()) #7, !dbg !1175
  call void @llvm.dbg.value(metadata i8* %569, metadata !1172, metadata !DIExpression()) #7, !dbg !1175
  call void @llvm.dbg.value(metadata i8* %577, metadata !1173, metadata !DIExpression()) #7, !dbg !1175
  call void @llvm.dbg.value(metadata i8* %569, metadata !1174, metadata !DIExpression(DW_OP_plus_uconst, 42, DW_OP_stack_value)) #7, !dbg !1175
  %582 = getelementptr i8, i8* %569, i64 50, !dbg !1177
  %583 = icmp ugt i8* %582, %577, !dbg !1179
  %584 = bitcast i8* %578 to %struct.gtp1hdr*, !dbg !1180
  %585 = select i1 %583, %struct.gtp1hdr* null, %struct.gtp1hdr* %584, !dbg !1180
  call void @llvm.dbg.value(metadata %struct.gtp1hdr* %585, metadata !1073, metadata !DIExpression()) #7, !dbg !1082
  %586 = icmp ne %struct.ethhdr* %568, null, !dbg !1181
  %587 = icmp ne %struct.iphdr* %576, null
  %588 = and i1 %586, %587, !dbg !1183
  %589 = icmp ne %struct.udphdr* %581, null
  %590 = and i1 %589, %588, !dbg !1183
  %591 = icmp ne %struct.gtp1hdr* %585, null
  %592 = and i1 %591, %590, !dbg !1183
  br i1 %592, label %593, label %798, !dbg !1183

593:                                              ; preds = %559
  call void @llvm.dbg.value(metadata i64 %563, metadata !1055, metadata !DIExpression()) #7, !dbg !1082
  %594 = add i16 %552, 36, !dbg !1184
  call void @llvm.dbg.value(metadata i16 %594, metadata !1060, metadata !DIExpression()) #7, !dbg !1082
  %595 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* nonnull %568, i32 2, i32 2) #7, !dbg !1185, !llvm.preserve.access.index !306
  store i16 8, i16* %595, align 2, !dbg !1186, !tbaa !410
  %596 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 0, i32 1) #7, !dbg !1187, !llvm.preserve.access.index !314
  %597 = load i8, i8* %596, align 4, !dbg !1188
  %598 = and i8 %597, 15, !dbg !1188
  %599 = or i8 %598, 64, !dbg !1188
  store i8 %599, i8* %596, align 4, !dbg !1188
  %600 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 0, i32 0) #7, !dbg !1189, !llvm.preserve.access.index !314
  %601 = load i8, i8* %600, align 4, !dbg !1190
  %602 = and i8 %601, -16, !dbg !1190
  %603 = or i8 %602, 5, !dbg !1190
  store i8 %603, i8* %600, align 4, !dbg !1190
  %604 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 4, i32 5) #7, !dbg !1191, !llvm.preserve.access.index !314
  store i16 64, i16* %604, align 2, !dbg !1192, !tbaa !1193
  %605 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 6, i32 7) #7, !dbg !1194, !llvm.preserve.access.index !314
  store i8 17, i8* %605, align 1, !dbg !1195, !tbaa !538
  %606 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 7, i32 8) #7, !dbg !1196, !llvm.preserve.access.index !314
  store i16 0, i16* %606, align 2, !dbg !1197, !tbaa !1028
  %607 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 1, i32 2) #7, !dbg !1198, !llvm.preserve.access.index !314
  store i8 0, i8* %607, align 1, !dbg !1199, !tbaa !1200
  %608 = call i16 @llvm.bswap.i16(i16 %594) #7
  %609 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 2, i32 3) #7, !dbg !1201, !llvm.preserve.access.index !314
  store i16 %608, i16* %609, align 2, !dbg !1202, !tbaa !445
  %610 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 5, i32 6) #7, !dbg !1203, !llvm.preserve.access.index !314
  store i8 64, i8* %610, align 4, !dbg !1204, !tbaa !1205
  %611 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %3, i64 0, i32 0, !dbg !1206
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %611) #7, !dbg !1206
  call void @llvm.dbg.declare(metadata %struct.args_mob_session* %3, metadata !1074, metadata !DIExpression()) #7, !dbg !1207
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %611, i8 0, i64 5, i1 false) #7, !dbg !1208
  %612 = getelementptr inbounds i8, i8* %374, i64 40, !dbg !1209
  %613 = bitcast i8* %612 to i32*, !dbg !1209
  %614 = load i32, i32* %613, align 4, !dbg !1209, !tbaa !1210
  %615 = lshr i32 %614, 3, !dbg !1211
  %616 = trunc i32 %615 to i16, !dbg !1212
  call void @llvm.dbg.value(metadata i16 %616, metadata !1075, metadata !DIExpression()) #7, !dbg !1082
  %617 = trunc i32 %614 to i16, !dbg !1213
  %618 = and i16 %617, 7, !dbg !1213
  call void @llvm.dbg.value(metadata i16 %618, metadata !1076, metadata !DIExpression()) #7, !dbg !1082
  %619 = getelementptr inbounds i8, i8* %374, i64 44, !dbg !1214
  %620 = bitcast i8* %619 to i32*, !dbg !1214
  %621 = load i32, i32* %620, align 4, !dbg !1214, !tbaa !1215
  %622 = lshr i32 %621, 3, !dbg !1216
  %623 = trunc i32 %622 to i16, !dbg !1217
  call void @llvm.dbg.value(metadata i16 %623, metadata !1077, metadata !DIExpression()) #7, !dbg !1082
  %624 = trunc i32 %621 to i16, !dbg !1218
  %625 = and i16 %624, 7, !dbg !1218
  call void @llvm.dbg.value(metadata i16 %625, metadata !1078, metadata !DIExpression()) #7, !dbg !1082
  %626 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 8, i32 9) #7, !dbg !1219, !llvm.preserve.access.index !314
  %627 = bitcast i32* %626 to i8*, !dbg !1220
  call void @llvm.dbg.value(metadata i8* %627, metadata !1079, metadata !DIExpression()) #7, !dbg !1082
  %628 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %576, i32 9, i32 10) #7, !dbg !1221, !llvm.preserve.access.index !314
  %629 = bitcast i32* %628 to i8*, !dbg !1222
  call void @llvm.dbg.value(metadata i8* %629, metadata !1080, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i8* %611, metadata !1081, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i8* %627, metadata !1223, metadata !DIExpression()) #7, !dbg !1242
  call void @llvm.dbg.value(metadata %struct.in6_addr* %536, metadata !1228, metadata !DIExpression()) #7, !dbg !1242
  call void @llvm.dbg.value(metadata i16 %618, metadata !1231, metadata !DIExpression()) #7, !dbg !1242
  call void @llvm.dbg.value(metadata i64 %563, metadata !1232, metadata !DIExpression()) #7, !dbg !1242
  call void @llvm.dbg.value(metadata i16 %616, metadata !1230, metadata !DIExpression()) #7, !dbg !1242
  call void @llvm.dbg.value(metadata i16 4, metadata !1229, metadata !DIExpression()) #7, !dbg !1242
  %630 = and i32 %615, 65535, !dbg !1244
  %631 = zext i32 %630 to i64, !dbg !1244
  %632 = icmp ugt i16 %616, 11
  br i1 %632, label %676, label %633, !dbg !1246

633:                                              ; preds = %593
  %634 = icmp eq i16 %618, 0, !dbg !1247
  br i1 %634, label %638, label %635, !dbg !1248

635:                                              ; preds = %633
  call void @llvm.dbg.value(metadata i16 0, metadata !1233, metadata !DIExpression()) #7, !dbg !1249
  %636 = getelementptr inbounds i8, i8* %533, i64 %631, !dbg !1250
  %637 = sub nuw nsw i16 8, %618, !dbg !1250
  br label %649, !dbg !1251

638:                                              ; preds = %633
  %639 = getelementptr i32, i32* %626, i64 1, !dbg !1252
  %640 = bitcast i32* %639 to i8*, !dbg !1252
  %641 = icmp ugt i8* %640, %577, !dbg !1255
  br i1 %641, label %676, label %642, !dbg !1256

642:                                              ; preds = %638
  %643 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* nonnull %536, i32 0, i32 0) #7, !dbg !1257, !llvm.preserve.access.index !72
  %644 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %643, i32 0) #7, !dbg !1258, !llvm.preserve.access.index !75
  %645 = bitcast %union.anon* %644 to [16 x i8]*, !dbg !1258
  %646 = getelementptr inbounds [16 x i8], [16 x i8]* %645, i64 0, i64 %631, !dbg !1259
  %647 = bitcast i8* %646 to i32*, !dbg !1260
  %648 = load i32, i32* %647, align 1, !dbg !1260
  store i32 %648, i32* %626, align 1, !dbg !1260
  br label %676, !dbg !1261

649:                                              ; preds = %661, %635
  %650 = phi i64 [ 0, %635 ], [ %674, %661 ]
  call void @llvm.dbg.value(metadata i64 %650, metadata !1233, metadata !DIExpression()) #7, !dbg !1249
  %651 = getelementptr inbounds i8, i8* %627, i64 %650, !dbg !1262
  call void @llvm.dbg.value(metadata i8* %651, metadata !1237, metadata !DIExpression()) #7, !dbg !1250
  %652 = getelementptr i8, i8* %651, i64 1, !dbg !1263
  call void @llvm.dbg.value(metadata i8* %652, metadata !1240, metadata !DIExpression()) #7, !dbg !1250
  %653 = getelementptr inbounds i8, i8* %636, i64 %650, !dbg !1264
  call void @llvm.dbg.value(metadata i8* %653, metadata !1241, metadata !DIExpression()) #7, !dbg !1250
  %654 = icmp ugt i8* %652, %577, !dbg !1265
  %655 = getelementptr inbounds i8, i8* %652, i64 1
  %656 = icmp ugt i8* %655, %577
  %657 = or i1 %654, %656, !dbg !1267
  %658 = add nuw nsw i64 %650, %631
  %659 = icmp ugt i64 %658, 14
  %660 = or i1 %659, %657, !dbg !1267
  br i1 %660, label %676, label %661, !dbg !1267

661:                                              ; preds = %649
  %662 = load i8, i8* %653, align 1, !dbg !1268, !tbaa !634
  %663 = zext i8 %662 to i16, !dbg !1268
  %664 = lshr i16 %663, %618, !dbg !1269
  %665 = load i8, i8* %651, align 1, !dbg !1270, !tbaa !634
  %666 = trunc i16 %664 to i8, !dbg !1270
  %667 = or i8 %665, %666, !dbg !1270
  store i8 %667, i8* %651, align 1, !dbg !1270, !tbaa !634
  %668 = load i8, i8* %653, align 1, !dbg !1271, !tbaa !634
  %669 = zext i8 %668 to i16, !dbg !1271
  %670 = shl i16 %669, %637, !dbg !1272
  %671 = load i8, i8* %652, align 1, !dbg !1273, !tbaa !634
  %672 = trunc i16 %670 to i8, !dbg !1273
  %673 = or i8 %671, %672, !dbg !1273
  store i8 %673, i8* %652, align 1, !dbg !1273, !tbaa !634
  %674 = add nuw nsw i64 %650, 1, !dbg !1274
  call void @llvm.dbg.value(metadata i64 %674, metadata !1233, metadata !DIExpression()) #7, !dbg !1249
  %675 = icmp eq i64 %674, 4, !dbg !1275
  br i1 %675, label %676, label %649, !dbg !1251, !llvm.loop !1277

676:                                              ; preds = %661, %649, %642, %638, %593
  call void @llvm.dbg.value(metadata i8* %629, metadata !1223, metadata !DIExpression()) #7, !dbg !1280
  call void @llvm.dbg.value(metadata %struct.in6_addr* %540, metadata !1228, metadata !DIExpression()) #7, !dbg !1280
  call void @llvm.dbg.value(metadata i16 %625, metadata !1231, metadata !DIExpression()) #7, !dbg !1280
  call void @llvm.dbg.value(metadata i64 %563, metadata !1232, metadata !DIExpression()) #7, !dbg !1280
  call void @llvm.dbg.value(metadata i16 %623, metadata !1230, metadata !DIExpression()) #7, !dbg !1280
  call void @llvm.dbg.value(metadata i16 4, metadata !1229, metadata !DIExpression()) #7, !dbg !1280
  %677 = and i32 %622, 65535, !dbg !1282
  %678 = zext i32 %677 to i64, !dbg !1282
  %679 = icmp ugt i16 %623, 11
  br i1 %679, label %723, label %680, !dbg !1283

680:                                              ; preds = %676
  %681 = icmp eq i16 %625, 0, !dbg !1284
  br i1 %681, label %685, label %682, !dbg !1285

682:                                              ; preds = %680
  call void @llvm.dbg.value(metadata i16 0, metadata !1233, metadata !DIExpression()) #7, !dbg !1286
  %683 = getelementptr inbounds i8, i8* %539, i64 %678, !dbg !1287
  %684 = sub nuw nsw i16 8, %625, !dbg !1287
  br label %696, !dbg !1288

685:                                              ; preds = %680
  %686 = getelementptr i32, i32* %628, i64 1, !dbg !1289
  %687 = bitcast i32* %686 to i8*, !dbg !1289
  %688 = icmp ugt i8* %687, %577, !dbg !1290
  br i1 %688, label %723, label %689, !dbg !1291

689:                                              ; preds = %685
  %690 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* nonnull %540, i32 0, i32 0) #7, !dbg !1292, !llvm.preserve.access.index !72
  %691 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %690, i32 0) #7, !dbg !1293, !llvm.preserve.access.index !75
  %692 = bitcast %union.anon* %691 to [16 x i8]*, !dbg !1293
  %693 = getelementptr inbounds [16 x i8], [16 x i8]* %692, i64 0, i64 %678, !dbg !1294
  %694 = bitcast i8* %693 to i32*, !dbg !1295
  %695 = load i32, i32* %694, align 1, !dbg !1295
  store i32 %695, i32* %628, align 1, !dbg !1295
  br label %723, !dbg !1296

696:                                              ; preds = %708, %682
  %697 = phi i64 [ 0, %682 ], [ %721, %708 ]
  call void @llvm.dbg.value(metadata i64 %697, metadata !1233, metadata !DIExpression()) #7, !dbg !1286
  %698 = getelementptr inbounds i8, i8* %629, i64 %697, !dbg !1297
  call void @llvm.dbg.value(metadata i8* %698, metadata !1237, metadata !DIExpression()) #7, !dbg !1287
  %699 = getelementptr i8, i8* %698, i64 1, !dbg !1298
  call void @llvm.dbg.value(metadata i8* %699, metadata !1240, metadata !DIExpression()) #7, !dbg !1287
  %700 = getelementptr inbounds i8, i8* %683, i64 %697, !dbg !1299
  call void @llvm.dbg.value(metadata i8* %700, metadata !1241, metadata !DIExpression()) #7, !dbg !1287
  %701 = icmp ugt i8* %699, %577, !dbg !1300
  %702 = getelementptr inbounds i8, i8* %699, i64 1
  %703 = icmp ugt i8* %702, %577
  %704 = or i1 %701, %703, !dbg !1301
  %705 = add nuw nsw i64 %697, %678
  %706 = icmp ugt i64 %705, 14
  %707 = or i1 %706, %704, !dbg !1301
  br i1 %707, label %723, label %708, !dbg !1301

708:                                              ; preds = %696
  %709 = load i8, i8* %700, align 1, !dbg !1302, !tbaa !634
  %710 = zext i8 %709 to i16, !dbg !1302
  %711 = lshr i16 %710, %625, !dbg !1303
  %712 = load i8, i8* %698, align 1, !dbg !1304, !tbaa !634
  %713 = trunc i16 %711 to i8, !dbg !1304
  %714 = or i8 %712, %713, !dbg !1304
  store i8 %714, i8* %698, align 1, !dbg !1304, !tbaa !634
  %715 = load i8, i8* %700, align 1, !dbg !1305, !tbaa !634
  %716 = zext i8 %715 to i16, !dbg !1305
  %717 = shl i16 %716, %684, !dbg !1306
  %718 = load i8, i8* %699, align 1, !dbg !1307, !tbaa !634
  %719 = trunc i16 %717 to i8, !dbg !1307
  %720 = or i8 %718, %719, !dbg !1307
  store i8 %720, i8* %699, align 1, !dbg !1307, !tbaa !634
  %721 = add nuw nsw i64 %697, 1, !dbg !1308
  call void @llvm.dbg.value(metadata i64 %721, metadata !1233, metadata !DIExpression()) #7, !dbg !1286
  %722 = icmp eq i64 %721, 4, !dbg !1309
  br i1 %722, label %723, label %696, !dbg !1288, !llvm.loop !1310

723:                                              ; preds = %708, %696, %689, %685, %676
  %724 = add i16 %623, 4, !dbg !1313
  call void @llvm.dbg.value(metadata i16 %724, metadata !1077, metadata !DIExpression()) #7, !dbg !1082
  call void @llvm.dbg.value(metadata i8* %611, metadata !1314, metadata !DIExpression()) #7, !dbg !1339
  call void @llvm.dbg.value(metadata %struct.in6_addr* %540, metadata !1319, metadata !DIExpression()) #7, !dbg !1339
  call void @llvm.dbg.value(metadata i16 %625, metadata !1322, metadata !DIExpression()) #7, !dbg !1339
  call void @llvm.dbg.value(metadata i16 %724, metadata !1321, metadata !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1339
  call void @llvm.dbg.value(metadata i16 5, metadata !1320, metadata !DIExpression()) #7, !dbg !1339
  %725 = and i16 %724, 15, !dbg !1341
  call void @llvm.dbg.value(metadata i16 %725, metadata !1321, metadata !DIExpression()) #7, !dbg !1339
  %726 = icmp ugt i16 %725, 10, !dbg !1342
  br i1 %726, label %767, label %727, !dbg !1344

727:                                              ; preds = %723
  %728 = zext i16 %625 to i32, !dbg !1345
  %729 = icmp eq i16 %625, 0, !dbg !1346
  %730 = zext i16 %725 to i64
  %731 = getelementptr inbounds i8, i8* %539, i64 %730, !dbg !1347
  br i1 %729, label %732, label %735, !dbg !1348

732:                                              ; preds = %727
  %733 = xor i16 %725, 15, !dbg !1349
  %734 = zext i16 %733 to i64, !dbg !1350
  br label %739, !dbg !1349

735:                                              ; preds = %727
  call void @llvm.dbg.value(metadata i16 0, metadata !1331, metadata !DIExpression()) #7, !dbg !1352
  %736 = sub nuw nsw i32 8, %728, !dbg !1353
  %737 = xor i16 %725, 15, !dbg !1354
  %738 = zext i16 %737 to i64, !dbg !1356
  br label %748, !dbg !1354

739:                                              ; preds = %742, %732
  %740 = phi i64 [ 0, %732 ], [ %746, %742 ]
  call void @llvm.dbg.value(metadata i64 %740, metadata !1323, metadata !DIExpression()) #7, !dbg !1358
  call void @llvm.dbg.value(metadata i8* undef, metadata !1327, metadata !DIExpression()) #7, !dbg !1359
  call void @llvm.dbg.value(metadata i8* undef, metadata !1330, metadata !DIExpression()) #7, !dbg !1359
  %741 = icmp eq i64 %740, %734, !dbg !1350
  br i1 %741, label %767, label %742, !dbg !1360

742:                                              ; preds = %739
  %743 = getelementptr inbounds i8, i8* %731, i64 %740, !dbg !1361
  call void @llvm.dbg.value(metadata i8* %743, metadata !1330, metadata !DIExpression()) #7, !dbg !1359
  %744 = getelementptr inbounds i8, i8* %611, i64 %740, !dbg !1362
  call void @llvm.dbg.value(metadata i8* %744, metadata !1327, metadata !DIExpression()) #7, !dbg !1359
  %745 = load i8, i8* %743, align 1, !dbg !1363, !tbaa !634
  store i8 %745, i8* %744, align 1, !dbg !1364, !tbaa !634
  %746 = add nuw nsw i64 %740, 1, !dbg !1365
  call void @llvm.dbg.value(metadata i64 %746, metadata !1323, metadata !DIExpression()) #7, !dbg !1358
  %747 = icmp eq i64 %746, 5, !dbg !1366
  br i1 %747, label %767, label %739, !dbg !1368, !llvm.loop !1369

748:                                              ; preds = %753, %735
  %749 = phi i64 [ 0, %735 ], [ %765, %753 ]
  call void @llvm.dbg.value(metadata i64 %749, metadata !1331, metadata !DIExpression()) #7, !dbg !1352
  %750 = getelementptr inbounds i8, i8* %611, i64 %749, !dbg !1371
  call void @llvm.dbg.value(metadata i8* %750, metadata !1334, metadata !DIExpression()) #7, !dbg !1353
  %751 = getelementptr inbounds i8, i8* %750, i64 1, !dbg !1372
  call void @llvm.dbg.value(metadata i8* %751, metadata !1337, metadata !DIExpression()) #7, !dbg !1353
  call void @llvm.dbg.value(metadata i8* undef, metadata !1338, metadata !DIExpression()) #7, !dbg !1353
  %752 = icmp eq i64 %749, %738, !dbg !1356
  br i1 %752, label %767, label %753, !dbg !1373

753:                                              ; preds = %748
  %754 = getelementptr inbounds i8, i8* %731, i64 %749, !dbg !1374
  call void @llvm.dbg.value(metadata i8* %754, metadata !1338, metadata !DIExpression()) #7, !dbg !1353
  %755 = load i8, i8* %754, align 1, !dbg !1375, !tbaa !634
  %756 = zext i8 %755 to i32, !dbg !1375
  %757 = lshr i32 %756, %728, !dbg !1376
  %758 = load i8, i8* %750, align 1, !dbg !1377, !tbaa !634
  %759 = trunc i32 %757 to i8, !dbg !1377
  %760 = or i8 %758, %759, !dbg !1377
  store i8 %760, i8* %750, align 1, !dbg !1377, !tbaa !634
  %761 = shl i32 %756, %736, !dbg !1378
  %762 = load i8, i8* %751, align 1, !dbg !1379, !tbaa !634
  %763 = trunc i32 %761 to i8, !dbg !1379
  %764 = or i8 %762, %763, !dbg !1379
  store i8 %764, i8* %751, align 1, !dbg !1379, !tbaa !634
  %765 = add nuw nsw i64 %749, 1, !dbg !1380
  call void @llvm.dbg.value(metadata i64 %765, metadata !1331, metadata !DIExpression()) #7, !dbg !1352
  %766 = icmp eq i64 %765, 4
  br i1 %766, label %767, label %748, !dbg !1354, !llvm.loop !1381

767:                                              ; preds = %753, %748, %742, %739, %723
  %768 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %581, i32 3, i32 3) #7, !dbg !1384, !llvm.preserve.access.index !1067
  store i16 0, i16* %768, align 2, !dbg !1385, !tbaa !1386
  %769 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %581, i32 0, i32 0) #7, !dbg !1388, !llvm.preserve.access.index !1067
  store i16 26632, i16* %769, align 2, !dbg !1389, !tbaa !1390
  %770 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %581, i32 1, i32 1) #7, !dbg !1391, !llvm.preserve.access.index !1067
  store i16 26632, i16* %770, align 2, !dbg !1392, !tbaa !1393
  %771 = add i16 %552, 16, !dbg !1394
  %772 = call i16 @llvm.bswap.i16(i16 %771) #7, !dbg !1394
  %773 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %581, i32 2, i32 2) #7, !dbg !1395, !llvm.preserve.access.index !1067
  store i16 %772, i16* %773, align 2, !dbg !1396, !tbaa !1397
  %774 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %585, i64 0, i32 0, !dbg !1398
  store i8 48, i8* %774, align 4, !dbg !1399, !tbaa !1400
  %775 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %585, i64 0, i32 1, !dbg !1401
  store i8 -1, i8* %775, align 1, !dbg !1402, !tbaa !549
  %776 = call i16 @llvm.bswap.i16(i16 %552) #7
  %777 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %585, i64 0, i32 2, !dbg !1403
  store i16 %776, i16* %777, align 2, !dbg !1404, !tbaa !551
  %778 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %3, i64 0, i32 1, i32 0, !dbg !1405
  %779 = load i32, i32* %778, align 1, !dbg !1405, !tbaa !634
  %780 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %585, i64 0, i32 3, !dbg !1406
  store i32 %779, i32* %780, align 4, !dbg !1407, !tbaa !546
  call void @llvm.dbg.value(metadata %struct.iphdr* %576, metadata !1016, metadata !DIExpression()) #7, !dbg !1408
  call void @llvm.dbg.value(metadata i32 0, metadata !1022, metadata !DIExpression()) #7, !dbg !1408
  store i16 0, i16* %606, align 2, !dbg !1410, !tbaa !1028
  %781 = bitcast %struct.iphdr* %576 to i16*, !dbg !1411
  call void @llvm.dbg.value(metadata i16* %781, metadata !1021, metadata !DIExpression()) #7, !dbg !1408
  call void @llvm.dbg.value(metadata i32 0, metadata !1023, metadata !DIExpression()) #7, !dbg !1408
  br label %782, !dbg !1412

782:                                              ; preds = %782, %767
  %783 = phi i32 [ 0, %767 ], [ %790, %782 ]
  %784 = phi i32 [ 0, %767 ], [ %789, %782 ]
  %785 = phi i16* [ %781, %767 ], [ %786, %782 ]
  call void @llvm.dbg.value(metadata i32 %783, metadata !1023, metadata !DIExpression()) #7, !dbg !1408
  call void @llvm.dbg.value(metadata i32 %784, metadata !1022, metadata !DIExpression()) #7, !dbg !1408
  call void @llvm.dbg.value(metadata i16* %785, metadata !1021, metadata !DIExpression()) #7, !dbg !1408
  %786 = getelementptr inbounds i16, i16* %785, i64 1, !dbg !1413
  call void @llvm.dbg.value(metadata i16* %786, metadata !1021, metadata !DIExpression()) #7, !dbg !1408
  %787 = load i16, i16* %785, align 2, !dbg !1414, !tbaa !1035
  %788 = zext i16 %787 to i32, !dbg !1414
  %789 = add i32 %784, %788, !dbg !1415
  call void @llvm.dbg.value(metadata i32 %789, metadata !1022, metadata !DIExpression()) #7, !dbg !1408
  %790 = add nuw nsw i32 %783, 1, !dbg !1416
  call void @llvm.dbg.value(metadata i32 %790, metadata !1023, metadata !DIExpression()) #7, !dbg !1408
  %791 = icmp eq i32 %790, 10, !dbg !1417
  br i1 %791, label %792, label %782, !dbg !1412, !llvm.loop !1418

792:                                              ; preds = %782
  call void @llvm.dbg.value(metadata i32 %789, metadata !1022, metadata !DIExpression()) #7, !dbg !1408
  %793 = lshr i32 %789, 16, !dbg !1420
  %794 = add i32 %793, %789, !dbg !1421
  %795 = trunc i32 %794 to i16, !dbg !1422
  %796 = xor i16 %795, -1, !dbg !1422
  store i16 %796, i16* %606, align 2, !dbg !1423, !tbaa !1028
  store i16 0, i16* %768, align 2, !dbg !1424, !tbaa !1386
  %797 = call fastcc i32 @rewrite_nexthop(%struct.xdp_md* %0, i32 0) #7, !dbg !1425
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %611) #7, !dbg !1426
  br label %798

798:                                              ; preds = %792, %559, %556, %535, %531
  %799 = phi i32 [ 1, %531 ], [ 2, %535 ], [ 2, %556 ], [ %797, %792 ], [ 1, %559 ], !dbg !1082
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %532) #7, !dbg !1426
  br label %800

800:                                              ; preds = %509, %798
  %801 = phi i32 [ %799, %798 ], [ 2, %509 ], !dbg !1082
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !1427
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !1427
  call void @llvm.dbg.value(metadata i32 %801, metadata !403, metadata !DIExpression()) #7, !dbg !1427
  %802 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %801) #7, !dbg !1429
  br label %820, !dbg !1430

803:                                              ; preds = %364
  %804 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.2* @transit_table_v6 to i8*), i8* nonnull %31) #7, !dbg !1431
  %805 = bitcast i8* %804 to %struct.transit_behavior*, !dbg !1431
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %805, metadata !341, metadata !DIExpression()), !dbg !345
  %806 = icmp eq i8* %804, null, !dbg !1433
  br i1 %806, label %818, label %807, !dbg !1435

807:                                              ; preds = %803
  %808 = getelementptr inbounds i8, i8* %804, i64 44, !dbg !1436
  %809 = bitcast i8* %808 to i32*, !dbg !1436
  %810 = load i32, i32* %809, align 4, !dbg !1436, !tbaa !439
  %811 = icmp eq i32 %810, 1, !dbg !1438
  br i1 %811, label %812, label %818, !dbg !1438

812:                                              ; preds = %807
  %813 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %29, i32 2, i32 3), !dbg !1439, !llvm.preserve.access.index !329
  %814 = load i16, i16* %813, align 4, !dbg !1439, !tbaa !612
  %815 = trunc i16 %814 to i8, !dbg !1441
  %816 = call fastcc i32 @transit_encap(%struct.xdp_md* %0, %struct.transit_behavior* nonnull %805, i8 zeroext 41, i8 zeroext %815), !dbg !1442
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !1443
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !1443
  call void @llvm.dbg.value(metadata i32 %816, metadata !403, metadata !DIExpression()) #7, !dbg !1443
  %817 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %816) #7, !dbg !1445
  br label %820, !dbg !1446

818:                                              ; preds = %35, %43, %373, %803, %807, %376, %51
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #7, !dbg !1447
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #7, !dbg !1447
  call void @llvm.dbg.value(metadata i32 2, metadata !403, metadata !DIExpression()) #7, !dbg !1447
  %819 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 2) #7, !dbg !1449
  br label %820, !dbg !1450

820:                                              ; preds = %818, %812, %800, %506, %431, %362, %357, %55, %41, %33
  %821 = phi i32 [ 2, %33 ], [ 2, %818 ], [ %358, %357 ], [ %60, %55 ], [ 1, %41 ], [ %801, %800 ], [ %507, %506 ], [ %432, %431 ], [ %816, %812 ], [ 1, %362 ], !dbg !345
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %31) #7, !dbg !1451
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30) #7, !dbg !1451
  ret i32 %821, !dbg !1451
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr*, i32 immarg, i32 immarg) #3

; Function Attrs: inlinehint nounwind
define internal fastcc i32 @transit_encap(%struct.xdp_md* %0, %struct.transit_behavior* nocapture readonly %1, i8 zeroext %2, i8 zeroext %3) unnamed_addr #4 !dbg !1452 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1456, metadata !DIExpression()), !dbg !1461
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %1, metadata !1457, metadata !DIExpression()), !dbg !1461
  call void @llvm.dbg.value(metadata i8 %2, metadata !1458, metadata !DIExpression()), !dbg !1461
  call void @llvm.dbg.value(metadata i8 %3, metadata !1459, metadata !DIExpression()), !dbg !1461
  %5 = zext i8 %3 to i16, !dbg !1462
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1463, metadata !DIExpression()) #7, !dbg !1479
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %1, metadata !1468, metadata !DIExpression()) #7, !dbg !1479
  call void @llvm.dbg.value(metadata i8 %2, metadata !1469, metadata !DIExpression()) #7, !dbg !1479
  call void @llvm.dbg.value(metadata i16 %5, metadata !1470, metadata !DIExpression()) #7, !dbg !1479
  call void @llvm.dbg.value(metadata i32 undef, metadata !1471, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1479
  call void @llvm.dbg.value(metadata i32 undef, metadata !1472, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1479
  %6 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 4, !dbg !1481
  %7 = load i32, i32* %6, align 4, !dbg !1481, !tbaa !564
  %8 = trunc i32 %7 to i8, !dbg !1482
  %9 = shl i8 %8, 4, !dbg !1483
  %10 = or i8 %9, 8, !dbg !1484
  call void @llvm.dbg.value(metadata i8 %10, metadata !1475, metadata !DIExpression()) #7, !dbg !1479
  %11 = zext i8 %10 to i32, !dbg !1485
  %12 = add nuw nsw i32 %11, 40, !dbg !1487
  %13 = sub nsw i32 0, %12, !dbg !1488
  %14 = tail call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %13) #7, !dbg !1489
  %15 = icmp eq i64 %14, 0, !dbg !1489
  br i1 %15, label %16, label %121, !dbg !1490

16:                                               ; preds = %4
  %17 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1) #7, !dbg !1491, !llvm.preserve.access.index !62
  %18 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0) #7, !dbg !1492, !llvm.preserve.access.index !62
  %19 = load i32, i32* %18, align 4, !dbg !1493, !tbaa !347
  %20 = zext i32 %19 to i64, !dbg !1494
  call void @llvm.dbg.value(metadata i64 %20, metadata !1471, metadata !DIExpression()) #7, !dbg !1479
  %21 = load i32, i32* %17, align 4, !dbg !1495, !tbaa !355
  %22 = zext i32 %21 to i64, !dbg !1496
  %23 = inttoptr i64 %22 to i8*, !dbg !1497
  call void @llvm.dbg.value(metadata i8* %23, metadata !1472, metadata !DIExpression()) #7, !dbg !1479
  call void @llvm.dbg.value(metadata i64 %20, metadata !1476, metadata !DIExpression()) #7, !dbg !1479
  %24 = add nuw nsw i64 %20, 14, !dbg !1498
  %25 = inttoptr i64 %24 to i8*, !dbg !1500
  %26 = icmp ugt i8* %25, %23, !dbg !1501
  br i1 %26, label %121, label %27, !dbg !1502

27:                                               ; preds = %16
  %28 = inttoptr i64 %20 to %struct.ethhdr*, !dbg !1503
  call void @llvm.dbg.value(metadata %struct.ethhdr* %28, metadata !1476, metadata !DIExpression()) #7, !dbg !1479
  %29 = inttoptr i64 %20 to i8*, !dbg !1504
  call void @llvm.dbg.value(metadata i8* %29, metadata !1471, metadata !DIExpression()) #7, !dbg !1479
  %30 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %28, i32 2, i32 2) #7, !dbg !1505, !llvm.preserve.access.index !306
  store i16 -8826, i16* %30, align 2, !dbg !1506, !tbaa !410
  %31 = getelementptr i8, i8* %29, i64 14, !dbg !1507
  %32 = bitcast i8* %31 to %struct.ipv6hdr*, !dbg !1508
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %32, metadata !1473, metadata !DIExpression()) #7, !dbg !1479
  %33 = getelementptr i8, i8* %29, i64 54, !dbg !1509
  %34 = icmp ugt i8* %33, %23, !dbg !1511
  br i1 %34, label %121, label %35, !dbg !1512

35:                                               ; preds = %27
  %36 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 0, i32 1) #7, !dbg !1513, !llvm.preserve.access.index !329
  %37 = load i8, i8* %36, align 4, !dbg !1514
  %38 = and i8 %37, 15, !dbg !1514
  %39 = or i8 %38, 96, !dbg !1514
  store i8 %39, i8* %36, align 4, !dbg !1514
  %40 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 0, i32 0) #7, !dbg !1515, !llvm.preserve.access.index !329
  %41 = load i8, i8* %40, align 4, !dbg !1516
  %42 = and i8 %41, -16, !dbg !1516
  store i8 %42, i8* %40, align 4, !dbg !1516
  %43 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 3, i32 4) #7, !dbg !1517, !llvm.preserve.access.index !329
  store i8 43, i8* %43, align 2, !dbg !1518, !tbaa !605
  %44 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 4, i32 5) #7, !dbg !1519, !llvm.preserve.access.index !329
  store i8 64, i8* %44, align 1, !dbg !1520, !tbaa !609
  %45 = zext i8 %10 to i16
  %46 = add nuw nsw i16 %45, %5
  %47 = tail call i16 @llvm.bswap.i16(i16 %46) #7
  %48 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 2, i32 3) #7, !dbg !1521, !llvm.preserve.access.index !329
  store i16 %47, i16* %48, align 4, !dbg !1522, !tbaa !612
  %49 = tail call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 5, i32 6) #7, !dbg !1523, !llvm.preserve.access.index !329
  %50 = bitcast %struct.in6_addr* %49 to i8*, !dbg !1524
  %51 = bitcast %struct.transit_behavior* %1 to i8*, !dbg !1524
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %50, i8* nonnull align 4 dereferenceable(16) %51, i64 16, i1 false) #7, !dbg !1524
  %52 = load i32, i32* %6, align 4, !dbg !1525, !tbaa !564
  %53 = add i32 %52, -1, !dbg !1527
  %54 = icmp ugt i32 %53, 4, !dbg !1527
  br i1 %54, label %121, label %55, !dbg !1527

55:                                               ; preds = %35
  %56 = tail call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %32, i32 6, i32 7) #7, !dbg !1528, !llvm.preserve.access.index !329
  %57 = bitcast %struct.in6_addr* %56 to i8*, !dbg !1529
  %58 = zext i32 %53 to i64, !dbg !1530
  %59 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 6, i64 %58, !dbg !1530
  %60 = bitcast %struct.in6_addr* %59 to i8*, !dbg !1529
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %57, i8* nonnull align 4 dereferenceable(16) %60, i64 16, i1 false) #7, !dbg !1529
  call void @llvm.dbg.value(metadata i8* %33, metadata !1474, metadata !DIExpression()) #7, !dbg !1479
  %61 = getelementptr i8, i8* %29, i64 62, !dbg !1531
  %62 = icmp ugt i8* %61, %23, !dbg !1533
  br i1 %62, label %121, label %63, !dbg !1534

63:                                               ; preds = %55
  store i8 %2, i8* %33, align 4, !dbg !1535, !tbaa !699
  %64 = lshr exact i8 %10, 3, !dbg !1536
  %65 = add nsw i8 %64, -1, !dbg !1537
  %66 = getelementptr i8, i8* %29, i64 55, !dbg !1538
  store i8 %65, i8* %66, align 1, !dbg !1539, !tbaa !705
  %67 = getelementptr i8, i8* %29, i64 56, !dbg !1540
  store i8 4, i8* %67, align 2, !dbg !1541, !tbaa !708
  %68 = load i32, i32* %6, align 4, !dbg !1542, !tbaa !564
  %69 = trunc i32 %68 to i8, !dbg !1543
  %70 = add i8 %69, -1, !dbg !1543
  %71 = getelementptr i8, i8* %29, i64 57, !dbg !1544
  store i8 %70, i8* %71, align 1, !dbg !1545, !tbaa !712
  %72 = getelementptr i8, i8* %29, i64 58, !dbg !1546
  store i8 %70, i8* %72, align 4, !dbg !1547, !tbaa !715
  %73 = getelementptr i8, i8* %29, i64 59, !dbg !1548
  store i8 0, i8* %73, align 1, !dbg !1549, !tbaa !718
  %74 = getelementptr i8, i8* %29, i64 60, !dbg !1550
  %75 = bitcast i8* %74 to i16*, !dbg !1550
  store i16 0, i16* %75, align 2, !dbg !1551, !tbaa !721
  call void @llvm.dbg.value(metadata i32 0, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  call void @llvm.dbg.value(metadata i64 0, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  %76 = icmp eq i32 %68, 0, !dbg !1553
  br i1 %76, label %119, label %77, !dbg !1557

77:                                               ; preds = %63
  %78 = getelementptr i8, i8* %29, i64 79, !dbg !1558
  %79 = icmp ugt i8* %78, %23, !dbg !1560
  br i1 %79, label %121, label %80, !dbg !1561

80:                                               ; preds = %77
  %81 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 6, i64 0, !dbg !1562
  %82 = bitcast %struct.in6_addr* %81 to i8*, !dbg !1563
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %61, i8* nonnull align 4 dereferenceable(16) %82, i64 16, i1 false) #7, !dbg !1563
  call void @llvm.dbg.value(metadata i64 1, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  %83 = load i32, i32* %6, align 4, !dbg !1564, !tbaa !564
  %84 = icmp ugt i32 %83, 1, !dbg !1553
  br i1 %84, label %85, label %119, !dbg !1557

85:                                               ; preds = %80
  %86 = getelementptr i8, i8* %29, i64 95, !dbg !1558
  %87 = icmp ugt i8* %86, %23, !dbg !1560
  br i1 %87, label %121, label %88, !dbg !1561

88:                                               ; preds = %85
  %89 = getelementptr i8, i8* %29, i64 78, !dbg !1565
  %90 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 6, i64 1, !dbg !1562
  %91 = bitcast %struct.in6_addr* %90 to i8*, !dbg !1563
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %89, i8* nonnull align 4 dereferenceable(16) %91, i64 16, i1 false) #7, !dbg !1563
  call void @llvm.dbg.value(metadata i64 2, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  %92 = load i32, i32* %6, align 4, !dbg !1564, !tbaa !564
  %93 = icmp ugt i32 %92, 2, !dbg !1553
  br i1 %93, label %94, label %119, !dbg !1557

94:                                               ; preds = %88
  %95 = getelementptr i8, i8* %29, i64 111, !dbg !1558
  %96 = icmp ugt i8* %95, %23, !dbg !1560
  br i1 %96, label %121, label %97, !dbg !1561

97:                                               ; preds = %94
  %98 = getelementptr i8, i8* %29, i64 94, !dbg !1565
  %99 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 6, i64 2, !dbg !1562
  %100 = bitcast %struct.in6_addr* %99 to i8*, !dbg !1563
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %98, i8* nonnull align 4 dereferenceable(16) %100, i64 16, i1 false) #7, !dbg !1563
  call void @llvm.dbg.value(metadata i64 3, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  %101 = load i32, i32* %6, align 4, !dbg !1564, !tbaa !564
  %102 = icmp ugt i32 %101, 3, !dbg !1553
  br i1 %102, label %103, label %119, !dbg !1557

103:                                              ; preds = %97
  %104 = getelementptr i8, i8* %29, i64 127, !dbg !1558
  %105 = icmp ugt i8* %104, %23, !dbg !1560
  br i1 %105, label %121, label %106, !dbg !1561

106:                                              ; preds = %103
  %107 = getelementptr i8, i8* %29, i64 110, !dbg !1565
  %108 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 6, i64 3, !dbg !1562
  %109 = bitcast %struct.in6_addr* %108 to i8*, !dbg !1563
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %107, i8* nonnull align 4 dereferenceable(16) %109, i64 16, i1 false) #7, !dbg !1563
  call void @llvm.dbg.value(metadata i64 4, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  %110 = load i32, i32* %6, align 4, !dbg !1564, !tbaa !564
  %111 = icmp ugt i32 %110, 4, !dbg !1553
  br i1 %111, label %112, label %119, !dbg !1557

112:                                              ; preds = %106
  %113 = getelementptr i8, i8* %29, i64 143, !dbg !1558
  %114 = icmp ugt i8* %113, %23, !dbg !1560
  br i1 %114, label %121, label %115, !dbg !1561

115:                                              ; preds = %112
  %116 = getelementptr i8, i8* %29, i64 126, !dbg !1565
  %117 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1, i64 0, i32 6, i64 4, !dbg !1562
  %118 = bitcast %struct.in6_addr* %117 to i8*, !dbg !1563
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %116, i8* nonnull align 4 dereferenceable(16) %118, i64 16, i1 false) #7, !dbg !1563
  call void @llvm.dbg.value(metadata i64 5, metadata !1477, metadata !DIExpression()) #7, !dbg !1552
  br label %119

119:                                              ; preds = %115, %106, %97, %88, %80, %63
  call void @llvm.dbg.value(metadata i32 10000, metadata !1460, metadata !DIExpression()), !dbg !1461
  %120 = tail call fastcc i32 @rewrite_nexthop(%struct.xdp_md* %0, i32 2), !dbg !1566
  br label %121, !dbg !1568

121:                                              ; preds = %112, %103, %94, %85, %77, %4, %55, %35, %27, %16, %119
  %122 = phi i32 [ %120, %119 ], [ 2, %16 ], [ 2, %27 ], [ 2, %35 ], [ 2, %55 ], [ 2, %4 ], [ 2, %77 ], [ 2, %85 ], [ 2, %94 ], [ 2, %103 ], [ 2, %112 ], !dbg !1461
  ret i32 %122, !dbg !1569
}

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: nounwind readnone
declare %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr*, i32 immarg, i32 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: nounwind readnone
declare i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr*, i32 immarg, i32 immarg) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: norecurse nounwind readnone
define dso_local i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone %0) #5 section "xdp_pass" !dbg !1570 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !1572, metadata !DIExpression()), !dbg !1573
  ret i32 2, !dbg !1574
}

; Function Attrs: inlinehint nounwind
define internal fastcc i32 @rewrite_nexthop(%struct.xdp_md* %0, i32 %1) unnamed_addr #4 !dbg !1575 {
  %3 = alloca %struct.bpf_fib_lookup, align 4
  %4 = alloca i32, align 4
  %5 = alloca [6 x i8], align 1
  %6 = alloca [6 x i8], align 1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1579, metadata !DIExpression()), !dbg !1587
  call void @llvm.dbg.value(metadata i32 %1, metadata !1580, metadata !DIExpression()), !dbg !1587
  %7 = getelementptr inbounds [6 x i8], [6 x i8]* %6, i64 0, i64 0
  %8 = getelementptr inbounds [6 x i8], [6 x i8]* %5, i64 0, i64 0
  %9 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0), !dbg !1588, !llvm.preserve.access.index !62
  %10 = load i32, i32* %9, align 4, !dbg !1588, !tbaa !347
  %11 = zext i32 %10 to i64, !dbg !1589
  %12 = inttoptr i64 %11 to i8*, !dbg !1590
  call void @llvm.dbg.value(metadata i8* %12, metadata !1581, metadata !DIExpression()), !dbg !1587
  %13 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1), !dbg !1591, !llvm.preserve.access.index !62
  %14 = load i32, i32* %13, align 4, !dbg !1591, !tbaa !355
  %15 = zext i32 %14 to i64, !dbg !1592
  %16 = inttoptr i64 %15 to i8*, !dbg !1593
  call void @llvm.dbg.value(metadata i8* %16, metadata !1582, metadata !DIExpression()), !dbg !1587
  %17 = getelementptr i8, i8* %12, i64 1, !dbg !1594
  %18 = icmp ugt i8* %17, %16, !dbg !1596
  br i1 %18, label %145, label %19, !dbg !1597

19:                                               ; preds = %2
  %20 = bitcast i32* %4 to i8*, !dbg !1598
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %20) #7, !dbg !1598
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %8), !dbg !1599
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !1584, metadata !DIExpression()), !dbg !1600
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %7), !dbg !1599
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !1585, metadata !DIExpression()), !dbg !1601
  call void @llvm.dbg.value(metadata i32* %4, metadata !1583, metadata !DIExpression(DW_OP_deref)), !dbg !1587
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1602, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i8* %8, metadata !1608, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i8* %7, metadata !1609, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i32* %4, metadata !1610, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i32 %1, metadata !1611, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i8* %12, metadata !1612, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i8* %16, metadata !1613, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata i8* %12, metadata !1614, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #7, !dbg !1628
  call void @llvm.dbg.value(metadata i8* %12, metadata !364, metadata !DIExpression()) #7, !dbg !1628
  call void @llvm.dbg.value(metadata i64 %15, metadata !365, metadata !DIExpression()) #7, !dbg !1628
  call void @llvm.dbg.value(metadata i8* %12, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !1628
  %21 = getelementptr i8, i8* %12, i64 34, !dbg !1630
  %22 = bitcast i8* %21 to %struct.iphdr*, !dbg !1630
  %23 = inttoptr i64 %15 to %struct.iphdr*, !dbg !1631
  %24 = icmp ugt %struct.iphdr* %22, %23, !dbg !1632
  %25 = getelementptr i8, i8* %12, i64 14, !dbg !1633
  %26 = bitcast i8* %25 to %struct.iphdr*, !dbg !1633
  %27 = select i1 %24, %struct.iphdr* null, %struct.iphdr* %26, !dbg !1633
  call void @llvm.dbg.value(metadata %struct.iphdr* %27, metadata !1615, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #7, !dbg !1634
  call void @llvm.dbg.value(metadata i8* %12, metadata !379, metadata !DIExpression()) #7, !dbg !1634
  call void @llvm.dbg.value(metadata i64 %15, metadata !380, metadata !DIExpression()) #7, !dbg !1634
  call void @llvm.dbg.value(metadata i8* %12, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #7, !dbg !1634
  %28 = getelementptr i8, i8* %12, i64 54, !dbg !1636
  %29 = bitcast i8* %28 to %struct.ipv6hdr*, !dbg !1636
  %30 = inttoptr i64 %15 to %struct.ipv6hdr*, !dbg !1637
  %31 = icmp ugt %struct.ipv6hdr* %29, %30, !dbg !1638
  %32 = bitcast i8* %25 to %struct.ipv6hdr*, !dbg !1639
  %33 = select i1 %31, %struct.ipv6hdr* null, %struct.ipv6hdr* %32, !dbg !1639
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %33, metadata !1616, metadata !DIExpression()) #7, !dbg !1626
  %34 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %3, i64 0, i32 0, !dbg !1640
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %34) #7, !dbg !1640
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %3, metadata !1617, metadata !DIExpression()) #7, !dbg !1641
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %34, i8 0, i64 64, i1 false) #7, !dbg !1641
  %35 = icmp ugt i8* %25, %16, !dbg !1642
  br i1 %35, label %126, label %36, !dbg !1644

36:                                               ; preds = %19
  %37 = inttoptr i64 %11 to %struct.ethhdr*, !dbg !1645
  call void @llvm.dbg.value(metadata %struct.ethhdr* %37, metadata !1614, metadata !DIExpression()) #7, !dbg !1626
  %38 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %37, i32 2, i32 2) #7, !dbg !1646, !llvm.preserve.access.index !306
  %39 = load i16, i16* %38, align 2, !dbg !1646, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %39, metadata !1618, metadata !DIExpression()) #7, !dbg !1626
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %34, i8 0, i64 64, i1 false) #7, !dbg !1647
  switch i16 %39, label %126 [
    i16 8, label %40
    i16 -8826, label %68
  ], !dbg !1648

40:                                               ; preds = %36
  %41 = icmp eq %struct.iphdr* %27, null, !dbg !1649
  br i1 %41, label %126, label %42, !dbg !1651

42:                                               ; preds = %40
  %43 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 0, i32 0) #7, !dbg !1652, !llvm.preserve.access.index !99
  store i8 2, i8* %43, align 4, !dbg !1653, !tbaa !1654
  %44 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %27, i32 1, i32 2) #7, !dbg !1656, !llvm.preserve.access.index !314
  %45 = load i8, i8* %44, align 1, !dbg !1656, !tbaa !1200
  %46 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 6, i32 6) #7, !dbg !1657, !llvm.preserve.access.index !99
  %47 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %46, i32 0) #7, !dbg !1657, !llvm.preserve.access.index !98
  %48 = bitcast %union.anon.5* %47 to i8*, !dbg !1657
  store i8 %45, i8* %48, align 4, !dbg !1658, !tbaa !634
  %49 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %27, i32 6, i32 7) #7, !dbg !1659, !llvm.preserve.access.index !314
  %50 = load i8, i8* %49, align 1, !dbg !1659, !tbaa !538
  %51 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 1, i32 1) #7, !dbg !1660, !llvm.preserve.access.index !99
  store i8 %50, i8* %51, align 1, !dbg !1661, !tbaa !1662
  %52 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 2, i32 2) #7, !dbg !1663, !llvm.preserve.access.index !99
  store i16 0, i16* %52, align 2, !dbg !1664, !tbaa !1665
  %53 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 3, i32 3) #7, !dbg !1666, !llvm.preserve.access.index !99
  store i16 0, i16* %53, align 4, !dbg !1667, !tbaa !1668
  %54 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %27, i32 2, i32 3) #7, !dbg !1669, !llvm.preserve.access.index !314
  %55 = load i16, i16* %54, align 2, !dbg !1669, !tbaa !445
  %56 = tail call i16 @llvm.bswap.i16(i16 %55) #7
  %57 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 4, i32 4) #7, !dbg !1670, !llvm.preserve.access.index !99
  store i16 %56, i16* %57, align 2, !dbg !1671, !tbaa !1672
  %58 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %27, i32 8, i32 9) #7, !dbg !1673, !llvm.preserve.access.index !314
  %59 = load i32, i32* %58, align 4, !dbg !1673, !tbaa !1674
  %60 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 7, i32 7) #7, !dbg !1675, !llvm.preserve.access.index !99
  %61 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %60, i32 0) #7, !dbg !1675, !llvm.preserve.access.index !109
  %62 = getelementptr %union.anon.6, %union.anon.6* %61, i64 0, i32 0, i64 0, !dbg !1675
  store i32 %59, i32* %62, align 4, !dbg !1676, !tbaa !634
  %63 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %27, i32 9, i32 10) #7, !dbg !1677, !llvm.preserve.access.index !314
  %64 = load i32, i32* %63, align 4, !dbg !1677, !tbaa !428
  %65 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 8, i32 8) #7, !dbg !1678, !llvm.preserve.access.index !99
  %66 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %65, i32 0) #7, !dbg !1678, !llvm.preserve.access.index !115
  %67 = getelementptr %union.anon.7, %union.anon.7* %66, i64 0, i32 0, i64 0, !dbg !1678
  store i32 %64, i32* %67, align 4, !dbg !1679, !tbaa !634
  br label %103, !dbg !1680

68:                                               ; preds = %36
  %69 = icmp eq %struct.ipv6hdr* %33, null, !dbg !1681
  br i1 %69, label %126, label %70, !dbg !1683

70:                                               ; preds = %68
  %71 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %33, i32 4, i32 5) #7, !dbg !1684, !llvm.preserve.access.index !329
  %72 = load i8, i8* %71, align 1, !dbg !1684, !tbaa !609
  %73 = icmp ult i8 %72, 2, !dbg !1686
  br i1 %73, label %126, label %74, !dbg !1687

74:                                               ; preds = %70
  %75 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 7, i32 7) #7, !dbg !1688, !llvm.preserve.access.index !99
  %76 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %75, i32 1) #7, !dbg !1688, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %76, metadata !1619, metadata !DIExpression()) #7, !dbg !1689
  %77 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 8, i32 8) #7, !dbg !1690, !llvm.preserve.access.index !99
  %78 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %77, i32 1) #7, !dbg !1690, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %78, metadata !1621, metadata !DIExpression()) #7, !dbg !1689
  %79 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 0, i32 0) #7, !dbg !1691, !llvm.preserve.access.index !99
  store i8 10, i8* %79, align 4, !dbg !1692, !tbaa !1654
  %80 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 6, i32 6) #7, !dbg !1693, !llvm.preserve.access.index !99
  %81 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %80, i32 0) #7, !dbg !1693, !llvm.preserve.access.index !98
  %82 = bitcast %union.anon.5* %81 to i8*, !dbg !1693
  store i8 0, i8* %82, align 4, !dbg !1694, !tbaa !634
  %83 = bitcast %struct.ipv6hdr* %33 to i32*, !dbg !1695
  %84 = load i32, i32* %83, align 4, !dbg !1695, !tbaa !1106
  %85 = and i32 %84, -241, !dbg !1696
  %86 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %80, i32 1) #7, !dbg !1697, !llvm.preserve.access.index !98
  %87 = getelementptr %union.anon.5, %union.anon.5* %86, i64 0, i32 0, !dbg !1697
  store i32 %85, i32* %87, align 4, !dbg !1698, !tbaa !634
  %88 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %33, i32 3, i32 4) #7, !dbg !1699, !llvm.preserve.access.index !329
  %89 = load i8, i8* %88, align 2, !dbg !1699, !tbaa !605
  %90 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 1, i32 1) #7, !dbg !1700, !llvm.preserve.access.index !99
  store i8 %89, i8* %90, align 1, !dbg !1701, !tbaa !1662
  %91 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 2, i32 2) #7, !dbg !1702, !llvm.preserve.access.index !99
  store i16 0, i16* %91, align 2, !dbg !1703, !tbaa !1665
  %92 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 3, i32 3) #7, !dbg !1704, !llvm.preserve.access.index !99
  store i16 0, i16* %92, align 4, !dbg !1705, !tbaa !1668
  %93 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %33, i32 2, i32 3) #7, !dbg !1706, !llvm.preserve.access.index !329
  %94 = load i16, i16* %93, align 4, !dbg !1706, !tbaa !612
  %95 = tail call i16 @llvm.bswap.i16(i16 %94) #7
  %96 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 4, i32 4) #7, !dbg !1707, !llvm.preserve.access.index !99
  store i16 %95, i16* %96, align 2, !dbg !1708, !tbaa !1672
  %97 = tail call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %33, i32 5, i32 6) #7, !dbg !1709, !llvm.preserve.access.index !329
  %98 = bitcast %union.anon.6* %76 to i8*, !dbg !1709
  %99 = bitcast %struct.in6_addr* %97 to i8*, !dbg !1709
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %98, i8* nonnull align 4 dereferenceable(16) %99, i64 16, i1 false) #7, !dbg !1709, !tbaa.struct !839
  %100 = tail call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %33, i32 6, i32 7) #7, !dbg !1710, !llvm.preserve.access.index !329
  %101 = bitcast %union.anon.7* %78 to i8*, !dbg !1710
  %102 = bitcast %struct.in6_addr* %100 to i8*, !dbg !1710
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %101, i8* nonnull align 4 dereferenceable(16) %102, i64 16, i1 false) #7, !dbg !1710, !tbaa.struct !839
  br label %103, !dbg !1711

103:                                              ; preds = %74, %42
  %104 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #7, !dbg !1712, !llvm.preserve.access.index !62
  %105 = load i32, i32* %104, align 4, !dbg !1712, !tbaa !1713
  %106 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 5, i32 5) #7, !dbg !1714, !llvm.preserve.access.index !99
  store i32 %105, i32* %106, align 4, !dbg !1715, !tbaa !1716
  %107 = bitcast %struct.xdp_md* %0 to i8*, !dbg !1717
  %108 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %107, %struct.bpf_fib_lookup* nonnull %3, i32 64, i32 %1) #7, !dbg !1718
  %109 = trunc i64 %108 to i32, !dbg !1718
  call void @llvm.dbg.value(metadata i32 %109, metadata !1622, metadata !DIExpression()) #7, !dbg !1626
  %110 = icmp eq i32 %109, 0, !dbg !1719
  br i1 %110, label %111, label %126, !dbg !1719

111:                                              ; preds = %103
  switch i16 %39, label %127 [
    i16 8, label %112
    i16 -8826, label %122
  ], !dbg !1720

112:                                              ; preds = %111
  call void @llvm.dbg.value(metadata %struct.iphdr* %27, metadata !1721, metadata !DIExpression()) #7, !dbg !1727
  %113 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* %27, i32 7, i32 8) #7, !dbg !1730, !llvm.preserve.access.index !314
  %114 = load i16, i16* %113, align 2, !dbg !1730, !tbaa !1028
  call void @llvm.dbg.value(metadata i16 %114, metadata !1726, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #7, !dbg !1727
  %115 = add i16 %114, 1, !dbg !1731
  call void @llvm.dbg.value(metadata i16 %114, metadata !1726, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #7, !dbg !1727
  %116 = icmp ugt i16 %114, -3, !dbg !1732
  %117 = zext i1 %116 to i16, !dbg !1732
  %118 = add i16 %115, %117, !dbg !1733
  store i16 %118, i16* %113, align 2, !dbg !1734, !tbaa !1028
  %119 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %27, i32 5, i32 6) #7, !dbg !1735, !llvm.preserve.access.index !314
  %120 = load i8, i8* %119, align 4, !dbg !1736, !tbaa !1205
  %121 = add i8 %120, -1, !dbg !1736
  store i8 %121, i8* %119, align 4, !dbg !1736, !tbaa !1205
  br label %127, !dbg !1737

122:                                              ; preds = %111
  %123 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %33, i32 4, i32 5) #7, !dbg !1738, !llvm.preserve.access.index !329
  %124 = load i8, i8* %123, align 1, !dbg !1740, !tbaa !609
  %125 = add i8 %124, -1, !dbg !1740
  store i8 %125, i8* %123, align 1, !dbg !1740, !tbaa !609
  br label %127, !dbg !1741

126:                                              ; preds = %19, %40, %68, %70, %36, %103
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %34) #7, !dbg !1742
  call void @llvm.dbg.value(metadata i1 true, metadata !1586, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1587
  br label %143, !dbg !1743

127:                                              ; preds = %122, %112, %111
  %128 = load i32, i32* %106, align 4, !dbg !1744, !tbaa !1716
  store i32 %128, i32* %4, align 4, !dbg !1745, !tbaa !1106
  call void @llvm.dbg.value(metadata i8* %8, metadata !1623, metadata !DIExpression()) #7, !dbg !1746
  call void @llvm.dbg.value(metadata i8* %7, metadata !1625, metadata !DIExpression()) #7, !dbg !1746
  %129 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 12, i32 12) #7, !dbg !1747, !llvm.preserve.access.index !99
  %130 = getelementptr inbounds [6 x i8], [6 x i8]* %129, i64 0, i64 0, !dbg !1748
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %7, i8* nonnull align 2 dereferenceable(6) %130, i64 6, i1 false) #7, !dbg !1748
  %131 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %3, i32 11, i32 11) #7, !dbg !1749, !llvm.preserve.access.index !99
  %132 = getelementptr inbounds [6 x i8], [6 x i8]* %131, i64 0, i64 0, !dbg !1750
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %8, i8* nonnull align 4 dereferenceable(6) %132, i64 6, i1 false) #7, !dbg !1750
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %34) #7, !dbg !1742
  call void @llvm.dbg.value(metadata i1 true, metadata !1586, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)), !dbg !1587
  call void @llvm.dbg.value(metadata i8* %12, metadata !1751, metadata !DIExpression()) #7, !dbg !1762
  call void @llvm.dbg.value(metadata i8* %8, metadata !1756, metadata !DIExpression()) #7, !dbg !1762
  call void @llvm.dbg.value(metadata i8* %7, metadata !1757, metadata !DIExpression()) #7, !dbg !1762
  call void @llvm.dbg.value(metadata i8* %8, metadata !1758, metadata !DIExpression()) #7, !dbg !1762
  call void @llvm.dbg.value(metadata i8* %7, metadata !1760, metadata !DIExpression()) #7, !dbg !1762
  call void @llvm.dbg.value(metadata i8* %12, metadata !1761, metadata !DIExpression()) #7, !dbg !1762
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %12, i8* nonnull align 2 dereferenceable(6) %7, i64 6, i1 false) #7, !dbg !1766
  %133 = getelementptr inbounds i8, i8* %12, i64 6, !dbg !1767
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %133, i8* nonnull align 2 dereferenceable(6) %8, i64 6, i1 false) #7, !dbg !1768
  call void @llvm.dbg.value(metadata i32* %4, metadata !1583, metadata !DIExpression(DW_OP_deref)), !dbg !1587
  %134 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %20) #7, !dbg !1769
  %135 = icmp eq i8* %134, null, !dbg !1769
  br i1 %135, label %143, label %136, !dbg !1771

136:                                              ; preds = %127
  %137 = load i32, i32* %104, align 4, !dbg !1772, !tbaa !1713
  %138 = load i32, i32* %4, align 4, !dbg !1774, !tbaa !1106
  call void @llvm.dbg.value(metadata i32 %138, metadata !1583, metadata !DIExpression()), !dbg !1587
  %139 = icmp eq i32 %137, %138, !dbg !1775
  br i1 %139, label %143, label %140, !dbg !1776

140:                                              ; preds = %136
  %141 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %138, i64 0) #7, !dbg !1777
  %142 = trunc i64 %141 to i32, !dbg !1777
  br label %143, !dbg !1778

143:                                              ; preds = %126, %136, %127, %140
  %144 = phi i32 [ %142, %140 ], [ 2, %127 ], [ 3, %136 ], [ 2, %126 ], !dbg !1587
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %7), !dbg !1779
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %8), !dbg !1779
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %20) #7, !dbg !1779
  br label %145

145:                                              ; preds = %2, %143
  %146 = phi i32 [ %144, %143 ], [ 2, %2 ], !dbg !1587
  ret i32 %146, !dbg !1779
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind readnone
declare i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5*, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6*, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7*, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone
declare %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon*, i32 immarg) #3

; Function Attrs: nounwind readnone
declare i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr*, i32 immarg, i32 immarg) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readnone }
attributes #4 = { inlinehint nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn writeonly }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!293, !294, !295}
!llvm.ident = !{!296}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "xdpcap_hook", scope: !2, file: !137, line: 62, type: !283, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Debian clang version 11.0.1-2", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !52, globals: !130, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "srv6.c", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!4 = !{!5, !14, !44, !48}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 29782, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "./../common/vmlinux.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0, isUnsigned: true)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2, isUnsigned: true)
!12 = !DIEnumerator(name: "XDP_TX", value: 3, isUnsigned: true)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4, isUnsigned: true)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 33712, baseType: !7, size: 32, elements: !15)
!15 = !{!16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43}
!16 = !DIEnumerator(name: "IPPROTO_IP", value: 0, isUnsigned: true)
!17 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1, isUnsigned: true)
!18 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2, isUnsigned: true)
!19 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4, isUnsigned: true)
!20 = !DIEnumerator(name: "IPPROTO_TCP", value: 6, isUnsigned: true)
!21 = !DIEnumerator(name: "IPPROTO_EGP", value: 8, isUnsigned: true)
!22 = !DIEnumerator(name: "IPPROTO_PUP", value: 12, isUnsigned: true)
!23 = !DIEnumerator(name: "IPPROTO_UDP", value: 17, isUnsigned: true)
!24 = !DIEnumerator(name: "IPPROTO_IDP", value: 22, isUnsigned: true)
!25 = !DIEnumerator(name: "IPPROTO_TP", value: 29, isUnsigned: true)
!26 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33, isUnsigned: true)
!27 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41, isUnsigned: true)
!28 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46, isUnsigned: true)
!29 = !DIEnumerator(name: "IPPROTO_GRE", value: 47, isUnsigned: true)
!30 = !DIEnumerator(name: "IPPROTO_ESP", value: 50, isUnsigned: true)
!31 = !DIEnumerator(name: "IPPROTO_AH", value: 51, isUnsigned: true)
!32 = !DIEnumerator(name: "IPPROTO_MTP", value: 92, isUnsigned: true)
!33 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94, isUnsigned: true)
!34 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98, isUnsigned: true)
!35 = !DIEnumerator(name: "IPPROTO_PIM", value: 103, isUnsigned: true)
!36 = !DIEnumerator(name: "IPPROTO_COMP", value: 108, isUnsigned: true)
!37 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132, isUnsigned: true)
!38 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136, isUnsigned: true)
!39 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137, isUnsigned: true)
!40 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143, isUnsigned: true)
!41 = !DIEnumerator(name: "IPPROTO_RAW", value: 255, isUnsigned: true)
!42 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262, isUnsigned: true)
!43 = !DIEnumerator(name: "IPPROTO_MAX", value: 263, isUnsigned: true)
!44 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 90510, baseType: !7, size: 32, elements: !45)
!45 = !{!46, !47}
!46 = !DIEnumerator(name: "BPF_FIB_LOOKUP_DIRECT", value: 1, isUnsigned: true)
!47 = !DIEnumerator(name: "BPF_FIB_LOOKUP_OUTPUT", value: 2, isUnsigned: true)
!48 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 36, baseType: !7, size: 32, elements: !49)
!49 = !{!50, !51}
!50 = !DIEnumerator(name: "false", value: 0, isUnsigned: true)
!51 = !DIEnumerator(name: "true", value: 1, isUnsigned: true)
!52 = !{!53, !54, !55, !57, !60, !71, !93, !65, !94, !95, !96, !97, !98, !109, !115}
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!54 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !6, line: 12, baseType: !56)
!56 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DISubroutineType(types: !59)
!59 = !{!60, !61, !53, !60}
!60 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64)
!62 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 32700, size: 192, elements: !63)
!63 = !{!64, !66, !67, !68, !69, !70}
!64 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !62, file: !6, line: 32701, baseType: !65, size: 32)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !6, line: 16, baseType: !7)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !62, file: !6, line: 32702, baseType: !65, size: 32, offset: 32)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !62, file: !6, line: 32703, baseType: !65, size: 32, offset: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !62, file: !6, line: 32704, baseType: !65, size: 32, offset: 96)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !62, file: !6, line: 32705, baseType: !65, size: 32, offset: 128)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !62, file: !6, line: 32706, baseType: !65, size: 32, offset: 160)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !6, line: 7911, size: 128, elements: !73)
!73 = !{!74}
!74 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !72, file: !6, line: 7916, baseType: !75, size: 128)
!75 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !72, file: !6, line: 7912, size: 128, elements: !76)
!76 = !{!77, !83, !88}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !75, file: !6, line: 7913, baseType: !78, size: 128)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 128, elements: !81)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !6, line: 10, baseType: !80)
!80 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!81 = !{!82}
!82 = !DISubrange(count: 16)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !75, file: !6, line: 7914, baseType: !84, size: 128)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 128, elements: !86)
!85 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !6, line: 7670, baseType: !55)
!86 = !{!87}
!87 = !DISubrange(count: 8)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !75, file: !6, line: 7915, baseType: !89, size: 128)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 128, elements: !91)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !6, line: 7672, baseType: !65)
!91 = !{!92}
!92 = !DISubrange(count: 4)
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !6, line: 43298, baseType: !55)
!95 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!98 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !99, file: !6, line: 90534, size: 32, elements: !126)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !6, line: 90527, size: 512, elements: !100)
!100 = !{!101, !102, !103, !104, !105, !106, !107, !108, !114, !119, !120, !121, !125}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !99, file: !6, line: 90528, baseType: !79, size: 8)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !99, file: !6, line: 90529, baseType: !79, size: 8, offset: 8)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !99, file: !6, line: 90530, baseType: !85, size: 16, offset: 16)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !99, file: !6, line: 90531, baseType: !85, size: 16, offset: 32)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !99, file: !6, line: 90532, baseType: !55, size: 16, offset: 48)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !99, file: !6, line: 90533, baseType: !65, size: 32, offset: 64)
!107 = !DIDerivedType(tag: DW_TAG_member, scope: !99, file: !6, line: 90534, baseType: !98, size: 32, offset: 96)
!108 = !DIDerivedType(tag: DW_TAG_member, scope: !99, file: !6, line: 90539, baseType: !109, size: 128, offset: 128)
!109 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !99, file: !6, line: 90539, size: 128, elements: !110)
!110 = !{!111, !112}
!111 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !109, file: !6, line: 90540, baseType: !90, size: 32)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !109, file: !6, line: 90541, baseType: !113, size: 128)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 128, elements: !91)
!114 = !DIDerivedType(tag: DW_TAG_member, scope: !99, file: !6, line: 90543, baseType: !115, size: 128, offset: 256)
!115 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !99, file: !6, line: 90543, size: 128, elements: !116)
!116 = !{!117, !118}
!117 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !115, file: !6, line: 90544, baseType: !90, size: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !115, file: !6, line: 90545, baseType: !113, size: 128)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !99, file: !6, line: 90547, baseType: !85, size: 16, offset: 384)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !99, file: !6, line: 90548, baseType: !85, size: 16, offset: 400)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !99, file: !6, line: 90549, baseType: !122, size: 48, offset: 416)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 48, elements: !123)
!123 = !{!124}
!124 = !DISubrange(count: 6)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !99, file: !6, line: 90550, baseType: !122, size: 48, offset: 464)
!126 = !{!127, !128, !129}
!127 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !98, file: !6, line: 90535, baseType: !79, size: 8)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !98, file: !6, line: 90536, baseType: !90, size: 32)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !98, file: !6, line: 90537, baseType: !65, size: 32)
!130 = !{!131, !135, !154, !201, !232, !241, !0, !257, !265, !270, !276}
!131 = !DIGlobalVariableExpression(var: !132, expr: !DIExpression())
!132 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 485, type: !133, isLocal: false, isDefinition: true)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !134, size: 32, elements: !91)
!134 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!135 = !DIGlobalVariableExpression(var: !136, expr: !DIExpression())
!136 = distinct !DIGlobalVariable(name: "tx_port", scope: !2, file: !137, line: 17, type: !138, isLocal: false, isDefinition: true)
!137 = !DIFile(filename: "./srv6_maps.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!138 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !137, line: 11, size: 256, elements: !139)
!139 = !{!140, !145, !148, !149}
!140 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !138, file: !137, line: 13, baseType: !141, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !142, size: 64)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 448, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 14)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !138, file: !137, line: 14, baseType: !146, size: 64, offset: 64)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 128, elements: !91)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !138, file: !137, line: 15, baseType: !146, size: 64, offset: 128)
!149 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !138, file: !137, line: 16, baseType: !150, size: 64, offset: 192)
!150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !151, size: 64)
!151 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 2048, elements: !152)
!152 = !{!153}
!153 = !DISubrange(count: 64)
!154 = !DIGlobalVariableExpression(var: !155, expr: !DIExpression())
!155 = distinct !DIGlobalVariable(name: "function_table", scope: !2, file: !137, line: 26, type: !156, isLocal: false, isDefinition: true)
!156 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !137, line: 19, size: 320, elements: !157)
!157 = !{!158, !163, !170, !191, !196}
!158 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !156, file: !137, line: 21, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !160, size: 64)
!160 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 352, elements: !161)
!161 = !{!162}
!162 = !DISubrange(count: 11)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !156, file: !137, line: 22, baseType: !164, size: 64, offset: 64)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lpm_key_v6", file: !166, line: 33, size: 160, elements: !167)
!166 = !DIFile(filename: "./srv6_structs.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!167 = !{!168, !169}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !165, file: !166, line: 35, baseType: !65, size: 32)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !165, file: !166, line: 36, baseType: !72, size: 128, offset: 32)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !156, file: !137, line: 23, baseType: !171, size: 64, offset: 128)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "end_function", file: !166, line: 39, size: 384, elements: !173)
!173 = !{!174, !175, !187, !188, !189, !190}
!174 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !172, file: !166, line: 41, baseType: !113, size: 128)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "nexthop", scope: !172, file: !166, line: 50, baseType: !176, size: 128, offset: 128)
!176 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !172, file: !166, line: 42, size: 128, elements: !177)
!177 = !{!178, !179}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "v6addr", scope: !176, file: !166, line: 44, baseType: !113, size: 128)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "v4", scope: !176, file: !166, line: 49, baseType: !180, size: 128)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "v4", file: !166, line: 45, size: 128, elements: !181)
!181 = !{!182, !183}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !180, file: !166, line: 47, baseType: !65, size: 32)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !180, file: !166, line: 48, baseType: !184, size: 96, offset: 32)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 96, elements: !185)
!185 = !{!186}
!186 = !DISubrange(count: 3)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "function", scope: !172, file: !166, line: 53, baseType: !65, size: 32, offset: 256)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "flaver", scope: !172, file: !166, line: 54, baseType: !65, size: 32, offset: 288)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "v4_addr_spos", scope: !172, file: !166, line: 55, baseType: !65, size: 32, offset: 320)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "v4_addr_dpos", scope: !172, file: !166, line: 56, baseType: !65, size: 32, offset: 352)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !156, file: !137, line: 24, baseType: !192, size: 64, offset: 192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!193 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 2097152, elements: !194)
!194 = !{!195}
!195 = !DISubrange(count: 65536)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !156, file: !137, line: 25, baseType: !197, size: 64, offset: 256)
!197 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !198, size: 64)
!198 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 32, elements: !199)
!199 = !{!200}
!200 = !DISubrange(count: 1)
!201 = !DIGlobalVariableExpression(var: !202, expr: !DIExpression())
!202 = distinct !DIGlobalVariable(name: "transit_table_v4", scope: !2, file: !137, line: 35, type: !203, isLocal: false, isDefinition: true)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !137, line: 28, size: 320, elements: !204)
!204 = !{!205, !206, !212, !226, !231}
!205 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !203, file: !137, line: 30, baseType: !159, size: 64)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !203, file: !137, line: 31, baseType: !207, size: 64, offset: 64)
!207 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !208, size: 64)
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lpm_key_v4", file: !166, line: 27, size: 64, elements: !209)
!209 = !{!210, !211}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !208, file: !166, line: 29, baseType: !65, size: 32)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !208, file: !166, line: 30, baseType: !65, size: 32, offset: 32)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !203, file: !137, line: 32, baseType: !213, size: 64, offset: 128)
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!214 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "transit_behavior", file: !166, line: 16, size: 1024, elements: !215)
!215 = !{!216, !217, !218, !219, !220, !221, !222}
!216 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !214, file: !166, line: 18, baseType: !72, size: 128)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !214, file: !166, line: 19, baseType: !72, size: 128, offset: 128)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "s_prefixlen", scope: !214, file: !166, line: 20, baseType: !65, size: 32, offset: 256)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "d_prefixlen", scope: !214, file: !166, line: 21, baseType: !65, size: 32, offset: 288)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "segment_length", scope: !214, file: !166, line: 22, baseType: !65, size: 32, offset: 320)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "action", scope: !214, file: !166, line: 23, baseType: !65, size: 32, offset: 352)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "segments", scope: !214, file: !166, line: 24, baseType: !223, size: 640, offset: 384)
!223 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, size: 640, elements: !224)
!224 = !{!225}
!225 = !DISubrange(count: 5)
!226 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !203, file: !137, line: 33, baseType: !227, size: 64, offset: 192)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 8192, elements: !229)
!229 = !{!230}
!230 = !DISubrange(count: 256)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !203, file: !137, line: 34, baseType: !197, size: 64, offset: 256)
!232 = !DIGlobalVariableExpression(var: !233, expr: !DIExpression())
!233 = distinct !DIGlobalVariable(name: "transit_table_v6", scope: !2, file: !137, line: 44, type: !234, isLocal: false, isDefinition: true)
!234 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !137, line: 37, size: 320, elements: !235)
!235 = !{!236, !237, !238, !239, !240}
!236 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !234, file: !137, line: 39, baseType: !159, size: 64)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !234, file: !137, line: 40, baseType: !164, size: 64, offset: 64)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !234, file: !137, line: 41, baseType: !213, size: 64, offset: 128)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !234, file: !137, line: 42, baseType: !227, size: 64, offset: 192)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "map_flags", scope: !234, file: !137, line: 43, baseType: !197, size: 64, offset: 256)
!241 = !DIGlobalVariableExpression(var: !242, expr: !DIExpression())
!242 = distinct !DIGlobalVariable(name: "in_taple_v6_addr", scope: !2, file: !137, line: 52, type: !243, isLocal: false, isDefinition: true)
!243 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !137, line: 46, size: 256, elements: !244)
!244 = !{!245, !248, !250, !256}
!245 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !243, file: !137, line: 48, baseType: !246, size: 64)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 192, elements: !123)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !243, file: !137, line: 49, baseType: !249, size: 64, offset: 64)
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !243, file: !137, line: 50, baseType: !251, size: 64, offset: 128)
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!252 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "v6addr_heep", file: !166, line: 10, size: 256, elements: !253)
!253 = !{!254, !255}
!254 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !252, file: !166, line: 12, baseType: !72, size: 128)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !252, file: !166, line: 13, baseType: !72, size: 128, offset: 128)
!256 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !243, file: !137, line: 51, baseType: !197, size: 64, offset: 192)
!257 = !DIGlobalVariableExpression(var: !258, expr: !DIExpression())
!258 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !259, line: 52, type: !260, isLocal: true, isDefinition: true)
!259 = !DIFile(filename: "./../common/bpf_helper_defs.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!261 = !DISubroutineType(types: !262)
!262 = !{!53, !53, !263}
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!264 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!265 = !DIGlobalVariableExpression(var: !266, expr: !DIExpression())
!266 = distinct !DIGlobalVariable(name: "bpf_xdp_adjust_head", scope: !2, file: !259, line: 1121, type: !267, isLocal: true, isDefinition: true)
!267 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !268, size: 64)
!268 = !DISubroutineType(types: !269)
!269 = !{!54, !61, !60}
!270 = !DIGlobalVariableExpression(var: !271, expr: !DIExpression())
!271 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !259, line: 1817, type: !272, isLocal: true, isDefinition: true)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!273 = !DISubroutineType(types: !274)
!274 = !{!54, !53, !275, !60, !65}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!276 = !DIGlobalVariableExpression(var: !277, expr: !DIExpression())
!277 = distinct !DIGlobalVariable(name: "bpf_redirect_map", scope: !2, file: !259, line: 1297, type: !278, isLocal: true, isDefinition: true)
!278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !279, size: 64)
!279 = !DISubroutineType(types: !280)
!280 = !{!54, !53, !65, !281}
!281 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !6, line: 20, baseType: !282)
!282 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdpcap_hook", file: !137, line: 56, size: 256, elements: !284)
!284 = !{!285, !288, !289, !290}
!285 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !283, file: !137, line: 58, baseType: !286, size: 64)
!286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !287, size: 64)
!287 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 96, elements: !185)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !283, file: !137, line: 59, baseType: !146, size: 64, offset: 64)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !283, file: !137, line: 60, baseType: !146, size: 64, offset: 128)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !283, file: !137, line: 61, baseType: !291, size: 64, offset: 192)
!291 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !292, size: 64)
!292 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 160, elements: !224)
!293 = !{i32 7, !"Dwarf Version", i32 4}
!294 = !{i32 2, !"Debug Info Version", i32 3}
!295 = !{i32 1, !"wchar_size", i32 4}
!296 = !{!"Debian clang version 11.0.1-2"}
!297 = distinct !DISubprogram(name: "srv6_handler", scope: !3, file: !3, line: 395, type: !298, scopeLine: 396, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !300)
!298 = !DISubroutineType(types: !299)
!299 = !{!60, !61}
!300 = !{!301, !302, !303, !304, !312, !327, !340, !341, !342, !343, !344}
!301 = !DILocalVariable(name: "xdp", arg: 1, scope: !297, file: !3, line: 395, type: !61)
!302 = !DILocalVariable(name: "data", scope: !297, file: !3, line: 398, type: !53)
!303 = !DILocalVariable(name: "data_end", scope: !297, file: !3, line: 399, type: !53)
!304 = !DILocalVariable(name: "eth", scope: !297, file: !3, line: 400, type: !305)
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64)
!306 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !6, line: 10332, size: 112, elements: !307)
!307 = !{!308, !310, !311}
!308 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !306, file: !6, line: 10333, baseType: !309, size: 48)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 48, elements: !123)
!310 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !306, file: !6, line: 10334, baseType: !309, size: 48, offset: 48)
!311 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !306, file: !6, line: 10335, baseType: !85, size: 16, offset: 96)
!312 = !DILocalVariable(name: "iph", scope: !297, file: !3, line: 401, type: !313)
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!314 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !6, line: 43652, size: 160, elements: !315)
!315 = !{!316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326}
!316 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !314, file: !6, line: 43653, baseType: !79, size: 4, flags: DIFlagBitField, extraData: i64 0)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !314, file: !6, line: 43654, baseType: !79, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !314, file: !6, line: 43655, baseType: !79, size: 8, offset: 8)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !314, file: !6, line: 43656, baseType: !85, size: 16, offset: 16)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !314, file: !6, line: 43657, baseType: !85, size: 16, offset: 32)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !314, file: !6, line: 43658, baseType: !85, size: 16, offset: 48)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !314, file: !6, line: 43659, baseType: !79, size: 8, offset: 64)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !314, file: !6, line: 43660, baseType: !79, size: 8, offset: 72)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !314, file: !6, line: 43661, baseType: !94, size: 16, offset: 80)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !314, file: !6, line: 43662, baseType: !90, size: 32, offset: 96)
!326 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !314, file: !6, line: 43663, baseType: !90, size: 32, offset: 128)
!327 = !DILocalVariable(name: "v6h", scope: !297, file: !3, line: 402, type: !328)
!328 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !329, size: 64)
!329 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !6, line: 43678, size: 320, elements: !330)
!330 = !{!331, !332, !333, !335, !336, !337, !338, !339}
!331 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !329, file: !6, line: 43679, baseType: !79, size: 4, flags: DIFlagBitField, extraData: i64 0)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !329, file: !6, line: 43680, baseType: !79, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !329, file: !6, line: 43681, baseType: !334, size: 24, offset: 8)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !79, size: 24, elements: !185)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !329, file: !6, line: 43682, baseType: !85, size: 16, offset: 32)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !329, file: !6, line: 43683, baseType: !79, size: 8, offset: 48)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !329, file: !6, line: 43684, baseType: !79, size: 8, offset: 56)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !329, file: !6, line: 43685, baseType: !72, size: 128, offset: 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !329, file: !6, line: 43686, baseType: !72, size: 128, offset: 192)
!340 = !DILocalVariable(name: "ef_table", scope: !297, file: !3, line: 403, type: !171)
!341 = !DILocalVariable(name: "tb", scope: !297, file: !3, line: 404, type: !213)
!342 = !DILocalVariable(name: "v4key", scope: !297, file: !3, line: 405, type: !208)
!343 = !DILocalVariable(name: "v6key", scope: !297, file: !3, line: 406, type: !165)
!344 = !DILocalVariable(name: "h_proto", scope: !297, file: !3, line: 407, type: !55)
!345 = !DILocation(line: 0, scope: !297)
!346 = !DILocation(line: 398, column: 37, scope: !297)
!347 = !{!348, !349, i64 0}
!348 = !{!"xdp_md", !349, i64 0, !349, i64 4, !349, i64 8, !349, i64 12, !349, i64 16, !349, i64 20}
!349 = !{!"int", !350, i64 0}
!350 = !{!"omnipotent char", !351, i64 0}
!351 = !{!"Simple C/C++ TBAA"}
!352 = !DILocation(line: 398, column: 26, scope: !297)
!353 = !DILocation(line: 398, column: 18, scope: !297)
!354 = !DILocation(line: 399, column: 41, scope: !297)
!355 = !{!348, !349, i64 4}
!356 = !DILocation(line: 399, column: 30, scope: !297)
!357 = !DILocation(line: 399, column: 22, scope: !297)
!358 = !DILocalVariable(name: "xdp", arg: 1, scope: !359, file: !360, line: 241, type: !61)
!359 = distinct !DISubprogram(name: "get_ipv4", scope: !360, file: !360, line: 241, type: !361, scopeLine: 242, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !363)
!360 = !DIFile(filename: "./srv6_helpers.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!361 = !DISubroutineType(types: !362)
!362 = !{!313, !61}
!363 = !{!358, !364, !365, !366}
!364 = !DILocalVariable(name: "data", scope: !359, file: !360, line: 243, type: !53)
!365 = !DILocalVariable(name: "data_end", scope: !359, file: !360, line: 244, type: !53)
!366 = !DILocalVariable(name: "iph", scope: !359, file: !360, line: 246, type: !313)
!367 = !DILocation(line: 0, scope: !359, inlinedAt: !368)
!368 = distinct !DILocation(line: 401, column: 25, scope: !297)
!369 = !DILocation(line: 247, column: 13, scope: !370, inlinedAt: !368)
!370 = distinct !DILexicalBlock(scope: !359, file: !360, line: 247, column: 9)
!371 = !DILocation(line: 247, column: 19, scope: !370, inlinedAt: !368)
!372 = !DILocation(line: 247, column: 17, scope: !370, inlinedAt: !368)
!373 = !DILocation(line: 247, column: 9, scope: !359, inlinedAt: !368)
!374 = !DILocalVariable(name: "xdp", arg: 1, scope: !375, file: !360, line: 228, type: !61)
!375 = distinct !DISubprogram(name: "get_ipv6", scope: !360, file: !360, line: 228, type: !376, scopeLine: 229, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !378)
!376 = !DISubroutineType(types: !377)
!377 = !{!328, !61}
!378 = !{!374, !379, !380, !381}
!379 = !DILocalVariable(name: "data", scope: !375, file: !360, line: 230, type: !53)
!380 = !DILocalVariable(name: "data_end", scope: !375, file: !360, line: 231, type: !53)
!381 = !DILocalVariable(name: "v6h", scope: !375, file: !360, line: 233, type: !328)
!382 = !DILocation(line: 0, scope: !375, inlinedAt: !383)
!383 = distinct !DILocation(line: 402, column: 27, scope: !297)
!384 = !DILocation(line: 235, column: 13, scope: !385, inlinedAt: !383)
!385 = distinct !DILexicalBlock(scope: !375, file: !360, line: 235, column: 9)
!386 = !DILocation(line: 235, column: 19, scope: !385, inlinedAt: !383)
!387 = !DILocation(line: 235, column: 17, scope: !385, inlinedAt: !383)
!388 = !DILocation(line: 235, column: 9, scope: !375, inlinedAt: !383)
!389 = !DILocation(line: 405, column: 5, scope: !297)
!390 = !DILocation(line: 405, column: 23, scope: !297)
!391 = !DILocation(line: 406, column: 5, scope: !297)
!392 = !DILocation(line: 406, column: 23, scope: !297)
!393 = !DILocation(line: 409, column: 29, scope: !394)
!394 = distinct !DILexicalBlock(scope: !297, file: !3, line: 409, column: 9)
!395 = !DILocation(line: 409, column: 9, scope: !297)
!396 = !DILocalVariable(name: "ctx", arg: 1, scope: !397, file: !398, line: 29, type: !61)
!397 = distinct !DISubprogram(name: "xdpcap_exit", scope: !398, file: !398, line: 29, type: !399, scopeLine: 29, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !401)
!398 = !DIFile(filename: "./hook.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!399 = !DISubroutineType(types: !400)
!400 = !{!5, !61, !53, !5}
!401 = !{!396, !402, !403}
!402 = !DILocalVariable(name: "hook_map", arg: 2, scope: !397, file: !398, line: 29, type: !53)
!403 = !DILocalVariable(name: "action", arg: 3, scope: !397, file: !398, line: 29, type: !5)
!404 = !DILocation(line: 0, scope: !397, inlinedAt: !405)
!405 = distinct !DILocation(line: 410, column: 16, scope: !394)
!406 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !405)
!407 = !DILocation(line: 410, column: 9, scope: !394)
!408 = !DILocation(line: 400, column: 26, scope: !297)
!409 = !DILocation(line: 412, column: 20, scope: !297)
!410 = !{!411, !412, i64 12}
!411 = !{!"ethhdr", !350, i64 0, !350, i64 6, !412, i64 12}
!412 = !{!"short", !350, i64 0}
!413 = !DILocation(line: 413, column: 9, scope: !297)
!414 = !DILocation(line: 415, column: 14, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 415, column: 13)
!416 = distinct !DILexicalBlock(scope: !417, file: !3, line: 414, column: 5)
!417 = distinct !DILexicalBlock(scope: !297, file: !3, line: 413, column: 9)
!418 = !DILocation(line: 415, column: 13, scope: !416)
!419 = !DILocation(line: 0, scope: !397, inlinedAt: !420)
!420 = distinct !DILocation(line: 416, column: 20, scope: !415)
!421 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !420)
!422 = !DILocation(line: 416, column: 13, scope: !415)
!423 = !DILocation(line: 418, column: 15, scope: !416)
!424 = !DILocation(line: 418, column: 25, scope: !416)
!425 = !{!426, !349, i64 0}
!426 = !{!"lpm_key_v4", !349, i64 0, !349, i64 4}
!427 = !DILocation(line: 419, column: 27, scope: !416)
!428 = !{!429, !349, i64 16}
!429 = !{!"iphdr", !350, i64 0, !350, i64 0, !350, i64 1, !412, i64 2, !412, i64 4, !412, i64 6, !350, i64 8, !350, i64 9, !412, i64 10, !349, i64 12, !349, i64 16}
!430 = !DILocation(line: 419, column: 15, scope: !416)
!431 = !DILocation(line: 419, column: 20, scope: !416)
!432 = !{!426, !349, i64 4}
!433 = !DILocation(line: 421, column: 14, scope: !416)
!434 = !DILocation(line: 422, column: 13, scope: !435)
!435 = distinct !DILexicalBlock(scope: !416, file: !3, line: 422, column: 13)
!436 = !DILocation(line: 422, column: 13, scope: !416)
!437 = !DILocation(line: 425, column: 25, scope: !438)
!438 = distinct !DILexicalBlock(scope: !435, file: !3, line: 423, column: 9)
!439 = !{!440, !349, i64 44}
!440 = !{!"transit_behavior", !441, i64 0, !441, i64 16, !349, i64 32, !349, i64 36, !349, i64 40, !349, i64 44, !350, i64 48}
!441 = !{!"in6_addr", !350, i64 0}
!442 = !DILocation(line: 425, column: 13, scope: !438)
!443 = !DILocation(line: 428, column: 92, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !3, line: 426, column: 13)
!445 = !{!429, !412, i64 2}
!446 = !DILocation(line: 428, column: 55, scope: !444)
!447 = !DILocation(line: 0, scope: !397, inlinedAt: !448)
!448 = distinct !DILocation(line: 428, column: 24, scope: !444)
!449 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !448)
!450 = !DILocation(line: 428, column: 17, scope: !444)
!451 = !DILocalVariable(name: "xdp", arg: 1, scope: !452, file: !3, line: 156, type: !61)
!452 = distinct !DISubprogram(name: "transit_gtp4_encap", scope: !3, file: !3, line: 156, type: !453, scopeLine: 157, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !455)
!453 = !DISubroutineType(types: !454)
!454 = !{!60, !61, !213}
!455 = !{!451, !456, !457, !458, !459, !460, !461, !462, !463, !478, !479, !480, !481, !482, !483, !484, !492, !493, !494, !509, !510, !511, !512, !513, !514, !515, !516}
!456 = !DILocalVariable(name: "tb", arg: 2, scope: !452, file: !3, line: 156, type: !213)
!457 = !DILocalVariable(name: "data", scope: !452, file: !3, line: 159, type: !53)
!458 = !DILocalVariable(name: "data_end", scope: !452, file: !3, line: 160, type: !53)
!459 = !DILocalVariable(name: "iph", scope: !452, file: !3, line: 161, type: !313)
!460 = !DILocalVariable(name: "type", scope: !452, file: !3, line: 162, type: !79)
!461 = !DILocalVariable(name: "tid", scope: !452, file: !3, line: 163, type: !65)
!462 = !DILocalVariable(name: "v6h", scope: !452, file: !3, line: 165, type: !328)
!463 = !DILocalVariable(name: "srh", scope: !452, file: !3, line: 166, type: !464)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!465 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "srhhdr", file: !166, line: 61, size: 64, elements: !466)
!466 = !{!467, !468, !469, !470, !471, !472, !473, !474}
!467 = !DIDerivedType(tag: DW_TAG_member, name: "nextHdr", scope: !465, file: !166, line: 63, baseType: !79, size: 8)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "hdrExtLen", scope: !465, file: !166, line: 64, baseType: !79, size: 8, offset: 8)
!469 = !DIDerivedType(tag: DW_TAG_member, name: "routingType", scope: !465, file: !166, line: 65, baseType: !79, size: 8, offset: 16)
!470 = !DIDerivedType(tag: DW_TAG_member, name: "segmentsLeft", scope: !465, file: !166, line: 66, baseType: !79, size: 8, offset: 24)
!471 = !DIDerivedType(tag: DW_TAG_member, name: "lastEntry", scope: !465, file: !166, line: 67, baseType: !79, size: 8, offset: 32)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !465, file: !166, line: 68, baseType: !79, size: 8, offset: 40)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "tag", scope: !465, file: !166, line: 69, baseType: !55, size: 16, offset: 48)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "segments", scope: !465, file: !166, line: 72, baseType: !475, offset: 64)
!475 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, elements: !476)
!476 = !{!477}
!477 = !DISubrange(count: 0)
!478 = !DILocalVariable(name: "srh_len", scope: !452, file: !3, line: 167, type: !79)
!479 = !DILocalVariable(name: "decap_len", scope: !452, file: !3, line: 168, type: !55)
!480 = !DILocalVariable(name: "encap_len", scope: !452, file: !3, line: 168, type: !55)
!481 = !DILocalVariable(name: "innerlen", scope: !452, file: !3, line: 169, type: !55)
!482 = !DILocalVariable(name: "outer_saddr", scope: !452, file: !3, line: 170, type: !65)
!483 = !DILocalVariable(name: "outer_daddr", scope: !452, file: !3, line: 170, type: !65)
!484 = !DILocalVariable(name: "gtp1h", scope: !452, file: !3, line: 178, type: !485)
!485 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !486, size: 64)
!486 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "gtp1hdr", file: !166, line: 76, size: 64, elements: !487)
!487 = !{!488, !489, !490, !491}
!488 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !486, file: !166, line: 84, baseType: !79, size: 8)
!489 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !486, file: !166, line: 85, baseType: !79, size: 8, offset: 8)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !486, file: !166, line: 86, baseType: !55, size: 16, offset: 16)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "tid", scope: !486, file: !166, line: 87, baseType: !65, size: 32, offset: 32)
!492 = !DILocalVariable(name: "seg_len", scope: !452, file: !3, line: 207, type: !65)
!493 = !DILocalVariable(name: "new_eth", scope: !452, file: !3, line: 222, type: !305)
!494 = !DILocalVariable(name: "args", scope: !452, file: !3, line: 243, type: !495)
!495 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "args_mob_session", file: !166, line: 97, size: 40, elements: !496)
!496 = !{!497, !498, !499, !500}
!497 = !DIDerivedType(tag: DW_TAG_member, name: "qfi", scope: !495, file: !166, line: 99, baseType: !79, size: 6, flags: DIFlagBitField, extraData: i64 0)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !495, file: !166, line: 100, baseType: !79, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!499 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !495, file: !166, line: 101, baseType: !79, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "session", scope: !495, file: !166, line: 111, baseType: !501, size: 32, offset: 8)
!501 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !495, file: !166, line: 103, size: 32, elements: !502)
!502 = !{!503, !504}
!503 = !DIDerivedType(tag: DW_TAG_member, name: "pdu_session_id", scope: !501, file: !166, line: 105, baseType: !65, size: 32)
!504 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !501, file: !166, line: 110, baseType: !505, size: 32)
!505 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "seq", file: !166, line: 106, size: 32, elements: !506)
!506 = !{!507, !508}
!507 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !505, file: !166, line: 108, baseType: !55, size: 16)
!508 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !505, file: !166, line: 109, baseType: !55, size: 16, offset: 16)
!509 = !DILocalVariable(name: "s_offset", scope: !452, file: !3, line: 244, type: !55)
!510 = !DILocalVariable(name: "s_shift", scope: !452, file: !3, line: 244, type: !55)
!511 = !DILocalVariable(name: "d_offset", scope: !452, file: !3, line: 244, type: !55)
!512 = !DILocalVariable(name: "d_shift", scope: !452, file: !3, line: 244, type: !55)
!513 = !DILocalVariable(name: "src_p", scope: !452, file: !3, line: 258, type: !96)
!514 = !DILocalVariable(name: "dst_p", scope: !452, file: !3, line: 258, type: !96)
!515 = !DILocalVariable(name: "args_p", scope: !452, file: !3, line: 258, type: !96)
!516 = !DILocalVariable(name: "i", scope: !517, file: !3, line: 286, type: !55)
!517 = distinct !DILexicalBlock(scope: !452, file: !3, line: 286, column: 5)
!518 = !DILocation(line: 0, scope: !452, inlinedAt: !519)
!519 = distinct !DILocation(line: 431, column: 55, scope: !444)
!520 = !DILocation(line: 159, column: 46, scope: !452, inlinedAt: !519)
!521 = !DILocation(line: 159, column: 26, scope: !452, inlinedAt: !519)
!522 = !DILocation(line: 159, column: 18, scope: !452, inlinedAt: !519)
!523 = !DILocation(line: 160, column: 50, scope: !452, inlinedAt: !519)
!524 = !DILocation(line: 0, scope: !359, inlinedAt: !525)
!525 = distinct !DILocation(line: 161, column: 25, scope: !452, inlinedAt: !519)
!526 = !DILocation(line: 244, column: 30, scope: !359, inlinedAt: !525)
!527 = !DILocation(line: 247, column: 13, scope: !370, inlinedAt: !525)
!528 = !DILocation(line: 247, column: 19, scope: !370, inlinedAt: !525)
!529 = !DILocation(line: 247, column: 17, scope: !370, inlinedAt: !525)
!530 = !DILocation(line: 247, column: 9, scope: !359, inlinedAt: !525)
!531 = !DILocation(line: 170, column: 5, scope: !452, inlinedAt: !519)
!532 = !DILocation(line: 171, column: 10, scope: !533, inlinedAt: !519)
!533 = distinct !DILexicalBlock(scope: !452, file: !3, line: 171, column: 9)
!534 = !DILocation(line: 171, column: 9, scope: !452, inlinedAt: !519)
!535 = !DILocation(line: 160, column: 22, scope: !452, inlinedAt: !519)
!536 = !DILocation(line: 175, column: 14, scope: !537, inlinedAt: !519)
!537 = distinct !DILexicalBlock(scope: !452, file: !3, line: 175, column: 9)
!538 = !{!429, !350, i64 9}
!539 = !DILocation(line: 175, column: 23, scope: !537, inlinedAt: !519)
!540 = !DILocation(line: 175, column: 9, scope: !452, inlinedAt: !519)
!541 = !DILocation(line: 182, column: 43, scope: !452, inlinedAt: !519)
!542 = !DILocation(line: 182, column: 5, scope: !452, inlinedAt: !519)
!543 = !DILocation(line: 183, column: 43, scope: !452, inlinedAt: !519)
!544 = !DILocation(line: 183, column: 5, scope: !452, inlinedAt: !519)
!545 = !DILocation(line: 188, column: 18, scope: !452, inlinedAt: !519)
!546 = !{!547, !349, i64 4}
!547 = !{!"gtp1hdr", !350, i64 0, !350, i64 1, !412, i64 2, !349, i64 4}
!548 = !DILocation(line: 189, column: 19, scope: !452, inlinedAt: !519)
!549 = !{!547, !350, i64 1}
!550 = !DILocation(line: 190, column: 16, scope: !452, inlinedAt: !519)
!551 = !{!547, !412, i64 2}
!552 = !DILocation(line: 192, column: 14, scope: !553, inlinedAt: !519)
!553 = distinct !DILexicalBlock(scope: !452, file: !3, line: 192, column: 9)
!554 = !DILocation(line: 192, column: 9, scope: !452, inlinedAt: !519)
!555 = !DILocation(line: 195, column: 13, scope: !556, inlinedAt: !519)
!556 = distinct !DILexicalBlock(scope: !452, file: !3, line: 195, column: 9)
!557 = !{!440, !349, i64 32}
!558 = !DILocation(line: 195, column: 25, scope: !556, inlinedAt: !519)
!559 = !DILocation(line: 195, column: 30, scope: !556, inlinedAt: !519)
!560 = !DILocation(line: 195, column: 37, scope: !556, inlinedAt: !519)
!561 = !{!440, !349, i64 36}
!562 = !DILocation(line: 195, column: 54, scope: !556, inlinedAt: !519)
!563 = !DILocation(line: 207, column: 25, scope: !452, inlinedAt: !519)
!564 = !{!440, !349, i64 40}
!565 = !DILocation(line: 207, column: 40, scope: !452, inlinedAt: !519)
!566 = !DILocation(line: 208, column: 66, scope: !452, inlinedAt: !519)
!567 = !DILocation(line: 208, column: 64, scope: !452, inlinedAt: !519)
!568 = !DILocation(line: 208, column: 37, scope: !452, inlinedAt: !519)
!569 = !DILocation(line: 211, column: 23, scope: !452, inlinedAt: !519)
!570 = !DILocation(line: 213, column: 9, scope: !571, inlinedAt: !519)
!571 = distinct !DILexicalBlock(scope: !452, file: !3, line: 213, column: 9)
!572 = !DILocation(line: 213, column: 9, scope: !452, inlinedAt: !519)
!573 = !DILocation(line: 210, column: 42, scope: !452, inlinedAt: !519)
!574 = !DILocation(line: 210, column: 40, scope: !452, inlinedAt: !519)
!575 = !DILocation(line: 216, column: 36, scope: !576, inlinedAt: !519)
!576 = distinct !DILexicalBlock(scope: !452, file: !3, line: 216, column: 9)
!577 = !DILocation(line: 216, column: 9, scope: !576, inlinedAt: !519)
!578 = !DILocation(line: 216, column: 9, scope: !452, inlinedAt: !519)
!579 = !DILocation(line: 219, column: 31, scope: !452, inlinedAt: !519)
!580 = !DILocation(line: 219, column: 20, scope: !452, inlinedAt: !519)
!581 = !DILocation(line: 220, column: 35, scope: !452, inlinedAt: !519)
!582 = !DILocation(line: 220, column: 24, scope: !452, inlinedAt: !519)
!583 = !DILocation(line: 220, column: 16, scope: !452, inlinedAt: !519)
!584 = !DILocation(line: 223, column: 32, scope: !585, inlinedAt: !519)
!585 = distinct !DILexicalBlock(scope: !452, file: !3, line: 223, column: 9)
!586 = !DILocation(line: 223, column: 9, scope: !585, inlinedAt: !519)
!587 = !DILocation(line: 223, column: 57, scope: !585, inlinedAt: !519)
!588 = !DILocation(line: 223, column: 9, scope: !452, inlinedAt: !519)
!589 = !DILocation(line: 222, column: 30, scope: !452, inlinedAt: !519)
!590 = !DILocation(line: 219, column: 12, scope: !452, inlinedAt: !519)
!591 = !DILocation(line: 226, column: 14, scope: !452, inlinedAt: !519)
!592 = !DILocation(line: 226, column: 22, scope: !452, inlinedAt: !519)
!593 = !DILocation(line: 228, column: 24, scope: !452, inlinedAt: !519)
!594 = !DILocation(line: 228, column: 11, scope: !452, inlinedAt: !519)
!595 = !DILocation(line: 229, column: 47, scope: !596, inlinedAt: !519)
!596 = distinct !DILexicalBlock(scope: !452, file: !3, line: 229, column: 9)
!597 = !DILocation(line: 229, column: 73, scope: !596, inlinedAt: !519)
!598 = !DILocation(line: 229, column: 9, scope: !452, inlinedAt: !519)
!599 = !DILocation(line: 232, column: 10, scope: !452, inlinedAt: !519)
!600 = !DILocation(line: 232, column: 18, scope: !452, inlinedAt: !519)
!601 = !DILocation(line: 233, column: 10, scope: !452, inlinedAt: !519)
!602 = !DILocation(line: 233, column: 19, scope: !452, inlinedAt: !519)
!603 = !DILocation(line: 234, column: 10, scope: !452, inlinedAt: !519)
!604 = !DILocation(line: 234, column: 18, scope: !452, inlinedAt: !519)
!605 = !{!606, !350, i64 6}
!606 = !{!"ipv6hdr", !350, i64 0, !350, i64 0, !350, i64 1, !412, i64 4, !350, i64 6, !350, i64 7, !441, i64 8, !441, i64 24}
!607 = !DILocation(line: 235, column: 10, scope: !452, inlinedAt: !519)
!608 = !DILocation(line: 235, column: 20, scope: !452, inlinedAt: !519)
!609 = !{!606, !350, i64 7}
!610 = !DILocation(line: 236, column: 10, scope: !452, inlinedAt: !519)
!611 = !DILocation(line: 236, column: 22, scope: !452, inlinedAt: !519)
!612 = !{!606, !412, i64 4}
!613 = !DILocation(line: 237, column: 28, scope: !452, inlinedAt: !519)
!614 = !DILocation(line: 237, column: 5, scope: !452, inlinedAt: !519)
!615 = !DILocation(line: 238, column: 21, scope: !616, inlinedAt: !519)
!616 = distinct !DILexicalBlock(scope: !452, file: !3, line: 238, column: 9)
!617 = !DILocation(line: 241, column: 28, scope: !452, inlinedAt: !519)
!618 = !DILocation(line: 241, column: 5, scope: !452, inlinedAt: !519)
!619 = !DILocation(line: 241, column: 40, scope: !452, inlinedAt: !519)
!620 = !DILocation(line: 241, column: 36, scope: !452, inlinedAt: !519)
!621 = !DILocation(line: 243, column: 5, scope: !452, inlinedAt: !519)
!622 = !DILocation(line: 243, column: 29, scope: !452, inlinedAt: !519)
!623 = !DILocation(line: 246, column: 20, scope: !452, inlinedAt: !519)
!624 = !DILocation(line: 246, column: 32, scope: !452, inlinedAt: !519)
!625 = !DILocation(line: 246, column: 16, scope: !452, inlinedAt: !519)
!626 = !DILocation(line: 247, column: 15, scope: !452, inlinedAt: !519)
!627 = !DILocation(line: 248, column: 20, scope: !452, inlinedAt: !519)
!628 = !DILocation(line: 248, column: 32, scope: !452, inlinedAt: !519)
!629 = !DILocation(line: 248, column: 16, scope: !452, inlinedAt: !519)
!630 = !DILocation(line: 249, column: 15, scope: !452, inlinedAt: !519)
!631 = !DILocation(line: 253, column: 12, scope: !452, inlinedAt: !519)
!632 = !DILocation(line: 255, column: 18, scope: !452, inlinedAt: !519)
!633 = !DILocation(line: 255, column: 33, scope: !452, inlinedAt: !519)
!634 = !{!350, !350, i64 0}
!635 = !DILocalVariable(name: "v6addr", arg: 1, scope: !636, file: !360, line: 104, type: !71)
!636 = distinct !DISubprogram(name: "write_v6addr_in_pyload", scope: !360, file: !360, line: 103, type: !637, scopeLine: 105, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !641)
!637 = !DISubroutineType(types: !638)
!638 = !{null, !71, !96, !55, !55, !55, !639}
!639 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !640, size: 64)
!640 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !65)
!641 = !{!635, !642, !643, !644, !645, !646, !647, !651, !654}
!642 = !DILocalVariable(name: "payload", arg: 2, scope: !636, file: !360, line: 104, type: !96)
!643 = !DILocalVariable(name: "payload_size", arg: 3, scope: !636, file: !360, line: 104, type: !55)
!644 = !DILocalVariable(name: "offset", arg: 4, scope: !636, file: !360, line: 104, type: !55)
!645 = !DILocalVariable(name: "shift", arg: 5, scope: !636, file: !360, line: 104, type: !55)
!646 = !DILocalVariable(name: "data_end", arg: 6, scope: !636, file: !360, line: 104, type: !639)
!647 = !DILocalVariable(name: "index", scope: !648, file: !360, line: 123, type: !55)
!648 = distinct !DILexicalBlock(scope: !649, file: !360, line: 123, column: 9)
!649 = distinct !DILexicalBlock(scope: !650, file: !360, line: 121, column: 5)
!650 = distinct !DILexicalBlock(scope: !636, file: !360, line: 113, column: 9)
!651 = !DILocalVariable(name: "v6val1", scope: !652, file: !360, line: 130, type: !96)
!652 = distinct !DILexicalBlock(scope: !653, file: !360, line: 124, column: 9)
!653 = distinct !DILexicalBlock(scope: !648, file: !360, line: 123, column: 9)
!654 = !DILocalVariable(name: "v6val2", scope: !652, file: !360, line: 131, type: !96)
!655 = !DILocation(line: 0, scope: !636, inlinedAt: !656)
!656 = distinct !DILocation(line: 263, column: 5, scope: !452, inlinedAt: !519)
!657 = !DILocation(line: 106, column: 21, scope: !636, inlinedAt: !656)
!658 = !DILocation(line: 108, column: 36, scope: !659, inlinedAt: !656)
!659 = distinct !DILexicalBlock(scope: !636, file: !360, line: 108, column: 9)
!660 = !DILocation(line: 108, column: 43, scope: !659, inlinedAt: !656)
!661 = !DILocation(line: 113, column: 9, scope: !650, inlinedAt: !656)
!662 = !DILocation(line: 113, column: 15, scope: !650, inlinedAt: !656)
!663 = !DILocation(line: 0, scope: !650, inlinedAt: !656)
!664 = !DILocation(line: 113, column: 9, scope: !636, inlinedAt: !656)
!665 = !DILocation(line: 0, scope: !648, inlinedAt: !656)
!666 = !DILocation(line: 0, scope: !667, inlinedAt: !656)
!667 = distinct !DILexicalBlock(scope: !668, file: !360, line: 133, column: 13)
!668 = distinct !DILexicalBlock(scope: !652, file: !360, line: 132, column: 17)
!669 = !DILocation(line: 123, column: 9, scope: !648, inlinedAt: !656)
!670 = !DILocation(line: 115, column: 37, scope: !671, inlinedAt: !656)
!671 = distinct !DILexicalBlock(scope: !672, file: !360, line: 115, column: 13)
!672 = distinct !DILexicalBlock(scope: !650, file: !360, line: 114, column: 5)
!673 = !DILocation(line: 115, column: 52, scope: !671, inlinedAt: !656)
!674 = !DILocation(line: 115, column: 13, scope: !672, inlinedAt: !656)
!675 = !DILocation(line: 118, column: 35, scope: !672, inlinedAt: !656)
!676 = !DILocation(line: 118, column: 41, scope: !672, inlinedAt: !656)
!677 = !DILocation(line: 118, column: 27, scope: !672, inlinedAt: !656)
!678 = !DILocation(line: 118, column: 9, scope: !672, inlinedAt: !656)
!679 = !DILocation(line: 119, column: 5, scope: !672, inlinedAt: !656)
!680 = !DILocation(line: 130, column: 60, scope: !652, inlinedAt: !656)
!681 = !DILocation(line: 0, scope: !652, inlinedAt: !656)
!682 = !DILocation(line: 131, column: 68, scope: !652, inlinedAt: !656)
!683 = !DILocation(line: 132, column: 28, scope: !668, inlinedAt: !656)
!684 = !DILocation(line: 132, column: 40, scope: !668, inlinedAt: !656)
!685 = !DILocation(line: 134, column: 28, scope: !667, inlinedAt: !656)
!686 = !DILocation(line: 134, column: 43, scope: !667, inlinedAt: !656)
!687 = !DILocation(line: 134, column: 25, scope: !667, inlinedAt: !656)
!688 = !DILocation(line: 135, column: 43, scope: !667, inlinedAt: !656)
!689 = !DILocation(line: 135, column: 25, scope: !667, inlinedAt: !656)
!690 = !DILocation(line: 123, column: 69, scope: !653, inlinedAt: !656)
!691 = distinct !{!691, !669, !692, !693}
!692 = !DILocation(line: 139, column: 9, scope: !648, inlinedAt: !656)
!693 = !{!"llvm.loop.unroll.disable"}
!694 = !DILocation(line: 266, column: 72, scope: !695, inlinedAt: !519)
!695 = distinct !DILexicalBlock(scope: !452, file: !3, line: 266, column: 9)
!696 = !DILocation(line: 266, column: 97, scope: !695, inlinedAt: !519)
!697 = !DILocation(line: 266, column: 9, scope: !452, inlinedAt: !519)
!698 = !DILocation(line: 269, column: 18, scope: !452, inlinedAt: !519)
!699 = !{!700, !350, i64 0}
!700 = !{!"srhhdr", !350, i64 0, !350, i64 1, !350, i64 2, !350, i64 3, !350, i64 4, !350, i64 5, !412, i64 6, !350, i64 8}
!701 = !DILocation(line: 270, column: 32, scope: !452, inlinedAt: !519)
!702 = !DILocation(line: 270, column: 37, scope: !452, inlinedAt: !519)
!703 = !DILocation(line: 270, column: 10, scope: !452, inlinedAt: !519)
!704 = !DILocation(line: 270, column: 20, scope: !452, inlinedAt: !519)
!705 = !{!700, !350, i64 1}
!706 = !DILocation(line: 271, column: 10, scope: !452, inlinedAt: !519)
!707 = !DILocation(line: 271, column: 22, scope: !452, inlinedAt: !519)
!708 = !{!700, !350, i64 2}
!709 = !DILocation(line: 272, column: 25, scope: !452, inlinedAt: !519)
!710 = !DILocation(line: 272, column: 10, scope: !452, inlinedAt: !519)
!711 = !DILocation(line: 272, column: 23, scope: !452, inlinedAt: !519)
!712 = !{!700, !350, i64 3}
!713 = !DILocation(line: 273, column: 10, scope: !452, inlinedAt: !519)
!714 = !DILocation(line: 273, column: 20, scope: !452, inlinedAt: !519)
!715 = !{!700, !350, i64 4}
!716 = !DILocation(line: 274, column: 10, scope: !452, inlinedAt: !519)
!717 = !DILocation(line: 274, column: 16, scope: !452, inlinedAt: !519)
!718 = !{!700, !350, i64 5}
!719 = !DILocation(line: 275, column: 10, scope: !452, inlinedAt: !519)
!720 = !DILocation(line: 275, column: 14, scope: !452, inlinedAt: !519)
!721 = !{!700, !412, i64 6}
!722 = !DILocation(line: 276, column: 122, scope: !723, inlinedAt: !519)
!723 = distinct !DILexicalBlock(scope: !452, file: !3, line: 276, column: 9)
!724 = !DILocation(line: 276, column: 127, scope: !723, inlinedAt: !519)
!725 = !DILocation(line: 276, column: 9, scope: !452, inlinedAt: !519)
!726 = !DILocation(line: 279, column: 5, scope: !452, inlinedAt: !519)
!727 = !DILocation(line: 280, column: 28, scope: !452, inlinedAt: !519)
!728 = !DILocation(line: 280, column: 23, scope: !452, inlinedAt: !519)
!729 = !DILocation(line: 280, column: 46, scope: !452, inlinedAt: !519)
!730 = !DILocation(line: 280, column: 5, scope: !452, inlinedAt: !519)
!731 = !DILocation(line: 0, scope: !636, inlinedAt: !732)
!732 = distinct !DILocation(line: 281, column: 5, scope: !452, inlinedAt: !519)
!733 = !DILocation(line: 106, column: 21, scope: !636, inlinedAt: !732)
!734 = !DILocation(line: 108, column: 36, scope: !659, inlinedAt: !732)
!735 = !DILocation(line: 108, column: 43, scope: !659, inlinedAt: !732)
!736 = !DILocation(line: 113, column: 15, scope: !650, inlinedAt: !732)
!737 = !DILocation(line: 0, scope: !650, inlinedAt: !732)
!738 = !DILocation(line: 113, column: 9, scope: !636, inlinedAt: !732)
!739 = !DILocation(line: 0, scope: !648, inlinedAt: !732)
!740 = !DILocation(line: 0, scope: !667, inlinedAt: !732)
!741 = !DILocation(line: 123, column: 9, scope: !648, inlinedAt: !732)
!742 = !DILocation(line: 115, column: 37, scope: !671, inlinedAt: !732)
!743 = !DILocation(line: 115, column: 52, scope: !671, inlinedAt: !732)
!744 = !DILocation(line: 115, column: 13, scope: !672, inlinedAt: !732)
!745 = !DILocation(line: 118, column: 35, scope: !672, inlinedAt: !732)
!746 = !DILocation(line: 118, column: 41, scope: !672, inlinedAt: !732)
!747 = !DILocation(line: 118, column: 27, scope: !672, inlinedAt: !732)
!748 = !DILocation(line: 118, column: 9, scope: !672, inlinedAt: !732)
!749 = !DILocation(line: 119, column: 5, scope: !672, inlinedAt: !732)
!750 = !DILocation(line: 130, column: 60, scope: !652, inlinedAt: !732)
!751 = !DILocation(line: 0, scope: !652, inlinedAt: !732)
!752 = !DILocation(line: 131, column: 68, scope: !652, inlinedAt: !732)
!753 = !DILocation(line: 132, column: 28, scope: !668, inlinedAt: !732)
!754 = !DILocation(line: 132, column: 40, scope: !668, inlinedAt: !732)
!755 = !DILocation(line: 134, column: 28, scope: !667, inlinedAt: !732)
!756 = !DILocation(line: 134, column: 43, scope: !667, inlinedAt: !732)
!757 = !DILocation(line: 134, column: 25, scope: !667, inlinedAt: !732)
!758 = !DILocation(line: 135, column: 28, scope: !667, inlinedAt: !732)
!759 = !DILocation(line: 135, column: 43, scope: !667, inlinedAt: !732)
!760 = !DILocation(line: 135, column: 25, scope: !667, inlinedAt: !732)
!761 = !DILocation(line: 123, column: 69, scope: !653, inlinedAt: !732)
!762 = distinct !{!762, !741, !763, !693}
!763 = !DILocation(line: 139, column: 9, scope: !648, inlinedAt: !732)
!764 = !DILocation(line: 282, column: 14, scope: !452, inlinedAt: !519)
!765 = !DILocation(line: 0, scope: !636, inlinedAt: !766)
!766 = distinct !DILocation(line: 283, column: 5, scope: !452, inlinedAt: !519)
!767 = !DILocation(line: 106, column: 21, scope: !636, inlinedAt: !766)
!768 = !DILocation(line: 108, column: 36, scope: !659, inlinedAt: !766)
!769 = !DILocation(line: 108, column: 43, scope: !659, inlinedAt: !766)
!770 = !DILocation(line: 113, column: 15, scope: !650, inlinedAt: !766)
!771 = !DILocation(line: 0, scope: !650, inlinedAt: !766)
!772 = !DILocation(line: 113, column: 9, scope: !636, inlinedAt: !766)
!773 = !DILocation(line: 0, scope: !648, inlinedAt: !766)
!774 = !DILocation(line: 0, scope: !667, inlinedAt: !766)
!775 = !DILocation(line: 123, column: 9, scope: !648, inlinedAt: !766)
!776 = !DILocation(line: 115, column: 37, scope: !671, inlinedAt: !766)
!777 = !DILocation(line: 115, column: 52, scope: !671, inlinedAt: !766)
!778 = !DILocation(line: 115, column: 13, scope: !672, inlinedAt: !766)
!779 = !DILocation(line: 118, column: 35, scope: !672, inlinedAt: !766)
!780 = !DILocation(line: 118, column: 41, scope: !672, inlinedAt: !766)
!781 = !DILocation(line: 118, column: 27, scope: !672, inlinedAt: !766)
!782 = !DILocation(line: 118, column: 9, scope: !672, inlinedAt: !766)
!783 = !DILocation(line: 119, column: 5, scope: !672, inlinedAt: !766)
!784 = !DILocation(line: 130, column: 60, scope: !652, inlinedAt: !766)
!785 = !DILocation(line: 0, scope: !652, inlinedAt: !766)
!786 = !DILocation(line: 131, column: 68, scope: !652, inlinedAt: !766)
!787 = !DILocation(line: 132, column: 28, scope: !668, inlinedAt: !766)
!788 = !DILocation(line: 132, column: 40, scope: !668, inlinedAt: !766)
!789 = !DILocation(line: 134, column: 28, scope: !667, inlinedAt: !766)
!790 = !DILocation(line: 134, column: 43, scope: !667, inlinedAt: !766)
!791 = !DILocation(line: 134, column: 25, scope: !667, inlinedAt: !766)
!792 = !DILocation(line: 135, column: 28, scope: !667, inlinedAt: !766)
!793 = !DILocation(line: 135, column: 43, scope: !667, inlinedAt: !766)
!794 = !DILocation(line: 135, column: 25, scope: !667, inlinedAt: !766)
!795 = !DILocation(line: 123, column: 69, scope: !653, inlinedAt: !766)
!796 = distinct !{!796, !775, !797, !693}
!797 = !DILocation(line: 139, column: 9, scope: !648, inlinedAt: !766)
!798 = !DILocation(line: 0, scope: !517, inlinedAt: !519)
!799 = !DILocation(line: 286, column: 5, scope: !517, inlinedAt: !519)
!800 = !DILocation(line: 0, scope: !801, inlinedAt: !519)
!801 = distinct !DILexicalBlock(scope: !802, file: !3, line: 292, column: 13)
!802 = distinct !DILexicalBlock(scope: !803, file: !3, line: 287, column: 5)
!803 = distinct !DILexicalBlock(scope: !517, file: !3, line: 286, column: 5)
!804 = !DILocation(line: 292, column: 126, scope: !801, inlinedAt: !519)
!805 = !DILocation(line: 292, column: 136, scope: !801, inlinedAt: !519)
!806 = !DILocation(line: 292, column: 141, scope: !801, inlinedAt: !519)
!807 = !DILocation(line: 292, column: 13, scope: !802, inlinedAt: !519)
!808 = !DILocation(line: 295, column: 27, scope: !802, inlinedAt: !519)
!809 = !DILocation(line: 295, column: 9, scope: !802, inlinedAt: !519)
!810 = !DILocation(line: 295, column: 61, scope: !802, inlinedAt: !519)
!811 = !DILocation(line: 295, column: 46, scope: !802, inlinedAt: !519)
!812 = !DILocation(line: 286, column: 42, scope: !803, inlinedAt: !519)
!813 = !DILocation(line: 286, column: 23, scope: !803, inlinedAt: !519)
!814 = !DILocation(line: 286, column: 25, scope: !803, inlinedAt: !519)
!815 = distinct !{!815, !799, !816, !693}
!816 = !DILocation(line: 296, column: 5, scope: !517, inlinedAt: !519)
!817 = !DILocation(line: 298, column: 12, scope: !452, inlinedAt: !519)
!818 = !DILocation(line: 298, column: 5, scope: !452, inlinedAt: !519)
!819 = !DILocation(line: 299, column: 1, scope: !452, inlinedAt: !519)
!820 = !DILocation(line: 0, scope: !397, inlinedAt: !821)
!821 = distinct !DILocation(line: 431, column: 24, scope: !444)
!822 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !821)
!823 = !DILocation(line: 431, column: 17, scope: !444)
!824 = !DILocation(line: 437, column: 14, scope: !825)
!825 = distinct !DILexicalBlock(scope: !826, file: !3, line: 437, column: 13)
!826 = distinct !DILexicalBlock(scope: !827, file: !3, line: 436, column: 5)
!827 = distinct !DILexicalBlock(scope: !417, file: !3, line: 435, column: 14)
!828 = !DILocation(line: 437, column: 13, scope: !826)
!829 = !DILocation(line: 0, scope: !397, inlinedAt: !830)
!830 = distinct !DILocation(line: 438, column: 20, scope: !825)
!831 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !830)
!832 = !DILocation(line: 438, column: 13, scope: !825)
!833 = !DILocation(line: 440, column: 15, scope: !826)
!834 = !DILocation(line: 440, column: 25, scope: !826)
!835 = !{!836, !349, i64 0}
!836 = !{!"lpm_key_v6", !349, i64 0, !441, i64 4}
!837 = !DILocation(line: 441, column: 15, scope: !826)
!838 = !DILocation(line: 441, column: 27, scope: !826)
!839 = !{i64 0, i64 16, !634, i64 0, i64 16, !634, i64 0, i64 16, !634}
!840 = !DILocation(line: 442, column: 18, scope: !841)
!841 = distinct !DILexicalBlock(scope: !826, file: !3, line: 442, column: 13)
!842 = !DILocation(line: 442, column: 26, scope: !841)
!843 = !DILocation(line: 442, column: 13, scope: !826)
!844 = !DILocation(line: 445, column: 24, scope: !845)
!845 = distinct !DILexicalBlock(scope: !841, file: !3, line: 443, column: 9)
!846 = !DILocation(line: 446, column: 17, scope: !847)
!847 = distinct !DILexicalBlock(scope: !845, file: !3, line: 446, column: 17)
!848 = !DILocation(line: 446, column: 17, scope: !845)
!849 = !DILocation(line: 448, column: 35, scope: !850)
!850 = distinct !DILexicalBlock(scope: !847, file: !3, line: 447, column: 13)
!851 = !{!852, !349, i64 32}
!852 = !{!"end_function", !350, i64 0, !350, i64 16, !349, i64 32, !349, i64 36, !349, i64 40, !349, i64 44}
!853 = !DILocation(line: 448, column: 17, scope: !850)
!854 = !DILocalVariable(name: "xdp", arg: 1, scope: !855, file: !3, line: 13, type: !61)
!855 = distinct !DISubprogram(name: "action_end", scope: !3, file: !3, line: 13, type: !298, scopeLine: 14, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !856)
!856 = !{!854, !857, !858}
!857 = !DILocalVariable(name: "srhdr", scope: !855, file: !3, line: 18, type: !464)
!858 = !DILocalVariable(name: "v6h", scope: !855, file: !3, line: 19, type: !328)
!859 = !DILocation(line: 0, scope: !855, inlinedAt: !860)
!860 = distinct !DILocation(line: 451, column: 59, scope: !861)
!861 = distinct !DILexicalBlock(scope: !850, file: !3, line: 449, column: 17)
!862 = !DILocalVariable(name: "xdp", arg: 1, scope: !863, file: !360, line: 297, type: !61)
!863 = distinct !DISubprogram(name: "get_and_validate_srh", scope: !360, file: !360, line: 297, type: !864, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !866)
!864 = !DISubroutineType(types: !865)
!865 = !{!464, !61}
!866 = !{!862, !867}
!867 = !DILocalVariable(name: "srh", scope: !863, file: !360, line: 299, type: !464)
!868 = !DILocation(line: 0, scope: !863, inlinedAt: !869)
!869 = distinct !DILocation(line: 18, column: 28, scope: !855, inlinedAt: !860)
!870 = !DILocalVariable(name: "xdp", arg: 1, scope: !871, file: !360, line: 253, type: !61)
!871 = distinct !DISubprogram(name: "get_srh", scope: !360, file: !360, line: 253, type: !864, scopeLine: 254, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !872)
!872 = !{!870, !873, !874, !875}
!873 = !DILocalVariable(name: "data", scope: !871, file: !360, line: 255, type: !53)
!874 = !DILocalVariable(name: "data_end", scope: !871, file: !360, line: 256, type: !53)
!875 = !DILocalVariable(name: "srh", scope: !871, file: !360, line: 258, type: !464)
!876 = !DILocation(line: 0, scope: !871, inlinedAt: !877)
!877 = distinct !DILocation(line: 301, column: 11, scope: !863, inlinedAt: !869)
!878 = !DILocation(line: 255, column: 37, scope: !871, inlinedAt: !877)
!879 = !DILocation(line: 255, column: 26, scope: !871, inlinedAt: !877)
!880 = !DILocation(line: 255, column: 18, scope: !871, inlinedAt: !877)
!881 = !DILocation(line: 256, column: 41, scope: !871, inlinedAt: !877)
!882 = !DILocation(line: 256, column: 30, scope: !871, inlinedAt: !877)
!883 = !DILocation(line: 262, column: 13, scope: !884, inlinedAt: !877)
!884 = distinct !DILexicalBlock(scope: !871, file: !360, line: 262, column: 9)
!885 = !DILocation(line: 262, column: 19, scope: !884, inlinedAt: !877)
!886 = !DILocation(line: 262, column: 17, scope: !884, inlinedAt: !877)
!887 = !DILocation(line: 262, column: 9, scope: !871, inlinedAt: !877)
!888 = !DILocation(line: 302, column: 10, scope: !889, inlinedAt: !869)
!889 = distinct !DILexicalBlock(scope: !863, file: !360, line: 302, column: 9)
!890 = !DILocation(line: 302, column: 9, scope: !863, inlinedAt: !869)
!891 = !DILocation(line: 305, column: 14, scope: !892, inlinedAt: !869)
!892 = distinct !DILexicalBlock(scope: !863, file: !360, line: 305, column: 9)
!893 = !DILocation(line: 305, column: 27, scope: !892, inlinedAt: !869)
!894 = !DILocation(line: 0, scope: !375, inlinedAt: !895)
!895 = distinct !DILocation(line: 19, column: 27, scope: !855, inlinedAt: !860)
!896 = !DILocation(line: 235, column: 13, scope: !385, inlinedAt: !895)
!897 = !DILocation(line: 235, column: 19, scope: !385, inlinedAt: !895)
!898 = !DILocation(line: 235, column: 17, scope: !385, inlinedAt: !895)
!899 = !DILocation(line: 235, column: 9, scope: !375, inlinedAt: !895)
!900 = !DILocation(line: 21, column: 10, scope: !901, inlinedAt: !860)
!901 = distinct !DILexicalBlock(scope: !855, file: !3, line: 21, column: 9)
!902 = !DILocation(line: 21, column: 16, scope: !901, inlinedAt: !860)
!903 = !DILocation(line: 24, column: 39, scope: !904, inlinedAt: !860)
!904 = distinct !DILexicalBlock(scope: !855, file: !3, line: 24, column: 9)
!905 = !DILocalVariable(name: "srh", arg: 1, scope: !906, file: !360, line: 317, type: !464)
!906 = distinct !DISubprogram(name: "advance_nextseg", scope: !360, file: !360, line: 317, type: !907, scopeLine: 318, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !911)
!907 = !DISubroutineType(types: !908)
!908 = !{!909, !464, !71, !61}
!909 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !6, line: 79, baseType: !910)
!910 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!911 = !{!905, !912, !913, !914, !915}
!912 = !DILocalVariable(name: "daddr", arg: 2, scope: !906, file: !360, line: 317, type: !71)
!913 = !DILocalVariable(name: "xdp", arg: 3, scope: !906, file: !360, line: 317, type: !61)
!914 = !DILocalVariable(name: "addr", scope: !906, file: !360, line: 319, type: !71)
!915 = !DILocalVariable(name: "data_end", scope: !906, file: !360, line: 320, type: !53)
!916 = !DILocation(line: 0, scope: !906, inlinedAt: !917)
!917 = distinct !DILocation(line: 24, column: 10, scope: !904, inlinedAt: !860)
!918 = !DILocation(line: 320, column: 22, scope: !906, inlinedAt: !917)
!919 = !DILocation(line: 322, column: 10, scope: !906, inlinedAt: !917)
!920 = !DILocation(line: 322, column: 22, scope: !906, inlinedAt: !917)
!921 = !DILocation(line: 323, column: 27, scope: !922, inlinedAt: !917)
!922 = distinct !DILexicalBlock(scope: !906, file: !360, line: 323, column: 9)
!923 = !DILocation(line: 323, column: 80, scope: !922, inlinedAt: !917)
!924 = !DILocation(line: 323, column: 77, scope: !922, inlinedAt: !917)
!925 = !DILocation(line: 323, column: 51, scope: !922, inlinedAt: !917)
!926 = !DILocation(line: 323, column: 103, scope: !922, inlinedAt: !917)
!927 = !DILocation(line: 323, column: 9, scope: !906, inlinedAt: !917)
!928 = !DILocation(line: 326, column: 26, scope: !906, inlinedAt: !917)
!929 = !DILocation(line: 327, column: 14, scope: !930, inlinedAt: !917)
!930 = distinct !DILexicalBlock(scope: !906, file: !360, line: 327, column: 9)
!931 = !DILocation(line: 327, column: 20, scope: !930, inlinedAt: !917)
!932 = !DILocation(line: 327, column: 18, scope: !930, inlinedAt: !917)
!933 = !DILocation(line: 327, column: 9, scope: !906, inlinedAt: !917)
!934 = !DILocation(line: 330, column: 14, scope: !906, inlinedAt: !917)
!935 = !DILocation(line: 27, column: 12, scope: !855, inlinedAt: !860)
!936 = !DILocation(line: 27, column: 5, scope: !855, inlinedAt: !860)
!937 = !DILocation(line: 0, scope: !397, inlinedAt: !938)
!938 = distinct !DILocation(line: 451, column: 28, scope: !861)
!939 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !938)
!940 = !DILocation(line: 451, column: 21, scope: !861)
!941 = !DILocalVariable(name: "xdp", arg: 1, scope: !942, file: !3, line: 59, type: !61)
!942 = distinct !DISubprogram(name: "action_enddx4", scope: !3, file: !3, line: 59, type: !943, scopeLine: 60, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !945)
!943 = !DISubroutineType(types: !944)
!944 = !{!60, !61, !171}
!945 = !{!941, !946, !947, !948}
!946 = !DILocalVariable(name: "ef", arg: 2, scope: !942, file: !3, line: 59, type: !171)
!947 = !DILocalVariable(name: "rc", scope: !942, file: !3, line: 61, type: !60)
!948 = !DILocalVariable(name: "iph", scope: !942, file: !3, line: 69, type: !313)
!949 = !DILocation(line: 0, scope: !942, inlinedAt: !950)
!950 = distinct !DILocation(line: 453, column: 59, scope: !861)
!951 = !DILocalVariable(name: "xdp", arg: 1, scope: !952, file: !3, line: 30, type: !61)
!952 = distinct !DISubprogram(name: "base_decap", scope: !3, file: !3, line: 30, type: !953, scopeLine: 31, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !955)
!953 = !DISubroutineType(types: !954)
!954 = !{!60, !61, !55}
!955 = !{!951, !956, !957, !958, !959, !960, !961}
!956 = !DILocalVariable(name: "proto", arg: 2, scope: !952, file: !3, line: 30, type: !55)
!957 = !DILocalVariable(name: "data_end", scope: !952, file: !3, line: 32, type: !53)
!958 = !DILocalVariable(name: "data", scope: !952, file: !3, line: 33, type: !53)
!959 = !DILocalVariable(name: "srh", scope: !952, file: !3, line: 35, type: !464)
!960 = !DILocalVariable(name: "v6h", scope: !952, file: !3, line: 36, type: !328)
!961 = !DILocalVariable(name: "new_eth", scope: !952, file: !3, line: 50, type: !305)
!962 = !DILocation(line: 0, scope: !952, inlinedAt: !963)
!963 = distinct !DILocation(line: 61, column: 14, scope: !942, inlinedAt: !950)
!964 = !DILocation(line: 0, scope: !871, inlinedAt: !965)
!965 = distinct !DILocation(line: 35, column: 26, scope: !952, inlinedAt: !963)
!966 = !DILocation(line: 255, column: 37, scope: !871, inlinedAt: !965)
!967 = !DILocation(line: 255, column: 26, scope: !871, inlinedAt: !965)
!968 = !DILocation(line: 255, column: 18, scope: !871, inlinedAt: !965)
!969 = !DILocation(line: 256, column: 41, scope: !871, inlinedAt: !965)
!970 = !DILocation(line: 256, column: 30, scope: !871, inlinedAt: !965)
!971 = !DILocation(line: 262, column: 13, scope: !884, inlinedAt: !965)
!972 = !DILocation(line: 262, column: 19, scope: !884, inlinedAt: !965)
!973 = !DILocation(line: 262, column: 17, scope: !884, inlinedAt: !965)
!974 = !DILocation(line: 262, column: 9, scope: !871, inlinedAt: !965)
!975 = !DILocation(line: 0, scope: !375, inlinedAt: !976)
!976 = distinct !DILocation(line: 36, column: 27, scope: !952, inlinedAt: !963)
!977 = !DILocation(line: 235, column: 13, scope: !385, inlinedAt: !976)
!978 = !DILocation(line: 235, column: 19, scope: !385, inlinedAt: !976)
!979 = !DILocation(line: 235, column: 17, scope: !385, inlinedAt: !976)
!980 = !DILocation(line: 235, column: 9, scope: !375, inlinedAt: !976)
!981 = !DILocation(line: 38, column: 10, scope: !982, inlinedAt: !963)
!982 = distinct !DILexicalBlock(scope: !952, file: !3, line: 38, column: 9)
!983 = !DILocation(line: 38, column: 14, scope: !982, inlinedAt: !963)
!984 = !DILocation(line: 43, column: 71, scope: !985, inlinedAt: !963)
!985 = distinct !DILexicalBlock(scope: !952, file: !3, line: 43, column: 9)
!986 = !DILocation(line: 43, column: 66, scope: !985, inlinedAt: !963)
!987 = !DILocation(line: 43, column: 86, scope: !985, inlinedAt: !963)
!988 = !DILocation(line: 43, column: 63, scope: !985, inlinedAt: !963)
!989 = !DILocation(line: 43, column: 9, scope: !985, inlinedAt: !963)
!990 = !DILocation(line: 43, column: 9, scope: !952, inlinedAt: !963)
!991 = !DILocation(line: 48, column: 40, scope: !952, inlinedAt: !963)
!992 = !DILocation(line: 48, column: 20, scope: !952, inlinedAt: !963)
!993 = !DILocation(line: 49, column: 44, scope: !952, inlinedAt: !963)
!994 = !DILocation(line: 49, column: 24, scope: !952, inlinedAt: !963)
!995 = !DILocation(line: 50, column: 30, scope: !952, inlinedAt: !963)
!996 = !DILocation(line: 51, column: 17, scope: !997, inlinedAt: !963)
!997 = distinct !DILexicalBlock(scope: !952, file: !3, line: 51, column: 9)
!998 = !DILocation(line: 51, column: 23, scope: !997, inlinedAt: !963)
!999 = !DILocation(line: 51, column: 21, scope: !997, inlinedAt: !963)
!1000 = !DILocation(line: 51, column: 9, scope: !952, inlinedAt: !963)
!1001 = !DILocation(line: 54, column: 14, scope: !952, inlinedAt: !963)
!1002 = !DILocation(line: 54, column: 22, scope: !952, inlinedAt: !963)
!1003 = !DILocation(line: 0, scope: !359, inlinedAt: !1004)
!1004 = distinct !DILocation(line: 69, column: 25, scope: !942, inlinedAt: !950)
!1005 = !DILocation(line: 243, column: 18, scope: !359, inlinedAt: !1004)
!1006 = !DILocation(line: 247, column: 13, scope: !370, inlinedAt: !1004)
!1007 = !DILocation(line: 247, column: 19, scope: !370, inlinedAt: !1004)
!1008 = !DILocation(line: 247, column: 17, scope: !370, inlinedAt: !1004)
!1009 = !DILocation(line: 247, column: 9, scope: !359, inlinedAt: !1004)
!1010 = !DILocation(line: 71, column: 10, scope: !1011, inlinedAt: !950)
!1011 = distinct !DILexicalBlock(scope: !942, file: !3, line: 71, column: 9)
!1012 = !DILocation(line: 71, column: 9, scope: !942, inlinedAt: !950)
!1013 = !DILocation(line: 76, column: 33, scope: !942, inlinedAt: !950)
!1014 = !DILocation(line: 76, column: 10, scope: !942, inlinedAt: !950)
!1015 = !DILocation(line: 76, column: 16, scope: !942, inlinedAt: !950)
!1016 = !DILocalVariable(name: "iph", arg: 1, scope: !1017, file: !360, line: 192, type: !313)
!1017 = distinct !DISubprogram(name: "csum_build", scope: !360, file: !360, line: 192, type: !1018, scopeLine: 193, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1020)
!1018 = !DISubroutineType(types: !1019)
!1019 = !{null, !313}
!1020 = !{!1016, !1021, !1022, !1023}
!1021 = !DILocalVariable(name: "next_iph_u16", scope: !1017, file: !360, line: 194, type: !97)
!1022 = !DILocalVariable(name: "csum", scope: !1017, file: !360, line: 195, type: !65)
!1023 = !DILocalVariable(name: "i", scope: !1017, file: !360, line: 196, type: !60)
!1024 = !DILocation(line: 0, scope: !1017, inlinedAt: !1025)
!1025 = distinct !DILocation(line: 77, column: 5, scope: !942, inlinedAt: !950)
!1026 = !DILocation(line: 197, column: 10, scope: !1017, inlinedAt: !1025)
!1027 = !DILocation(line: 197, column: 16, scope: !1017, inlinedAt: !1025)
!1028 = !{!429, !412, i64 10}
!1029 = !DILocation(line: 198, column: 20, scope: !1017, inlinedAt: !1025)
!1030 = !DILocation(line: 200, column: 5, scope: !1031, inlinedAt: !1025)
!1031 = distinct !DILexicalBlock(scope: !1017, file: !360, line: 200, column: 5)
!1032 = !DILocation(line: 201, column: 30, scope: !1033, inlinedAt: !1025)
!1033 = distinct !DILexicalBlock(scope: !1031, file: !360, line: 200, column: 5)
!1034 = !DILocation(line: 201, column: 17, scope: !1033, inlinedAt: !1025)
!1035 = !{!412, !412, i64 0}
!1036 = !DILocation(line: 201, column: 14, scope: !1033, inlinedAt: !1025)
!1037 = !DILocation(line: 200, column: 43, scope: !1033, inlinedAt: !1025)
!1038 = !DILocation(line: 200, column: 19, scope: !1033, inlinedAt: !1025)
!1039 = distinct !{!1039, !1030, !1040, !693}
!1040 = !DILocation(line: 201, column: 30, scope: !1031, inlinedAt: !1025)
!1041 = !DILocation(line: 203, column: 44, scope: !1017, inlinedAt: !1025)
!1042 = !DILocation(line: 203, column: 36, scope: !1017, inlinedAt: !1025)
!1043 = !DILocation(line: 203, column: 18, scope: !1017, inlinedAt: !1025)
!1044 = !DILocation(line: 203, column: 16, scope: !1017, inlinedAt: !1025)
!1045 = !DILocation(line: 78, column: 12, scope: !942, inlinedAt: !950)
!1046 = !DILocation(line: 78, column: 5, scope: !942, inlinedAt: !950)
!1047 = !DILocation(line: 0, scope: !397, inlinedAt: !1048)
!1048 = distinct !DILocation(line: 453, column: 28, scope: !861)
!1049 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1048)
!1050 = !DILocation(line: 453, column: 21, scope: !861)
!1051 = !DILocalVariable(name: "xdp", arg: 1, scope: !1052, file: !3, line: 302, type: !61)
!1052 = distinct !DISubprogram(name: "action_end_m_gtp4_e", scope: !3, file: !3, line: 302, type: !943, scopeLine: 303, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1053)
!1053 = !{!1051, !1054, !1055, !1056, !1057, !1058, !1059, !1060, !1061, !1062, !1063, !1064, !1065, !1073, !1074, !1075, !1076, !1077, !1078, !1079, !1080, !1081}
!1054 = !DILocalVariable(name: "ef", arg: 2, scope: !1052, file: !3, line: 302, type: !171)
!1055 = !DILocalVariable(name: "data_end", scope: !1052, file: !3, line: 304, type: !53)
!1056 = !DILocalVariable(name: "data", scope: !1052, file: !3, line: 305, type: !53)
!1057 = !DILocalVariable(name: "srh", scope: !1052, file: !3, line: 307, type: !464)
!1058 = !DILocalVariable(name: "v6h", scope: !1052, file: !3, line: 308, type: !328)
!1059 = !DILocalVariable(name: "payload_len", scope: !1052, file: !3, line: 309, type: !55)
!1060 = !DILocalVariable(name: "tot_len", scope: !1052, file: !3, line: 309, type: !55)
!1061 = !DILocalVariable(name: "v6taple_key", scope: !1052, file: !3, line: 314, type: !60)
!1062 = !DILocalVariable(name: "map_addr_taple", scope: !1052, file: !3, line: 315, type: !251)
!1063 = !DILocalVariable(name: "new_eth", scope: !1052, file: !3, line: 334, type: !305)
!1064 = !DILocalVariable(name: "new_iph", scope: !1052, file: !3, line: 335, type: !313)
!1065 = !DILocalVariable(name: "new_uh", scope: !1052, file: !3, line: 336, type: !1066)
!1066 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1067, size: 64)
!1067 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !6, line: 43689, size: 64, elements: !1068)
!1068 = !{!1069, !1070, !1071, !1072}
!1069 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !1067, file: !6, line: 43690, baseType: !85, size: 16)
!1070 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !1067, file: !6, line: 43691, baseType: !85, size: 16, offset: 16)
!1071 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !1067, file: !6, line: 43692, baseType: !85, size: 16, offset: 32)
!1072 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !1067, file: !6, line: 43693, baseType: !94, size: 16, offset: 48)
!1073 = !DILocalVariable(name: "new_gtp1", scope: !1052, file: !3, line: 337, type: !485)
!1074 = !DILocalVariable(name: "args", scope: !1052, file: !3, line: 356, type: !495)
!1075 = !DILocalVariable(name: "s_offset", scope: !1052, file: !3, line: 358, type: !55)
!1076 = !DILocalVariable(name: "s_shift", scope: !1052, file: !3, line: 358, type: !55)
!1077 = !DILocalVariable(name: "d_offset", scope: !1052, file: !3, line: 358, type: !55)
!1078 = !DILocalVariable(name: "d_shift", scope: !1052, file: !3, line: 358, type: !55)
!1079 = !DILocalVariable(name: "src_p", scope: !1052, file: !3, line: 365, type: !96)
!1080 = !DILocalVariable(name: "dst_p", scope: !1052, file: !3, line: 365, type: !96)
!1081 = !DILocalVariable(name: "args_p", scope: !1052, file: !3, line: 365, type: !96)
!1082 = !DILocation(line: 0, scope: !1052, inlinedAt: !1083)
!1083 = distinct !DILocation(line: 455, column: 59, scope: !861)
!1084 = !DILocation(line: 0, scope: !871, inlinedAt: !1085)
!1085 = distinct !DILocation(line: 307, column: 26, scope: !1052, inlinedAt: !1083)
!1086 = !DILocation(line: 255, column: 37, scope: !871, inlinedAt: !1085)
!1087 = !DILocation(line: 255, column: 26, scope: !871, inlinedAt: !1085)
!1088 = !DILocation(line: 255, column: 18, scope: !871, inlinedAt: !1085)
!1089 = !DILocation(line: 256, column: 41, scope: !871, inlinedAt: !1085)
!1090 = !DILocation(line: 256, column: 30, scope: !871, inlinedAt: !1085)
!1091 = !DILocation(line: 262, column: 13, scope: !884, inlinedAt: !1085)
!1092 = !DILocation(line: 262, column: 19, scope: !884, inlinedAt: !1085)
!1093 = !DILocation(line: 262, column: 17, scope: !884, inlinedAt: !1085)
!1094 = !DILocation(line: 262, column: 9, scope: !871, inlinedAt: !1085)
!1095 = !DILocation(line: 0, scope: !375, inlinedAt: !1096)
!1096 = distinct !DILocation(line: 308, column: 27, scope: !1052, inlinedAt: !1083)
!1097 = !DILocation(line: 235, column: 13, scope: !385, inlinedAt: !1096)
!1098 = !DILocation(line: 235, column: 19, scope: !385, inlinedAt: !1096)
!1099 = !DILocation(line: 235, column: 17, scope: !385, inlinedAt: !1096)
!1100 = !DILocation(line: 235, column: 9, scope: !375, inlinedAt: !1096)
!1101 = !DILocation(line: 311, column: 10, scope: !1102, inlinedAt: !1083)
!1102 = distinct !DILexicalBlock(scope: !1052, file: !3, line: 311, column: 9)
!1103 = !DILocation(line: 311, column: 14, scope: !1102, inlinedAt: !1083)
!1104 = !DILocation(line: 314, column: 5, scope: !1052, inlinedAt: !1083)
!1105 = !DILocation(line: 314, column: 9, scope: !1052, inlinedAt: !1083)
!1106 = !{!349, !349, i64 0}
!1107 = !DILocation(line: 315, column: 42, scope: !1052, inlinedAt: !1083)
!1108 = !DILocation(line: 316, column: 10, scope: !1109, inlinedAt: !1083)
!1109 = distinct !DILexicalBlock(scope: !1052, file: !3, line: 316, column: 9)
!1110 = !DILocation(line: 316, column: 9, scope: !1052, inlinedAt: !1083)
!1111 = !DILocation(line: 319, column: 21, scope: !1052, inlinedAt: !1083)
!1112 = !DILocation(line: 319, column: 34, scope: !1052, inlinedAt: !1083)
!1113 = !DILocation(line: 320, column: 21, scope: !1052, inlinedAt: !1083)
!1114 = !DILocation(line: 320, column: 34, scope: !1052, inlinedAt: !1083)
!1115 = !DILocation(line: 323, column: 19, scope: !1052, inlinedAt: !1083)
!1116 = !DILocation(line: 323, column: 55, scope: !1052, inlinedAt: !1083)
!1117 = !DILocation(line: 323, column: 50, scope: !1052, inlinedAt: !1083)
!1118 = !DILocation(line: 323, column: 70, scope: !1052, inlinedAt: !1083)
!1119 = !DILocation(line: 325, column: 63, scope: !1120, inlinedAt: !1083)
!1120 = distinct !DILexicalBlock(scope: !1052, file: !3, line: 325, column: 9)
!1121 = !DILocation(line: 325, column: 9, scope: !1120, inlinedAt: !1083)
!1122 = !DILocation(line: 325, column: 9, scope: !1052, inlinedAt: !1083)
!1123 = !DILocation(line: 328, column: 9, scope: !1124, inlinedAt: !1083)
!1124 = distinct !DILexicalBlock(scope: !1052, file: !3, line: 328, column: 9)
!1125 = !DILocation(line: 328, column: 9, scope: !1052, inlinedAt: !1083)
!1126 = !DILocalVariable(name: "xdp", arg: 1, scope: !1127, file: !360, line: 217, type: !61)
!1127 = distinct !DISubprogram(name: "get_eth", scope: !360, file: !360, line: 217, type: !1128, scopeLine: 218, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1130)
!1128 = !DISubroutineType(types: !1129)
!1129 = !{!305, !61}
!1130 = !{!1126, !1131, !1132, !1133}
!1131 = !DILocalVariable(name: "data", scope: !1127, file: !360, line: 219, type: !53)
!1132 = !DILocalVariable(name: "data_end", scope: !1127, file: !360, line: 220, type: !53)
!1133 = !DILocalVariable(name: "eth", scope: !1127, file: !360, line: 222, type: !305)
!1134 = !DILocation(line: 0, scope: !1127, inlinedAt: !1135)
!1135 = distinct !DILocation(line: 334, column: 30, scope: !1052, inlinedAt: !1083)
!1136 = !DILocation(line: 219, column: 37, scope: !1127, inlinedAt: !1135)
!1137 = !DILocation(line: 219, column: 26, scope: !1127, inlinedAt: !1135)
!1138 = !DILocation(line: 220, column: 41, scope: !1127, inlinedAt: !1135)
!1139 = !DILocation(line: 220, column: 30, scope: !1127, inlinedAt: !1135)
!1140 = !DILocation(line: 222, column: 26, scope: !1127, inlinedAt: !1135)
!1141 = !DILocation(line: 223, column: 13, scope: !1142, inlinedAt: !1135)
!1142 = distinct !DILexicalBlock(scope: !1127, file: !360, line: 223, column: 9)
!1143 = !DILocation(line: 223, column: 19, scope: !1142, inlinedAt: !1135)
!1144 = !DILocation(line: 223, column: 17, scope: !1142, inlinedAt: !1135)
!1145 = !DILocation(line: 0, scope: !359, inlinedAt: !1146)
!1146 = distinct !DILocation(line: 335, column: 29, scope: !1052, inlinedAt: !1083)
!1147 = !DILocation(line: 243, column: 18, scope: !359, inlinedAt: !1146)
!1148 = !DILocation(line: 247, column: 13, scope: !370, inlinedAt: !1146)
!1149 = !DILocation(line: 247, column: 19, scope: !370, inlinedAt: !1146)
!1150 = !DILocation(line: 247, column: 17, scope: !370, inlinedAt: !1146)
!1151 = !DILocation(line: 247, column: 9, scope: !359, inlinedAt: !1146)
!1152 = !DILocalVariable(name: "xdp", arg: 1, scope: !1153, file: !360, line: 271, type: !61)
!1153 = distinct !DISubprogram(name: "get_v4_udp", scope: !360, file: !360, line: 271, type: !1154, scopeLine: 272, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1156)
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!1066, !61}
!1156 = !{!1152, !1157, !1158, !1159}
!1157 = !DILocalVariable(name: "data", scope: !1153, file: !360, line: 273, type: !53)
!1158 = !DILocalVariable(name: "data_end", scope: !1153, file: !360, line: 274, type: !53)
!1159 = !DILocalVariable(name: "uh", scope: !1153, file: !360, line: 276, type: !1066)
!1160 = !DILocation(line: 0, scope: !1153, inlinedAt: !1161)
!1161 = distinct !DILocation(line: 336, column: 29, scope: !1052, inlinedAt: !1083)
!1162 = !DILocation(line: 274, column: 22, scope: !1153, inlinedAt: !1161)
!1163 = !DILocation(line: 278, column: 20, scope: !1164, inlinedAt: !1161)
!1164 = distinct !DILexicalBlock(scope: !1153, file: !360, line: 278, column: 9)
!1165 = !DILocation(line: 278, column: 44, scope: !1164, inlinedAt: !1161)
!1166 = !DILocation(line: 278, column: 9, scope: !1153, inlinedAt: !1161)
!1167 = !DILocalVariable(name: "xdp", arg: 1, scope: !1168, file: !360, line: 284, type: !61)
!1168 = distinct !DISubprogram(name: "get_v4_gtp1", scope: !360, file: !360, line: 284, type: !1169, scopeLine: 285, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1171)
!1169 = !DISubroutineType(types: !1170)
!1170 = !{!485, !61}
!1171 = !{!1167, !1172, !1173, !1174}
!1172 = !DILocalVariable(name: "data", scope: !1168, file: !360, line: 286, type: !53)
!1173 = !DILocalVariable(name: "data_end", scope: !1168, file: !360, line: 287, type: !53)
!1174 = !DILocalVariable(name: "gtp1", scope: !1168, file: !360, line: 289, type: !485)
!1175 = !DILocation(line: 0, scope: !1168, inlinedAt: !1176)
!1176 = distinct !DILocation(line: 337, column: 32, scope: !1052, inlinedAt: !1083)
!1177 = !DILocation(line: 291, column: 22, scope: !1178, inlinedAt: !1176)
!1178 = distinct !DILexicalBlock(scope: !1168, file: !360, line: 291, column: 9)
!1179 = !DILocation(line: 291, column: 47, scope: !1178, inlinedAt: !1176)
!1180 = !DILocation(line: 291, column: 9, scope: !1168, inlinedAt: !1176)
!1181 = !DILocation(line: 339, column: 10, scope: !1182, inlinedAt: !1083)
!1182 = distinct !DILexicalBlock(scope: !1052, file: !3, line: 339, column: 9)
!1183 = !DILocation(line: 339, column: 18, scope: !1182, inlinedAt: !1083)
!1184 = !DILocation(line: 342, column: 64, scope: !1052, inlinedAt: !1083)
!1185 = !DILocation(line: 344, column: 14, scope: !1052, inlinedAt: !1083)
!1186 = !DILocation(line: 344, column: 22, scope: !1052, inlinedAt: !1083)
!1187 = !DILocation(line: 347, column: 14, scope: !1052, inlinedAt: !1083)
!1188 = !DILocation(line: 347, column: 22, scope: !1052, inlinedAt: !1083)
!1189 = !DILocation(line: 348, column: 14, scope: !1052, inlinedAt: !1083)
!1190 = !DILocation(line: 348, column: 18, scope: !1052, inlinedAt: !1083)
!1191 = !DILocation(line: 349, column: 14, scope: !1052, inlinedAt: !1083)
!1192 = !DILocation(line: 349, column: 23, scope: !1052, inlinedAt: !1083)
!1193 = !{!429, !412, i64 6}
!1194 = !DILocation(line: 350, column: 14, scope: !1052, inlinedAt: !1083)
!1195 = !DILocation(line: 350, column: 23, scope: !1052, inlinedAt: !1083)
!1196 = !DILocation(line: 351, column: 14, scope: !1052, inlinedAt: !1083)
!1197 = !DILocation(line: 351, column: 20, scope: !1052, inlinedAt: !1083)
!1198 = !DILocation(line: 352, column: 14, scope: !1052, inlinedAt: !1083)
!1199 = !DILocation(line: 352, column: 18, scope: !1052, inlinedAt: !1083)
!1200 = !{!429, !350, i64 1}
!1201 = !DILocation(line: 353, column: 14, scope: !1052, inlinedAt: !1083)
!1202 = !DILocation(line: 353, column: 22, scope: !1052, inlinedAt: !1083)
!1203 = !DILocation(line: 354, column: 14, scope: !1052, inlinedAt: !1083)
!1204 = !DILocation(line: 354, column: 18, scope: !1052, inlinedAt: !1083)
!1205 = !{!429, !350, i64 8}
!1206 = !DILocation(line: 356, column: 5, scope: !1052, inlinedAt: !1083)
!1207 = !DILocation(line: 356, column: 29, scope: !1052, inlinedAt: !1083)
!1208 = !DILocation(line: 357, column: 5, scope: !1052, inlinedAt: !1083)
!1209 = !DILocation(line: 360, column: 20, scope: !1052, inlinedAt: !1083)
!1210 = !{!852, !349, i64 40}
!1211 = !DILocation(line: 360, column: 33, scope: !1052, inlinedAt: !1083)
!1212 = !DILocation(line: 360, column: 16, scope: !1052, inlinedAt: !1083)
!1213 = !DILocation(line: 361, column: 15, scope: !1052, inlinedAt: !1083)
!1214 = !DILocation(line: 362, column: 20, scope: !1052, inlinedAt: !1083)
!1215 = !{!852, !349, i64 44}
!1216 = !DILocation(line: 362, column: 33, scope: !1052, inlinedAt: !1083)
!1217 = !DILocation(line: 362, column: 16, scope: !1052, inlinedAt: !1083)
!1218 = !DILocation(line: 363, column: 15, scope: !1052, inlinedAt: !1083)
!1219 = !DILocation(line: 366, column: 31, scope: !1052, inlinedAt: !1083)
!1220 = !DILocation(line: 366, column: 13, scope: !1052, inlinedAt: !1083)
!1221 = !DILocation(line: 367, column: 31, scope: !1052, inlinedAt: !1083)
!1222 = !DILocation(line: 367, column: 13, scope: !1052, inlinedAt: !1083)
!1223 = !DILocalVariable(name: "payload", arg: 1, scope: !1224, file: !360, line: 65, type: !96)
!1224 = distinct !DISubprogram(name: "read_v6addr_in_pkt_pyload", scope: !360, file: !360, line: 64, type: !1225, scopeLine: 66, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1227)
!1225 = !DISubroutineType(types: !1226)
!1226 = !{null, !96, !71, !55, !55, !55, !639}
!1227 = !{!1223, !1228, !1229, !1230, !1231, !1232, !1233, !1237, !1240, !1241}
!1228 = !DILocalVariable(name: "v6addr", arg: 2, scope: !1224, file: !360, line: 65, type: !71)
!1229 = !DILocalVariable(name: "payload_size", arg: 3, scope: !1224, file: !360, line: 65, type: !55)
!1230 = !DILocalVariable(name: "offset", arg: 4, scope: !1224, file: !360, line: 65, type: !55)
!1231 = !DILocalVariable(name: "shift", arg: 5, scope: !1224, file: !360, line: 65, type: !55)
!1232 = !DILocalVariable(name: "data_end", arg: 6, scope: !1224, file: !360, line: 65, type: !639)
!1233 = !DILocalVariable(name: "index", scope: !1234, file: !360, line: 84, type: !55)
!1234 = distinct !DILexicalBlock(scope: !1235, file: !360, line: 84, column: 9)
!1235 = distinct !DILexicalBlock(scope: !1236, file: !360, line: 82, column: 5)
!1236 = distinct !DILexicalBlock(scope: !1224, file: !360, line: 74, column: 9)
!1237 = !DILocalVariable(name: "payval1", scope: !1238, file: !360, line: 91, type: !96)
!1238 = distinct !DILexicalBlock(scope: !1239, file: !360, line: 85, column: 9)
!1239 = distinct !DILexicalBlock(scope: !1234, file: !360, line: 84, column: 9)
!1240 = !DILocalVariable(name: "payval2", scope: !1238, file: !360, line: 92, type: !96)
!1241 = !DILocalVariable(name: "v6val", scope: !1238, file: !360, line: 93, type: !96)
!1242 = !DILocation(line: 0, scope: !1224, inlinedAt: !1243)
!1243 = distinct !DILocation(line: 370, column: 5, scope: !1052, inlinedAt: !1083)
!1244 = !DILocation(line: 69, column: 36, scope: !1245, inlinedAt: !1243)
!1245 = distinct !DILexicalBlock(scope: !1224, file: !360, line: 69, column: 9)
!1246 = !DILocation(line: 69, column: 43, scope: !1245, inlinedAt: !1243)
!1247 = !DILocation(line: 74, column: 15, scope: !1236, inlinedAt: !1243)
!1248 = !DILocation(line: 74, column: 9, scope: !1224, inlinedAt: !1243)
!1249 = !DILocation(line: 0, scope: !1234, inlinedAt: !1243)
!1250 = !DILocation(line: 0, scope: !1238, inlinedAt: !1243)
!1251 = !DILocation(line: 88, column: 17, scope: !1238, inlinedAt: !1243)
!1252 = !DILocation(line: 76, column: 29, scope: !1253, inlinedAt: !1243)
!1253 = distinct !DILexicalBlock(scope: !1254, file: !360, line: 76, column: 13)
!1254 = distinct !DILexicalBlock(scope: !1236, file: !360, line: 75, column: 5)
!1255 = !DILocation(line: 76, column: 44, scope: !1253, inlinedAt: !1243)
!1256 = !DILocation(line: 76, column: 13, scope: !1254, inlinedAt: !1243)
!1257 = !DILocation(line: 79, column: 44, scope: !1254, inlinedAt: !1243)
!1258 = !DILocation(line: 79, column: 50, scope: !1254, inlinedAt: !1243)
!1259 = !DILocation(line: 79, column: 36, scope: !1254, inlinedAt: !1243)
!1260 = !DILocation(line: 79, column: 9, scope: !1254, inlinedAt: !1243)
!1261 = !DILocation(line: 80, column: 5, scope: !1254, inlinedAt: !1243)
!1262 = !DILocation(line: 91, column: 53, scope: !1238, inlinedAt: !1243)
!1263 = !DILocation(line: 92, column: 61, scope: !1238, inlinedAt: !1243)
!1264 = !DILocation(line: 93, column: 59, scope: !1238, inlinedAt: !1243)
!1265 = !DILocation(line: 94, column: 37, scope: !1266, inlinedAt: !1243)
!1266 = distinct !DILexicalBlock(scope: !1238, file: !360, line: 94, column: 17)
!1267 = !DILocation(line: 94, column: 48, scope: !1266, inlinedAt: !1243)
!1268 = !DILocation(line: 97, column: 25, scope: !1238, inlinedAt: !1243)
!1269 = !DILocation(line: 97, column: 32, scope: !1238, inlinedAt: !1243)
!1270 = !DILocation(line: 97, column: 22, scope: !1238, inlinedAt: !1243)
!1271 = !DILocation(line: 98, column: 25, scope: !1238, inlinedAt: !1243)
!1272 = !DILocation(line: 98, column: 32, scope: !1238, inlinedAt: !1243)
!1273 = !DILocation(line: 98, column: 22, scope: !1238, inlinedAt: !1243)
!1274 = !DILocation(line: 84, column: 69, scope: !1239, inlinedAt: !1243)
!1275 = !DILocation(line: 88, column: 30, scope: !1276, inlinedAt: !1243)
!1276 = distinct !DILexicalBlock(scope: !1238, file: !360, line: 88, column: 17)
!1277 = distinct !{!1277, !1278, !1279, !693}
!1278 = !DILocation(line: 84, column: 9, scope: !1234, inlinedAt: !1243)
!1279 = !DILocation(line: 99, column: 9, scope: !1234, inlinedAt: !1243)
!1280 = !DILocation(line: 0, scope: !1224, inlinedAt: !1281)
!1281 = distinct !DILocation(line: 371, column: 5, scope: !1052, inlinedAt: !1083)
!1282 = !DILocation(line: 69, column: 36, scope: !1245, inlinedAt: !1281)
!1283 = !DILocation(line: 69, column: 43, scope: !1245, inlinedAt: !1281)
!1284 = !DILocation(line: 74, column: 15, scope: !1236, inlinedAt: !1281)
!1285 = !DILocation(line: 74, column: 9, scope: !1224, inlinedAt: !1281)
!1286 = !DILocation(line: 0, scope: !1234, inlinedAt: !1281)
!1287 = !DILocation(line: 0, scope: !1238, inlinedAt: !1281)
!1288 = !DILocation(line: 88, column: 17, scope: !1238, inlinedAt: !1281)
!1289 = !DILocation(line: 76, column: 29, scope: !1253, inlinedAt: !1281)
!1290 = !DILocation(line: 76, column: 44, scope: !1253, inlinedAt: !1281)
!1291 = !DILocation(line: 76, column: 13, scope: !1254, inlinedAt: !1281)
!1292 = !DILocation(line: 79, column: 44, scope: !1254, inlinedAt: !1281)
!1293 = !DILocation(line: 79, column: 50, scope: !1254, inlinedAt: !1281)
!1294 = !DILocation(line: 79, column: 36, scope: !1254, inlinedAt: !1281)
!1295 = !DILocation(line: 79, column: 9, scope: !1254, inlinedAt: !1281)
!1296 = !DILocation(line: 80, column: 5, scope: !1254, inlinedAt: !1281)
!1297 = !DILocation(line: 91, column: 53, scope: !1238, inlinedAt: !1281)
!1298 = !DILocation(line: 92, column: 61, scope: !1238, inlinedAt: !1281)
!1299 = !DILocation(line: 93, column: 59, scope: !1238, inlinedAt: !1281)
!1300 = !DILocation(line: 94, column: 37, scope: !1266, inlinedAt: !1281)
!1301 = !DILocation(line: 94, column: 48, scope: !1266, inlinedAt: !1281)
!1302 = !DILocation(line: 97, column: 25, scope: !1238, inlinedAt: !1281)
!1303 = !DILocation(line: 97, column: 32, scope: !1238, inlinedAt: !1281)
!1304 = !DILocation(line: 97, column: 22, scope: !1238, inlinedAt: !1281)
!1305 = !DILocation(line: 98, column: 25, scope: !1238, inlinedAt: !1281)
!1306 = !DILocation(line: 98, column: 32, scope: !1238, inlinedAt: !1281)
!1307 = !DILocation(line: 98, column: 22, scope: !1238, inlinedAt: !1281)
!1308 = !DILocation(line: 84, column: 69, scope: !1239, inlinedAt: !1281)
!1309 = !DILocation(line: 88, column: 30, scope: !1276, inlinedAt: !1281)
!1310 = distinct !{!1310, !1311, !1312, !693}
!1311 = !DILocation(line: 84, column: 9, scope: !1234, inlinedAt: !1281)
!1312 = !DILocation(line: 99, column: 9, scope: !1234, inlinedAt: !1281)
!1313 = !DILocation(line: 372, column: 14, scope: !1052, inlinedAt: !1083)
!1314 = !DILocalVariable(name: "payload", arg: 1, scope: !1315, file: !360, line: 15, type: !96)
!1315 = distinct !DISubprogram(name: "read_v6addr_in_pyload", scope: !360, file: !360, line: 14, type: !1316, scopeLine: 16, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1318)
!1316 = !DISubroutineType(types: !1317)
!1317 = !{null, !96, !71, !55, !55, !55}
!1318 = !{!1314, !1319, !1320, !1321, !1322, !1323, !1327, !1330, !1331, !1334, !1337, !1338}
!1319 = !DILocalVariable(name: "v6addr", arg: 2, scope: !1315, file: !360, line: 15, type: !71)
!1320 = !DILocalVariable(name: "payload_size", arg: 3, scope: !1315, file: !360, line: 15, type: !55)
!1321 = !DILocalVariable(name: "offset", arg: 4, scope: !1315, file: !360, line: 15, type: !55)
!1322 = !DILocalVariable(name: "shift", arg: 5, scope: !1315, file: !360, line: 15, type: !55)
!1323 = !DILocalVariable(name: "index", scope: !1324, file: !360, line: 27, type: !55)
!1324 = distinct !DILexicalBlock(scope: !1325, file: !360, line: 27, column: 9)
!1325 = distinct !DILexicalBlock(scope: !1326, file: !360, line: 25, column: 5)
!1326 = distinct !DILexicalBlock(scope: !1315, file: !360, line: 24, column: 9)
!1327 = !DILocalVariable(name: "payval1", scope: !1328, file: !360, line: 34, type: !96)
!1328 = distinct !DILexicalBlock(scope: !1329, file: !360, line: 28, column: 9)
!1329 = distinct !DILexicalBlock(scope: !1324, file: !360, line: 27, column: 9)
!1330 = !DILocalVariable(name: "v6val", scope: !1328, file: !360, line: 35, type: !96)
!1331 = !DILocalVariable(name: "index", scope: !1332, file: !360, line: 45, type: !55)
!1332 = distinct !DILexicalBlock(scope: !1333, file: !360, line: 45, column: 9)
!1333 = distinct !DILexicalBlock(scope: !1326, file: !360, line: 43, column: 5)
!1334 = !DILocalVariable(name: "payval1", scope: !1335, file: !360, line: 52, type: !96)
!1335 = distinct !DILexicalBlock(scope: !1336, file: !360, line: 46, column: 9)
!1336 = distinct !DILexicalBlock(scope: !1332, file: !360, line: 45, column: 9)
!1337 = !DILocalVariable(name: "payval2", scope: !1335, file: !360, line: 53, type: !96)
!1338 = !DILocalVariable(name: "v6val", scope: !1335, file: !360, line: 54, type: !96)
!1339 = !DILocation(line: 0, scope: !1315, inlinedAt: !1340)
!1340 = distinct !DILocation(line: 374, column: 5, scope: !1052, inlinedAt: !1083)
!1341 = !DILocation(line: 17, column: 21, scope: !1315, inlinedAt: !1340)
!1342 = !DILocation(line: 20, column: 33, scope: !1343, inlinedAt: !1340)
!1343 = distinct !DILexicalBlock(scope: !1315, file: !360, line: 19, column: 9)
!1344 = !DILocation(line: 20, column: 58, scope: !1343, inlinedAt: !1340)
!1345 = !DILocation(line: 24, column: 9, scope: !1326, inlinedAt: !1340)
!1346 = !DILocation(line: 24, column: 15, scope: !1326, inlinedAt: !1340)
!1347 = !DILocation(line: 0, scope: !1326, inlinedAt: !1340)
!1348 = !DILocation(line: 24, column: 9, scope: !1315, inlinedAt: !1340)
!1349 = !DILocation(line: 27, column: 9, scope: !1324, inlinedAt: !1340)
!1350 = !DILocation(line: 36, column: 36, scope: !1351, inlinedAt: !1340)
!1351 = distinct !DILexicalBlock(scope: !1328, file: !360, line: 36, column: 17)
!1352 = !DILocation(line: 0, scope: !1332, inlinedAt: !1340)
!1353 = !DILocation(line: 0, scope: !1335, inlinedAt: !1340)
!1354 = !DILocation(line: 49, column: 39, scope: !1355, inlinedAt: !1340)
!1355 = distinct !DILexicalBlock(scope: !1335, file: !360, line: 49, column: 17)
!1356 = !DILocation(line: 55, column: 36, scope: !1357, inlinedAt: !1340)
!1357 = distinct !DILexicalBlock(scope: !1335, file: !360, line: 55, column: 17)
!1358 = !DILocation(line: 0, scope: !1324, inlinedAt: !1340)
!1359 = !DILocation(line: 0, scope: !1328, inlinedAt: !1340)
!1360 = !DILocation(line: 36, column: 17, scope: !1328, inlinedAt: !1340)
!1361 = !DILocation(line: 35, column: 59, scope: !1328, inlinedAt: !1340)
!1362 = !DILocation(line: 34, column: 53, scope: !1328, inlinedAt: !1340)
!1363 = !DILocation(line: 39, column: 24, scope: !1328, inlinedAt: !1340)
!1364 = !DILocation(line: 39, column: 22, scope: !1328, inlinedAt: !1340)
!1365 = !DILocation(line: 27, column: 69, scope: !1329, inlinedAt: !1340)
!1366 = !DILocation(line: 31, column: 30, scope: !1367, inlinedAt: !1340)
!1367 = distinct !DILexicalBlock(scope: !1328, file: !360, line: 31, column: 17)
!1368 = !DILocation(line: 31, column: 17, scope: !1328, inlinedAt: !1340)
!1369 = distinct !{!1369, !1349, !1370, !693}
!1370 = !DILocation(line: 40, column: 9, scope: !1324, inlinedAt: !1340)
!1371 = !DILocation(line: 52, column: 53, scope: !1335, inlinedAt: !1340)
!1372 = !DILocation(line: 53, column: 61, scope: !1335, inlinedAt: !1340)
!1373 = !DILocation(line: 55, column: 17, scope: !1335, inlinedAt: !1340)
!1374 = !DILocation(line: 54, column: 59, scope: !1335, inlinedAt: !1340)
!1375 = !DILocation(line: 58, column: 25, scope: !1335, inlinedAt: !1340)
!1376 = !DILocation(line: 58, column: 32, scope: !1335, inlinedAt: !1340)
!1377 = !DILocation(line: 58, column: 22, scope: !1335, inlinedAt: !1340)
!1378 = !DILocation(line: 59, column: 32, scope: !1335, inlinedAt: !1340)
!1379 = !DILocation(line: 59, column: 22, scope: !1335, inlinedAt: !1340)
!1380 = !DILocation(line: 45, column: 69, scope: !1336, inlinedAt: !1340)
!1381 = distinct !{!1381, !1382, !1383, !693}
!1382 = !DILocation(line: 45, column: 9, scope: !1332, inlinedAt: !1340)
!1383 = !DILocation(line: 60, column: 9, scope: !1332, inlinedAt: !1340)
!1384 = !DILocation(line: 377, column: 13, scope: !1052, inlinedAt: !1083)
!1385 = !DILocation(line: 377, column: 19, scope: !1052, inlinedAt: !1083)
!1386 = !{!1387, !412, i64 6}
!1387 = !{!"udphdr", !412, i64 0, !412, i64 2, !412, i64 4, !412, i64 6}
!1388 = !DILocation(line: 378, column: 13, scope: !1052, inlinedAt: !1083)
!1389 = !DILocation(line: 378, column: 20, scope: !1052, inlinedAt: !1083)
!1390 = !{!1387, !412, i64 0}
!1391 = !DILocation(line: 379, column: 13, scope: !1052, inlinedAt: !1083)
!1392 = !DILocation(line: 379, column: 18, scope: !1052, inlinedAt: !1083)
!1393 = !{!1387, !412, i64 2}
!1394 = !DILocation(line: 380, column: 19, scope: !1052, inlinedAt: !1083)
!1395 = !DILocation(line: 380, column: 13, scope: !1052, inlinedAt: !1083)
!1396 = !DILocation(line: 380, column: 17, scope: !1052, inlinedAt: !1083)
!1397 = !{!1387, !412, i64 4}
!1398 = !DILocation(line: 383, column: 15, scope: !1052, inlinedAt: !1083)
!1399 = !DILocation(line: 383, column: 21, scope: !1052, inlinedAt: !1083)
!1400 = !{!547, !350, i64 0}
!1401 = !DILocation(line: 385, column: 15, scope: !1052, inlinedAt: !1083)
!1402 = !DILocation(line: 385, column: 20, scope: !1052, inlinedAt: !1083)
!1403 = !DILocation(line: 386, column: 15, scope: !1052, inlinedAt: !1083)
!1404 = !DILocation(line: 386, column: 22, scope: !1052, inlinedAt: !1083)
!1405 = !DILocation(line: 387, column: 34, scope: !1052, inlinedAt: !1083)
!1406 = !DILocation(line: 387, column: 15, scope: !1052, inlinedAt: !1083)
!1407 = !DILocation(line: 387, column: 19, scope: !1052, inlinedAt: !1083)
!1408 = !DILocation(line: 0, scope: !1017, inlinedAt: !1409)
!1409 = distinct !DILocation(line: 389, column: 5, scope: !1052, inlinedAt: !1083)
!1410 = !DILocation(line: 197, column: 16, scope: !1017, inlinedAt: !1409)
!1411 = !DILocation(line: 198, column: 20, scope: !1017, inlinedAt: !1409)
!1412 = !DILocation(line: 200, column: 5, scope: !1031, inlinedAt: !1409)
!1413 = !DILocation(line: 201, column: 30, scope: !1033, inlinedAt: !1409)
!1414 = !DILocation(line: 201, column: 17, scope: !1033, inlinedAt: !1409)
!1415 = !DILocation(line: 201, column: 14, scope: !1033, inlinedAt: !1409)
!1416 = !DILocation(line: 200, column: 43, scope: !1033, inlinedAt: !1409)
!1417 = !DILocation(line: 200, column: 19, scope: !1033, inlinedAt: !1409)
!1418 = distinct !{!1418, !1412, !1419, !693}
!1419 = !DILocation(line: 201, column: 30, scope: !1031, inlinedAt: !1409)
!1420 = !DILocation(line: 203, column: 44, scope: !1017, inlinedAt: !1409)
!1421 = !DILocation(line: 203, column: 36, scope: !1017, inlinedAt: !1409)
!1422 = !DILocation(line: 203, column: 18, scope: !1017, inlinedAt: !1409)
!1423 = !DILocation(line: 203, column: 16, scope: !1017, inlinedAt: !1409)
!1424 = !DILocation(line: 391, column: 19, scope: !1052, inlinedAt: !1083)
!1425 = !DILocation(line: 392, column: 12, scope: !1052, inlinedAt: !1083)
!1426 = !DILocation(line: 393, column: 1, scope: !1052, inlinedAt: !1083)
!1427 = !DILocation(line: 0, scope: !397, inlinedAt: !1428)
!1428 = distinct !DILocation(line: 455, column: 28, scope: !861)
!1429 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1428)
!1430 = !DILocation(line: 455, column: 21, scope: !861)
!1431 = !DILocation(line: 462, column: 18, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !841, file: !3, line: 460, column: 9)
!1433 = !DILocation(line: 463, column: 17, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1432, file: !3, line: 463, column: 17)
!1435 = !DILocation(line: 463, column: 17, scope: !1432)
!1436 = !DILocation(line: 466, column: 29, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1434, file: !3, line: 464, column: 13)
!1438 = !DILocation(line: 466, column: 17, scope: !1437)
!1439 = !DILocation(line: 469, column: 101, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1437, file: !3, line: 467, column: 17)
!1441 = !DILocation(line: 469, column: 96, scope: !1440)
!1442 = !DILocation(line: 469, column: 59, scope: !1440)
!1443 = !DILocation(line: 0, scope: !397, inlinedAt: !1444)
!1444 = distinct !DILocation(line: 469, column: 28, scope: !1440)
!1445 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1444)
!1446 = !DILocation(line: 469, column: 21, scope: !1440)
!1447 = !DILocation(line: 0, scope: !397, inlinedAt: !1448)
!1448 = distinct !DILocation(line: 477, column: 12, scope: !297)
!1449 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1448)
!1450 = !DILocation(line: 477, column: 5, scope: !297)
!1451 = !DILocation(line: 478, column: 1, scope: !297)
!1452 = distinct !DISubprogram(name: "transit_encap", scope: !3, file: !3, line: 148, type: !1453, scopeLine: 149, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1455)
!1453 = !DISubroutineType(types: !1454)
!1454 = !{!60, !61, !213, !79, !79}
!1455 = !{!1456, !1457, !1458, !1459, !1460}
!1456 = !DILocalVariable(name: "xdp", arg: 1, scope: !1452, file: !3, line: 148, type: !61)
!1457 = !DILocalVariable(name: "tb", arg: 2, scope: !1452, file: !3, line: 148, type: !213)
!1458 = !DILocalVariable(name: "nexthdr", arg: 3, scope: !1452, file: !3, line: 148, type: !79)
!1459 = !DILocalVariable(name: "innerlen", arg: 4, scope: !1452, file: !3, line: 148, type: !79)
!1460 = !DILocalVariable(name: "rc", scope: !1452, file: !3, line: 150, type: !60)
!1461 = !DILocation(line: 0, scope: !1452)
!1462 = !DILocation(line: 150, column: 43, scope: !1452)
!1463 = !DILocalVariable(name: "xdp", arg: 1, scope: !1464, file: !3, line: 81, type: !61)
!1464 = distinct !DISubprogram(name: "base_encap", scope: !3, file: !3, line: 81, type: !1465, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1467)
!1465 = !DISubroutineType(types: !1466)
!1466 = !{!60, !61, !213, !79, !55}
!1467 = !{!1463, !1468, !1469, !1470, !1471, !1472, !1473, !1474, !1475, !1476, !1477}
!1468 = !DILocalVariable(name: "tb", arg: 2, scope: !1464, file: !3, line: 81, type: !213)
!1469 = !DILocalVariable(name: "nexthdr", arg: 3, scope: !1464, file: !3, line: 81, type: !79)
!1470 = !DILocalVariable(name: "innerlen", arg: 4, scope: !1464, file: !3, line: 81, type: !55)
!1471 = !DILocalVariable(name: "data", scope: !1464, file: !3, line: 83, type: !53)
!1472 = !DILocalVariable(name: "data_end", scope: !1464, file: !3, line: 84, type: !53)
!1473 = !DILocalVariable(name: "v6h", scope: !1464, file: !3, line: 86, type: !328)
!1474 = !DILocalVariable(name: "srh", scope: !1464, file: !3, line: 87, type: !464)
!1475 = !DILocalVariable(name: "srh_len", scope: !1464, file: !3, line: 88, type: !79)
!1476 = !DILocalVariable(name: "new_eth", scope: !1464, file: !3, line: 97, type: !305)
!1477 = !DILocalVariable(name: "i", scope: !1478, file: !3, line: 134, type: !65)
!1478 = distinct !DILexicalBlock(scope: !1464, file: !3, line: 134, column: 5)
!1479 = !DILocation(line: 0, scope: !1464, inlinedAt: !1480)
!1480 = distinct !DILocation(line: 150, column: 14, scope: !1452)
!1481 = !DILocation(line: 90, column: 69, scope: !1464, inlinedAt: !1480)
!1482 = !DILocation(line: 90, column: 65, scope: !1464, inlinedAt: !1480)
!1483 = !DILocation(line: 90, column: 63, scope: !1464, inlinedAt: !1480)
!1484 = !DILocation(line: 90, column: 37, scope: !1464, inlinedAt: !1480)
!1485 = !DILocation(line: 91, column: 69, scope: !1486, inlinedAt: !1480)
!1486 = distinct !DILexicalBlock(scope: !1464, file: !3, line: 91, column: 9)
!1487 = !DILocation(line: 91, column: 67, scope: !1486, inlinedAt: !1480)
!1488 = !DILocation(line: 91, column: 36, scope: !1486, inlinedAt: !1480)
!1489 = !DILocation(line: 91, column: 9, scope: !1486, inlinedAt: !1480)
!1490 = !DILocation(line: 91, column: 9, scope: !1464, inlinedAt: !1480)
!1491 = !DILocation(line: 84, column: 41, scope: !1464, inlinedAt: !1480)
!1492 = !DILocation(line: 83, column: 37, scope: !1464, inlinedAt: !1480)
!1493 = !DILocation(line: 94, column: 31, scope: !1464, inlinedAt: !1480)
!1494 = !DILocation(line: 94, column: 20, scope: !1464, inlinedAt: !1480)
!1495 = !DILocation(line: 95, column: 35, scope: !1464, inlinedAt: !1480)
!1496 = !DILocation(line: 95, column: 24, scope: !1464, inlinedAt: !1480)
!1497 = !DILocation(line: 95, column: 16, scope: !1464, inlinedAt: !1480)
!1498 = !DILocation(line: 100, column: 32, scope: !1499, inlinedAt: !1480)
!1499 = distinct !DILexicalBlock(scope: !1464, file: !3, line: 100, column: 9)
!1500 = !DILocation(line: 100, column: 9, scope: !1499, inlinedAt: !1480)
!1501 = !DILocation(line: 100, column: 57, scope: !1499, inlinedAt: !1480)
!1502 = !DILocation(line: 100, column: 9, scope: !1464, inlinedAt: !1480)
!1503 = !DILocation(line: 98, column: 15, scope: !1464, inlinedAt: !1480)
!1504 = !DILocation(line: 94, column: 12, scope: !1464, inlinedAt: !1480)
!1505 = !DILocation(line: 103, column: 14, scope: !1464, inlinedAt: !1480)
!1506 = !DILocation(line: 103, column: 22, scope: !1464, inlinedAt: !1480)
!1507 = !DILocation(line: 105, column: 24, scope: !1464, inlinedAt: !1480)
!1508 = !DILocation(line: 105, column: 11, scope: !1464, inlinedAt: !1480)
!1509 = !DILocation(line: 106, column: 47, scope: !1510, inlinedAt: !1480)
!1510 = distinct !DILexicalBlock(scope: !1464, file: !3, line: 106, column: 9)
!1511 = !DILocation(line: 106, column: 73, scope: !1510, inlinedAt: !1480)
!1512 = !DILocation(line: 106, column: 9, scope: !1464, inlinedAt: !1480)
!1513 = !DILocation(line: 109, column: 10, scope: !1464, inlinedAt: !1480)
!1514 = !DILocation(line: 109, column: 18, scope: !1464, inlinedAt: !1480)
!1515 = !DILocation(line: 110, column: 10, scope: !1464, inlinedAt: !1480)
!1516 = !DILocation(line: 110, column: 19, scope: !1464, inlinedAt: !1480)
!1517 = !DILocation(line: 111, column: 10, scope: !1464, inlinedAt: !1480)
!1518 = !DILocation(line: 111, column: 18, scope: !1464, inlinedAt: !1480)
!1519 = !DILocation(line: 112, column: 10, scope: !1464, inlinedAt: !1480)
!1520 = !DILocation(line: 112, column: 20, scope: !1464, inlinedAt: !1480)
!1521 = !DILocation(line: 113, column: 10, scope: !1464, inlinedAt: !1480)
!1522 = !DILocation(line: 113, column: 22, scope: !1464, inlinedAt: !1480)
!1523 = !DILocation(line: 114, column: 28, scope: !1464, inlinedAt: !1480)
!1524 = !DILocation(line: 114, column: 5, scope: !1464, inlinedAt: !1480)
!1525 = !DILocation(line: 116, column: 13, scope: !1526, inlinedAt: !1480)
!1526 = distinct !DILexicalBlock(scope: !1464, file: !3, line: 116, column: 9)
!1527 = !DILocation(line: 116, column: 33, scope: !1526, inlinedAt: !1480)
!1528 = !DILocation(line: 119, column: 28, scope: !1464, inlinedAt: !1480)
!1529 = !DILocation(line: 119, column: 5, scope: !1464, inlinedAt: !1480)
!1530 = !DILocation(line: 119, column: 36, scope: !1464, inlinedAt: !1480)
!1531 = !DILocation(line: 122, column: 72, scope: !1532, inlinedAt: !1480)
!1532 = distinct !DILexicalBlock(scope: !1464, file: !3, line: 122, column: 9)
!1533 = !DILocation(line: 122, column: 97, scope: !1532, inlinedAt: !1480)
!1534 = !DILocation(line: 122, column: 9, scope: !1464, inlinedAt: !1480)
!1535 = !DILocation(line: 125, column: 18, scope: !1464, inlinedAt: !1480)
!1536 = !DILocation(line: 126, column: 32, scope: !1464, inlinedAt: !1480)
!1537 = !DILocation(line: 126, column: 37, scope: !1464, inlinedAt: !1480)
!1538 = !DILocation(line: 126, column: 10, scope: !1464, inlinedAt: !1480)
!1539 = !DILocation(line: 126, column: 20, scope: !1464, inlinedAt: !1480)
!1540 = !DILocation(line: 127, column: 10, scope: !1464, inlinedAt: !1480)
!1541 = !DILocation(line: 127, column: 22, scope: !1464, inlinedAt: !1480)
!1542 = !DILocation(line: 128, column: 29, scope: !1464, inlinedAt: !1480)
!1543 = !DILocation(line: 128, column: 25, scope: !1464, inlinedAt: !1480)
!1544 = !DILocation(line: 128, column: 10, scope: !1464, inlinedAt: !1480)
!1545 = !DILocation(line: 128, column: 23, scope: !1464, inlinedAt: !1480)
!1546 = !DILocation(line: 129, column: 10, scope: !1464, inlinedAt: !1480)
!1547 = !DILocation(line: 129, column: 20, scope: !1464, inlinedAt: !1480)
!1548 = !DILocation(line: 130, column: 10, scope: !1464, inlinedAt: !1480)
!1549 = !DILocation(line: 130, column: 16, scope: !1464, inlinedAt: !1480)
!1550 = !DILocation(line: 131, column: 10, scope: !1464, inlinedAt: !1480)
!1551 = !DILocation(line: 131, column: 14, scope: !1464, inlinedAt: !1480)
!1552 = !DILocation(line: 0, scope: !1478, inlinedAt: !1480)
!1553 = !DILocation(line: 136, column: 15, scope: !1554, inlinedAt: !1480)
!1554 = distinct !DILexicalBlock(scope: !1555, file: !3, line: 136, column: 13)
!1555 = distinct !DILexicalBlock(scope: !1556, file: !3, line: 135, column: 5)
!1556 = distinct !DILexicalBlock(scope: !1478, file: !3, line: 134, column: 5)
!1557 = !DILocation(line: 136, column: 13, scope: !1555, inlinedAt: !1480)
!1558 = !DILocation(line: 139, column: 136, scope: !1559, inlinedAt: !1480)
!1559 = distinct !DILexicalBlock(scope: !1555, file: !3, line: 139, column: 13)
!1560 = !DILocation(line: 139, column: 141, scope: !1559, inlinedAt: !1480)
!1561 = !DILocation(line: 139, column: 13, scope: !1555, inlinedAt: !1480)
!1562 = !DILocation(line: 142, column: 46, scope: !1555, inlinedAt: !1480)
!1563 = !DILocation(line: 142, column: 9, scope: !1555, inlinedAt: !1480)
!1564 = !DILocation(line: 136, column: 22, scope: !1554, inlinedAt: !1480)
!1565 = !DILocation(line: 142, column: 27, scope: !1555, inlinedAt: !1480)
!1566 = !DILocation(line: 152, column: 16, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1452, file: !3, line: 151, column: 9)
!1568 = !DILocation(line: 152, column: 9, scope: !1567)
!1569 = !DILocation(line: 154, column: 1, scope: !1452)
!1570 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 481, type: !298, scopeLine: 482, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1571)
!1571 = !{!1572}
!1572 = !DILocalVariable(name: "ctx", arg: 1, scope: !1570, file: !3, line: 481, type: !61)
!1573 = !DILocation(line: 0, scope: !1570)
!1574 = !DILocation(line: 483, column: 5, scope: !1570)
!1575 = distinct !DISubprogram(name: "rewrite_nexthop", scope: !360, file: !360, line: 446, type: !1576, scopeLine: 447, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1578)
!1576 = !DISubroutineType(types: !1577)
!1577 = !{!60, !61, !65}
!1578 = !{!1579, !1580, !1581, !1582, !1583, !1584, !1585, !1586}
!1579 = !DILocalVariable(name: "xdp", arg: 1, scope: !1575, file: !360, line: 446, type: !61)
!1580 = !DILocalVariable(name: "flag", arg: 2, scope: !1575, file: !360, line: 446, type: !65)
!1581 = !DILocalVariable(name: "data", scope: !1575, file: !360, line: 448, type: !53)
!1582 = !DILocalVariable(name: "data_end", scope: !1575, file: !360, line: 449, type: !53)
!1583 = !DILocalVariable(name: "ifindex", scope: !1575, file: !360, line: 457, type: !65)
!1584 = !DILocalVariable(name: "smac", scope: !1575, file: !360, line: 458, type: !122)
!1585 = !DILocalVariable(name: "dmac", scope: !1575, file: !360, line: 458, type: !122)
!1586 = !DILocalVariable(name: "is_exist", scope: !1575, file: !360, line: 460, type: !909)
!1587 = !DILocation(line: 0, scope: !1575)
!1588 = !DILocation(line: 448, column: 37, scope: !1575)
!1589 = !DILocation(line: 448, column: 26, scope: !1575)
!1590 = !DILocation(line: 448, column: 18, scope: !1575)
!1591 = !DILocation(line: 449, column: 41, scope: !1575)
!1592 = !DILocation(line: 449, column: 30, scope: !1575)
!1593 = !DILocation(line: 449, column: 22, scope: !1575)
!1594 = !DILocation(line: 452, column: 14, scope: !1595)
!1595 = distinct !DILexicalBlock(scope: !1575, file: !360, line: 452, column: 9)
!1596 = !DILocation(line: 452, column: 18, scope: !1595)
!1597 = !DILocation(line: 452, column: 9, scope: !1575)
!1598 = !DILocation(line: 457, column: 5, scope: !1575)
!1599 = !DILocation(line: 458, column: 5, scope: !1575)
!1600 = !DILocation(line: 458, column: 10, scope: !1575)
!1601 = !DILocation(line: 458, column: 19, scope: !1575)
!1602 = !DILocalVariable(name: "xdp", arg: 1, scope: !1603, file: !360, line: 334, type: !61)
!1603 = distinct !DISubprogram(name: "lookup_nexthop", scope: !360, file: !360, line: 334, type: !1604, scopeLine: 335, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1607)
!1604 = !DISubroutineType(types: !1605)
!1605 = !{!909, !61, !53, !53, !1606, !65}
!1606 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!1607 = !{!1602, !1608, !1609, !1610, !1611, !1612, !1613, !1614, !1615, !1616, !1617, !1618, !1619, !1621, !1622, !1623, !1625}
!1608 = !DILocalVariable(name: "smac", arg: 2, scope: !1603, file: !360, line: 334, type: !53)
!1609 = !DILocalVariable(name: "dmac", arg: 3, scope: !1603, file: !360, line: 334, type: !53)
!1610 = !DILocalVariable(name: "ifindex", arg: 4, scope: !1603, file: !360, line: 334, type: !1606)
!1611 = !DILocalVariable(name: "flag", arg: 5, scope: !1603, file: !360, line: 334, type: !65)
!1612 = !DILocalVariable(name: "data", scope: !1603, file: !360, line: 336, type: !53)
!1613 = !DILocalVariable(name: "data_end", scope: !1603, file: !360, line: 337, type: !53)
!1614 = !DILocalVariable(name: "eth", scope: !1603, file: !360, line: 338, type: !305)
!1615 = !DILocalVariable(name: "iph", scope: !1603, file: !360, line: 339, type: !313)
!1616 = !DILocalVariable(name: "v6h", scope: !1603, file: !360, line: 340, type: !328)
!1617 = !DILocalVariable(name: "fib_params", scope: !1603, file: !360, line: 341, type: !99)
!1618 = !DILocalVariable(name: "h_proto", scope: !1603, file: !360, line: 342, type: !55)
!1619 = !DILocalVariable(name: "src", scope: !1620, file: !360, line: 374, type: !71)
!1620 = distinct !DILexicalBlock(scope: !1603, file: !360, line: 352, column: 5)
!1621 = !DILocalVariable(name: "dst", scope: !1620, file: !360, line: 375, type: !71)
!1622 = !DILocalVariable(name: "rc", scope: !1603, file: !360, line: 397, type: !60)
!1623 = !DILocalVariable(name: "source", scope: !1624, file: !360, line: 409, type: !96)
!1624 = distinct !DILexicalBlock(scope: !1603, file: !360, line: 400, column: 5)
!1625 = !DILocalVariable(name: "dest", scope: !1624, file: !360, line: 410, type: !96)
!1626 = !DILocation(line: 0, scope: !1603, inlinedAt: !1627)
!1627 = distinct !DILocation(line: 460, column: 21, scope: !1575)
!1628 = !DILocation(line: 0, scope: !359, inlinedAt: !1629)
!1629 = distinct !DILocation(line: 339, column: 25, scope: !1603, inlinedAt: !1627)
!1630 = !DILocation(line: 247, column: 13, scope: !370, inlinedAt: !1629)
!1631 = !DILocation(line: 247, column: 19, scope: !370, inlinedAt: !1629)
!1632 = !DILocation(line: 247, column: 17, scope: !370, inlinedAt: !1629)
!1633 = !DILocation(line: 247, column: 9, scope: !359, inlinedAt: !1629)
!1634 = !DILocation(line: 0, scope: !375, inlinedAt: !1635)
!1635 = distinct !DILocation(line: 340, column: 27, scope: !1603, inlinedAt: !1627)
!1636 = !DILocation(line: 235, column: 13, scope: !385, inlinedAt: !1635)
!1637 = !DILocation(line: 235, column: 19, scope: !385, inlinedAt: !1635)
!1638 = !DILocation(line: 235, column: 17, scope: !385, inlinedAt: !1635)
!1639 = !DILocation(line: 235, column: 9, scope: !375, inlinedAt: !1635)
!1640 = !DILocation(line: 341, column: 5, scope: !1603, inlinedAt: !1627)
!1641 = !DILocation(line: 341, column: 27, scope: !1603, inlinedAt: !1627)
!1642 = !DILocation(line: 345, column: 38, scope: !1643, inlinedAt: !1627)
!1643 = distinct !DILexicalBlock(scope: !1603, file: !360, line: 345, column: 9)
!1644 = !DILocation(line: 345, column: 9, scope: !1603, inlinedAt: !1627)
!1645 = !DILocation(line: 338, column: 26, scope: !1603, inlinedAt: !1627)
!1646 = !DILocation(line: 348, column: 20, scope: !1603, inlinedAt: !1627)
!1647 = !DILocation(line: 349, column: 5, scope: !1603, inlinedAt: !1627)
!1648 = !DILocation(line: 351, column: 5, scope: !1603, inlinedAt: !1627)
!1649 = !DILocation(line: 354, column: 14, scope: !1650, inlinedAt: !1627)
!1650 = distinct !DILexicalBlock(scope: !1620, file: !360, line: 354, column: 13)
!1651 = !DILocation(line: 354, column: 13, scope: !1620, inlinedAt: !1627)
!1652 = !DILocation(line: 357, column: 20, scope: !1620, inlinedAt: !1627)
!1653 = !DILocation(line: 357, column: 27, scope: !1620, inlinedAt: !1627)
!1654 = !{!1655, !350, i64 0}
!1655 = !{!"bpf_fib_lookup", !350, i64 0, !350, i64 1, !412, i64 2, !412, i64 4, !412, i64 6, !349, i64 8, !350, i64 12, !350, i64 16, !350, i64 32, !412, i64 48, !412, i64 50, !350, i64 52, !350, i64 58}
!1656 = !DILocation(line: 358, column: 31, scope: !1620, inlinedAt: !1627)
!1657 = !DILocation(line: 358, column: 20, scope: !1620, inlinedAt: !1627)
!1658 = !DILocation(line: 358, column: 24, scope: !1620, inlinedAt: !1627)
!1659 = !DILocation(line: 359, column: 39, scope: !1620, inlinedAt: !1627)
!1660 = !DILocation(line: 359, column: 20, scope: !1620, inlinedAt: !1627)
!1661 = !DILocation(line: 359, column: 32, scope: !1620, inlinedAt: !1627)
!1662 = !{!1655, !350, i64 1}
!1663 = !DILocation(line: 360, column: 20, scope: !1620, inlinedAt: !1627)
!1664 = !DILocation(line: 360, column: 26, scope: !1620, inlinedAt: !1627)
!1665 = !{!1655, !412, i64 2}
!1666 = !DILocation(line: 361, column: 20, scope: !1620, inlinedAt: !1627)
!1667 = !DILocation(line: 361, column: 26, scope: !1620, inlinedAt: !1627)
!1668 = !{!1655, !412, i64 4}
!1669 = !DILocation(line: 362, column: 30, scope: !1620, inlinedAt: !1627)
!1670 = !DILocation(line: 362, column: 20, scope: !1620, inlinedAt: !1627)
!1671 = !DILocation(line: 362, column: 28, scope: !1620, inlinedAt: !1627)
!1672 = !{!1655, !412, i64 6}
!1673 = !DILocation(line: 363, column: 36, scope: !1620, inlinedAt: !1627)
!1674 = !{!429, !349, i64 12}
!1675 = !DILocation(line: 363, column: 20, scope: !1620, inlinedAt: !1627)
!1676 = !DILocation(line: 363, column: 29, scope: !1620, inlinedAt: !1627)
!1677 = !DILocation(line: 364, column: 36, scope: !1620, inlinedAt: !1627)
!1678 = !DILocation(line: 364, column: 20, scope: !1620, inlinedAt: !1627)
!1679 = !DILocation(line: 364, column: 29, scope: !1620, inlinedAt: !1627)
!1680 = !DILocation(line: 365, column: 9, scope: !1620, inlinedAt: !1627)
!1681 = !DILocation(line: 368, column: 14, scope: !1682, inlinedAt: !1627)
!1682 = distinct !DILexicalBlock(scope: !1620, file: !360, line: 368, column: 13)
!1683 = !DILocation(line: 368, column: 13, scope: !1620, inlinedAt: !1627)
!1684 = !DILocation(line: 371, column: 18, scope: !1685, inlinedAt: !1627)
!1685 = distinct !DILexicalBlock(scope: !1620, file: !360, line: 371, column: 13)
!1686 = !DILocation(line: 371, column: 28, scope: !1685, inlinedAt: !1627)
!1687 = !DILocation(line: 371, column: 13, scope: !1620, inlinedAt: !1627)
!1688 = !DILocation(line: 374, column: 62, scope: !1620, inlinedAt: !1627)
!1689 = !DILocation(line: 0, scope: !1620, inlinedAt: !1627)
!1690 = !DILocation(line: 375, column: 62, scope: !1620, inlinedAt: !1627)
!1691 = !DILocation(line: 377, column: 20, scope: !1620, inlinedAt: !1627)
!1692 = !DILocation(line: 377, column: 27, scope: !1620, inlinedAt: !1627)
!1693 = !DILocation(line: 378, column: 20, scope: !1620, inlinedAt: !1627)
!1694 = !DILocation(line: 378, column: 24, scope: !1620, inlinedAt: !1627)
!1695 = !DILocation(line: 379, column: 31, scope: !1620, inlinedAt: !1627)
!1696 = !DILocation(line: 379, column: 46, scope: !1620, inlinedAt: !1627)
!1697 = !DILocation(line: 379, column: 20, scope: !1620, inlinedAt: !1627)
!1698 = !DILocation(line: 379, column: 29, scope: !1620, inlinedAt: !1627)
!1699 = !DILocation(line: 380, column: 39, scope: !1620, inlinedAt: !1627)
!1700 = !DILocation(line: 380, column: 20, scope: !1620, inlinedAt: !1627)
!1701 = !DILocation(line: 380, column: 32, scope: !1620, inlinedAt: !1627)
!1702 = !DILocation(line: 381, column: 20, scope: !1620, inlinedAt: !1627)
!1703 = !DILocation(line: 381, column: 26, scope: !1620, inlinedAt: !1627)
!1704 = !DILocation(line: 382, column: 20, scope: !1620, inlinedAt: !1627)
!1705 = !DILocation(line: 382, column: 26, scope: !1620, inlinedAt: !1627)
!1706 = !DILocation(line: 383, column: 30, scope: !1620, inlinedAt: !1627)
!1707 = !DILocation(line: 383, column: 20, scope: !1620, inlinedAt: !1627)
!1708 = !DILocation(line: 383, column: 28, scope: !1620, inlinedAt: !1627)
!1709 = !DILocation(line: 384, column: 21, scope: !1620, inlinedAt: !1627)
!1710 = !DILocation(line: 385, column: 21, scope: !1620, inlinedAt: !1627)
!1711 = !DILocation(line: 386, column: 9, scope: !1620, inlinedAt: !1627)
!1712 = !DILocation(line: 395, column: 31, scope: !1603, inlinedAt: !1627)
!1713 = !{!348, !349, i64 12}
!1714 = !DILocation(line: 395, column: 16, scope: !1603, inlinedAt: !1627)
!1715 = !DILocation(line: 395, column: 24, scope: !1603, inlinedAt: !1627)
!1716 = !{!1655, !349, i64 8}
!1717 = !DILocation(line: 397, column: 29, scope: !1603, inlinedAt: !1627)
!1718 = !DILocation(line: 397, column: 14, scope: !1603, inlinedAt: !1627)
!1719 = !DILocation(line: 399, column: 5, scope: !1603, inlinedAt: !1627)
!1720 = !DILocation(line: 402, column: 13, scope: !1624, inlinedAt: !1627)
!1721 = !DILocalVariable(name: "iph", arg: 1, scope: !1722, file: !360, line: 144, type: !313)
!1722 = distinct !DISubprogram(name: "ip_decrease_ttl", scope: !360, file: !360, line: 144, type: !1723, scopeLine: 145, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1725)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!60, !313}
!1725 = !{!1721, !1726}
!1726 = !DILocalVariable(name: "check", scope: !1722, file: !360, line: 146, type: !65)
!1727 = !DILocation(line: 0, scope: !1722, inlinedAt: !1728)
!1728 = distinct !DILocation(line: 403, column: 13, scope: !1729, inlinedAt: !1627)
!1729 = distinct !DILexicalBlock(scope: !1624, file: !360, line: 402, column: 13)
!1730 = !DILocation(line: 146, column: 31, scope: !1722, inlinedAt: !1728)
!1731 = !DILocation(line: 148, column: 11, scope: !1722, inlinedAt: !1728)
!1732 = !DILocation(line: 149, column: 43, scope: !1722, inlinedAt: !1728)
!1733 = !DILocation(line: 149, column: 34, scope: !1722, inlinedAt: !1728)
!1734 = !DILocation(line: 149, column: 16, scope: !1722, inlinedAt: !1728)
!1735 = !DILocation(line: 150, column: 19, scope: !1722, inlinedAt: !1728)
!1736 = !DILocation(line: 150, column: 12, scope: !1722, inlinedAt: !1728)
!1737 = !DILocation(line: 403, column: 13, scope: !1729, inlinedAt: !1627)
!1738 = !DILocation(line: 405, column: 18, scope: !1739, inlinedAt: !1627)
!1739 = distinct !DILexicalBlock(scope: !1729, file: !360, line: 404, column: 18)
!1740 = !DILocation(line: 405, column: 27, scope: !1739, inlinedAt: !1627)
!1741 = !DILocation(line: 405, column: 13, scope: !1739, inlinedAt: !1627)
!1742 = !DILocation(line: 444, column: 1, scope: !1603, inlinedAt: !1627)
!1743 = !DILocation(line: 461, column: 9, scope: !1575)
!1744 = !DILocation(line: 407, column: 31, scope: !1624, inlinedAt: !1627)
!1745 = !DILocation(line: 407, column: 18, scope: !1624, inlinedAt: !1627)
!1746 = !DILocation(line: 0, scope: !1624, inlinedAt: !1627)
!1747 = !DILocation(line: 411, column: 43, scope: !1624, inlinedAt: !1627)
!1748 = !DILocation(line: 411, column: 9, scope: !1624, inlinedAt: !1627)
!1749 = !DILocation(line: 412, column: 45, scope: !1624, inlinedAt: !1627)
!1750 = !DILocation(line: 412, column: 9, scope: !1624, inlinedAt: !1627)
!1751 = !DILocalVariable(name: "data", arg: 1, scope: !1752, file: !360, line: 207, type: !53)
!1752 = distinct !DISubprogram(name: "set_src_dst_mac", scope: !360, file: !360, line: 207, type: !1753, scopeLine: 208, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1755)
!1753 = !DISubroutineType(types: !1754)
!1754 = !{null, !53, !53, !53}
!1755 = !{!1751, !1756, !1757, !1758, !1760, !1761}
!1756 = !DILocalVariable(name: "src", arg: 2, scope: !1752, file: !360, line: 207, type: !53)
!1757 = !DILocalVariable(name: "dst", arg: 3, scope: !1752, file: !360, line: 207, type: !53)
!1758 = !DILocalVariable(name: "source", scope: !1752, file: !360, line: 209, type: !1759)
!1759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!1760 = !DILocalVariable(name: "dest", scope: !1752, file: !360, line: 210, type: !1759)
!1761 = !DILocalVariable(name: "p", scope: !1752, file: !360, line: 211, type: !1759)
!1762 = !DILocation(line: 0, scope: !1752, inlinedAt: !1763)
!1763 = distinct !DILocation(line: 463, column: 9, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1765, file: !360, line: 462, column: 5)
!1765 = distinct !DILexicalBlock(scope: !1575, file: !360, line: 461, column: 9)
!1766 = !DILocation(line: 213, column: 5, scope: !1752, inlinedAt: !1763)
!1767 = !DILocation(line: 214, column: 24, scope: !1752, inlinedAt: !1763)
!1768 = !DILocation(line: 214, column: 5, scope: !1752, inlinedAt: !1763)
!1769 = !DILocation(line: 465, column: 14, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1764, file: !360, line: 465, column: 13)
!1771 = !DILocation(line: 465, column: 13, scope: !1764)
!1772 = !DILocation(line: 468, column: 18, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1764, file: !360, line: 468, column: 13)
!1774 = !DILocation(line: 468, column: 37, scope: !1773)
!1775 = !DILocation(line: 468, column: 34, scope: !1773)
!1776 = !DILocation(line: 468, column: 13, scope: !1764)
!1777 = !DILocation(line: 474, column: 16, scope: !1764)
!1778 = !DILocation(line: 474, column: 9, scope: !1764)
!1779 = !DILocation(line: 478, column: 1, scope: !1575)
