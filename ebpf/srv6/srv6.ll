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
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.5, %union.anon.6, %union.anon.7, i16, i16, [6 x i8], [6 x i8] }
%union.anon.5 = type { i32 }
%union.anon.6 = type { [4 x i32] }
%union.anon.7 = type { [4 x i32] }
%struct.args_mob_session = type <{ i8, %union.anon.8 }>
%union.anon.8 = type { i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %struct.in6_addr, %struct.in6_addr }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.srhhdr = type { i8, i8, i8, i8, i8, i8, i16, [0 x %struct.in6_addr] }
%struct.udphdr = type { i16, i16, i16, i16 }
%struct.gtp1hdr = type { i8, i8, i16, i32 }

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
  %2 = alloca %struct.bpf_fib_lookup, align 4
  %3 = alloca i32, align 4
  %4 = alloca %struct.bpf_fib_lookup, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.args_mob_session, align 1
  %8 = alloca %struct.bpf_fib_lookup, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.bpf_fib_lookup, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.bpf_fib_lookup, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.args_mob_session, align 1
  %17 = alloca %struct.bpf_fib_lookup, align 4
  %18 = alloca i32, align 4
  %19 = alloca [6 x i8], align 1
  %20 = alloca [6 x i8], align 1
  %21 = alloca %struct.lpm_key_v4, align 4
  %22 = alloca %struct.lpm_key_v6, align 4
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !301, metadata !DIExpression()), !dbg !345
  %23 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 0, i32 0), !dbg !346, !llvm.preserve.access.index !62
  %24 = load i32, i32* %23, align 4, !dbg !346, !tbaa !347
  %25 = zext i32 %24 to i64, !dbg !352
  %26 = inttoptr i64 %25 to i8*, !dbg !353
  call void @llvm.dbg.value(metadata i8* %26, metadata !302, metadata !DIExpression()), !dbg !345
  %27 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 1, i32 1), !dbg !354, !llvm.preserve.access.index !62
  %28 = load i32, i32* %27, align 4, !dbg !354, !tbaa !355
  %29 = zext i32 %28 to i64, !dbg !356
  %30 = inttoptr i64 %29 to i8*, !dbg !357
  call void @llvm.dbg.value(metadata i8* %30, metadata !303, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata i8* %26, metadata !304, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !367
  call void @llvm.dbg.value(metadata i8* %26, metadata !364, metadata !DIExpression()) #6, !dbg !367
  call void @llvm.dbg.value(metadata i64 %29, metadata !365, metadata !DIExpression()) #6, !dbg !367
  call void @llvm.dbg.value(metadata i8* %26, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !367
  %31 = getelementptr i8, i8* %26, i64 34, !dbg !369
  %32 = bitcast i8* %31 to %struct.iphdr*, !dbg !369
  %33 = inttoptr i64 %29 to %struct.iphdr*, !dbg !371
  %34 = icmp ugt %struct.iphdr* %32, %33, !dbg !372
  %35 = getelementptr i8, i8* %26, i64 14, !dbg !373
  %36 = bitcast i8* %35 to %struct.iphdr*, !dbg !373
  %37 = select i1 %34, %struct.iphdr* null, %struct.iphdr* %36, !dbg !373
  call void @llvm.dbg.value(metadata %struct.iphdr* %37, metadata !312, metadata !DIExpression()), !dbg !345
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !382
  call void @llvm.dbg.value(metadata i8* %26, metadata !379, metadata !DIExpression()) #6, !dbg !382
  call void @llvm.dbg.value(metadata i64 %29, metadata !380, metadata !DIExpression()) #6, !dbg !382
  call void @llvm.dbg.value(metadata i8* %26, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !382
  %38 = getelementptr i8, i8* %26, i64 54, !dbg !384
  %39 = bitcast i8* %38 to %struct.ipv6hdr*, !dbg !384
  %40 = inttoptr i64 %29 to %struct.ipv6hdr*, !dbg !386
  %41 = icmp ugt %struct.ipv6hdr* %39, %40, !dbg !387
  %42 = bitcast i8* %35 to %struct.ipv6hdr*, !dbg !388
  %43 = select i1 %41, %struct.ipv6hdr* null, %struct.ipv6hdr* %42, !dbg !388
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %43, metadata !327, metadata !DIExpression()), !dbg !345
  %44 = bitcast %struct.lpm_key_v4* %21 to i8*, !dbg !389
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %44) #6, !dbg !389
  call void @llvm.dbg.declare(metadata %struct.lpm_key_v4* %21, metadata !342, metadata !DIExpression()), !dbg !390
  %45 = bitcast %struct.lpm_key_v6* %22 to i8*, !dbg !391
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %45) #6, !dbg !391
  call void @llvm.dbg.declare(metadata %struct.lpm_key_v6* %22, metadata !343, metadata !DIExpression()), !dbg !392
  %46 = icmp ugt i8* %35, %30, !dbg !393
  br i1 %46, label %47, label %49, !dbg !395

47:                                               ; preds = %1
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !404
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !404
  call void @llvm.dbg.value(metadata i32 2, metadata !403, metadata !DIExpression()) #6, !dbg !404
  %48 = tail call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 2) #6, !dbg !406
  br label %1845, !dbg !407

49:                                               ; preds = %1
  %50 = inttoptr i64 %25 to %struct.ethhdr*, !dbg !408
  call void @llvm.dbg.value(metadata %struct.ethhdr* %50, metadata !304, metadata !DIExpression()), !dbg !345
  %51 = tail call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %50, i32 2, i32 2), !dbg !409, !llvm.preserve.access.index !306
  %52 = load i16, i16* %51, align 2, !dbg !409, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %52, metadata !344, metadata !DIExpression()), !dbg !345
  switch i16 %52, label %1843 [
    i16 8, label %53
    i16 -8826, label %752
  ], !dbg !413

53:                                               ; preds = %49
  %54 = icmp eq %struct.iphdr* %37, null, !dbg !414
  br i1 %54, label %55, label %57, !dbg !418

55:                                               ; preds = %53
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !419
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !419
  call void @llvm.dbg.value(metadata i32 1, metadata !403, metadata !DIExpression()) #6, !dbg !419
  %56 = tail call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 1) #6, !dbg !421
  br label %1845, !dbg !422

57:                                               ; preds = %53
  %58 = getelementptr inbounds %struct.lpm_key_v4, %struct.lpm_key_v4* %21, i64 0, i32 0, !dbg !423
  store i32 32, i32* %58, align 4, !dbg !424, !tbaa !425
  %59 = tail call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %37, i32 9, i32 10), !dbg !427, !llvm.preserve.access.index !314
  %60 = load i32, i32* %59, align 4, !dbg !427, !tbaa !428
  %61 = getelementptr inbounds %struct.lpm_key_v4, %struct.lpm_key_v4* %21, i64 0, i32 1, !dbg !430
  store i32 %60, i32* %61, align 4, !dbg !431, !tbaa !432
  %62 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon* @transit_table_v4 to i8*), i8* nonnull %44) #6, !dbg !433
  %63 = bitcast i8* %62 to %struct.transit_behavior*, !dbg !433
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %63, metadata !341, metadata !DIExpression()), !dbg !345
  %64 = icmp eq i8* %62, null, !dbg !434
  br i1 %64, label %1843, label %65, !dbg !436

65:                                               ; preds = %57
  %66 = getelementptr inbounds i8, i8* %62, i64 44, !dbg !437
  %67 = bitcast i8* %66 to i32*, !dbg !437
  %68 = load i32, i32* %67, align 4, !dbg !437, !tbaa !439
  switch i32 %68, label %1843 [
    i32 1, label %69
    i32 5, label %319
  ], !dbg !442

69:                                               ; preds = %65
  %70 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %37, i32 2, i32 3), !dbg !443, !llvm.preserve.access.index !314
  %71 = load i16, i16* %70, align 2, !dbg !443, !tbaa !445
  %72 = lshr i16 %71, 8, !dbg !443
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !446, metadata !DIExpression()) #6, !dbg !455
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %63, metadata !451, metadata !DIExpression()) #6, !dbg !455
  call void @llvm.dbg.value(metadata i8 4, metadata !452, metadata !DIExpression()) #6, !dbg !455
  call void @llvm.dbg.value(metadata i16 %72, metadata !453, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !455
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !457, metadata !DIExpression()) #6, !dbg !487
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %63, metadata !462, metadata !DIExpression()) #6, !dbg !487
  call void @llvm.dbg.value(metadata i8 4, metadata !463, metadata !DIExpression()) #6, !dbg !487
  call void @llvm.dbg.value(metadata i16 %72, metadata !464, metadata !DIExpression()) #6, !dbg !487
  call void @llvm.dbg.value(metadata i32 undef, metadata !465, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !487
  call void @llvm.dbg.value(metadata i32 undef, metadata !466, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !487
  %73 = getelementptr inbounds i8, i8* %62, i64 40, !dbg !489
  %74 = bitcast i8* %73 to i32*, !dbg !489
  %75 = load i32, i32* %74, align 4, !dbg !489, !tbaa !490
  %76 = trunc i32 %75 to i8, !dbg !491
  %77 = shl i8 %76, 4, !dbg !492
  %78 = or i8 %77, 8, !dbg !493
  call void @llvm.dbg.value(metadata i8 %78, metadata !483, metadata !DIExpression()) #6, !dbg !487
  %79 = zext i8 %78 to i32, !dbg !494
  %80 = add nuw nsw i32 %79, 40, !dbg !496
  %81 = sub nsw i32 0, %80, !dbg !497
  %82 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %81) #6, !dbg !498
  %83 = icmp eq i64 %82, 0, !dbg !498
  br i1 %83, label %84, label %316, !dbg !499

84:                                               ; preds = %69
  %85 = load i32, i32* %23, align 4, !dbg !500, !tbaa !347
  %86 = zext i32 %85 to i64, !dbg !501
  call void @llvm.dbg.value(metadata i64 %86, metadata !465, metadata !DIExpression()) #6, !dbg !487
  %87 = load i32, i32* %27, align 4, !dbg !502, !tbaa !355
  %88 = zext i32 %87 to i64, !dbg !503
  %89 = inttoptr i64 %88 to i8*, !dbg !504
  call void @llvm.dbg.value(metadata i8* %89, metadata !466, metadata !DIExpression()) #6, !dbg !487
  call void @llvm.dbg.value(metadata i64 %86, metadata !484, metadata !DIExpression()) #6, !dbg !487
  %90 = add nuw nsw i64 %86, 14, !dbg !505
  %91 = inttoptr i64 %90 to i8*, !dbg !507
  %92 = icmp ugt i8* %91, %89, !dbg !508
  br i1 %92, label %316, label %93, !dbg !509

93:                                               ; preds = %84
  %94 = inttoptr i64 %86 to %struct.ethhdr*, !dbg !510
  call void @llvm.dbg.value(metadata %struct.ethhdr* %94, metadata !484, metadata !DIExpression()) #6, !dbg !487
  %95 = inttoptr i64 %86 to i8*, !dbg !511
  call void @llvm.dbg.value(metadata i8* %95, metadata !465, metadata !DIExpression()) #6, !dbg !487
  %96 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %94, i32 2, i32 2) #6, !dbg !512, !llvm.preserve.access.index !306
  store i16 -8826, i16* %96, align 2, !dbg !513, !tbaa !410
  %97 = getelementptr i8, i8* %95, i64 14, !dbg !514
  %98 = bitcast i8* %97 to %struct.ipv6hdr*, !dbg !515
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %98, metadata !467, metadata !DIExpression()) #6, !dbg !487
  %99 = getelementptr i8, i8* %95, i64 54, !dbg !516
  %100 = icmp ugt i8* %99, %89, !dbg !518
  br i1 %100, label %316, label %101, !dbg !519

101:                                              ; preds = %93
  %102 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 0, i32 1) #6, !dbg !520, !llvm.preserve.access.index !329
  %103 = load i8, i8* %102, align 4, !dbg !521
  %104 = and i8 %103, 15, !dbg !521
  %105 = or i8 %104, 96, !dbg !521
  store i8 %105, i8* %102, align 4, !dbg !521
  %106 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 0, i32 0) #6, !dbg !522, !llvm.preserve.access.index !329
  %107 = load i8, i8* %106, align 4, !dbg !523
  %108 = and i8 %107, -16, !dbg !523
  store i8 %108, i8* %106, align 4, !dbg !523
  %109 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 3, i32 4) #6, !dbg !524, !llvm.preserve.access.index !329
  store i8 43, i8* %109, align 2, !dbg !525, !tbaa !526
  %110 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 4, i32 5) #6, !dbg !528, !llvm.preserve.access.index !329
  store i8 64, i8* %110, align 1, !dbg !529, !tbaa !530
  %111 = zext i8 %78 to i16
  %112 = add nuw nsw i16 %72, %111
  %113 = call i16 @llvm.bswap.i16(i16 %112) #6
  %114 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 2, i32 3) #6, !dbg !531, !llvm.preserve.access.index !329
  store i16 %113, i16* %114, align 4, !dbg !532, !tbaa !533
  %115 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 5, i32 6) #6, !dbg !534, !llvm.preserve.access.index !329
  %116 = bitcast %struct.in6_addr* %115 to i8*, !dbg !535
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %116, i8* nonnull align 4 dereferenceable(16) %62, i64 16, i1 false) #6, !dbg !535
  %117 = load i32, i32* %74, align 4, !dbg !536, !tbaa !490
  %118 = add i32 %117, -1, !dbg !538
  %119 = icmp ugt i32 %118, 4, !dbg !538
  br i1 %119, label %316, label %120, !dbg !538

120:                                              ; preds = %101
  %121 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %98, i32 6, i32 7) #6, !dbg !539, !llvm.preserve.access.index !329
  %122 = bitcast %struct.in6_addr* %121 to i8*, !dbg !540
  %123 = zext i32 %118 to i64, !dbg !541
  %124 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %63, i64 0, i32 6, i64 %123, !dbg !541
  %125 = bitcast %struct.in6_addr* %124 to i8*, !dbg !540
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %122, i8* nonnull align 4 dereferenceable(16) %125, i64 16, i1 false) #6, !dbg !540
  call void @llvm.dbg.value(metadata i8* %99, metadata !468, metadata !DIExpression()) #6, !dbg !487
  %126 = getelementptr i8, i8* %95, i64 62, !dbg !542
  %127 = icmp ugt i8* %126, %89, !dbg !544
  br i1 %127, label %316, label %128, !dbg !545

128:                                              ; preds = %120
  store i8 4, i8* %99, align 4, !dbg !546, !tbaa !547
  %129 = lshr exact i8 %78, 3, !dbg !549
  %130 = add nsw i8 %129, -1, !dbg !550
  %131 = getelementptr i8, i8* %95, i64 55, !dbg !551
  store i8 %130, i8* %131, align 1, !dbg !552, !tbaa !553
  %132 = getelementptr i8, i8* %95, i64 56, !dbg !554
  store i8 4, i8* %132, align 2, !dbg !555, !tbaa !556
  %133 = load i32, i32* %74, align 4, !dbg !557, !tbaa !490
  %134 = trunc i32 %133 to i8, !dbg !558
  %135 = add i8 %134, -1, !dbg !558
  %136 = getelementptr i8, i8* %95, i64 57, !dbg !559
  store i8 %135, i8* %136, align 1, !dbg !560, !tbaa !561
  %137 = getelementptr i8, i8* %95, i64 58, !dbg !562
  store i8 %135, i8* %137, align 4, !dbg !563, !tbaa !564
  %138 = getelementptr i8, i8* %95, i64 59, !dbg !565
  store i8 0, i8* %138, align 1, !dbg !566, !tbaa !567
  %139 = getelementptr i8, i8* %95, i64 60, !dbg !568
  %140 = bitcast i8* %139 to i16*, !dbg !568
  store i16 0, i16* %140, align 2, !dbg !569, !tbaa !570
  call void @llvm.dbg.value(metadata i32 0, metadata !485, metadata !DIExpression()) #6, !dbg !571
  call void @llvm.dbg.value(metadata i64 0, metadata !485, metadata !DIExpression()) #6, !dbg !571
  %141 = icmp eq i32 %133, 0, !dbg !572
  br i1 %141, label %179, label %142, !dbg !576

142:                                              ; preds = %128
  %143 = getelementptr i8, i8* %95, i64 79, !dbg !577
  %144 = icmp ugt i8* %143, %89, !dbg !579
  br i1 %144, label %316, label %145, !dbg !580

145:                                              ; preds = %142
  %146 = getelementptr inbounds i8, i8* %62, i64 48, !dbg !581
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %126, i8* nonnull align 4 dereferenceable(16) %146, i64 16, i1 false) #6, !dbg !582
  call void @llvm.dbg.value(metadata i64 1, metadata !485, metadata !DIExpression()) #6, !dbg !571
  %147 = load i32, i32* %74, align 4, !dbg !583, !tbaa !490
  %148 = icmp ugt i32 %147, 1, !dbg !572
  br i1 %148, label %149, label %179, !dbg !576

149:                                              ; preds = %145
  %150 = getelementptr i8, i8* %95, i64 95, !dbg !577
  %151 = icmp ugt i8* %150, %89, !dbg !579
  br i1 %151, label %316, label %152, !dbg !580

152:                                              ; preds = %149
  %153 = getelementptr i8, i8* %95, i64 78, !dbg !584
  %154 = getelementptr inbounds i8, i8* %62, i64 64, !dbg !581
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %153, i8* nonnull align 4 dereferenceable(16) %154, i64 16, i1 false) #6, !dbg !582
  call void @llvm.dbg.value(metadata i64 2, metadata !485, metadata !DIExpression()) #6, !dbg !571
  %155 = load i32, i32* %74, align 4, !dbg !583, !tbaa !490
  %156 = icmp ugt i32 %155, 2, !dbg !572
  br i1 %156, label %157, label %179, !dbg !576

157:                                              ; preds = %152
  %158 = getelementptr i8, i8* %95, i64 111, !dbg !577
  %159 = icmp ugt i8* %158, %89, !dbg !579
  br i1 %159, label %316, label %160, !dbg !580

160:                                              ; preds = %157
  %161 = getelementptr i8, i8* %95, i64 94, !dbg !584
  %162 = getelementptr inbounds i8, i8* %62, i64 80, !dbg !581
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %161, i8* nonnull align 4 dereferenceable(16) %162, i64 16, i1 false) #6, !dbg !582
  call void @llvm.dbg.value(metadata i64 3, metadata !485, metadata !DIExpression()) #6, !dbg !571
  %163 = load i32, i32* %74, align 4, !dbg !583, !tbaa !490
  %164 = icmp ugt i32 %163, 3, !dbg !572
  br i1 %164, label %165, label %179, !dbg !576

165:                                              ; preds = %160
  %166 = getelementptr i8, i8* %95, i64 127, !dbg !577
  %167 = icmp ugt i8* %166, %89, !dbg !579
  br i1 %167, label %316, label %168, !dbg !580

168:                                              ; preds = %165
  %169 = getelementptr i8, i8* %95, i64 110, !dbg !584
  %170 = getelementptr inbounds i8, i8* %62, i64 96, !dbg !581
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %169, i8* nonnull align 4 dereferenceable(16) %170, i64 16, i1 false) #6, !dbg !582
  call void @llvm.dbg.value(metadata i64 4, metadata !485, metadata !DIExpression()) #6, !dbg !571
  %171 = load i32, i32* %74, align 4, !dbg !583, !tbaa !490
  %172 = icmp ugt i32 %171, 4, !dbg !572
  br i1 %172, label %173, label %179, !dbg !576

173:                                              ; preds = %168
  %174 = getelementptr i8, i8* %95, i64 143, !dbg !577
  %175 = icmp ugt i8* %174, %89, !dbg !579
  br i1 %175, label %316, label %176, !dbg !580

176:                                              ; preds = %173
  %177 = getelementptr i8, i8* %95, i64 126, !dbg !584
  %178 = getelementptr inbounds i8, i8* %62, i64 112, !dbg !581
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %177, i8* nonnull align 4 dereferenceable(16) %178, i64 16, i1 false) #6, !dbg !582
  call void @llvm.dbg.value(metadata i64 5, metadata !485, metadata !DIExpression()) #6, !dbg !571
  br label %179

179:                                              ; preds = %176, %168, %160, %152, %145, %128
  call void @llvm.dbg.value(metadata i32 10000, metadata !454, metadata !DIExpression()) #6, !dbg !455
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !585, metadata !DIExpression()) #6, !dbg !599
  call void @llvm.dbg.value(metadata i32 2, metadata !590, metadata !DIExpression()) #6, !dbg !599
  %180 = getelementptr inbounds [6 x i8], [6 x i8]* %20, i64 0, i64 0
  %181 = getelementptr inbounds [6 x i8], [6 x i8]* %19, i64 0, i64 0
  %182 = load i32, i32* %23, align 4, !dbg !602, !tbaa !347
  %183 = zext i32 %182 to i64, !dbg !603
  %184 = inttoptr i64 %183 to i8*, !dbg !604
  call void @llvm.dbg.value(metadata i8* %184, metadata !591, metadata !DIExpression()) #6, !dbg !599
  %185 = load i32, i32* %27, align 4, !dbg !605, !tbaa !355
  %186 = zext i32 %185 to i64, !dbg !606
  %187 = inttoptr i64 %186 to i8*, !dbg !607
  call void @llvm.dbg.value(metadata i8* %187, metadata !592, metadata !DIExpression()) #6, !dbg !599
  %188 = getelementptr i8, i8* %184, i64 1, !dbg !608
  %189 = icmp ugt i8* %188, %187, !dbg !610
  br i1 %189, label %316, label %190, !dbg !611

190:                                              ; preds = %179
  %191 = bitcast i32* %18 to i8*, !dbg !612
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %191) #6, !dbg !612
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %181), !dbg !613
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !594, metadata !DIExpression()) #6, !dbg !614
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %180), !dbg !613
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !595, metadata !DIExpression()) #6, !dbg !615
  call void @llvm.dbg.value(metadata i32* %18, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !599
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !616, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i8* %181, metadata !622, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i8* %180, metadata !623, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i32* %18, metadata !624, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i32 2, metadata !625, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i8* %184, metadata !626, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i8* %187, metadata !627, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata i8* %184, metadata !628, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !642
  call void @llvm.dbg.value(metadata i8* %184, metadata !364, metadata !DIExpression()) #6, !dbg !642
  call void @llvm.dbg.value(metadata i64 %186, metadata !365, metadata !DIExpression()) #6, !dbg !642
  call void @llvm.dbg.value(metadata i8* %184, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !642
  %192 = getelementptr i8, i8* %184, i64 34, !dbg !644
  %193 = bitcast i8* %192 to %struct.iphdr*, !dbg !644
  %194 = inttoptr i64 %186 to %struct.iphdr*, !dbg !645
  %195 = icmp ugt %struct.iphdr* %193, %194, !dbg !646
  %196 = getelementptr i8, i8* %184, i64 14, !dbg !647
  %197 = bitcast i8* %196 to %struct.iphdr*, !dbg !647
  %198 = select i1 %195, %struct.iphdr* null, %struct.iphdr* %197, !dbg !647
  call void @llvm.dbg.value(metadata %struct.iphdr* %198, metadata !629, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !648
  call void @llvm.dbg.value(metadata i8* %184, metadata !379, metadata !DIExpression()) #6, !dbg !648
  call void @llvm.dbg.value(metadata i64 %186, metadata !380, metadata !DIExpression()) #6, !dbg !648
  call void @llvm.dbg.value(metadata i8* %184, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !648
  %199 = getelementptr i8, i8* %184, i64 54, !dbg !650
  %200 = bitcast i8* %199 to %struct.ipv6hdr*, !dbg !650
  %201 = inttoptr i64 %186 to %struct.ipv6hdr*, !dbg !651
  %202 = icmp ugt %struct.ipv6hdr* %200, %201, !dbg !652
  %203 = bitcast i8* %196 to %struct.ipv6hdr*, !dbg !653
  %204 = select i1 %202, %struct.ipv6hdr* null, %struct.ipv6hdr* %203, !dbg !653
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %204, metadata !630, metadata !DIExpression()) #6, !dbg !640
  %205 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %17, i64 0, i32 0, !dbg !654
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %205) #6, !dbg !654
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %17, metadata !631, metadata !DIExpression()) #6, !dbg !655
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %205, i8 0, i64 64, i1 false) #6, !dbg !655
  %206 = icmp ugt i8* %196, %187, !dbg !656
  br i1 %206, label %297, label %207, !dbg !658

207:                                              ; preds = %190
  %208 = inttoptr i64 %183 to %struct.ethhdr*, !dbg !659
  call void @llvm.dbg.value(metadata %struct.ethhdr* %208, metadata !628, metadata !DIExpression()) #6, !dbg !640
  %209 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %208, i32 2, i32 2) #6, !dbg !660, !llvm.preserve.access.index !306
  %210 = load i16, i16* %209, align 2, !dbg !660, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %210, metadata !632, metadata !DIExpression()) #6, !dbg !640
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %205, i8 0, i64 64, i1 false) #6, !dbg !661
  switch i16 %210, label %297 [
    i16 8, label %211
    i16 -8826, label %239
  ], !dbg !662

211:                                              ; preds = %207
  %212 = icmp eq %struct.iphdr* %198, null, !dbg !663
  br i1 %212, label %297, label %213, !dbg !665

213:                                              ; preds = %211
  %214 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 0, i32 0) #6, !dbg !666, !llvm.preserve.access.index !99
  store i8 2, i8* %214, align 4, !dbg !667, !tbaa !668
  %215 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %198, i32 1, i32 2) #6, !dbg !670, !llvm.preserve.access.index !314
  %216 = load i8, i8* %215, align 1, !dbg !670, !tbaa !671
  %217 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 6, i32 6) #6, !dbg !672, !llvm.preserve.access.index !99
  %218 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %217, i32 0) #6, !dbg !672, !llvm.preserve.access.index !98
  %219 = bitcast %union.anon.5* %218 to i8*, !dbg !672
  store i8 %216, i8* %219, align 4, !dbg !673, !tbaa !674
  %220 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %198, i32 6, i32 7) #6, !dbg !675, !llvm.preserve.access.index !314
  %221 = load i8, i8* %220, align 1, !dbg !675, !tbaa !676
  %222 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 1, i32 1) #6, !dbg !677, !llvm.preserve.access.index !99
  store i8 %221, i8* %222, align 1, !dbg !678, !tbaa !679
  %223 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 2, i32 2) #6, !dbg !680, !llvm.preserve.access.index !99
  store i16 0, i16* %223, align 2, !dbg !681, !tbaa !682
  %224 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 3, i32 3) #6, !dbg !683, !llvm.preserve.access.index !99
  store i16 0, i16* %224, align 4, !dbg !684, !tbaa !685
  %225 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %198, i32 2, i32 3) #6, !dbg !686, !llvm.preserve.access.index !314
  %226 = load i16, i16* %225, align 2, !dbg !686, !tbaa !445
  %227 = call i16 @llvm.bswap.i16(i16 %226) #6
  %228 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 4, i32 4) #6, !dbg !687, !llvm.preserve.access.index !99
  store i16 %227, i16* %228, align 2, !dbg !688, !tbaa !689
  %229 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %198, i32 8, i32 9) #6, !dbg !690, !llvm.preserve.access.index !314
  %230 = load i32, i32* %229, align 4, !dbg !690, !tbaa !691
  %231 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 7, i32 7) #6, !dbg !692, !llvm.preserve.access.index !99
  %232 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %231, i32 0) #6, !dbg !692, !llvm.preserve.access.index !109
  %233 = getelementptr %union.anon.6, %union.anon.6* %232, i64 0, i32 0, i64 0, !dbg !692
  store i32 %230, i32* %233, align 4, !dbg !693, !tbaa !674
  %234 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %198, i32 9, i32 10) #6, !dbg !694, !llvm.preserve.access.index !314
  %235 = load i32, i32* %234, align 4, !dbg !694, !tbaa !428
  %236 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 8, i32 8) #6, !dbg !695, !llvm.preserve.access.index !99
  %237 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %236, i32 0) #6, !dbg !695, !llvm.preserve.access.index !115
  %238 = getelementptr %union.anon.7, %union.anon.7* %237, i64 0, i32 0, i64 0, !dbg !695
  store i32 %235, i32* %238, align 4, !dbg !696, !tbaa !674
  br label %274, !dbg !697

239:                                              ; preds = %207
  %240 = icmp eq %struct.ipv6hdr* %204, null, !dbg !698
  br i1 %240, label %297, label %241, !dbg !700

241:                                              ; preds = %239
  %242 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %204, i32 4, i32 5) #6, !dbg !701, !llvm.preserve.access.index !329
  %243 = load i8, i8* %242, align 1, !dbg !701, !tbaa !530
  %244 = icmp ult i8 %243, 2, !dbg !703
  br i1 %244, label %297, label %245, !dbg !704

245:                                              ; preds = %241
  %246 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 7, i32 7) #6, !dbg !705, !llvm.preserve.access.index !99
  %247 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %246, i32 1) #6, !dbg !705, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %247, metadata !633, metadata !DIExpression()) #6, !dbg !706
  %248 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 8, i32 8) #6, !dbg !707, !llvm.preserve.access.index !99
  %249 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %248, i32 1) #6, !dbg !707, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %249, metadata !635, metadata !DIExpression()) #6, !dbg !706
  %250 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 0, i32 0) #6, !dbg !708, !llvm.preserve.access.index !99
  store i8 10, i8* %250, align 4, !dbg !709, !tbaa !668
  %251 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 6, i32 6) #6, !dbg !710, !llvm.preserve.access.index !99
  %252 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %251, i32 0) #6, !dbg !710, !llvm.preserve.access.index !98
  %253 = bitcast %union.anon.5* %252 to i8*, !dbg !710
  store i8 0, i8* %253, align 4, !dbg !711, !tbaa !674
  %254 = bitcast %struct.ipv6hdr* %204 to i32*, !dbg !712
  %255 = load i32, i32* %254, align 4, !dbg !712, !tbaa !713
  %256 = and i32 %255, -241, !dbg !714
  %257 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %251, i32 1) #6, !dbg !715, !llvm.preserve.access.index !98
  %258 = getelementptr %union.anon.5, %union.anon.5* %257, i64 0, i32 0, !dbg !715
  store i32 %256, i32* %258, align 4, !dbg !716, !tbaa !674
  %259 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %204, i32 3, i32 4) #6, !dbg !717, !llvm.preserve.access.index !329
  %260 = load i8, i8* %259, align 2, !dbg !717, !tbaa !526
  %261 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 1, i32 1) #6, !dbg !718, !llvm.preserve.access.index !99
  store i8 %260, i8* %261, align 1, !dbg !719, !tbaa !679
  %262 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 2, i32 2) #6, !dbg !720, !llvm.preserve.access.index !99
  store i16 0, i16* %262, align 2, !dbg !721, !tbaa !682
  %263 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 3, i32 3) #6, !dbg !722, !llvm.preserve.access.index !99
  store i16 0, i16* %263, align 4, !dbg !723, !tbaa !685
  %264 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %204, i32 2, i32 3) #6, !dbg !724, !llvm.preserve.access.index !329
  %265 = load i16, i16* %264, align 4, !dbg !724, !tbaa !533
  %266 = call i16 @llvm.bswap.i16(i16 %265) #6
  %267 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 4, i32 4) #6, !dbg !725, !llvm.preserve.access.index !99
  store i16 %266, i16* %267, align 2, !dbg !726, !tbaa !689
  %268 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %204, i32 5, i32 6) #6, !dbg !727, !llvm.preserve.access.index !329
  %269 = bitcast %union.anon.6* %247 to i8*, !dbg !727
  %270 = bitcast %struct.in6_addr* %268 to i8*, !dbg !727
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %269, i8* nonnull align 4 dereferenceable(16) %270, i64 16, i1 false) #6, !dbg !727, !tbaa.struct !728
  %271 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %204, i32 6, i32 7) #6, !dbg !729, !llvm.preserve.access.index !329
  %272 = bitcast %union.anon.7* %249 to i8*, !dbg !729
  %273 = bitcast %struct.in6_addr* %271 to i8*, !dbg !729
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %272, i8* nonnull align 4 dereferenceable(16) %273, i64 16, i1 false) #6, !dbg !729, !tbaa.struct !728
  br label %274, !dbg !730

274:                                              ; preds = %245, %213
  %275 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #6, !dbg !731, !llvm.preserve.access.index !62
  %276 = load i32, i32* %275, align 4, !dbg !731, !tbaa !732
  %277 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 5, i32 5) #6, !dbg !733, !llvm.preserve.access.index !99
  store i32 %276, i32* %277, align 4, !dbg !734, !tbaa !735
  %278 = bitcast %struct.xdp_md* %0 to i8*, !dbg !736
  %279 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %278, %struct.bpf_fib_lookup* nonnull %17, i32 64, i32 2) #6, !dbg !737
  %280 = trunc i64 %279 to i32, !dbg !737
  call void @llvm.dbg.value(metadata i32 %280, metadata !636, metadata !DIExpression()) #6, !dbg !640
  %281 = icmp eq i32 %280, 0, !dbg !738
  br i1 %281, label %282, label %297, !dbg !738

282:                                              ; preds = %274
  switch i16 %210, label %298 [
    i16 8, label %283
    i16 -8826, label %293
  ], !dbg !739

283:                                              ; preds = %282
  call void @llvm.dbg.value(metadata %struct.iphdr* %198, metadata !740, metadata !DIExpression()) #6, !dbg !746
  %284 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* %198, i32 7, i32 8) #6, !dbg !749, !llvm.preserve.access.index !314
  %285 = load i16, i16* %284, align 2, !dbg !749, !tbaa !750
  call void @llvm.dbg.value(metadata i16 %285, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !746
  %286 = add i16 %285, 1, !dbg !751
  call void @llvm.dbg.value(metadata i16 %285, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !746
  %287 = icmp ugt i16 %285, -3, !dbg !752
  %288 = zext i1 %287 to i16, !dbg !752
  %289 = add i16 %286, %288, !dbg !753
  store i16 %289, i16* %284, align 2, !dbg !754, !tbaa !750
  %290 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %198, i32 5, i32 6) #6, !dbg !755, !llvm.preserve.access.index !314
  %291 = load i8, i8* %290, align 4, !dbg !756, !tbaa !757
  %292 = add i8 %291, -1, !dbg !756
  store i8 %292, i8* %290, align 4, !dbg !756, !tbaa !757
  br label %298, !dbg !758

293:                                              ; preds = %282
  %294 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %204, i32 4, i32 5) #6, !dbg !759, !llvm.preserve.access.index !329
  %295 = load i8, i8* %294, align 1, !dbg !761, !tbaa !530
  %296 = add i8 %295, -1, !dbg !761
  store i8 %296, i8* %294, align 1, !dbg !761, !tbaa !530
  br label %298, !dbg !762

297:                                              ; preds = %274, %241, %239, %211, %207, %190
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %205) #6, !dbg !763
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !599
  br label %314, !dbg !764

298:                                              ; preds = %293, %283, %282
  %299 = load i32, i32* %277, align 4, !dbg !765, !tbaa !735
  store i32 %299, i32* %18, align 4, !dbg !766, !tbaa !713
  call void @llvm.dbg.value(metadata i8* %181, metadata !637, metadata !DIExpression()) #6, !dbg !767
  call void @llvm.dbg.value(metadata i8* %180, metadata !639, metadata !DIExpression()) #6, !dbg !767
  %300 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 12, i32 12) #6, !dbg !768, !llvm.preserve.access.index !99
  %301 = getelementptr inbounds [6 x i8], [6 x i8]* %300, i64 0, i64 0, !dbg !769
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %180, i8* nonnull align 2 dereferenceable(6) %301, i64 6, i1 false) #6, !dbg !769
  %302 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %17, i32 11, i32 11) #6, !dbg !770, !llvm.preserve.access.index !99
  %303 = getelementptr inbounds [6 x i8], [6 x i8]* %302, i64 0, i64 0, !dbg !771
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %181, i8* nonnull align 4 dereferenceable(6) %303, i64 6, i1 false) #6, !dbg !771
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %205) #6, !dbg !763
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !599
  call void @llvm.dbg.value(metadata i8* %184, metadata !772, metadata !DIExpression()) #6, !dbg !783
  call void @llvm.dbg.value(metadata i8* %181, metadata !777, metadata !DIExpression()) #6, !dbg !783
  call void @llvm.dbg.value(metadata i8* %180, metadata !778, metadata !DIExpression()) #6, !dbg !783
  call void @llvm.dbg.value(metadata i8* %181, metadata !779, metadata !DIExpression()) #6, !dbg !783
  call void @llvm.dbg.value(metadata i8* %180, metadata !781, metadata !DIExpression()) #6, !dbg !783
  call void @llvm.dbg.value(metadata i8* %184, metadata !782, metadata !DIExpression()) #6, !dbg !783
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %184, i8* nonnull align 2 dereferenceable(6) %180, i64 6, i1 false) #6, !dbg !787
  %304 = getelementptr inbounds i8, i8* %184, i64 6, !dbg !788
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %304, i8* nonnull align 2 dereferenceable(6) %181, i64 6, i1 false) #6, !dbg !789
  call void @llvm.dbg.value(metadata i32* %18, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !599
  %305 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %191) #6, !dbg !790
  %306 = icmp eq i8* %305, null, !dbg !790
  br i1 %306, label %314, label %307, !dbg !792

307:                                              ; preds = %298
  %308 = load i32, i32* %275, align 4, !dbg !793, !tbaa !732
  %309 = load i32, i32* %18, align 4, !dbg !795, !tbaa !713
  call void @llvm.dbg.value(metadata i32 %309, metadata !593, metadata !DIExpression()) #6, !dbg !599
  %310 = icmp eq i32 %308, %309, !dbg !796
  br i1 %310, label %314, label %311, !dbg !797

311:                                              ; preds = %307
  %312 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %309, i64 0) #6, !dbg !798
  %313 = trunc i64 %312 to i32, !dbg !798
  br label %314, !dbg !799

314:                                              ; preds = %311, %307, %298, %297
  %315 = phi i32 [ %313, %311 ], [ 2, %298 ], [ 3, %307 ], [ 2, %297 ], !dbg !599
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %180), !dbg !800
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %181), !dbg !800
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %191) #6, !dbg !800
  br label %316

316:                                              ; preds = %69, %84, %93, %101, %120, %142, %149, %157, %165, %173, %179, %314
  %317 = phi i32 [ %315, %314 ], [ 2, %179 ], [ 2, %84 ], [ 2, %93 ], [ 2, %101 ], [ 2, %120 ], [ 2, %69 ], [ 2, %142 ], [ 2, %149 ], [ 2, %157 ], [ 2, %165 ], [ 2, %173 ], !dbg !455
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !801
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !801
  call void @llvm.dbg.value(metadata i32 %317, metadata !403, metadata !DIExpression()) #6, !dbg !801
  %318 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %317) #6, !dbg !803
  br label %1845, !dbg !804

319:                                              ; preds = %65
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !805, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %63, metadata !810, metadata !DIExpression()) #6, !dbg !858
  %320 = load i32, i32* %23, align 4, !dbg !860, !tbaa !347
  %321 = zext i32 %320 to i64, !dbg !861
  %322 = inttoptr i64 %321 to i8*, !dbg !862
  call void @llvm.dbg.value(metadata i8* %322, metadata !811, metadata !DIExpression()) #6, !dbg !858
  %323 = load i32, i32* %27, align 4, !dbg !863, !tbaa !355
  call void @llvm.dbg.value(metadata i32 %323, metadata !812, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !858
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !864
  call void @llvm.dbg.value(metadata i8* %322, metadata !364, metadata !DIExpression()) #6, !dbg !864
  %324 = zext i32 %323 to i64, !dbg !866
  call void @llvm.dbg.value(metadata i64 %324, metadata !365, metadata !DIExpression()) #6, !dbg !864
  call void @llvm.dbg.value(metadata i8* %322, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !864
  %325 = getelementptr i8, i8* %322, i64 34, !dbg !867
  %326 = bitcast i8* %325 to %struct.iphdr*, !dbg !867
  %327 = inttoptr i64 %324 to %struct.iphdr*, !dbg !868
  %328 = icmp ugt %struct.iphdr* %326, %327, !dbg !869
  %329 = getelementptr i8, i8* %322, i64 14, !dbg !870
  %330 = bitcast i8* %329 to %struct.iphdr*, !dbg !870
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !813, metadata !DIExpression()) #6, !dbg !858
  %331 = bitcast i32* %14 to i8*, !dbg !871
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %331) #6, !dbg !871
  %332 = bitcast i32* %15 to i8*, !dbg !871
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %332) #6, !dbg !871
  %333 = icmp eq i8* %329, null, !dbg !872
  %334 = or i1 %333, %328, !dbg !872
  br i1 %334, label %749, label %335, !dbg !874

335:                                              ; preds = %319
  call void @llvm.dbg.value(metadata i64 %324, metadata !812, metadata !DIExpression()) #6, !dbg !858
  %336 = inttoptr i64 %324 to i8*, !dbg !875
  call void @llvm.dbg.value(metadata i8* %336, metadata !812, metadata !DIExpression()) #6, !dbg !858
  %337 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %330, i32 6, i32 7) #6, !dbg !876, !llvm.preserve.access.index !314
  %338 = load i8, i8* %337, align 1, !dbg !876, !tbaa !676
  %339 = icmp ne i8 %338, 17, !dbg !878
  %340 = getelementptr i8, i8* %322, i64 50
  %341 = icmp ugt i8* %340, %336
  %342 = or i1 %341, %339, !dbg !879
  call void @llvm.dbg.value(metadata i8* %322, metadata !824, metadata !DIExpression(DW_OP_plus_uconst, 42, DW_OP_stack_value)) #6, !dbg !858
  br i1 %342, label %749, label %343, !dbg !879

343:                                              ; preds = %335
  call void @llvm.dbg.value(metadata i8* %322, metadata !824, metadata !DIExpression(DW_OP_plus_uconst, 42, DW_OP_stack_value)) #6, !dbg !858
  %344 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %330, i32 8, i32 9) #6, !dbg !880, !llvm.preserve.access.index !314
  call void @llvm.dbg.value(metadata i32* %14, metadata !822, metadata !DIExpression(DW_OP_deref)) #6, !dbg !858
  %345 = load i32, i32* %344, align 4, !dbg !881
  store i32 %345, i32* %14, align 4, !dbg !881
  %346 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %330, i32 9, i32 10) #6, !dbg !882, !llvm.preserve.access.index !314
  call void @llvm.dbg.value(metadata i32* %15, metadata !823, metadata !DIExpression(DW_OP_deref)) #6, !dbg !858
  %347 = load i32, i32* %346, align 4, !dbg !883
  store i32 %347, i32* %15, align 4, !dbg !883
  call void @llvm.dbg.value(metadata i16 36, metadata !819, metadata !DIExpression()) #6, !dbg !858
  %348 = getelementptr i8, i8* %322, i64 46, !dbg !884
  %349 = bitcast i8* %348 to i32*, !dbg !884
  %350 = load i32, i32* %349, align 4, !dbg !884, !tbaa !885
  call void @llvm.dbg.value(metadata i32 %350, metadata !815, metadata !DIExpression()) #6, !dbg !858
  %351 = getelementptr i8, i8* %322, i64 43, !dbg !887
  %352 = load i8, i8* %351, align 1, !dbg !887, !tbaa !888
  call void @llvm.dbg.value(metadata i8 %352, metadata !814, metadata !DIExpression()) #6, !dbg !858
  %353 = getelementptr i8, i8* %322, i64 44, !dbg !889
  %354 = bitcast i8* %353 to i16*, !dbg !889
  %355 = load i16, i16* %354, align 2, !dbg !889, !tbaa !890
  %356 = call i16 @llvm.bswap.i16(i16 %355) #6
  call void @llvm.dbg.value(metadata i16 %356, metadata !821, metadata !DIExpression()) #6, !dbg !858
  %357 = icmp eq i8 %352, -1, !dbg !891
  br i1 %357, label %358, label %749, !dbg !893

358:                                              ; preds = %343
  %359 = getelementptr inbounds i8, i8* %62, i64 32, !dbg !894
  %360 = bitcast i8* %359 to i32*, !dbg !894
  %361 = load i32, i32* %360, align 4, !dbg !894, !tbaa !896
  %362 = icmp eq i32 %361, 0, !dbg !897
  br i1 %362, label %749, label %363, !dbg !898

363:                                              ; preds = %358
  %364 = getelementptr inbounds i8, i8* %62, i64 36, !dbg !899
  %365 = bitcast i8* %364 to i32*, !dbg !899
  %366 = load i32, i32* %365, align 4, !dbg !899, !tbaa !900
  %367 = icmp ugt i32 %361, 96
  %368 = add i32 %366, -1, !dbg !901
  %369 = icmp ugt i32 %368, 55, !dbg !901
  %370 = or i1 %367, %369, !dbg !901
  br i1 %370, label %749, label %371, !dbg !901

371:                                              ; preds = %363
  %372 = getelementptr inbounds i8, i8* %62, i64 40, !dbg !902
  %373 = bitcast i8* %372 to i32*, !dbg !902
  %374 = load i32, i32* %373, align 4, !dbg !902, !tbaa !490
  %375 = add i32 %374, 1, !dbg !903
  call void @llvm.dbg.value(metadata i32 %375, metadata !832, metadata !DIExpression()) #6, !dbg !858
  %376 = trunc i32 %375 to i8, !dbg !904
  %377 = shl i8 %376, 4, !dbg !905
  %378 = or i8 %377, 8, !dbg !906
  call void @llvm.dbg.value(metadata i8 %378, metadata !818, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata i8 %378, metadata !820, metadata !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus_uconst, 40, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !858
  %379 = and i32 %375, 65535, !dbg !907
  call void @llvm.dbg.value(metadata i32 %379, metadata !832, metadata !DIExpression()) #6, !dbg !858
  %380 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 36) #6, !dbg !908
  %381 = icmp eq i64 %380, 0, !dbg !908
  br i1 %381, label %382, label %749, !dbg !910

382:                                              ; preds = %371
  %383 = zext i8 %378 to i32, !dbg !911
  %384 = add nuw nsw i32 %383, 40, !dbg !912
  call void @llvm.dbg.value(metadata i32 %384, metadata !820, metadata !DIExpression()) #6, !dbg !858
  %385 = sub nsw i32 0, %384, !dbg !913
  %386 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %385) #6, !dbg !915
  %387 = icmp eq i64 %386, 0, !dbg !915
  br i1 %387, label %388, label %749, !dbg !916

388:                                              ; preds = %382
  %389 = load i32, i32* %23, align 4, !dbg !917, !tbaa !347
  %390 = zext i32 %389 to i64, !dbg !918
  call void @llvm.dbg.value(metadata i64 %390, metadata !811, metadata !DIExpression()) #6, !dbg !858
  %391 = load i32, i32* %27, align 4, !dbg !919, !tbaa !355
  %392 = zext i32 %391 to i64, !dbg !920
  %393 = inttoptr i64 %392 to i8*, !dbg !921
  call void @llvm.dbg.value(metadata i8* %393, metadata !812, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata i64 %390, metadata !833, metadata !DIExpression()) #6, !dbg !858
  %394 = add nuw nsw i64 %390, 14, !dbg !922
  %395 = inttoptr i64 %394 to i8*, !dbg !924
  %396 = icmp ugt i8* %395, %393, !dbg !925
  br i1 %396, label %749, label %397, !dbg !926

397:                                              ; preds = %388
  %398 = inttoptr i64 %390 to %struct.ethhdr*, !dbg !927
  call void @llvm.dbg.value(metadata %struct.ethhdr* %398, metadata !833, metadata !DIExpression()) #6, !dbg !858
  %399 = inttoptr i64 %390 to i8*, !dbg !928
  call void @llvm.dbg.value(metadata i8* %399, metadata !811, metadata !DIExpression()) #6, !dbg !858
  %400 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %398, i32 2, i32 2) #6, !dbg !929, !llvm.preserve.access.index !306
  store i16 -8826, i16* %400, align 2, !dbg !930, !tbaa !410
  %401 = getelementptr i8, i8* %399, i64 14, !dbg !931
  %402 = bitcast i8* %401 to %struct.ipv6hdr*, !dbg !932
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %402, metadata !816, metadata !DIExpression()) #6, !dbg !858
  %403 = getelementptr i8, i8* %399, i64 54, !dbg !933
  %404 = icmp ugt i8* %403, %393, !dbg !935
  br i1 %404, label %749, label %405, !dbg !936

405:                                              ; preds = %397
  %406 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 0, i32 1) #6, !dbg !937, !llvm.preserve.access.index !329
  %407 = load i8, i8* %406, align 4, !dbg !938
  %408 = and i8 %407, 15, !dbg !938
  %409 = or i8 %408, 96, !dbg !938
  store i8 %409, i8* %406, align 4, !dbg !938
  %410 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 0, i32 0) #6, !dbg !939, !llvm.preserve.access.index !329
  %411 = load i8, i8* %410, align 4, !dbg !940
  %412 = and i8 %411, -16, !dbg !940
  store i8 %412, i8* %410, align 4, !dbg !940
  %413 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 3, i32 4) #6, !dbg !941, !llvm.preserve.access.index !329
  store i8 43, i8* %413, align 2, !dbg !942, !tbaa !526
  %414 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 4, i32 5) #6, !dbg !943, !llvm.preserve.access.index !329
  store i8 64, i8* %414, align 1, !dbg !944, !tbaa !530
  %415 = zext i8 %378 to i16
  %416 = add i16 %356, %415
  %417 = call i16 @llvm.bswap.i16(i16 %416) #6
  %418 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 2, i32 3) #6, !dbg !945, !llvm.preserve.access.index !329
  store i16 %417, i16* %418, align 4, !dbg !946, !tbaa !533
  %419 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 5, i32 6) #6, !dbg !947, !llvm.preserve.access.index !329
  %420 = bitcast %struct.in6_addr* %419 to i8*, !dbg !948
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %420, i8* nonnull align 4 dereferenceable(16) %62, i64 16, i1 false) #6, !dbg !948
  %421 = add nsw i32 %379, -1, !dbg !949
  %422 = icmp ugt i32 %421, 4, !dbg !949
  br i1 %422, label %749, label %423, !dbg !949

423:                                              ; preds = %405
  %424 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %402, i32 6, i32 7) #6, !dbg !951, !llvm.preserve.access.index !329
  %425 = bitcast %struct.in6_addr* %424 to i8*, !dbg !952
  %426 = getelementptr inbounds i8, i8* %62, i64 48, !dbg !953
  %427 = zext i32 %421 to i64, !dbg !954
  %428 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %63, i64 0, i32 6, i64 %427, !dbg !954
  %429 = bitcast %struct.in6_addr* %428 to i8*, !dbg !952
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %425, i8* nonnull align 4 dereferenceable(16) %429, i64 16, i1 false) #6, !dbg !952
  %430 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %16, i64 0, i32 0, !dbg !955
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %430) #6, !dbg !955
  call void @llvm.dbg.declare(metadata %struct.args_mob_session* %16, metadata !834, metadata !DIExpression()) #6, !dbg !956
  %431 = load i32, i32* %360, align 4, !dbg !957, !tbaa !896
  %432 = lshr i32 %431, 3, !dbg !958
  %433 = trunc i32 %432 to i16, !dbg !959
  call void @llvm.dbg.value(metadata i16 %433, metadata !849, metadata !DIExpression()) #6, !dbg !858
  %434 = trunc i32 %431 to i16, !dbg !960
  %435 = and i16 %434, 7, !dbg !960
  call void @llvm.dbg.value(metadata i16 %435, metadata !850, metadata !DIExpression()) #6, !dbg !858
  %436 = load i32, i32* %365, align 4, !dbg !961, !tbaa !900
  %437 = lshr i32 %436, 3, !dbg !962
  %438 = trunc i32 %437 to i16, !dbg !963
  call void @llvm.dbg.value(metadata i16 %438, metadata !851, metadata !DIExpression()) #6, !dbg !858
  %439 = trunc i32 %436 to i16, !dbg !964
  %440 = and i16 %439, 7, !dbg !964
  call void @llvm.dbg.value(metadata i16 %440, metadata !852, metadata !DIExpression()) #6, !dbg !858
  store i8 0, i8* %430, align 1, !dbg !965
  %441 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %16, i64 0, i32 1, i32 0, !dbg !966
  store i32 %350, i32* %441, align 1, !dbg !967, !tbaa !674
  call void @llvm.dbg.value(metadata i8* %331, metadata !853, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata i8* %332, metadata !854, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata i8* %430, metadata !855, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata i32* %14, metadata !822, metadata !DIExpression(DW_OP_deref)) #6, !dbg !858
  call void @llvm.dbg.value(metadata %struct.in6_addr* %419, metadata !968, metadata !DIExpression()) #6, !dbg !988
  call void @llvm.dbg.value(metadata i8* %331, metadata !975, metadata !DIExpression()) #6, !dbg !988
  call void @llvm.dbg.value(metadata i16 4, metadata !976, metadata !DIExpression()) #6, !dbg !988
  call void @llvm.dbg.value(metadata i16 %433, metadata !977, metadata !DIExpression()) #6, !dbg !988
  call void @llvm.dbg.value(metadata i16 %435, metadata !978, metadata !DIExpression()) #6, !dbg !988
  call void @llvm.dbg.value(metadata i64 %392, metadata !979, metadata !DIExpression()) #6, !dbg !988
  %442 = and i16 %433, 4095, !dbg !990
  call void @llvm.dbg.value(metadata i16 %442, metadata !977, metadata !DIExpression()) #6, !dbg !988
  call void @llvm.dbg.value(metadata i16 4, metadata !976, metadata !DIExpression()) #6, !dbg !988
  %443 = zext i16 %442 to i64, !dbg !991
  %444 = icmp ugt i16 %442, 11
  br i1 %444, label %482, label %445, !dbg !993

445:                                              ; preds = %423
  %446 = zext i16 %435 to i32, !dbg !994
  %447 = icmp eq i16 %435, 0, !dbg !995
  %448 = getelementptr i8, i8* %420, i64 %443, !dbg !996
  br i1 %447, label %451, label %449, !dbg !997

449:                                              ; preds = %445
  call void @llvm.dbg.value(metadata i16 0, metadata !980, metadata !DIExpression()) #6, !dbg !998
  call void @llvm.dbg.value(metadata i16 0, metadata !980, metadata !DIExpression()) #6, !dbg !998
  %450 = sub nuw nsw i32 8, %446, !dbg !999
  br label %460, !dbg !1002

451:                                              ; preds = %445
  %452 = getelementptr i8, i8* %448, i64 4, !dbg !1003
  %453 = icmp ugt i8* %452, %393, !dbg !1006
  br i1 %453, label %482, label %454, !dbg !1007

454:                                              ; preds = %451
  %455 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* %419, i32 0, i32 0) #6, !dbg !1008, !llvm.preserve.access.index !72
  %456 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %455, i32 0) #6, !dbg !1009, !llvm.preserve.access.index !75
  %457 = bitcast %union.anon* %456 to [16 x i8]*, !dbg !1009
  %458 = getelementptr inbounds [16 x i8], [16 x i8]* %457, i64 0, i64 %443, !dbg !1010
  %459 = bitcast i8* %458 to i32*, !dbg !1011
  store i32 %345, i32* %459, align 1, !dbg !1011
  br label %482, !dbg !1012

460:                                              ; preds = %468, %449
  %461 = phi i64 [ 0, %449 ], [ %480, %468 ]
  call void @llvm.dbg.value(metadata i64 %461, metadata !980, metadata !DIExpression()) #6, !dbg !998
  %462 = getelementptr inbounds i8, i8* %448, i64 %461, !dbg !1013
  call void @llvm.dbg.value(metadata i8* %462, metadata !984, metadata !DIExpression()) #6, !dbg !1014
  %463 = getelementptr inbounds i8, i8* %462, i64 1, !dbg !1015
  call void @llvm.dbg.value(metadata i8* %463, metadata !987, metadata !DIExpression()) #6, !dbg !1014
  %464 = icmp ugt i8* %463, %393, !dbg !1016
  %465 = getelementptr inbounds i8, i8* %463, i64 1
  %466 = icmp ugt i8* %465, %393
  %467 = or i1 %464, %466, !dbg !1017
  br i1 %467, label %482, label %468, !dbg !1017

468:                                              ; preds = %460
  %469 = getelementptr inbounds i8, i8* %331, i64 %461, !dbg !1018
  %470 = load i8, i8* %469, align 1, !dbg !1018, !tbaa !674
  %471 = zext i8 %470 to i32, !dbg !1018
  %472 = lshr i32 %471, %446, !dbg !1019
  %473 = load i8, i8* %462, align 1, !dbg !1020, !tbaa !674
  %474 = trunc i32 %472 to i8, !dbg !1020
  %475 = or i8 %473, %474, !dbg !1020
  store i8 %475, i8* %462, align 1, !dbg !1020, !tbaa !674
  %476 = shl i32 %471, %450, !dbg !1021
  %477 = load i8, i8* %463, align 1, !dbg !1022, !tbaa !674
  %478 = trunc i32 %476 to i8, !dbg !1022
  %479 = or i8 %477, %478, !dbg !1022
  store i8 %479, i8* %463, align 1, !dbg !1022, !tbaa !674
  %480 = add nuw nsw i64 %461, 1, !dbg !1023
  call void @llvm.dbg.value(metadata i64 %480, metadata !980, metadata !DIExpression()) #6, !dbg !998
  %481 = icmp eq i64 %480, 4, !dbg !1002
  br i1 %481, label %482, label %460, !dbg !1002, !llvm.loop !1024

482:                                              ; preds = %468, %460, %454, %451, %423
  call void @llvm.dbg.value(metadata i8* %403, metadata !817, metadata !DIExpression()) #6, !dbg !858
  %483 = getelementptr i8, i8* %399, i64 62, !dbg !1027
  %484 = icmp ugt i8* %483, %393, !dbg !1029
  br i1 %484, label %747, label %485, !dbg !1030

485:                                              ; preds = %482
  store i8 4, i8* %403, align 4, !dbg !1031, !tbaa !547
  %486 = lshr exact i8 %378, 3, !dbg !1032
  %487 = add nsw i8 %486, -1, !dbg !1033
  %488 = getelementptr i8, i8* %399, i64 55, !dbg !1034
  store i8 %487, i8* %488, align 1, !dbg !1035, !tbaa !553
  %489 = getelementptr i8, i8* %399, i64 56, !dbg !1036
  store i8 4, i8* %489, align 2, !dbg !1037, !tbaa !556
  %490 = trunc i32 %421 to i8, !dbg !1038
  %491 = getelementptr i8, i8* %399, i64 57, !dbg !1039
  store i8 %490, i8* %491, align 1, !dbg !1040, !tbaa !561
  %492 = getelementptr i8, i8* %399, i64 58, !dbg !1041
  store i8 %490, i8* %492, align 4, !dbg !1042, !tbaa !564
  %493 = getelementptr i8, i8* %399, i64 59, !dbg !1043
  store i8 0, i8* %493, align 1, !dbg !1044, !tbaa !567
  %494 = getelementptr i8, i8* %399, i64 60, !dbg !1045
  %495 = bitcast i8* %494 to i16*, !dbg !1045
  store i16 0, i16* %495, align 2, !dbg !1046, !tbaa !570
  %496 = getelementptr i8, i8* %399, i64 79, !dbg !1047
  %497 = icmp ugt i8* %496, %393, !dbg !1049
  br i1 %497, label %747, label %498, !dbg !1050

498:                                              ; preds = %485
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %425, i8* nonnull align 4 dereferenceable(16) %426, i64 16, i1 false) #6, !dbg !1051
  %499 = bitcast i8* %483 to [0 x %struct.in6_addr]*, !dbg !1052
  %500 = bitcast i8* %483 to %struct.in6_addr*, !dbg !1053
  %501 = getelementptr inbounds i8, i8* %62, i64 16, !dbg !1054
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %483, i8* nonnull align 4 dereferenceable(16) %501, i64 16, i1 false) #6, !dbg !1055
  call void @llvm.dbg.value(metadata i32* %15, metadata !823, metadata !DIExpression(DW_OP_deref)) #6, !dbg !858
  call void @llvm.dbg.value(metadata %struct.in6_addr* %500, metadata !968, metadata !DIExpression()) #6, !dbg !1056
  call void @llvm.dbg.value(metadata i8* %332, metadata !975, metadata !DIExpression()) #6, !dbg !1056
  call void @llvm.dbg.value(metadata i16 4, metadata !976, metadata !DIExpression()) #6, !dbg !1056
  call void @llvm.dbg.value(metadata i16 %438, metadata !977, metadata !DIExpression()) #6, !dbg !1056
  call void @llvm.dbg.value(metadata i16 %440, metadata !978, metadata !DIExpression()) #6, !dbg !1056
  call void @llvm.dbg.value(metadata i64 %392, metadata !979, metadata !DIExpression()) #6, !dbg !1056
  %502 = and i16 %438, 4095, !dbg !1058
  call void @llvm.dbg.value(metadata i16 %502, metadata !977, metadata !DIExpression()) #6, !dbg !1056
  %503 = zext i16 %502 to i64, !dbg !1059
  %504 = icmp ugt i16 %502, 11
  br i1 %504, label %544, label %505, !dbg !1060

505:                                              ; preds = %498
  %506 = icmp eq i16 %440, 0, !dbg !1061
  %507 = getelementptr i8, i8* %483, i64 %503, !dbg !1062
  br i1 %506, label %510, label %508, !dbg !1063

508:                                              ; preds = %505
  call void @llvm.dbg.value(metadata i16 0, metadata !980, metadata !DIExpression()) #6, !dbg !1064
  %509 = sub nuw nsw i16 8, %440, !dbg !1065
  br label %520, !dbg !1066

510:                                              ; preds = %505
  %511 = getelementptr i8, i8* %507, i64 4, !dbg !1067
  %512 = icmp ugt i8* %511, %393, !dbg !1068
  br i1 %512, label %544, label %513, !dbg !1069

513:                                              ; preds = %510
  %514 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* %500, i32 0, i32 0) #6, !dbg !1070, !llvm.preserve.access.index !72
  %515 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %514, i32 0) #6, !dbg !1071, !llvm.preserve.access.index !75
  %516 = bitcast %union.anon* %515 to [16 x i8]*, !dbg !1071
  %517 = getelementptr inbounds [16 x i8], [16 x i8]* %516, i64 0, i64 %503, !dbg !1072
  %518 = bitcast i8* %517 to i32*, !dbg !1073
  %519 = load i32, i32* %15, align 4, !dbg !1073
  store i32 %519, i32* %518, align 1, !dbg !1073
  br label %544, !dbg !1074

520:                                              ; preds = %528, %508
  %521 = phi i64 [ 0, %508 ], [ %542, %528 ]
  call void @llvm.dbg.value(metadata i64 %521, metadata !980, metadata !DIExpression()) #6, !dbg !1064
  %522 = getelementptr inbounds i8, i8* %507, i64 %521, !dbg !1075
  call void @llvm.dbg.value(metadata i8* %522, metadata !984, metadata !DIExpression()) #6, !dbg !1076
  %523 = getelementptr inbounds i8, i8* %522, i64 1, !dbg !1077
  call void @llvm.dbg.value(metadata i8* %523, metadata !987, metadata !DIExpression()) #6, !dbg !1076
  %524 = icmp ugt i8* %523, %393, !dbg !1078
  %525 = getelementptr inbounds i8, i8* %523, i64 1
  %526 = icmp ugt i8* %525, %393
  %527 = or i1 %524, %526, !dbg !1079
  br i1 %527, label %544, label %528, !dbg !1079

528:                                              ; preds = %520
  %529 = getelementptr inbounds i8, i8* %332, i64 %521, !dbg !1080
  %530 = load i8, i8* %529, align 1, !dbg !1080, !tbaa !674
  %531 = zext i8 %530 to i16, !dbg !1080
  %532 = lshr i16 %531, %440, !dbg !1081
  %533 = load i8, i8* %522, align 1, !dbg !1082, !tbaa !674
  %534 = trunc i16 %532 to i8, !dbg !1082
  %535 = or i8 %533, %534, !dbg !1082
  store i8 %535, i8* %522, align 1, !dbg !1082, !tbaa !674
  %536 = load i8, i8* %529, align 1, !dbg !1083, !tbaa !674
  %537 = zext i8 %536 to i16, !dbg !1083
  %538 = shl i16 %537, %509, !dbg !1084
  %539 = load i8, i8* %523, align 1, !dbg !1085, !tbaa !674
  %540 = trunc i16 %538 to i8, !dbg !1085
  %541 = or i8 %539, %540, !dbg !1085
  store i8 %541, i8* %523, align 1, !dbg !1085, !tbaa !674
  %542 = add nuw nsw i64 %521, 1, !dbg !1086
  call void @llvm.dbg.value(metadata i64 %542, metadata !980, metadata !DIExpression()) #6, !dbg !1064
  %543 = icmp eq i64 %542, 4, !dbg !1066
  br i1 %543, label %544, label %520, !dbg !1066, !llvm.loop !1087

544:                                              ; preds = %528, %520, %513, %510, %498
  %545 = add i16 %438, 4, !dbg !1089
  call void @llvm.dbg.value(metadata i16 %545, metadata !851, metadata !DIExpression()) #6, !dbg !858
  call void @llvm.dbg.value(metadata %struct.in6_addr* %500, metadata !968, metadata !DIExpression()) #6, !dbg !1090
  call void @llvm.dbg.value(metadata i8* %430, metadata !975, metadata !DIExpression()) #6, !dbg !1090
  call void @llvm.dbg.value(metadata i16 5, metadata !976, metadata !DIExpression()) #6, !dbg !1090
  call void @llvm.dbg.value(metadata i16 %545, metadata !977, metadata !DIExpression()) #6, !dbg !1090
  call void @llvm.dbg.value(metadata i16 %440, metadata !978, metadata !DIExpression()) #6, !dbg !1090
  call void @llvm.dbg.value(metadata i64 %392, metadata !979, metadata !DIExpression()) #6, !dbg !1090
  %546 = and i16 %545, 4095, !dbg !1092
  call void @llvm.dbg.value(metadata i16 %546, metadata !977, metadata !DIExpression()) #6, !dbg !1090
  %547 = zext i16 %546 to i64, !dbg !1093
  %548 = icmp ugt i16 %546, 10
  br i1 %548, label %586, label %549, !dbg !1094

549:                                              ; preds = %544
  %550 = icmp eq i16 %440, 0, !dbg !1095
  %551 = getelementptr i8, i8* %483, i64 %547, !dbg !1096
  br i1 %550, label %554, label %552, !dbg !1097

552:                                              ; preds = %549
  call void @llvm.dbg.value(metadata i16 0, metadata !980, metadata !DIExpression()) #6, !dbg !1098
  %553 = sub nuw nsw i16 8, %440, !dbg !1099
  br label %562, !dbg !1100

554:                                              ; preds = %549
  %555 = getelementptr i8, i8* %551, i64 5, !dbg !1101
  %556 = icmp ugt i8* %555, %393, !dbg !1102
  br i1 %556, label %586, label %557, !dbg !1103

557:                                              ; preds = %554
  %558 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* %500, i32 0, i32 0) #6, !dbg !1104, !llvm.preserve.access.index !72
  %559 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %558, i32 0) #6, !dbg !1105, !llvm.preserve.access.index !75
  %560 = bitcast %union.anon* %559 to [16 x i8]*, !dbg !1105
  %561 = getelementptr inbounds [16 x i8], [16 x i8]* %560, i64 0, i64 %547, !dbg !1106
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %561, i8* nonnull align 1 dereferenceable(5) %430, i64 5, i1 false) #6, !dbg !1107
  br label %586, !dbg !1108

562:                                              ; preds = %570, %552
  %563 = phi i64 [ 0, %552 ], [ %584, %570 ]
  call void @llvm.dbg.value(metadata i64 %563, metadata !980, metadata !DIExpression()) #6, !dbg !1098
  %564 = getelementptr inbounds i8, i8* %551, i64 %563, !dbg !1109
  call void @llvm.dbg.value(metadata i8* %564, metadata !984, metadata !DIExpression()) #6, !dbg !1110
  %565 = getelementptr inbounds i8, i8* %564, i64 1, !dbg !1111
  call void @llvm.dbg.value(metadata i8* %565, metadata !987, metadata !DIExpression()) #6, !dbg !1110
  %566 = icmp ugt i8* %565, %393, !dbg !1112
  %567 = getelementptr inbounds i8, i8* %565, i64 1
  %568 = icmp ugt i8* %567, %393
  %569 = or i1 %566, %568, !dbg !1113
  br i1 %569, label %586, label %570, !dbg !1113

570:                                              ; preds = %562
  %571 = getelementptr inbounds i8, i8* %430, i64 %563, !dbg !1114
  %572 = load i8, i8* %571, align 1, !dbg !1114, !tbaa !674
  %573 = zext i8 %572 to i16, !dbg !1114
  %574 = lshr i16 %573, %440, !dbg !1115
  %575 = load i8, i8* %564, align 1, !dbg !1116, !tbaa !674
  %576 = trunc i16 %574 to i8, !dbg !1116
  %577 = or i8 %575, %576, !dbg !1116
  store i8 %577, i8* %564, align 1, !dbg !1116, !tbaa !674
  %578 = load i8, i8* %571, align 1, !dbg !1117, !tbaa !674
  %579 = zext i8 %578 to i16, !dbg !1117
  %580 = shl i16 %579, %553, !dbg !1118
  %581 = load i8, i8* %565, align 1, !dbg !1119, !tbaa !674
  %582 = trunc i16 %580 to i8, !dbg !1119
  %583 = or i8 %581, %582, !dbg !1119
  store i8 %583, i8* %565, align 1, !dbg !1119, !tbaa !674
  %584 = add nuw nsw i64 %563, 1, !dbg !1120
  call void @llvm.dbg.value(metadata i64 %584, metadata !980, metadata !DIExpression()) #6, !dbg !1098
  %585 = icmp eq i64 %584, 5, !dbg !1100
  br i1 %585, label %586, label %562, !dbg !1100, !llvm.loop !1121

586:                                              ; preds = %570, %562, %557, %554, %544
  call void @llvm.dbg.value(metadata i32 1, metadata !856, metadata !DIExpression()) #6, !dbg !1123
  %587 = icmp ugt i32 %379, 1
  call void @llvm.dbg.value(metadata i32 1, metadata !856, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1123
  br i1 %587, label %588, label %610, !dbg !1124

588:                                              ; preds = %586
  %589 = getelementptr i8, i8* %399, i64 63, !dbg !1125
  br label %590, !dbg !1124

590:                                              ; preds = %597, %588
  %591 = phi i32 [ 1, %588 ], [ %606, %597 ]
  %592 = shl nuw nsw i32 %591, 4, !dbg !1129
  %593 = add nuw nsw i32 %592, 32, !dbg !1129
  %594 = zext i32 %593 to i64, !dbg !1129
  %595 = getelementptr i8, i8* %589, i64 %594, !dbg !1130
  %596 = icmp ugt i8* %595, %393, !dbg !1131
  br i1 %596, label %747, label %597, !dbg !1132

597:                                              ; preds = %590
  %598 = zext i32 %591 to i64, !dbg !1133
  %599 = getelementptr inbounds [0 x %struct.in6_addr], [0 x %struct.in6_addr]* %499, i64 0, i64 %598, !dbg !1133
  %600 = bitcast %struct.in6_addr* %599 to i8*, !dbg !1134
  %601 = add nsw i32 %591, -1, !dbg !1135
  %602 = sext i32 %601 to i64, !dbg !1136
  %603 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %63, i64 0, i32 6, i64 %602, !dbg !1136
  %604 = bitcast %struct.in6_addr* %603 to i8*, !dbg !1134
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %600, i8* nonnull align 4 dereferenceable(16) %604, i64 16, i1 false) #6, !dbg !1134
  %605 = add nuw nsw i32 %591, 1, !dbg !1137
  call void @llvm.dbg.value(metadata i32 undef, metadata !856, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !1123
  %606 = and i32 %605, 65535, !dbg !1138
  call void @llvm.dbg.value(metadata i32 %605, metadata !856, metadata !DIExpression()) #6, !dbg !1123
  %607 = icmp ult i32 %606, 5, !dbg !1139
  %608 = icmp ult i32 %606, %379
  %609 = and i1 %607, %608, !dbg !1124
  call void @llvm.dbg.value(metadata i32 %605, metadata !856, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1123
  br i1 %609, label %590, label %610, !dbg !1124, !llvm.loop !1140

610:                                              ; preds = %597, %586
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !585, metadata !DIExpression()) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i32 2, metadata !590, metadata !DIExpression()) #6, !dbg !1142
  %611 = getelementptr inbounds [6 x i8], [6 x i8]* %20, i64 0, i64 0
  %612 = getelementptr inbounds [6 x i8], [6 x i8]* %19, i64 0, i64 0
  %613 = load i32, i32* %23, align 4, !dbg !1144, !tbaa !347
  %614 = zext i32 %613 to i64, !dbg !1145
  %615 = inttoptr i64 %614 to i8*, !dbg !1146
  call void @llvm.dbg.value(metadata i8* %615, metadata !591, metadata !DIExpression()) #6, !dbg !1142
  %616 = load i32, i32* %27, align 4, !dbg !1147, !tbaa !355
  %617 = zext i32 %616 to i64, !dbg !1148
  %618 = inttoptr i64 %617 to i8*, !dbg !1149
  call void @llvm.dbg.value(metadata i8* %618, metadata !592, metadata !DIExpression()) #6, !dbg !1142
  %619 = getelementptr i8, i8* %615, i64 1, !dbg !1150
  %620 = icmp ugt i8* %619, %618, !dbg !1151
  br i1 %620, label %747, label %621, !dbg !1152

621:                                              ; preds = %610
  %622 = bitcast i32* %13 to i8*, !dbg !1153
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %622) #6, !dbg !1153
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %612), !dbg !1154
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !594, metadata !DIExpression()) #6, !dbg !1155
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %611), !dbg !1154
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !595, metadata !DIExpression()) #6, !dbg !1156
  call void @llvm.dbg.value(metadata i32* %13, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1142
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !616, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i8* %612, metadata !622, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i8* %611, metadata !623, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i32* %13, metadata !624, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i32 2, metadata !625, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i8* %615, metadata !626, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i8* %618, metadata !627, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata i8* %615, metadata !628, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !1159
  call void @llvm.dbg.value(metadata i8* %615, metadata !364, metadata !DIExpression()) #6, !dbg !1159
  call void @llvm.dbg.value(metadata i64 %617, metadata !365, metadata !DIExpression()) #6, !dbg !1159
  call void @llvm.dbg.value(metadata i8* %615, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1159
  %623 = getelementptr i8, i8* %615, i64 34, !dbg !1161
  %624 = bitcast i8* %623 to %struct.iphdr*, !dbg !1161
  %625 = inttoptr i64 %617 to %struct.iphdr*, !dbg !1162
  %626 = icmp ugt %struct.iphdr* %624, %625, !dbg !1163
  %627 = getelementptr i8, i8* %615, i64 14, !dbg !1164
  %628 = bitcast i8* %627 to %struct.iphdr*, !dbg !1164
  %629 = select i1 %626, %struct.iphdr* null, %struct.iphdr* %628, !dbg !1164
  call void @llvm.dbg.value(metadata %struct.iphdr* %629, metadata !629, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !1165
  call void @llvm.dbg.value(metadata i8* %615, metadata !379, metadata !DIExpression()) #6, !dbg !1165
  call void @llvm.dbg.value(metadata i64 %617, metadata !380, metadata !DIExpression()) #6, !dbg !1165
  call void @llvm.dbg.value(metadata i8* %615, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1165
  %630 = getelementptr i8, i8* %615, i64 54, !dbg !1167
  %631 = bitcast i8* %630 to %struct.ipv6hdr*, !dbg !1167
  %632 = inttoptr i64 %617 to %struct.ipv6hdr*, !dbg !1168
  %633 = icmp ugt %struct.ipv6hdr* %631, %632, !dbg !1169
  %634 = bitcast i8* %627 to %struct.ipv6hdr*, !dbg !1170
  %635 = select i1 %633, %struct.ipv6hdr* null, %struct.ipv6hdr* %634, !dbg !1170
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %635, metadata !630, metadata !DIExpression()) #6, !dbg !1157
  %636 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %12, i64 0, i32 0, !dbg !1171
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %636) #6, !dbg !1171
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %12, metadata !631, metadata !DIExpression()) #6, !dbg !1172
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %636, i8 0, i64 64, i1 false) #6, !dbg !1172
  %637 = icmp ugt i8* %627, %618, !dbg !1173
  br i1 %637, label %728, label %638, !dbg !1174

638:                                              ; preds = %621
  %639 = inttoptr i64 %614 to %struct.ethhdr*, !dbg !1175
  call void @llvm.dbg.value(metadata %struct.ethhdr* %639, metadata !628, metadata !DIExpression()) #6, !dbg !1157
  %640 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %639, i32 2, i32 2) #6, !dbg !1176, !llvm.preserve.access.index !306
  %641 = load i16, i16* %640, align 2, !dbg !1176, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %641, metadata !632, metadata !DIExpression()) #6, !dbg !1157
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %636, i8 0, i64 64, i1 false) #6, !dbg !1177
  switch i16 %641, label %728 [
    i16 8, label %642
    i16 -8826, label %670
  ], !dbg !1178

642:                                              ; preds = %638
  %643 = icmp eq %struct.iphdr* %629, null, !dbg !1179
  br i1 %643, label %728, label %644, !dbg !1180

644:                                              ; preds = %642
  %645 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 0, i32 0) #6, !dbg !1181, !llvm.preserve.access.index !99
  store i8 2, i8* %645, align 4, !dbg !1182, !tbaa !668
  %646 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %629, i32 1, i32 2) #6, !dbg !1183, !llvm.preserve.access.index !314
  %647 = load i8, i8* %646, align 1, !dbg !1183, !tbaa !671
  %648 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 6, i32 6) #6, !dbg !1184, !llvm.preserve.access.index !99
  %649 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %648, i32 0) #6, !dbg !1184, !llvm.preserve.access.index !98
  %650 = bitcast %union.anon.5* %649 to i8*, !dbg !1184
  store i8 %647, i8* %650, align 4, !dbg !1185, !tbaa !674
  %651 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %629, i32 6, i32 7) #6, !dbg !1186, !llvm.preserve.access.index !314
  %652 = load i8, i8* %651, align 1, !dbg !1186, !tbaa !676
  %653 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 1, i32 1) #6, !dbg !1187, !llvm.preserve.access.index !99
  store i8 %652, i8* %653, align 1, !dbg !1188, !tbaa !679
  %654 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 2, i32 2) #6, !dbg !1189, !llvm.preserve.access.index !99
  store i16 0, i16* %654, align 2, !dbg !1190, !tbaa !682
  %655 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 3, i32 3) #6, !dbg !1191, !llvm.preserve.access.index !99
  store i16 0, i16* %655, align 4, !dbg !1192, !tbaa !685
  %656 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %629, i32 2, i32 3) #6, !dbg !1193, !llvm.preserve.access.index !314
  %657 = load i16, i16* %656, align 2, !dbg !1193, !tbaa !445
  %658 = call i16 @llvm.bswap.i16(i16 %657) #6
  %659 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 4, i32 4) #6, !dbg !1194, !llvm.preserve.access.index !99
  store i16 %658, i16* %659, align 2, !dbg !1195, !tbaa !689
  %660 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %629, i32 8, i32 9) #6, !dbg !1196, !llvm.preserve.access.index !314
  %661 = load i32, i32* %660, align 4, !dbg !1196, !tbaa !691
  %662 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 7, i32 7) #6, !dbg !1197, !llvm.preserve.access.index !99
  %663 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %662, i32 0) #6, !dbg !1197, !llvm.preserve.access.index !109
  %664 = getelementptr %union.anon.6, %union.anon.6* %663, i64 0, i32 0, i64 0, !dbg !1197
  store i32 %661, i32* %664, align 4, !dbg !1198, !tbaa !674
  %665 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %629, i32 9, i32 10) #6, !dbg !1199, !llvm.preserve.access.index !314
  %666 = load i32, i32* %665, align 4, !dbg !1199, !tbaa !428
  %667 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 8, i32 8) #6, !dbg !1200, !llvm.preserve.access.index !99
  %668 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %667, i32 0) #6, !dbg !1200, !llvm.preserve.access.index !115
  %669 = getelementptr %union.anon.7, %union.anon.7* %668, i64 0, i32 0, i64 0, !dbg !1200
  store i32 %666, i32* %669, align 4, !dbg !1201, !tbaa !674
  br label %705, !dbg !1202

670:                                              ; preds = %638
  %671 = icmp eq %struct.ipv6hdr* %635, null, !dbg !1203
  br i1 %671, label %728, label %672, !dbg !1204

672:                                              ; preds = %670
  %673 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %635, i32 4, i32 5) #6, !dbg !1205, !llvm.preserve.access.index !329
  %674 = load i8, i8* %673, align 1, !dbg !1205, !tbaa !530
  %675 = icmp ult i8 %674, 2, !dbg !1206
  br i1 %675, label %728, label %676, !dbg !1207

676:                                              ; preds = %672
  %677 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 7, i32 7) #6, !dbg !1208, !llvm.preserve.access.index !99
  %678 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %677, i32 1) #6, !dbg !1208, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %678, metadata !633, metadata !DIExpression()) #6, !dbg !1209
  %679 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 8, i32 8) #6, !dbg !1210, !llvm.preserve.access.index !99
  %680 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %679, i32 1) #6, !dbg !1210, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %680, metadata !635, metadata !DIExpression()) #6, !dbg !1209
  %681 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 0, i32 0) #6, !dbg !1211, !llvm.preserve.access.index !99
  store i8 10, i8* %681, align 4, !dbg !1212, !tbaa !668
  %682 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 6, i32 6) #6, !dbg !1213, !llvm.preserve.access.index !99
  %683 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %682, i32 0) #6, !dbg !1213, !llvm.preserve.access.index !98
  %684 = bitcast %union.anon.5* %683 to i8*, !dbg !1213
  store i8 0, i8* %684, align 4, !dbg !1214, !tbaa !674
  %685 = bitcast %struct.ipv6hdr* %635 to i32*, !dbg !1215
  %686 = load i32, i32* %685, align 4, !dbg !1215, !tbaa !713
  %687 = and i32 %686, -241, !dbg !1216
  %688 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %682, i32 1) #6, !dbg !1217, !llvm.preserve.access.index !98
  %689 = getelementptr %union.anon.5, %union.anon.5* %688, i64 0, i32 0, !dbg !1217
  store i32 %687, i32* %689, align 4, !dbg !1218, !tbaa !674
  %690 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %635, i32 3, i32 4) #6, !dbg !1219, !llvm.preserve.access.index !329
  %691 = load i8, i8* %690, align 2, !dbg !1219, !tbaa !526
  %692 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 1, i32 1) #6, !dbg !1220, !llvm.preserve.access.index !99
  store i8 %691, i8* %692, align 1, !dbg !1221, !tbaa !679
  %693 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 2, i32 2) #6, !dbg !1222, !llvm.preserve.access.index !99
  store i16 0, i16* %693, align 2, !dbg !1223, !tbaa !682
  %694 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 3, i32 3) #6, !dbg !1224, !llvm.preserve.access.index !99
  store i16 0, i16* %694, align 4, !dbg !1225, !tbaa !685
  %695 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %635, i32 2, i32 3) #6, !dbg !1226, !llvm.preserve.access.index !329
  %696 = load i16, i16* %695, align 4, !dbg !1226, !tbaa !533
  %697 = call i16 @llvm.bswap.i16(i16 %696) #6
  %698 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 4, i32 4) #6, !dbg !1227, !llvm.preserve.access.index !99
  store i16 %697, i16* %698, align 2, !dbg !1228, !tbaa !689
  %699 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %635, i32 5, i32 6) #6, !dbg !1229, !llvm.preserve.access.index !329
  %700 = bitcast %union.anon.6* %678 to i8*, !dbg !1229
  %701 = bitcast %struct.in6_addr* %699 to i8*, !dbg !1229
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %700, i8* nonnull align 4 dereferenceable(16) %701, i64 16, i1 false) #6, !dbg !1229, !tbaa.struct !728
  %702 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %635, i32 6, i32 7) #6, !dbg !1230, !llvm.preserve.access.index !329
  %703 = bitcast %union.anon.7* %680 to i8*, !dbg !1230
  %704 = bitcast %struct.in6_addr* %702 to i8*, !dbg !1230
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %703, i8* nonnull align 4 dereferenceable(16) %704, i64 16, i1 false) #6, !dbg !1230, !tbaa.struct !728
  br label %705, !dbg !1231

705:                                              ; preds = %676, %644
  %706 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #6, !dbg !1232, !llvm.preserve.access.index !62
  %707 = load i32, i32* %706, align 4, !dbg !1232, !tbaa !732
  %708 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 5, i32 5) #6, !dbg !1233, !llvm.preserve.access.index !99
  store i32 %707, i32* %708, align 4, !dbg !1234, !tbaa !735
  %709 = bitcast %struct.xdp_md* %0 to i8*, !dbg !1235
  %710 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %709, %struct.bpf_fib_lookup* nonnull %12, i32 64, i32 2) #6, !dbg !1236
  %711 = trunc i64 %710 to i32, !dbg !1236
  call void @llvm.dbg.value(metadata i32 %711, metadata !636, metadata !DIExpression()) #6, !dbg !1157
  %712 = icmp eq i32 %711, 0, !dbg !1237
  br i1 %712, label %713, label %728, !dbg !1237

713:                                              ; preds = %705
  switch i16 %641, label %729 [
    i16 8, label %714
    i16 -8826, label %724
  ], !dbg !1238

714:                                              ; preds = %713
  call void @llvm.dbg.value(metadata %struct.iphdr* %629, metadata !740, metadata !DIExpression()) #6, !dbg !1239
  %715 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* %629, i32 7, i32 8) #6, !dbg !1241, !llvm.preserve.access.index !314
  %716 = load i16, i16* %715, align 2, !dbg !1241, !tbaa !750
  call void @llvm.dbg.value(metadata i16 %716, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1239
  %717 = add i16 %716, 1, !dbg !1242
  call void @llvm.dbg.value(metadata i16 %716, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !1239
  %718 = icmp ugt i16 %716, -3, !dbg !1243
  %719 = zext i1 %718 to i16, !dbg !1243
  %720 = add i16 %717, %719, !dbg !1244
  store i16 %720, i16* %715, align 2, !dbg !1245, !tbaa !750
  %721 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %629, i32 5, i32 6) #6, !dbg !1246, !llvm.preserve.access.index !314
  %722 = load i8, i8* %721, align 4, !dbg !1247, !tbaa !757
  %723 = add i8 %722, -1, !dbg !1247
  store i8 %723, i8* %721, align 4, !dbg !1247, !tbaa !757
  br label %729, !dbg !1248

724:                                              ; preds = %713
  %725 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %635, i32 4, i32 5) #6, !dbg !1249, !llvm.preserve.access.index !329
  %726 = load i8, i8* %725, align 1, !dbg !1250, !tbaa !530
  %727 = add i8 %726, -1, !dbg !1250
  store i8 %727, i8* %725, align 1, !dbg !1250, !tbaa !530
  br label %729, !dbg !1251

728:                                              ; preds = %705, %672, %670, %642, %638, %621
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %636) #6, !dbg !1252
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1142
  br label %745, !dbg !1253

729:                                              ; preds = %724, %714, %713
  %730 = load i32, i32* %708, align 4, !dbg !1254, !tbaa !735
  store i32 %730, i32* %13, align 4, !dbg !1255, !tbaa !713
  call void @llvm.dbg.value(metadata i8* %612, metadata !637, metadata !DIExpression()) #6, !dbg !1256
  call void @llvm.dbg.value(metadata i8* %611, metadata !639, metadata !DIExpression()) #6, !dbg !1256
  %731 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 12, i32 12) #6, !dbg !1257, !llvm.preserve.access.index !99
  %732 = getelementptr inbounds [6 x i8], [6 x i8]* %731, i64 0, i64 0, !dbg !1258
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %611, i8* nonnull align 2 dereferenceable(6) %732, i64 6, i1 false) #6, !dbg !1258
  %733 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %12, i32 11, i32 11) #6, !dbg !1259, !llvm.preserve.access.index !99
  %734 = getelementptr inbounds [6 x i8], [6 x i8]* %733, i64 0, i64 0, !dbg !1260
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %612, i8* nonnull align 4 dereferenceable(6) %734, i64 6, i1 false) #6, !dbg !1260
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %636) #6, !dbg !1252
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1142
  call void @llvm.dbg.value(metadata i8* %615, metadata !772, metadata !DIExpression()) #6, !dbg !1261
  call void @llvm.dbg.value(metadata i8* %612, metadata !777, metadata !DIExpression()) #6, !dbg !1261
  call void @llvm.dbg.value(metadata i8* %611, metadata !778, metadata !DIExpression()) #6, !dbg !1261
  call void @llvm.dbg.value(metadata i8* %612, metadata !779, metadata !DIExpression()) #6, !dbg !1261
  call void @llvm.dbg.value(metadata i8* %611, metadata !781, metadata !DIExpression()) #6, !dbg !1261
  call void @llvm.dbg.value(metadata i8* %615, metadata !782, metadata !DIExpression()) #6, !dbg !1261
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %615, i8* nonnull align 2 dereferenceable(6) %611, i64 6, i1 false) #6, !dbg !1263
  %735 = getelementptr inbounds i8, i8* %615, i64 6, !dbg !1264
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %735, i8* nonnull align 2 dereferenceable(6) %612, i64 6, i1 false) #6, !dbg !1265
  call void @llvm.dbg.value(metadata i32* %13, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1142
  %736 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %622) #6, !dbg !1266
  %737 = icmp eq i8* %736, null, !dbg !1266
  br i1 %737, label %745, label %738, !dbg !1267

738:                                              ; preds = %729
  %739 = load i32, i32* %706, align 4, !dbg !1268, !tbaa !732
  %740 = load i32, i32* %13, align 4, !dbg !1269, !tbaa !713
  call void @llvm.dbg.value(metadata i32 %740, metadata !593, metadata !DIExpression()) #6, !dbg !1142
  %741 = icmp eq i32 %739, %740, !dbg !1270
  br i1 %741, label %745, label %742, !dbg !1271

742:                                              ; preds = %738
  %743 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %740, i64 0) #6, !dbg !1272
  %744 = trunc i64 %743 to i32, !dbg !1272
  br label %745, !dbg !1273

745:                                              ; preds = %742, %738, %729, %728
  %746 = phi i32 [ %744, %742 ], [ 2, %729 ], [ 3, %738 ], [ 2, %728 ], !dbg !1142
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %611), !dbg !1274
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %612), !dbg !1274
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %622) #6, !dbg !1274
  br label %747

747:                                              ; preds = %590, %745, %610, %485, %482
  %748 = phi i32 [ 2, %482 ], [ 2, %485 ], [ %746, %745 ], [ 2, %610 ], [ 2, %590 ]
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %430) #6, !dbg !1275
  br label %749

749:                                              ; preds = %319, %335, %343, %358, %363, %371, %382, %388, %397, %405, %747
  %750 = phi i32 [ 2, %319 ], [ 2, %335 ], [ 1, %343 ], [ 1, %363 ], [ 1, %358 ], [ 2, %371 ], [ 2, %382 ], [ %748, %747 ], [ 1, %388 ], [ 1, %397 ], [ 1, %405 ], !dbg !858
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %332) #6, !dbg !1275
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %331) #6, !dbg !1275
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !1276
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !1276
  call void @llvm.dbg.value(metadata i32 %750, metadata !403, metadata !DIExpression()) #6, !dbg !1276
  %751 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %750) #6, !dbg !1278
  br label %1845, !dbg !1279

752:                                              ; preds = %49
  %753 = icmp eq %struct.ipv6hdr* %43, null, !dbg !1280
  br i1 %753, label %754, label %756, !dbg !1284

754:                                              ; preds = %752
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !1285
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !1285
  call void @llvm.dbg.value(metadata i32 1, metadata !403, metadata !DIExpression()) #6, !dbg !1285
  %755 = tail call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 1) #6, !dbg !1287
  br label %1845, !dbg !1288

756:                                              ; preds = %752
  %757 = getelementptr inbounds %struct.lpm_key_v6, %struct.lpm_key_v6* %22, i64 0, i32 0, !dbg !1289
  store i32 128, i32* %757, align 4, !dbg !1290, !tbaa !1291
  %758 = getelementptr inbounds %struct.lpm_key_v6, %struct.lpm_key_v6* %22, i64 0, i32 1, !dbg !1293
  %759 = tail call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %43, i32 6, i32 7), !dbg !1294, !llvm.preserve.access.index !329
  %760 = bitcast %struct.in6_addr* %758 to i8*, !dbg !1294
  %761 = bitcast %struct.in6_addr* %759 to i8*, !dbg !1294
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %760, i8* nonnull align 4 dereferenceable(16) %761, i64 16, i1 false), !dbg !1294, !tbaa.struct !728
  %762 = tail call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %43, i32 3, i32 4), !dbg !1295, !llvm.preserve.access.index !329
  %763 = load i8, i8* %762, align 2, !dbg !1295, !tbaa !526
  %764 = icmp eq i8 %763, 43, !dbg !1297
  br i1 %764, label %765, label %1584, !dbg !1298

765:                                              ; preds = %756
  %766 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.1* @function_table to i8*), i8* nonnull %45) #6, !dbg !1299
  call void @llvm.dbg.value(metadata i8* %766, metadata !340, metadata !DIExpression()), !dbg !345
  %767 = icmp eq i8* %766, null, !dbg !1301
  br i1 %767, label %1843, label %768, !dbg !1303

768:                                              ; preds = %765
  %769 = getelementptr inbounds i8, i8* %766, i64 32, !dbg !1304
  %770 = bitcast i8* %769 to i32*, !dbg !1304
  %771 = load i32, i32* %770, align 4, !dbg !1304, !tbaa !1306
  switch i32 %771, label %1843 [
    i32 1, label %772
    i32 6, label %961
    i32 16, label %1153
  ], !dbg !1308

772:                                              ; preds = %768
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1309, metadata !DIExpression()) #6, !dbg !1314
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1317, metadata !DIExpression()) #6, !dbg !1323
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1325, metadata !DIExpression()) #6, !dbg !1331
  %773 = load i32, i32* %23, align 4, !dbg !1333, !tbaa !347
  %774 = zext i32 %773 to i64, !dbg !1334
  %775 = inttoptr i64 %774 to i8*, !dbg !1335
  call void @llvm.dbg.value(metadata i8* %775, metadata !1328, metadata !DIExpression()) #6, !dbg !1331
  %776 = load i32, i32* %27, align 4, !dbg !1336, !tbaa !355
  %777 = zext i32 %776 to i64, !dbg !1337
  call void @llvm.dbg.value(metadata i64 %777, metadata !1329, metadata !DIExpression()) #6, !dbg !1331
  call void @llvm.dbg.value(metadata i8* %775, metadata !1330, metadata !DIExpression(DW_OP_plus_uconst, 54, DW_OP_stack_value)) #6, !dbg !1331
  %778 = getelementptr i8, i8* %775, i64 62, !dbg !1338
  %779 = bitcast i8* %778 to %struct.srhhdr*, !dbg !1338
  %780 = inttoptr i64 %777 to %struct.srhhdr*, !dbg !1340
  %781 = icmp ugt %struct.srhhdr* %779, %780, !dbg !1341
  %782 = getelementptr i8, i8* %775, i64 54, !dbg !1342
  call void @llvm.dbg.value(metadata %struct.srhhdr* undef, metadata !1322, metadata !DIExpression()) #6, !dbg !1323
  %783 = icmp eq i8* %782, null, !dbg !1343
  %784 = or i1 %783, %781, !dbg !1343
  br i1 %784, label %791, label %785, !dbg !1345

785:                                              ; preds = %772
  %786 = bitcast i8* %782 to %struct.srhhdr*, !dbg !1342
  %787 = getelementptr i8, i8* %775, i64 57, !dbg !1346
  %788 = load i8, i8* %787, align 1, !dbg !1346, !tbaa !561
  %789 = icmp eq i8 %788, 0, !dbg !1348
  %790 = select i1 %789, %struct.srhhdr* null, %struct.srhhdr* %786, !dbg !1323
  br label %791, !dbg !1323

791:                                              ; preds = %785, %772
  %792 = phi %struct.srhhdr* [ null, %772 ], [ %790, %785 ], !dbg !1323
  call void @llvm.dbg.value(metadata %struct.srhhdr* %792, metadata !1312, metadata !DIExpression()) #6, !dbg !1314
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !1349
  call void @llvm.dbg.value(metadata i8* %775, metadata !379, metadata !DIExpression()) #6, !dbg !1349
  call void @llvm.dbg.value(metadata i64 %777, metadata !380, metadata !DIExpression()) #6, !dbg !1349
  call void @llvm.dbg.value(metadata i8* %775, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1349
  %793 = bitcast i8* %782 to %struct.ipv6hdr*, !dbg !1351
  %794 = inttoptr i64 %777 to %struct.ipv6hdr*, !dbg !1352
  %795 = icmp ugt %struct.ipv6hdr* %793, %794, !dbg !1353
  %796 = getelementptr i8, i8* %775, i64 14, !dbg !1354
  %797 = bitcast i8* %796 to %struct.ipv6hdr*, !dbg !1354
  %798 = select i1 %795, %struct.ipv6hdr* null, %struct.ipv6hdr* %797, !dbg !1354
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %798, metadata !1313, metadata !DIExpression()) #6, !dbg !1314
  %799 = icmp ne %struct.srhhdr* %792, null, !dbg !1355
  %800 = icmp ne %struct.ipv6hdr* %798, null
  %801 = and i1 %800, %799, !dbg !1357
  br i1 %801, label %802, label %958, !dbg !1357

802:                                              ; preds = %791
  %803 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %798, i32 6, i32 7) #6, !dbg !1358, !llvm.preserve.access.index !329
  call void @llvm.dbg.value(metadata %struct.srhhdr* %792, metadata !1360, metadata !DIExpression()) #6, !dbg !1369
  call void @llvm.dbg.value(metadata %struct.in6_addr* %803, metadata !1365, metadata !DIExpression()) #6, !dbg !1369
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1366, metadata !DIExpression()) #6, !dbg !1369
  %804 = inttoptr i64 %777 to i8*, !dbg !1371
  call void @llvm.dbg.value(metadata i8* %804, metadata !1368, metadata !DIExpression()) #6, !dbg !1369
  %805 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %792, i64 0, i32 3, !dbg !1372
  %806 = load i8, i8* %805, align 1, !dbg !1373, !tbaa !561
  %807 = add i8 %806, -1, !dbg !1373
  store i8 %807, i8* %805, align 1, !dbg !1373, !tbaa !561
  %808 = getelementptr %struct.srhhdr, %struct.srhhdr* %792, i64 1, i32 0, !dbg !1374
  %809 = zext i8 %807 to i64, !dbg !1376
  %810 = shl nuw nsw i64 %809, 4, !dbg !1377
  %811 = add nuw nsw i64 %810, 16, !dbg !1377
  %812 = getelementptr i8, i8* %808, i64 %811, !dbg !1378
  %813 = icmp ugt i8* %812, %804, !dbg !1379
  br i1 %813, label %958, label %814, !dbg !1380

814:                                              ; preds = %802
  %815 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %792, i64 0, i32 7, i64 %809, !dbg !1381
  call void @llvm.dbg.value(metadata %struct.in6_addr* %815, metadata !1367, metadata !DIExpression()) #6, !dbg !1369
  %816 = getelementptr inbounds %struct.in6_addr, %struct.in6_addr* %815, i64 1, !dbg !1382
  %817 = inttoptr i64 %777 to %struct.in6_addr*, !dbg !1384
  %818 = icmp ugt %struct.in6_addr* %816, %817, !dbg !1385
  br i1 %818, label %958, label %819, !dbg !1386

819:                                              ; preds = %814
  %820 = bitcast %struct.in6_addr* %803 to i8*, !dbg !1387
  %821 = bitcast %struct.in6_addr* %815 to i8*, !dbg !1387
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %820, i8* nonnull align 4 dereferenceable(16) %821, i64 16, i1 false) #6, !dbg !1387, !tbaa.struct !728
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !585, metadata !DIExpression()) #6, !dbg !1388
  call void @llvm.dbg.value(metadata i32 0, metadata !590, metadata !DIExpression()) #6, !dbg !1388
  %822 = getelementptr inbounds [6 x i8], [6 x i8]* %20, i64 0, i64 0
  %823 = getelementptr inbounds [6 x i8], [6 x i8]* %19, i64 0, i64 0
  %824 = load i32, i32* %23, align 4, !dbg !1390, !tbaa !347
  %825 = zext i32 %824 to i64, !dbg !1391
  %826 = inttoptr i64 %825 to i8*, !dbg !1392
  call void @llvm.dbg.value(metadata i8* %826, metadata !591, metadata !DIExpression()) #6, !dbg !1388
  %827 = load i32, i32* %27, align 4, !dbg !1393, !tbaa !355
  %828 = zext i32 %827 to i64, !dbg !1394
  %829 = inttoptr i64 %828 to i8*, !dbg !1395
  call void @llvm.dbg.value(metadata i8* %829, metadata !592, metadata !DIExpression()) #6, !dbg !1388
  %830 = getelementptr i8, i8* %826, i64 1, !dbg !1396
  %831 = icmp ugt i8* %830, %829, !dbg !1397
  br i1 %831, label %958, label %832, !dbg !1398

832:                                              ; preds = %819
  %833 = bitcast i32* %11 to i8*, !dbg !1399
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %833) #6, !dbg !1399
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %823), !dbg !1400
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !594, metadata !DIExpression()) #6, !dbg !1401
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %822), !dbg !1400
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !595, metadata !DIExpression()) #6, !dbg !1402
  call void @llvm.dbg.value(metadata i32* %11, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1388
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !616, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i8* %823, metadata !622, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i8* %822, metadata !623, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i32* %11, metadata !624, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i32 0, metadata !625, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i8* %826, metadata !626, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i8* %829, metadata !627, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata i8* %826, metadata !628, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !1405
  call void @llvm.dbg.value(metadata i8* %826, metadata !364, metadata !DIExpression()) #6, !dbg !1405
  call void @llvm.dbg.value(metadata i64 %828, metadata !365, metadata !DIExpression()) #6, !dbg !1405
  call void @llvm.dbg.value(metadata i8* %826, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1405
  %834 = getelementptr i8, i8* %826, i64 34, !dbg !1407
  %835 = bitcast i8* %834 to %struct.iphdr*, !dbg !1407
  %836 = inttoptr i64 %828 to %struct.iphdr*, !dbg !1408
  %837 = icmp ugt %struct.iphdr* %835, %836, !dbg !1409
  %838 = getelementptr i8, i8* %826, i64 14, !dbg !1410
  %839 = bitcast i8* %838 to %struct.iphdr*, !dbg !1410
  %840 = select i1 %837, %struct.iphdr* null, %struct.iphdr* %839, !dbg !1410
  call void @llvm.dbg.value(metadata %struct.iphdr* %840, metadata !629, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !1411
  call void @llvm.dbg.value(metadata i8* %826, metadata !379, metadata !DIExpression()) #6, !dbg !1411
  call void @llvm.dbg.value(metadata i64 %828, metadata !380, metadata !DIExpression()) #6, !dbg !1411
  call void @llvm.dbg.value(metadata i8* %826, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1411
  %841 = getelementptr i8, i8* %826, i64 54, !dbg !1413
  %842 = bitcast i8* %841 to %struct.ipv6hdr*, !dbg !1413
  %843 = inttoptr i64 %828 to %struct.ipv6hdr*, !dbg !1414
  %844 = icmp ugt %struct.ipv6hdr* %842, %843, !dbg !1415
  %845 = bitcast i8* %838 to %struct.ipv6hdr*, !dbg !1416
  %846 = select i1 %844, %struct.ipv6hdr* null, %struct.ipv6hdr* %845, !dbg !1416
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %846, metadata !630, metadata !DIExpression()) #6, !dbg !1403
  %847 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %10, i64 0, i32 0, !dbg !1417
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %847) #6, !dbg !1417
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %10, metadata !631, metadata !DIExpression()) #6, !dbg !1418
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %847, i8 0, i64 64, i1 false) #6, !dbg !1418
  %848 = icmp ugt i8* %838, %829, !dbg !1419
  br i1 %848, label %939, label %849, !dbg !1420

849:                                              ; preds = %832
  %850 = inttoptr i64 %825 to %struct.ethhdr*, !dbg !1421
  call void @llvm.dbg.value(metadata %struct.ethhdr* %850, metadata !628, metadata !DIExpression()) #6, !dbg !1403
  %851 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %850, i32 2, i32 2) #6, !dbg !1422, !llvm.preserve.access.index !306
  %852 = load i16, i16* %851, align 2, !dbg !1422, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %852, metadata !632, metadata !DIExpression()) #6, !dbg !1403
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %847, i8 0, i64 64, i1 false) #6, !dbg !1423
  switch i16 %852, label %939 [
    i16 8, label %853
    i16 -8826, label %881
  ], !dbg !1424

853:                                              ; preds = %849
  %854 = icmp eq %struct.iphdr* %840, null, !dbg !1425
  br i1 %854, label %939, label %855, !dbg !1426

855:                                              ; preds = %853
  %856 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 0, i32 0) #6, !dbg !1427, !llvm.preserve.access.index !99
  store i8 2, i8* %856, align 4, !dbg !1428, !tbaa !668
  %857 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %840, i32 1, i32 2) #6, !dbg !1429, !llvm.preserve.access.index !314
  %858 = load i8, i8* %857, align 1, !dbg !1429, !tbaa !671
  %859 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 6, i32 6) #6, !dbg !1430, !llvm.preserve.access.index !99
  %860 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %859, i32 0) #6, !dbg !1430, !llvm.preserve.access.index !98
  %861 = bitcast %union.anon.5* %860 to i8*, !dbg !1430
  store i8 %858, i8* %861, align 4, !dbg !1431, !tbaa !674
  %862 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %840, i32 6, i32 7) #6, !dbg !1432, !llvm.preserve.access.index !314
  %863 = load i8, i8* %862, align 1, !dbg !1432, !tbaa !676
  %864 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 1, i32 1) #6, !dbg !1433, !llvm.preserve.access.index !99
  store i8 %863, i8* %864, align 1, !dbg !1434, !tbaa !679
  %865 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 2, i32 2) #6, !dbg !1435, !llvm.preserve.access.index !99
  store i16 0, i16* %865, align 2, !dbg !1436, !tbaa !682
  %866 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 3, i32 3) #6, !dbg !1437, !llvm.preserve.access.index !99
  store i16 0, i16* %866, align 4, !dbg !1438, !tbaa !685
  %867 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %840, i32 2, i32 3) #6, !dbg !1439, !llvm.preserve.access.index !314
  %868 = load i16, i16* %867, align 2, !dbg !1439, !tbaa !445
  %869 = call i16 @llvm.bswap.i16(i16 %868) #6
  %870 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 4, i32 4) #6, !dbg !1440, !llvm.preserve.access.index !99
  store i16 %869, i16* %870, align 2, !dbg !1441, !tbaa !689
  %871 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %840, i32 8, i32 9) #6, !dbg !1442, !llvm.preserve.access.index !314
  %872 = load i32, i32* %871, align 4, !dbg !1442, !tbaa !691
  %873 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 7, i32 7) #6, !dbg !1443, !llvm.preserve.access.index !99
  %874 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %873, i32 0) #6, !dbg !1443, !llvm.preserve.access.index !109
  %875 = getelementptr %union.anon.6, %union.anon.6* %874, i64 0, i32 0, i64 0, !dbg !1443
  store i32 %872, i32* %875, align 4, !dbg !1444, !tbaa !674
  %876 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %840, i32 9, i32 10) #6, !dbg !1445, !llvm.preserve.access.index !314
  %877 = load i32, i32* %876, align 4, !dbg !1445, !tbaa !428
  %878 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 8, i32 8) #6, !dbg !1446, !llvm.preserve.access.index !99
  %879 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %878, i32 0) #6, !dbg !1446, !llvm.preserve.access.index !115
  %880 = getelementptr %union.anon.7, %union.anon.7* %879, i64 0, i32 0, i64 0, !dbg !1446
  store i32 %877, i32* %880, align 4, !dbg !1447, !tbaa !674
  br label %916, !dbg !1448

881:                                              ; preds = %849
  %882 = icmp eq %struct.ipv6hdr* %846, null, !dbg !1449
  br i1 %882, label %939, label %883, !dbg !1450

883:                                              ; preds = %881
  %884 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %846, i32 4, i32 5) #6, !dbg !1451, !llvm.preserve.access.index !329
  %885 = load i8, i8* %884, align 1, !dbg !1451, !tbaa !530
  %886 = icmp ult i8 %885, 2, !dbg !1452
  br i1 %886, label %939, label %887, !dbg !1453

887:                                              ; preds = %883
  %888 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 7, i32 7) #6, !dbg !1454, !llvm.preserve.access.index !99
  %889 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %888, i32 1) #6, !dbg !1454, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %889, metadata !633, metadata !DIExpression()) #6, !dbg !1455
  %890 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 8, i32 8) #6, !dbg !1456, !llvm.preserve.access.index !99
  %891 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %890, i32 1) #6, !dbg !1456, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %891, metadata !635, metadata !DIExpression()) #6, !dbg !1455
  %892 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 0, i32 0) #6, !dbg !1457, !llvm.preserve.access.index !99
  store i8 10, i8* %892, align 4, !dbg !1458, !tbaa !668
  %893 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 6, i32 6) #6, !dbg !1459, !llvm.preserve.access.index !99
  %894 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %893, i32 0) #6, !dbg !1459, !llvm.preserve.access.index !98
  %895 = bitcast %union.anon.5* %894 to i8*, !dbg !1459
  store i8 0, i8* %895, align 4, !dbg !1460, !tbaa !674
  %896 = bitcast %struct.ipv6hdr* %846 to i32*, !dbg !1461
  %897 = load i32, i32* %896, align 4, !dbg !1461, !tbaa !713
  %898 = and i32 %897, -241, !dbg !1462
  %899 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %893, i32 1) #6, !dbg !1463, !llvm.preserve.access.index !98
  %900 = getelementptr %union.anon.5, %union.anon.5* %899, i64 0, i32 0, !dbg !1463
  store i32 %898, i32* %900, align 4, !dbg !1464, !tbaa !674
  %901 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %846, i32 3, i32 4) #6, !dbg !1465, !llvm.preserve.access.index !329
  %902 = load i8, i8* %901, align 2, !dbg !1465, !tbaa !526
  %903 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 1, i32 1) #6, !dbg !1466, !llvm.preserve.access.index !99
  store i8 %902, i8* %903, align 1, !dbg !1467, !tbaa !679
  %904 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 2, i32 2) #6, !dbg !1468, !llvm.preserve.access.index !99
  store i16 0, i16* %904, align 2, !dbg !1469, !tbaa !682
  %905 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 3, i32 3) #6, !dbg !1470, !llvm.preserve.access.index !99
  store i16 0, i16* %905, align 4, !dbg !1471, !tbaa !685
  %906 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %846, i32 2, i32 3) #6, !dbg !1472, !llvm.preserve.access.index !329
  %907 = load i16, i16* %906, align 4, !dbg !1472, !tbaa !533
  %908 = call i16 @llvm.bswap.i16(i16 %907) #6
  %909 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 4, i32 4) #6, !dbg !1473, !llvm.preserve.access.index !99
  store i16 %908, i16* %909, align 2, !dbg !1474, !tbaa !689
  %910 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %846, i32 5, i32 6) #6, !dbg !1475, !llvm.preserve.access.index !329
  %911 = bitcast %union.anon.6* %889 to i8*, !dbg !1475
  %912 = bitcast %struct.in6_addr* %910 to i8*, !dbg !1475
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %911, i8* nonnull align 4 dereferenceable(16) %912, i64 16, i1 false) #6, !dbg !1475, !tbaa.struct !728
  %913 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %846, i32 6, i32 7) #6, !dbg !1476, !llvm.preserve.access.index !329
  %914 = bitcast %union.anon.7* %891 to i8*, !dbg !1476
  %915 = bitcast %struct.in6_addr* %913 to i8*, !dbg !1476
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %914, i8* nonnull align 4 dereferenceable(16) %915, i64 16, i1 false) #6, !dbg !1476, !tbaa.struct !728
  br label %916, !dbg !1477

916:                                              ; preds = %887, %855
  %917 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #6, !dbg !1478, !llvm.preserve.access.index !62
  %918 = load i32, i32* %917, align 4, !dbg !1478, !tbaa !732
  %919 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 5, i32 5) #6, !dbg !1479, !llvm.preserve.access.index !99
  store i32 %918, i32* %919, align 4, !dbg !1480, !tbaa !735
  %920 = bitcast %struct.xdp_md* %0 to i8*, !dbg !1481
  %921 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %920, %struct.bpf_fib_lookup* nonnull %10, i32 64, i32 0) #6, !dbg !1482
  %922 = trunc i64 %921 to i32, !dbg !1482
  call void @llvm.dbg.value(metadata i32 %922, metadata !636, metadata !DIExpression()) #6, !dbg !1403
  %923 = icmp eq i32 %922, 0, !dbg !1483
  br i1 %923, label %924, label %939, !dbg !1483

924:                                              ; preds = %916
  switch i16 %852, label %940 [
    i16 8, label %925
    i16 -8826, label %935
  ], !dbg !1484

925:                                              ; preds = %924
  call void @llvm.dbg.value(metadata %struct.iphdr* %840, metadata !740, metadata !DIExpression()) #6, !dbg !1485
  %926 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* %840, i32 7, i32 8) #6, !dbg !1487, !llvm.preserve.access.index !314
  %927 = load i16, i16* %926, align 2, !dbg !1487, !tbaa !750
  call void @llvm.dbg.value(metadata i16 %927, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1485
  %928 = add i16 %927, 1, !dbg !1488
  call void @llvm.dbg.value(metadata i16 %927, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !1485
  %929 = icmp ugt i16 %927, -3, !dbg !1489
  %930 = zext i1 %929 to i16, !dbg !1489
  %931 = add i16 %928, %930, !dbg !1490
  store i16 %931, i16* %926, align 2, !dbg !1491, !tbaa !750
  %932 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %840, i32 5, i32 6) #6, !dbg !1492, !llvm.preserve.access.index !314
  %933 = load i8, i8* %932, align 4, !dbg !1493, !tbaa !757
  %934 = add i8 %933, -1, !dbg !1493
  store i8 %934, i8* %932, align 4, !dbg !1493, !tbaa !757
  br label %940, !dbg !1494

935:                                              ; preds = %924
  %936 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %846, i32 4, i32 5) #6, !dbg !1495, !llvm.preserve.access.index !329
  %937 = load i8, i8* %936, align 1, !dbg !1496, !tbaa !530
  %938 = add i8 %937, -1, !dbg !1496
  store i8 %938, i8* %936, align 1, !dbg !1496, !tbaa !530
  br label %940, !dbg !1497

939:                                              ; preds = %916, %883, %881, %853, %849, %832
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %847) #6, !dbg !1498
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1388
  br label %956, !dbg !1499

940:                                              ; preds = %935, %925, %924
  %941 = load i32, i32* %919, align 4, !dbg !1500, !tbaa !735
  store i32 %941, i32* %11, align 4, !dbg !1501, !tbaa !713
  call void @llvm.dbg.value(metadata i8* %823, metadata !637, metadata !DIExpression()) #6, !dbg !1502
  call void @llvm.dbg.value(metadata i8* %822, metadata !639, metadata !DIExpression()) #6, !dbg !1502
  %942 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 12, i32 12) #6, !dbg !1503, !llvm.preserve.access.index !99
  %943 = getelementptr inbounds [6 x i8], [6 x i8]* %942, i64 0, i64 0, !dbg !1504
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %822, i8* nonnull align 2 dereferenceable(6) %943, i64 6, i1 false) #6, !dbg !1504
  %944 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %10, i32 11, i32 11) #6, !dbg !1505, !llvm.preserve.access.index !99
  %945 = getelementptr inbounds [6 x i8], [6 x i8]* %944, i64 0, i64 0, !dbg !1506
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %823, i8* nonnull align 4 dereferenceable(6) %945, i64 6, i1 false) #6, !dbg !1506
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %847) #6, !dbg !1498
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1388
  call void @llvm.dbg.value(metadata i8* %826, metadata !772, metadata !DIExpression()) #6, !dbg !1507
  call void @llvm.dbg.value(metadata i8* %823, metadata !777, metadata !DIExpression()) #6, !dbg !1507
  call void @llvm.dbg.value(metadata i8* %822, metadata !778, metadata !DIExpression()) #6, !dbg !1507
  call void @llvm.dbg.value(metadata i8* %823, metadata !779, metadata !DIExpression()) #6, !dbg !1507
  call void @llvm.dbg.value(metadata i8* %822, metadata !781, metadata !DIExpression()) #6, !dbg !1507
  call void @llvm.dbg.value(metadata i8* %826, metadata !782, metadata !DIExpression()) #6, !dbg !1507
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %826, i8* nonnull align 2 dereferenceable(6) %822, i64 6, i1 false) #6, !dbg !1509
  %946 = getelementptr inbounds i8, i8* %826, i64 6, !dbg !1510
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %946, i8* nonnull align 2 dereferenceable(6) %823, i64 6, i1 false) #6, !dbg !1511
  call void @llvm.dbg.value(metadata i32* %11, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1388
  %947 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %833) #6, !dbg !1512
  %948 = icmp eq i8* %947, null, !dbg !1512
  br i1 %948, label %956, label %949, !dbg !1513

949:                                              ; preds = %940
  %950 = load i32, i32* %917, align 4, !dbg !1514, !tbaa !732
  %951 = load i32, i32* %11, align 4, !dbg !1515, !tbaa !713
  call void @llvm.dbg.value(metadata i32 %951, metadata !593, metadata !DIExpression()) #6, !dbg !1388
  %952 = icmp eq i32 %950, %951, !dbg !1516
  br i1 %952, label %956, label %953, !dbg !1517

953:                                              ; preds = %949
  %954 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %951, i64 0) #6, !dbg !1518
  %955 = trunc i64 %954 to i32, !dbg !1518
  br label %956, !dbg !1519

956:                                              ; preds = %953, %949, %940, %939
  %957 = phi i32 [ %955, %953 ], [ 2, %940 ], [ 3, %949 ], [ 2, %939 ], !dbg !1388
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %822), !dbg !1520
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %823), !dbg !1520
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %833) #6, !dbg !1520
  br label %958

958:                                              ; preds = %791, %802, %814, %819, %956
  %959 = phi i32 [ 2, %791 ], [ %957, %956 ], [ 2, %819 ], [ 2, %802 ], [ 2, %814 ], !dbg !1314
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !1521
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !1521
  call void @llvm.dbg.value(metadata i32 %959, metadata !403, metadata !DIExpression()) #6, !dbg !1521
  %960 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %959) #6, !dbg !1523
  br label %1845, !dbg !1524

961:                                              ; preds = %768
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1525, metadata !DIExpression()) #6, !dbg !1533
  call void @llvm.dbg.value(metadata i8* %766, metadata !1530, metadata !DIExpression()) #6, !dbg !1533
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1535, metadata !DIExpression()) #6, !dbg !1546
  call void @llvm.dbg.value(metadata i16 2048, metadata !1540, metadata !DIExpression()) #6, !dbg !1546
  call void @llvm.dbg.value(metadata i32 undef, metadata !1541, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1546
  call void @llvm.dbg.value(metadata i32 undef, metadata !1542, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1546
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1325, metadata !DIExpression()) #6, !dbg !1548
  %962 = load i32, i32* %23, align 4, !dbg !1550, !tbaa !347
  %963 = zext i32 %962 to i64, !dbg !1551
  %964 = inttoptr i64 %963 to i8*, !dbg !1552
  call void @llvm.dbg.value(metadata i8* %964, metadata !1328, metadata !DIExpression()) #6, !dbg !1548
  %965 = load i32, i32* %27, align 4, !dbg !1553, !tbaa !355
  %966 = zext i32 %965 to i64, !dbg !1554
  call void @llvm.dbg.value(metadata i64 %966, metadata !1329, metadata !DIExpression()) #6, !dbg !1548
  call void @llvm.dbg.value(metadata i8* %964, metadata !1330, metadata !DIExpression(DW_OP_plus_uconst, 54, DW_OP_stack_value)) #6, !dbg !1548
  %967 = getelementptr i8, i8* %964, i64 62, !dbg !1555
  %968 = bitcast i8* %967 to %struct.srhhdr*, !dbg !1555
  %969 = inttoptr i64 %966 to %struct.srhhdr*, !dbg !1556
  %970 = icmp ugt %struct.srhhdr* %968, %969, !dbg !1557
  %971 = getelementptr i8, i8* %964, i64 54, !dbg !1558
  %972 = bitcast i8* %971 to %struct.srhhdr*, !dbg !1558
  %973 = select i1 %970, %struct.srhhdr* null, %struct.srhhdr* %972, !dbg !1558
  call void @llvm.dbg.value(metadata %struct.srhhdr* %973, metadata !1543, metadata !DIExpression()) #6, !dbg !1546
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !1559
  call void @llvm.dbg.value(metadata i8* %964, metadata !379, metadata !DIExpression()) #6, !dbg !1559
  call void @llvm.dbg.value(metadata i64 %966, metadata !380, metadata !DIExpression()) #6, !dbg !1559
  call void @llvm.dbg.value(metadata i8* %964, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1559
  %974 = bitcast i8* %971 to %struct.ipv6hdr*, !dbg !1561
  %975 = inttoptr i64 %966 to %struct.ipv6hdr*, !dbg !1562
  %976 = icmp ule %struct.ipv6hdr* %974, %975, !dbg !1563
  %977 = getelementptr i8, i8* %964, i64 14, !dbg !1564
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* undef, metadata !1544, metadata !DIExpression()) #6, !dbg !1546
  %978 = icmp ne %struct.srhhdr* %973, null, !dbg !1565
  %979 = icmp ne i8* %977, null
  %980 = and i1 %979, %976
  %981 = and i1 %980, %978, !dbg !1567
  br i1 %981, label %982, label %1150, !dbg !1567

982:                                              ; preds = %961
  %983 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %973, i64 0, i32 1, !dbg !1568
  %984 = load i8, i8* %983, align 1, !dbg !1568, !tbaa !553
  %985 = zext i8 %984 to i32, !dbg !1570
  %986 = shl nuw nsw i32 %985, 3, !dbg !1571
  %987 = add nuw nsw i32 %986, 48, !dbg !1572
  %988 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %987) #6, !dbg !1573
  %989 = icmp eq i64 %988, 0, !dbg !1573
  br i1 %989, label %990, label %1150, !dbg !1574

990:                                              ; preds = %982
  %991 = load i32, i32* %23, align 4, !dbg !1575, !tbaa !347
  %992 = zext i32 %991 to i64, !dbg !1576
  call void @llvm.dbg.value(metadata i64 %992, metadata !1542, metadata !DIExpression()) #6, !dbg !1546
  %993 = load i32, i32* %27, align 4, !dbg !1577, !tbaa !355
  %994 = zext i32 %993 to i64, !dbg !1578
  call void @llvm.dbg.value(metadata i64 %994, metadata !1541, metadata !DIExpression()) #6, !dbg !1546
  %995 = inttoptr i64 %992 to %struct.ethhdr*, !dbg !1579
  call void @llvm.dbg.value(metadata %struct.ethhdr* %995, metadata !1545, metadata !DIExpression()) #6, !dbg !1546
  %996 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %995, i64 1, !dbg !1580
  %997 = inttoptr i64 %994 to %struct.ethhdr*, !dbg !1582
  %998 = icmp ugt %struct.ethhdr* %996, %997, !dbg !1583
  br i1 %998, label %1150, label %999, !dbg !1584

999:                                              ; preds = %990
  %1000 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %995, i32 2, i32 2) #6, !dbg !1585, !llvm.preserve.access.index !306
  store i16 8, i16* %1000, align 2, !dbg !1586, !tbaa !410
  call void @llvm.dbg.value(metadata i32 10000, metadata !1531, metadata !DIExpression()) #6, !dbg !1533
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !1587
  %1001 = inttoptr i64 %992 to i8*, !dbg !1589
  call void @llvm.dbg.value(metadata i8* %1001, metadata !364, metadata !DIExpression()) #6, !dbg !1587
  call void @llvm.dbg.value(metadata i64 %994, metadata !365, metadata !DIExpression()) #6, !dbg !1587
  call void @llvm.dbg.value(metadata i8* %1001, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1587
  %1002 = getelementptr i8, i8* %1001, i64 34, !dbg !1590
  %1003 = bitcast i8* %1002 to %struct.iphdr*, !dbg !1590
  %1004 = inttoptr i64 %994 to %struct.iphdr*, !dbg !1591
  %1005 = icmp ugt %struct.iphdr* %1003, %1004, !dbg !1592
  %1006 = getelementptr i8, i8* %1001, i64 14, !dbg !1593
  %1007 = bitcast i8* %1006 to %struct.iphdr*, !dbg !1593
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !1532, metadata !DIExpression()) #6, !dbg !1533
  %1008 = icmp eq i8* %1006, null, !dbg !1594
  %1009 = or i1 %1008, %1005, !dbg !1594
  br i1 %1009, label %1150, label %1010, !dbg !1596

1010:                                             ; preds = %999
  %1011 = getelementptr inbounds i8, i8* %766, i64 16, !dbg !1597
  %1012 = bitcast i8* %1011 to i32*, !dbg !1597
  %1013 = load i32, i32* %1012, align 4, !dbg !1597, !tbaa !674
  %1014 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1007, i32 9, i32 10) #6, !dbg !1598, !llvm.preserve.access.index !314
  store i32 %1013, i32* %1014, align 4, !dbg !1599, !tbaa !428
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !1600, metadata !DIExpression()) #6, !dbg !1608
  call void @llvm.dbg.value(metadata i32 0, metadata !1606, metadata !DIExpression()) #6, !dbg !1608
  %1015 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1007, i32 7, i32 8) #6, !dbg !1610, !llvm.preserve.access.index !314
  store i16 0, i16* %1015, align 2, !dbg !1611, !tbaa !750
  %1016 = bitcast i8* %1006 to i16*, !dbg !1612
  call void @llvm.dbg.value(metadata i16* %1016, metadata !1605, metadata !DIExpression()) #6, !dbg !1608
  call void @llvm.dbg.value(metadata i32 0, metadata !1607, metadata !DIExpression()) #6, !dbg !1608
  br label %1017, !dbg !1613

1017:                                             ; preds = %1017, %1010
  %1018 = phi i32 [ 0, %1010 ], [ %1025, %1017 ]
  %1019 = phi i32 [ 0, %1010 ], [ %1024, %1017 ]
  %1020 = phi i16* [ %1016, %1010 ], [ %1021, %1017 ]
  call void @llvm.dbg.value(metadata i32 %1018, metadata !1607, metadata !DIExpression()) #6, !dbg !1608
  call void @llvm.dbg.value(metadata i32 %1019, metadata !1606, metadata !DIExpression()) #6, !dbg !1608
  call void @llvm.dbg.value(metadata i16* %1020, metadata !1605, metadata !DIExpression()) #6, !dbg !1608
  %1021 = getelementptr inbounds i16, i16* %1020, i64 1, !dbg !1615
  call void @llvm.dbg.value(metadata i16* %1021, metadata !1605, metadata !DIExpression()) #6, !dbg !1608
  %1022 = load i16, i16* %1020, align 2, !dbg !1617, !tbaa !1618
  %1023 = zext i16 %1022 to i32, !dbg !1617
  %1024 = add i32 %1019, %1023, !dbg !1619
  call void @llvm.dbg.value(metadata i32 %1024, metadata !1606, metadata !DIExpression()) #6, !dbg !1608
  %1025 = add nuw nsw i32 %1018, 1, !dbg !1620
  call void @llvm.dbg.value(metadata i32 %1025, metadata !1607, metadata !DIExpression()) #6, !dbg !1608
  %1026 = icmp eq i32 %1025, 10, !dbg !1621
  br i1 %1026, label %1027, label %1017, !dbg !1613, !llvm.loop !1622

1027:                                             ; preds = %1017
  call void @llvm.dbg.value(metadata i32 %1024, metadata !1606, metadata !DIExpression()) #6, !dbg !1608
  %1028 = lshr i32 %1024, 16, !dbg !1624
  %1029 = add i32 %1028, %1024, !dbg !1625
  %1030 = trunc i32 %1029 to i16, !dbg !1626
  %1031 = xor i16 %1030, -1, !dbg !1626
  store i16 %1031, i16* %1015, align 2, !dbg !1627, !tbaa !750
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !585, metadata !DIExpression()) #6, !dbg !1628
  call void @llvm.dbg.value(metadata i32 0, metadata !590, metadata !DIExpression()) #6, !dbg !1628
  %1032 = getelementptr inbounds [6 x i8], [6 x i8]* %20, i64 0, i64 0
  %1033 = getelementptr inbounds [6 x i8], [6 x i8]* %19, i64 0, i64 0
  call void @llvm.dbg.value(metadata i8* %1001, metadata !591, metadata !DIExpression()) #6, !dbg !1628
  %1034 = inttoptr i64 %994 to i8*, !dbg !1630
  call void @llvm.dbg.value(metadata i8* %1034, metadata !592, metadata !DIExpression()) #6, !dbg !1628
  %1035 = getelementptr i8, i8* %1001, i64 1, !dbg !1631
  %1036 = icmp ugt i8* %1035, %1034, !dbg !1632
  br i1 %1036, label %1150, label %1037, !dbg !1633

1037:                                             ; preds = %1027
  %1038 = bitcast i32* %9 to i8*, !dbg !1634
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1038) #6, !dbg !1634
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %1033), !dbg !1635
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !594, metadata !DIExpression()) #6, !dbg !1636
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %1032), !dbg !1635
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !595, metadata !DIExpression()) #6, !dbg !1637
  call void @llvm.dbg.value(metadata i32* %9, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1628
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !616, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i8* %1033, metadata !622, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i8* %1032, metadata !623, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i32* %9, metadata !624, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i32 0, metadata !625, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i8* %1001, metadata !626, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i8* %1034, metadata !627, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata i8* %1001, metadata !628, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !1640
  call void @llvm.dbg.value(metadata i8* %1001, metadata !364, metadata !DIExpression()) #6, !dbg !1640
  call void @llvm.dbg.value(metadata i64 %994, metadata !365, metadata !DIExpression()) #6, !dbg !1640
  call void @llvm.dbg.value(metadata i8* %1001, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1640
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !629, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !1642
  call void @llvm.dbg.value(metadata i8* %1001, metadata !379, metadata !DIExpression()) #6, !dbg !1642
  call void @llvm.dbg.value(metadata i64 %994, metadata !380, metadata !DIExpression()) #6, !dbg !1642
  call void @llvm.dbg.value(metadata i8* %1001, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1642
  %1039 = getelementptr i8, i8* %1001, i64 54, !dbg !1644
  %1040 = bitcast i8* %1039 to %struct.ipv6hdr*, !dbg !1644
  %1041 = inttoptr i64 %994 to %struct.ipv6hdr*, !dbg !1645
  %1042 = icmp ugt %struct.ipv6hdr* %1040, %1041, !dbg !1646
  %1043 = bitcast i8* %1006 to %struct.ipv6hdr*, !dbg !1647
  %1044 = select i1 %1042, %struct.ipv6hdr* null, %struct.ipv6hdr* %1043, !dbg !1647
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1044, metadata !630, metadata !DIExpression()) #6, !dbg !1638
  %1045 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %8, i64 0, i32 0, !dbg !1648
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1045) #6, !dbg !1648
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %8, metadata !631, metadata !DIExpression()) #6, !dbg !1649
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %1045, i8 0, i64 64, i1 false) #6, !dbg !1649
  %1046 = icmp ugt i8* %1006, %1034, !dbg !1650
  br i1 %1046, label %1131, label %1047, !dbg !1651

1047:                                             ; preds = %1037
  call void @llvm.dbg.value(metadata %struct.ethhdr* %995, metadata !628, metadata !DIExpression()) #6, !dbg !1638
  %1048 = load i16, i16* %1000, align 2, !dbg !1652, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %1048, metadata !632, metadata !DIExpression()) #6, !dbg !1638
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %1045, i8 0, i64 64, i1 false) #6, !dbg !1653
  switch i16 %1048, label %1131 [
    i16 8, label %1049
    i16 -8826, label %1074
  ], !dbg !1654

1049:                                             ; preds = %1047
  %1050 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 0, i32 0) #6, !dbg !1655, !llvm.preserve.access.index !99
  store i8 2, i8* %1050, align 4, !dbg !1656, !tbaa !668
  %1051 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1007, i32 1, i32 2) #6, !dbg !1657, !llvm.preserve.access.index !314
  %1052 = load i8, i8* %1051, align 1, !dbg !1657, !tbaa !671
  %1053 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 6, i32 6) #6, !dbg !1658, !llvm.preserve.access.index !99
  %1054 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1053, i32 0) #6, !dbg !1658, !llvm.preserve.access.index !98
  %1055 = bitcast %union.anon.5* %1054 to i8*, !dbg !1658
  store i8 %1052, i8* %1055, align 4, !dbg !1659, !tbaa !674
  %1056 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1007, i32 6, i32 7) #6, !dbg !1660, !llvm.preserve.access.index !314
  %1057 = load i8, i8* %1056, align 1, !dbg !1660, !tbaa !676
  %1058 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 1, i32 1) #6, !dbg !1661, !llvm.preserve.access.index !99
  store i8 %1057, i8* %1058, align 1, !dbg !1662, !tbaa !679
  %1059 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 2, i32 2) #6, !dbg !1663, !llvm.preserve.access.index !99
  store i16 0, i16* %1059, align 2, !dbg !1664, !tbaa !682
  %1060 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 3, i32 3) #6, !dbg !1665, !llvm.preserve.access.index !99
  store i16 0, i16* %1060, align 4, !dbg !1666, !tbaa !685
  %1061 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1007, i32 2, i32 3) #6, !dbg !1667, !llvm.preserve.access.index !314
  %1062 = load i16, i16* %1061, align 2, !dbg !1667, !tbaa !445
  %1063 = call i16 @llvm.bswap.i16(i16 %1062) #6
  %1064 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 4, i32 4) #6, !dbg !1668, !llvm.preserve.access.index !99
  store i16 %1063, i16* %1064, align 2, !dbg !1669, !tbaa !689
  %1065 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1007, i32 8, i32 9) #6, !dbg !1670, !llvm.preserve.access.index !314
  %1066 = load i32, i32* %1065, align 4, !dbg !1670, !tbaa !691
  %1067 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 7, i32 7) #6, !dbg !1671, !llvm.preserve.access.index !99
  %1068 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %1067, i32 0) #6, !dbg !1671, !llvm.preserve.access.index !109
  %1069 = getelementptr %union.anon.6, %union.anon.6* %1068, i64 0, i32 0, i64 0, !dbg !1671
  store i32 %1066, i32* %1069, align 4, !dbg !1672, !tbaa !674
  %1070 = load i32, i32* %1014, align 4, !dbg !1673, !tbaa !428
  %1071 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 8, i32 8) #6, !dbg !1674, !llvm.preserve.access.index !99
  %1072 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %1071, i32 0) #6, !dbg !1674, !llvm.preserve.access.index !115
  %1073 = getelementptr %union.anon.7, %union.anon.7* %1072, i64 0, i32 0, i64 0, !dbg !1674
  store i32 %1070, i32* %1073, align 4, !dbg !1675, !tbaa !674
  br label %1109, !dbg !1676

1074:                                             ; preds = %1047
  %1075 = icmp eq %struct.ipv6hdr* %1044, null, !dbg !1677
  br i1 %1075, label %1131, label %1076, !dbg !1678

1076:                                             ; preds = %1074
  %1077 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1044, i32 4, i32 5) #6, !dbg !1679, !llvm.preserve.access.index !329
  %1078 = load i8, i8* %1077, align 1, !dbg !1679, !tbaa !530
  %1079 = icmp ult i8 %1078, 2, !dbg !1680
  br i1 %1079, label %1131, label %1080, !dbg !1681

1080:                                             ; preds = %1076
  %1081 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 7, i32 7) #6, !dbg !1682, !llvm.preserve.access.index !99
  %1082 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %1081, i32 1) #6, !dbg !1682, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %1082, metadata !633, metadata !DIExpression()) #6, !dbg !1683
  %1083 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 8, i32 8) #6, !dbg !1684, !llvm.preserve.access.index !99
  %1084 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %1083, i32 1) #6, !dbg !1684, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %1084, metadata !635, metadata !DIExpression()) #6, !dbg !1683
  %1085 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 0, i32 0) #6, !dbg !1685, !llvm.preserve.access.index !99
  store i8 10, i8* %1085, align 4, !dbg !1686, !tbaa !668
  %1086 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 6, i32 6) #6, !dbg !1687, !llvm.preserve.access.index !99
  %1087 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1086, i32 0) #6, !dbg !1687, !llvm.preserve.access.index !98
  %1088 = bitcast %union.anon.5* %1087 to i8*, !dbg !1687
  store i8 0, i8* %1088, align 4, !dbg !1688, !tbaa !674
  %1089 = bitcast %struct.ipv6hdr* %1044 to i32*, !dbg !1689
  %1090 = load i32, i32* %1089, align 4, !dbg !1689, !tbaa !713
  %1091 = and i32 %1090, -241, !dbg !1690
  %1092 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1086, i32 1) #6, !dbg !1691, !llvm.preserve.access.index !98
  %1093 = getelementptr %union.anon.5, %union.anon.5* %1092, i64 0, i32 0, !dbg !1691
  store i32 %1091, i32* %1093, align 4, !dbg !1692, !tbaa !674
  %1094 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1044, i32 3, i32 4) #6, !dbg !1693, !llvm.preserve.access.index !329
  %1095 = load i8, i8* %1094, align 2, !dbg !1693, !tbaa !526
  %1096 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 1, i32 1) #6, !dbg !1694, !llvm.preserve.access.index !99
  store i8 %1095, i8* %1096, align 1, !dbg !1695, !tbaa !679
  %1097 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 2, i32 2) #6, !dbg !1696, !llvm.preserve.access.index !99
  store i16 0, i16* %1097, align 2, !dbg !1697, !tbaa !682
  %1098 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 3, i32 3) #6, !dbg !1698, !llvm.preserve.access.index !99
  store i16 0, i16* %1098, align 4, !dbg !1699, !tbaa !685
  %1099 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1044, i32 2, i32 3) #6, !dbg !1700, !llvm.preserve.access.index !329
  %1100 = load i16, i16* %1099, align 4, !dbg !1700, !tbaa !533
  %1101 = call i16 @llvm.bswap.i16(i16 %1100) #6
  %1102 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 4, i32 4) #6, !dbg !1701, !llvm.preserve.access.index !99
  store i16 %1101, i16* %1102, align 2, !dbg !1702, !tbaa !689
  %1103 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1044, i32 5, i32 6) #6, !dbg !1703, !llvm.preserve.access.index !329
  %1104 = bitcast %union.anon.6* %1082 to i8*, !dbg !1703
  %1105 = bitcast %struct.in6_addr* %1103 to i8*, !dbg !1703
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1104, i8* nonnull align 4 dereferenceable(16) %1105, i64 16, i1 false) #6, !dbg !1703, !tbaa.struct !728
  %1106 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1044, i32 6, i32 7) #6, !dbg !1704, !llvm.preserve.access.index !329
  %1107 = bitcast %union.anon.7* %1084 to i8*, !dbg !1704
  %1108 = bitcast %struct.in6_addr* %1106 to i8*, !dbg !1704
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1107, i8* nonnull align 4 dereferenceable(16) %1108, i64 16, i1 false) #6, !dbg !1704, !tbaa.struct !728
  br label %1109, !dbg !1705

1109:                                             ; preds = %1080, %1049
  %1110 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #6, !dbg !1706, !llvm.preserve.access.index !62
  %1111 = load i32, i32* %1110, align 4, !dbg !1706, !tbaa !732
  %1112 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 5, i32 5) #6, !dbg !1707, !llvm.preserve.access.index !99
  store i32 %1111, i32* %1112, align 4, !dbg !1708, !tbaa !735
  %1113 = bitcast %struct.xdp_md* %0 to i8*, !dbg !1709
  %1114 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %1113, %struct.bpf_fib_lookup* nonnull %8, i32 64, i32 0) #6, !dbg !1710
  %1115 = trunc i64 %1114 to i32, !dbg !1710
  call void @llvm.dbg.value(metadata i32 %1115, metadata !636, metadata !DIExpression()) #6, !dbg !1638
  %1116 = icmp eq i32 %1115, 0, !dbg !1711
  br i1 %1116, label %1117, label %1131, !dbg !1711

1117:                                             ; preds = %1109
  switch i16 %1048, label %1132 [
    i16 8, label %1118
    i16 -8826, label %1127
  ], !dbg !1712

1118:                                             ; preds = %1117
  call void @llvm.dbg.value(metadata %struct.iphdr* undef, metadata !740, metadata !DIExpression()) #6, !dbg !1713
  %1119 = load i16, i16* %1015, align 2, !dbg !1715, !tbaa !750
  call void @llvm.dbg.value(metadata i16 %1119, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1713
  %1120 = add i16 %1119, 1, !dbg !1716
  call void @llvm.dbg.value(metadata i16 %1119, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !1713
  %1121 = icmp ugt i16 %1119, -3, !dbg !1717
  %1122 = zext i1 %1121 to i16, !dbg !1717
  %1123 = add i16 %1120, %1122, !dbg !1718
  store i16 %1123, i16* %1015, align 2, !dbg !1719, !tbaa !750
  %1124 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %1007, i32 5, i32 6) #6, !dbg !1720, !llvm.preserve.access.index !314
  %1125 = load i8, i8* %1124, align 4, !dbg !1721, !tbaa !757
  %1126 = add i8 %1125, -1, !dbg !1721
  store i8 %1126, i8* %1124, align 4, !dbg !1721, !tbaa !757
  br label %1132, !dbg !1722

1127:                                             ; preds = %1117
  %1128 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1044, i32 4, i32 5) #6, !dbg !1723, !llvm.preserve.access.index !329
  %1129 = load i8, i8* %1128, align 1, !dbg !1724, !tbaa !530
  %1130 = add i8 %1129, -1, !dbg !1724
  store i8 %1130, i8* %1128, align 1, !dbg !1724, !tbaa !530
  br label %1132, !dbg !1725

1131:                                             ; preds = %1109, %1076, %1074, %1047, %1037
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1045) #6, !dbg !1726
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1628
  br label %1148, !dbg !1727

1132:                                             ; preds = %1127, %1118, %1117
  %1133 = load i32, i32* %1112, align 4, !dbg !1728, !tbaa !735
  store i32 %1133, i32* %9, align 4, !dbg !1729, !tbaa !713
  call void @llvm.dbg.value(metadata i8* %1033, metadata !637, metadata !DIExpression()) #6, !dbg !1730
  call void @llvm.dbg.value(metadata i8* %1032, metadata !639, metadata !DIExpression()) #6, !dbg !1730
  %1134 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 12, i32 12) #6, !dbg !1731, !llvm.preserve.access.index !99
  %1135 = getelementptr inbounds [6 x i8], [6 x i8]* %1134, i64 0, i64 0, !dbg !1732
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %1032, i8* nonnull align 2 dereferenceable(6) %1135, i64 6, i1 false) #6, !dbg !1732
  %1136 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %8, i32 11, i32 11) #6, !dbg !1733, !llvm.preserve.access.index !99
  %1137 = getelementptr inbounds [6 x i8], [6 x i8]* %1136, i64 0, i64 0, !dbg !1734
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %1033, i8* nonnull align 4 dereferenceable(6) %1137, i64 6, i1 false) #6, !dbg !1734
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1045) #6, !dbg !1726
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1628
  call void @llvm.dbg.value(metadata i8* %1001, metadata !772, metadata !DIExpression()) #6, !dbg !1735
  call void @llvm.dbg.value(metadata i8* %1033, metadata !777, metadata !DIExpression()) #6, !dbg !1735
  call void @llvm.dbg.value(metadata i8* %1032, metadata !778, metadata !DIExpression()) #6, !dbg !1735
  call void @llvm.dbg.value(metadata i8* %1033, metadata !779, metadata !DIExpression()) #6, !dbg !1735
  call void @llvm.dbg.value(metadata i8* %1032, metadata !781, metadata !DIExpression()) #6, !dbg !1735
  call void @llvm.dbg.value(metadata i8* %1001, metadata !782, metadata !DIExpression()) #6, !dbg !1735
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %1001, i8* nonnull align 2 dereferenceable(6) %1032, i64 6, i1 false) #6, !dbg !1737
  %1138 = getelementptr inbounds i8, i8* %1001, i64 6, !dbg !1738
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %1138, i8* nonnull align 2 dereferenceable(6) %1033, i64 6, i1 false) #6, !dbg !1739
  call void @llvm.dbg.value(metadata i32* %9, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1628
  %1139 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %1038) #6, !dbg !1740
  %1140 = icmp eq i8* %1139, null, !dbg !1740
  br i1 %1140, label %1148, label %1141, !dbg !1741

1141:                                             ; preds = %1132
  %1142 = load i32, i32* %1110, align 4, !dbg !1742, !tbaa !732
  %1143 = load i32, i32* %9, align 4, !dbg !1743, !tbaa !713
  call void @llvm.dbg.value(metadata i32 %1143, metadata !593, metadata !DIExpression()) #6, !dbg !1628
  %1144 = icmp eq i32 %1142, %1143, !dbg !1744
  br i1 %1144, label %1148, label %1145, !dbg !1745

1145:                                             ; preds = %1141
  %1146 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %1143, i64 0) #6, !dbg !1746
  %1147 = trunc i64 %1146 to i32, !dbg !1746
  br label %1148, !dbg !1747

1148:                                             ; preds = %1145, %1141, %1132, %1131
  %1149 = phi i32 [ %1147, %1145 ], [ 2, %1132 ], [ 3, %1141 ], [ 2, %1131 ], !dbg !1628
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %1032), !dbg !1748
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %1033), !dbg !1748
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1038) #6, !dbg !1748
  br label %1150

1150:                                             ; preds = %961, %982, %990, %999, %1027, %1148
  %1151 = phi i32 [ 2, %999 ], [ %1149, %1148 ], [ 2, %1027 ], [ 1, %990 ], [ 2, %982 ], [ 2, %961 ], !dbg !1533
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !1749
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !1749
  call void @llvm.dbg.value(metadata i32 %1151, metadata !403, metadata !DIExpression()) #6, !dbg !1749
  %1152 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %1151) #6, !dbg !1751
  br label %1845, !dbg !1752

1153:                                             ; preds = %768
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1753, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i8* %766, metadata !1756, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i32 undef, metadata !1757, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i32 undef, metadata !1758, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1325, metadata !DIExpression()) #6, !dbg !1786
  %1154 = load i32, i32* %23, align 4, !dbg !1788, !tbaa !347
  %1155 = zext i32 %1154 to i64, !dbg !1789
  %1156 = inttoptr i64 %1155 to i8*, !dbg !1790
  call void @llvm.dbg.value(metadata i8* %1156, metadata !1328, metadata !DIExpression()) #6, !dbg !1786
  %1157 = load i32, i32* %27, align 4, !dbg !1791, !tbaa !355
  %1158 = zext i32 %1157 to i64, !dbg !1792
  call void @llvm.dbg.value(metadata i64 %1158, metadata !1329, metadata !DIExpression()) #6, !dbg !1786
  call void @llvm.dbg.value(metadata i8* %1156, metadata !1330, metadata !DIExpression(DW_OP_plus_uconst, 54, DW_OP_stack_value)) #6, !dbg !1786
  %1159 = getelementptr i8, i8* %1156, i64 62, !dbg !1793
  %1160 = bitcast i8* %1159 to %struct.srhhdr*, !dbg !1793
  %1161 = inttoptr i64 %1158 to %struct.srhhdr*, !dbg !1794
  %1162 = icmp ugt %struct.srhhdr* %1160, %1161, !dbg !1795
  %1163 = getelementptr i8, i8* %1156, i64 54, !dbg !1796
  %1164 = bitcast i8* %1163 to %struct.srhhdr*, !dbg !1796
  %1165 = select i1 %1162, %struct.srhhdr* null, %struct.srhhdr* %1164, !dbg !1796
  call void @llvm.dbg.value(metadata %struct.srhhdr* %1165, metadata !1759, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !1797
  call void @llvm.dbg.value(metadata i8* %1156, metadata !379, metadata !DIExpression()) #6, !dbg !1797
  call void @llvm.dbg.value(metadata i64 %1158, metadata !380, metadata !DIExpression()) #6, !dbg !1797
  call void @llvm.dbg.value(metadata i8* %1156, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1797
  %1166 = bitcast i8* %1163 to %struct.ipv6hdr*, !dbg !1799
  %1167 = inttoptr i64 %1158 to %struct.ipv6hdr*, !dbg !1800
  %1168 = icmp ugt %struct.ipv6hdr* %1166, %1167, !dbg !1801
  %1169 = getelementptr i8, i8* %1156, i64 14, !dbg !1802
  %1170 = bitcast i8* %1169 to %struct.ipv6hdr*, !dbg !1802
  %1171 = select i1 %1168, %struct.ipv6hdr* null, %struct.ipv6hdr* %1170, !dbg !1802
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1171, metadata !1760, metadata !DIExpression()) #6, !dbg !1784
  %1172 = icmp ne %struct.srhhdr* %1165, null, !dbg !1803
  %1173 = icmp ne %struct.ipv6hdr* %1171, null
  %1174 = and i1 %1172, %1173, !dbg !1805
  br i1 %1174, label %1175, label %1581, !dbg !1805

1175:                                             ; preds = %1153
  %1176 = bitcast i32* %6 to i8*, !dbg !1806
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1176) #6, !dbg !1806
  call void @llvm.dbg.value(metadata i32 0, metadata !1763, metadata !DIExpression()) #6, !dbg !1784
  store i32 0, i32* %6, align 4, !dbg !1807, !tbaa !713
  call void @llvm.dbg.value(metadata i32* %6, metadata !1763, metadata !DIExpression(DW_OP_deref)) #6, !dbg !1784
  %1177 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.4* @in_taple_v6_addr to i8*), i8* nonnull %1176) #6, !dbg !1808
  call void @llvm.dbg.value(metadata i8* %1177, metadata !1764, metadata !DIExpression()) #6, !dbg !1784
  %1178 = icmp eq i8* %1177, null, !dbg !1809
  br i1 %1178, label %1579, label %1179, !dbg !1811

1179:                                             ; preds = %1175
  call void @llvm.dbg.value(metadata i8* %1177, metadata !1764, metadata !DIExpression()) #6, !dbg !1784
  %1180 = bitcast i8* %1177 to %struct.in6_addr*, !dbg !1812
  %1181 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1171, i32 5, i32 6) #6, !dbg !1813, !llvm.preserve.access.index !329
  %1182 = bitcast %struct.in6_addr* %1181 to i8*, !dbg !1813
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1177, i8* nonnull align 4 dereferenceable(16) %1182, i64 16, i1 false) #6, !dbg !1813, !tbaa.struct !728
  %1183 = getelementptr inbounds i8, i8* %1177, i64 16, !dbg !1814
  %1184 = bitcast i8* %1183 to %struct.in6_addr*, !dbg !1814
  %1185 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1171, i32 6, i32 7) #6, !dbg !1815, !llvm.preserve.access.index !329
  %1186 = bitcast %struct.in6_addr* %1185 to i8*, !dbg !1815
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1183, i8* nonnull align 4 dereferenceable(16) %1186, i64 16, i1 false) #6, !dbg !1815, !tbaa.struct !728
  %1187 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1171, i32 2, i32 3) #6, !dbg !1816, !llvm.preserve.access.index !329
  %1188 = load i16, i16* %1187, align 4, !dbg !1816, !tbaa !533
  %1189 = call i16 @llvm.bswap.i16(i16 %1188) #6
  %1190 = getelementptr inbounds %struct.srhhdr, %struct.srhhdr* %1165, i64 0, i32 1, !dbg !1817
  %1191 = load i8, i8* %1190, align 1, !dbg !1817, !tbaa !553
  %1192 = zext i8 %1191 to i32, !dbg !1818
  %1193 = shl nuw nsw i32 %1192, 3, !dbg !1819
  %1194 = trunc i32 %1193 to i16, !dbg !1816
  %1195 = add i16 %1189, -8, !dbg !1816
  %1196 = sub i16 %1195, %1194, !dbg !1816
  call void @llvm.dbg.value(metadata i16 %1196, metadata !1761, metadata !DIExpression()) #6, !dbg !1784
  %1197 = add nuw nsw i32 %1193, 48, !dbg !1820
  %1198 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %1197) #6, !dbg !1822
  %1199 = icmp eq i64 %1198, 0, !dbg !1822
  br i1 %1199, label %1200, label %1579, !dbg !1823

1200:                                             ; preds = %1179
  %1201 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 -36) #6, !dbg !1824
  %1202 = icmp eq i64 %1201, 0, !dbg !1824
  br i1 %1202, label %1203, label %1579, !dbg !1826

1203:                                             ; preds = %1200
  call void @llvm.dbg.value(metadata i32 undef, metadata !1758, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i32 undef, metadata !1757, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1827, metadata !DIExpression()) #6, !dbg !1835
  %1204 = load i32, i32* %23, align 4, !dbg !1837, !tbaa !347
  %1205 = zext i32 %1204 to i64, !dbg !1838
  call void @llvm.dbg.value(metadata i64 %1205, metadata !1832, metadata !DIExpression()) #6, !dbg !1835
  %1206 = load i32, i32* %27, align 4, !dbg !1839, !tbaa !355
  %1207 = zext i32 %1206 to i64, !dbg !1840
  call void @llvm.dbg.value(metadata i64 %1207, metadata !1833, metadata !DIExpression()) #6, !dbg !1835
  %1208 = inttoptr i64 %1205 to %struct.ethhdr*, !dbg !1841
  call void @llvm.dbg.value(metadata %struct.ethhdr* %1208, metadata !1834, metadata !DIExpression()) #6, !dbg !1835
  %1209 = getelementptr inbounds %struct.ethhdr, %struct.ethhdr* %1208, i64 1, !dbg !1842
  %1210 = inttoptr i64 %1207 to %struct.ethhdr*, !dbg !1844
  %1211 = icmp ugt %struct.ethhdr* %1209, %1210, !dbg !1845
  %1212 = select i1 %1211, %struct.ethhdr* null, %struct.ethhdr* %1208, !dbg !1835
  call void @llvm.dbg.value(metadata %struct.ethhdr* %1212, metadata !1765, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !1846
  %1213 = inttoptr i64 %1205 to i8*, !dbg !1848
  call void @llvm.dbg.value(metadata i8* %1213, metadata !364, metadata !DIExpression()) #6, !dbg !1846
  call void @llvm.dbg.value(metadata i64 %1207, metadata !365, metadata !DIExpression()) #6, !dbg !1846
  call void @llvm.dbg.value(metadata i8* %1213, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !1846
  %1214 = getelementptr i8, i8* %1213, i64 34, !dbg !1849
  %1215 = bitcast i8* %1214 to %struct.iphdr*, !dbg !1849
  %1216 = inttoptr i64 %1207 to %struct.iphdr*, !dbg !1850
  %1217 = icmp ugt %struct.iphdr* %1215, %1216, !dbg !1851
  %1218 = getelementptr i8, i8* %1213, i64 14, !dbg !1852
  %1219 = bitcast i8* %1218 to %struct.iphdr*, !dbg !1852
  %1220 = select i1 %1217, %struct.iphdr* null, %struct.iphdr* %1219, !dbg !1852
  call void @llvm.dbg.value(metadata %struct.iphdr* %1220, metadata !1766, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1853, metadata !DIExpression()) #6, !dbg !1861
  call void @llvm.dbg.value(metadata i8* %1213, metadata !1858, metadata !DIExpression()) #6, !dbg !1861
  %1221 = inttoptr i64 %1207 to i8*, !dbg !1863
  call void @llvm.dbg.value(metadata i8* %1221, metadata !1859, metadata !DIExpression()) #6, !dbg !1861
  call void @llvm.dbg.value(metadata i8* %1213, metadata !1860, metadata !DIExpression(DW_OP_plus_uconst, 34, DW_OP_stack_value)) #6, !dbg !1861
  %1222 = getelementptr i8, i8* %1213, i64 42, !dbg !1864
  %1223 = icmp ugt i8* %1222, %1221, !dbg !1866
  %1224 = bitcast i8* %1214 to %struct.udphdr*, !dbg !1867
  %1225 = select i1 %1223, %struct.udphdr* null, %struct.udphdr* %1224, !dbg !1867
  call void @llvm.dbg.value(metadata %struct.udphdr* %1225, metadata !1767, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !1868, metadata !DIExpression()) #6, !dbg !1876
  call void @llvm.dbg.value(metadata i8* %1213, metadata !1873, metadata !DIExpression()) #6, !dbg !1876
  call void @llvm.dbg.value(metadata i8* %1221, metadata !1874, metadata !DIExpression()) #6, !dbg !1876
  call void @llvm.dbg.value(metadata i8* %1213, metadata !1875, metadata !DIExpression(DW_OP_plus_uconst, 42, DW_OP_stack_value)) #6, !dbg !1876
  %1226 = getelementptr i8, i8* %1213, i64 50, !dbg !1878
  %1227 = icmp ugt i8* %1226, %1221, !dbg !1880
  %1228 = bitcast i8* %1222 to %struct.gtp1hdr*, !dbg !1881
  %1229 = select i1 %1227, %struct.gtp1hdr* null, %struct.gtp1hdr* %1228, !dbg !1881
  call void @llvm.dbg.value(metadata %struct.gtp1hdr* %1229, metadata !1775, metadata !DIExpression()) #6, !dbg !1784
  %1230 = icmp ne %struct.ethhdr* %1212, null, !dbg !1882
  %1231 = icmp ne %struct.iphdr* %1220, null
  %1232 = and i1 %1230, %1231, !dbg !1884
  %1233 = icmp ne %struct.udphdr* %1225, null
  %1234 = and i1 %1233, %1232, !dbg !1884
  %1235 = icmp ne %struct.gtp1hdr* %1229, null
  %1236 = and i1 %1235, %1234, !dbg !1884
  br i1 %1236, label %1237, label %1579, !dbg !1884

1237:                                             ; preds = %1203
  call void @llvm.dbg.value(metadata i64 %1207, metadata !1757, metadata !DIExpression()) #6, !dbg !1784
  %1238 = add i16 %1196, 36, !dbg !1885
  call void @llvm.dbg.value(metadata i16 %1238, metadata !1762, metadata !DIExpression()) #6, !dbg !1784
  %1239 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* nonnull %1212, i32 2, i32 2) #6, !dbg !1886, !llvm.preserve.access.index !306
  store i16 8, i16* %1239, align 2, !dbg !1887, !tbaa !410
  %1240 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 0, i32 1) #6, !dbg !1888, !llvm.preserve.access.index !314
  %1241 = load i8, i8* %1240, align 4, !dbg !1889
  %1242 = and i8 %1241, 15, !dbg !1889
  %1243 = or i8 %1242, 64, !dbg !1889
  store i8 %1243, i8* %1240, align 4, !dbg !1889
  %1244 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 0, i32 0) #6, !dbg !1890, !llvm.preserve.access.index !314
  %1245 = load i8, i8* %1244, align 4, !dbg !1891
  %1246 = and i8 %1245, -16, !dbg !1891
  %1247 = or i8 %1246, 5, !dbg !1891
  store i8 %1247, i8* %1244, align 4, !dbg !1891
  %1248 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 4, i32 5) #6, !dbg !1892, !llvm.preserve.access.index !314
  store i16 64, i16* %1248, align 2, !dbg !1893, !tbaa !1894
  %1249 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 6, i32 7) #6, !dbg !1895, !llvm.preserve.access.index !314
  store i8 17, i8* %1249, align 1, !dbg !1896, !tbaa !676
  %1250 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 7, i32 8) #6, !dbg !1897, !llvm.preserve.access.index !314
  store i16 0, i16* %1250, align 2, !dbg !1898, !tbaa !750
  %1251 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 1, i32 2) #6, !dbg !1899, !llvm.preserve.access.index !314
  store i8 0, i8* %1251, align 1, !dbg !1900, !tbaa !671
  %1252 = call i16 @llvm.bswap.i16(i16 %1238) #6
  %1253 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 2, i32 3) #6, !dbg !1901, !llvm.preserve.access.index !314
  store i16 %1252, i16* %1253, align 2, !dbg !1902, !tbaa !445
  %1254 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 5, i32 6) #6, !dbg !1903, !llvm.preserve.access.index !314
  store i8 64, i8* %1254, align 4, !dbg !1904, !tbaa !757
  %1255 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %7, i64 0, i32 0, !dbg !1905
  call void @llvm.lifetime.start.p0i8(i64 5, i8* nonnull %1255) #6, !dbg !1905
  call void @llvm.dbg.declare(metadata %struct.args_mob_session* %7, metadata !1776, metadata !DIExpression()) #6, !dbg !1906
  call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %1255, i8 0, i64 5, i1 false) #6, !dbg !1907
  %1256 = getelementptr inbounds i8, i8* %766, i64 40, !dbg !1908
  %1257 = bitcast i8* %1256 to i32*, !dbg !1908
  %1258 = load i32, i32* %1257, align 4, !dbg !1908, !tbaa !1909
  %1259 = lshr i32 %1258, 3, !dbg !1910
  %1260 = trunc i32 %1259 to i16, !dbg !1911
  call void @llvm.dbg.value(metadata i16 %1260, metadata !1777, metadata !DIExpression()) #6, !dbg !1784
  %1261 = trunc i32 %1258 to i16, !dbg !1912
  %1262 = and i16 %1261, 7, !dbg !1912
  call void @llvm.dbg.value(metadata i16 %1262, metadata !1778, metadata !DIExpression()) #6, !dbg !1784
  %1263 = getelementptr inbounds i8, i8* %766, i64 44, !dbg !1913
  %1264 = bitcast i8* %1263 to i32*, !dbg !1913
  %1265 = load i32, i32* %1264, align 4, !dbg !1913, !tbaa !1914
  %1266 = lshr i32 %1265, 3, !dbg !1915
  %1267 = trunc i32 %1266 to i16, !dbg !1916
  call void @llvm.dbg.value(metadata i16 %1267, metadata !1779, metadata !DIExpression()) #6, !dbg !1784
  %1268 = trunc i32 %1265 to i16, !dbg !1917
  %1269 = and i16 %1268, 7, !dbg !1917
  call void @llvm.dbg.value(metadata i16 %1269, metadata !1780, metadata !DIExpression()) #6, !dbg !1784
  %1270 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 8, i32 9) #6, !dbg !1918, !llvm.preserve.access.index !314
  %1271 = bitcast i32* %1270 to i8*, !dbg !1919
  call void @llvm.dbg.value(metadata i8* %1271, metadata !1781, metadata !DIExpression()) #6, !dbg !1784
  %1272 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1220, i32 9, i32 10) #6, !dbg !1920, !llvm.preserve.access.index !314
  %1273 = bitcast i32* %1272 to i8*, !dbg !1921
  call void @llvm.dbg.value(metadata i8* %1273, metadata !1782, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i8* %1255, metadata !1783, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i8* %1271, metadata !1922, metadata !DIExpression()) #6, !dbg !1941
  call void @llvm.dbg.value(metadata %struct.in6_addr* %1180, metadata !1927, metadata !DIExpression()) #6, !dbg !1941
  call void @llvm.dbg.value(metadata i16 %1262, metadata !1930, metadata !DIExpression()) #6, !dbg !1941
  call void @llvm.dbg.value(metadata i64 %1207, metadata !1931, metadata !DIExpression()) #6, !dbg !1941
  call void @llvm.dbg.value(metadata i16 %1260, metadata !1929, metadata !DIExpression()) #6, !dbg !1941
  call void @llvm.dbg.value(metadata i16 4, metadata !1928, metadata !DIExpression()) #6, !dbg !1941
  %1274 = and i32 %1259, 65535, !dbg !1943
  %1275 = zext i32 %1274 to i64, !dbg !1943
  %1276 = icmp ugt i16 %1260, 11
  br i1 %1276, label %1320, label %1277, !dbg !1945

1277:                                             ; preds = %1237
  %1278 = icmp eq i16 %1262, 0, !dbg !1946
  br i1 %1278, label %1282, label %1279, !dbg !1947

1279:                                             ; preds = %1277
  call void @llvm.dbg.value(metadata i16 0, metadata !1932, metadata !DIExpression()) #6, !dbg !1948
  %1280 = getelementptr inbounds i8, i8* %1177, i64 %1275, !dbg !1949
  %1281 = sub nuw nsw i16 8, %1262, !dbg !1949
  br label %1293, !dbg !1950

1282:                                             ; preds = %1277
  %1283 = getelementptr i32, i32* %1270, i64 1, !dbg !1951
  %1284 = bitcast i32* %1283 to i8*, !dbg !1951
  %1285 = icmp ugt i8* %1284, %1221, !dbg !1954
  br i1 %1285, label %1320, label %1286, !dbg !1955

1286:                                             ; preds = %1282
  %1287 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* nonnull %1180, i32 0, i32 0) #6, !dbg !1956, !llvm.preserve.access.index !72
  %1288 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %1287, i32 0) #6, !dbg !1957, !llvm.preserve.access.index !75
  %1289 = bitcast %union.anon* %1288 to [16 x i8]*, !dbg !1957
  %1290 = getelementptr inbounds [16 x i8], [16 x i8]* %1289, i64 0, i64 %1275, !dbg !1958
  %1291 = bitcast i8* %1290 to i32*, !dbg !1959
  %1292 = load i32, i32* %1291, align 1, !dbg !1959
  store i32 %1292, i32* %1270, align 1, !dbg !1959
  br label %1320, !dbg !1960

1293:                                             ; preds = %1305, %1279
  %1294 = phi i64 [ 0, %1279 ], [ %1318, %1305 ]
  call void @llvm.dbg.value(metadata i64 %1294, metadata !1932, metadata !DIExpression()) #6, !dbg !1948
  %1295 = getelementptr inbounds i8, i8* %1271, i64 %1294, !dbg !1961
  call void @llvm.dbg.value(metadata i8* %1295, metadata !1936, metadata !DIExpression()) #6, !dbg !1949
  %1296 = getelementptr i8, i8* %1295, i64 1, !dbg !1962
  call void @llvm.dbg.value(metadata i8* %1296, metadata !1939, metadata !DIExpression()) #6, !dbg !1949
  %1297 = getelementptr inbounds i8, i8* %1280, i64 %1294, !dbg !1963
  call void @llvm.dbg.value(metadata i8* %1297, metadata !1940, metadata !DIExpression()) #6, !dbg !1949
  %1298 = icmp ugt i8* %1296, %1221, !dbg !1964
  %1299 = getelementptr inbounds i8, i8* %1296, i64 1
  %1300 = icmp ugt i8* %1299, %1221
  %1301 = or i1 %1298, %1300, !dbg !1966
  %1302 = add nuw nsw i64 %1294, %1275
  %1303 = icmp ugt i64 %1302, 14
  %1304 = or i1 %1303, %1301, !dbg !1966
  br i1 %1304, label %1320, label %1305, !dbg !1966

1305:                                             ; preds = %1293
  %1306 = load i8, i8* %1297, align 1, !dbg !1967, !tbaa !674
  %1307 = zext i8 %1306 to i16, !dbg !1967
  %1308 = lshr i16 %1307, %1262, !dbg !1968
  %1309 = load i8, i8* %1295, align 1, !dbg !1969, !tbaa !674
  %1310 = trunc i16 %1308 to i8, !dbg !1969
  %1311 = or i8 %1309, %1310, !dbg !1969
  store i8 %1311, i8* %1295, align 1, !dbg !1969, !tbaa !674
  %1312 = load i8, i8* %1297, align 1, !dbg !1970, !tbaa !674
  %1313 = zext i8 %1312 to i16, !dbg !1970
  %1314 = shl i16 %1313, %1281, !dbg !1971
  %1315 = load i8, i8* %1296, align 1, !dbg !1972, !tbaa !674
  %1316 = trunc i16 %1314 to i8, !dbg !1972
  %1317 = or i8 %1315, %1316, !dbg !1972
  store i8 %1317, i8* %1296, align 1, !dbg !1972, !tbaa !674
  %1318 = add nuw nsw i64 %1294, 1, !dbg !1973
  call void @llvm.dbg.value(metadata i64 %1318, metadata !1932, metadata !DIExpression()) #6, !dbg !1948
  %1319 = icmp eq i64 %1318, 4, !dbg !1974
  br i1 %1319, label %1320, label %1293, !dbg !1950, !llvm.loop !1976

1320:                                             ; preds = %1305, %1293, %1286, %1282, %1237
  call void @llvm.dbg.value(metadata i8* %1273, metadata !1922, metadata !DIExpression()) #6, !dbg !1979
  call void @llvm.dbg.value(metadata %struct.in6_addr* %1184, metadata !1927, metadata !DIExpression()) #6, !dbg !1979
  call void @llvm.dbg.value(metadata i16 %1269, metadata !1930, metadata !DIExpression()) #6, !dbg !1979
  call void @llvm.dbg.value(metadata i64 %1207, metadata !1931, metadata !DIExpression()) #6, !dbg !1979
  call void @llvm.dbg.value(metadata i16 %1267, metadata !1929, metadata !DIExpression()) #6, !dbg !1979
  call void @llvm.dbg.value(metadata i16 4, metadata !1928, metadata !DIExpression()) #6, !dbg !1979
  %1321 = and i32 %1266, 65535, !dbg !1981
  %1322 = zext i32 %1321 to i64, !dbg !1981
  %1323 = icmp ugt i16 %1267, 11
  br i1 %1323, label %1367, label %1324, !dbg !1982

1324:                                             ; preds = %1320
  %1325 = icmp eq i16 %1269, 0, !dbg !1983
  br i1 %1325, label %1329, label %1326, !dbg !1984

1326:                                             ; preds = %1324
  call void @llvm.dbg.value(metadata i16 0, metadata !1932, metadata !DIExpression()) #6, !dbg !1985
  %1327 = getelementptr inbounds i8, i8* %1183, i64 %1322, !dbg !1986
  %1328 = sub nuw nsw i16 8, %1269, !dbg !1986
  br label %1340, !dbg !1987

1329:                                             ; preds = %1324
  %1330 = getelementptr i32, i32* %1272, i64 1, !dbg !1988
  %1331 = bitcast i32* %1330 to i8*, !dbg !1988
  %1332 = icmp ugt i8* %1331, %1221, !dbg !1989
  br i1 %1332, label %1367, label %1333, !dbg !1990

1333:                                             ; preds = %1329
  %1334 = call %union.anon* @llvm.preserve.struct.access.index.p0s_union.anons.p0s_struct.in6_addrs(%struct.in6_addr* nonnull %1184, i32 0, i32 0) #6, !dbg !1991, !llvm.preserve.access.index !72
  %1335 = call %union.anon* @llvm.preserve.union.access.index.p0s_union.anons.p0s_union.anons(%union.anon* %1334, i32 0) #6, !dbg !1992, !llvm.preserve.access.index !75
  %1336 = bitcast %union.anon* %1335 to [16 x i8]*, !dbg !1992
  %1337 = getelementptr inbounds [16 x i8], [16 x i8]* %1336, i64 0, i64 %1322, !dbg !1993
  %1338 = bitcast i8* %1337 to i32*, !dbg !1994
  %1339 = load i32, i32* %1338, align 1, !dbg !1994
  store i32 %1339, i32* %1272, align 1, !dbg !1994
  br label %1367, !dbg !1995

1340:                                             ; preds = %1352, %1326
  %1341 = phi i64 [ 0, %1326 ], [ %1365, %1352 ]
  call void @llvm.dbg.value(metadata i64 %1341, metadata !1932, metadata !DIExpression()) #6, !dbg !1985
  %1342 = getelementptr inbounds i8, i8* %1273, i64 %1341, !dbg !1996
  call void @llvm.dbg.value(metadata i8* %1342, metadata !1936, metadata !DIExpression()) #6, !dbg !1986
  %1343 = getelementptr i8, i8* %1342, i64 1, !dbg !1997
  call void @llvm.dbg.value(metadata i8* %1343, metadata !1939, metadata !DIExpression()) #6, !dbg !1986
  %1344 = getelementptr inbounds i8, i8* %1327, i64 %1341, !dbg !1998
  call void @llvm.dbg.value(metadata i8* %1344, metadata !1940, metadata !DIExpression()) #6, !dbg !1986
  %1345 = icmp ugt i8* %1343, %1221, !dbg !1999
  %1346 = getelementptr inbounds i8, i8* %1343, i64 1
  %1347 = icmp ugt i8* %1346, %1221
  %1348 = or i1 %1345, %1347, !dbg !2000
  %1349 = add nuw nsw i64 %1341, %1322
  %1350 = icmp ugt i64 %1349, 14
  %1351 = or i1 %1350, %1348, !dbg !2000
  br i1 %1351, label %1367, label %1352, !dbg !2000

1352:                                             ; preds = %1340
  %1353 = load i8, i8* %1344, align 1, !dbg !2001, !tbaa !674
  %1354 = zext i8 %1353 to i16, !dbg !2001
  %1355 = lshr i16 %1354, %1269, !dbg !2002
  %1356 = load i8, i8* %1342, align 1, !dbg !2003, !tbaa !674
  %1357 = trunc i16 %1355 to i8, !dbg !2003
  %1358 = or i8 %1356, %1357, !dbg !2003
  store i8 %1358, i8* %1342, align 1, !dbg !2003, !tbaa !674
  %1359 = load i8, i8* %1344, align 1, !dbg !2004, !tbaa !674
  %1360 = zext i8 %1359 to i16, !dbg !2004
  %1361 = shl i16 %1360, %1328, !dbg !2005
  %1362 = load i8, i8* %1343, align 1, !dbg !2006, !tbaa !674
  %1363 = trunc i16 %1361 to i8, !dbg !2006
  %1364 = or i8 %1362, %1363, !dbg !2006
  store i8 %1364, i8* %1343, align 1, !dbg !2006, !tbaa !674
  %1365 = add nuw nsw i64 %1341, 1, !dbg !2007
  call void @llvm.dbg.value(metadata i64 %1365, metadata !1932, metadata !DIExpression()) #6, !dbg !1985
  %1366 = icmp eq i64 %1365, 4, !dbg !2008
  br i1 %1366, label %1367, label %1340, !dbg !1987, !llvm.loop !2009

1367:                                             ; preds = %1352, %1340, %1333, %1329, %1320
  %1368 = add i16 %1267, 4, !dbg !2012
  call void @llvm.dbg.value(metadata i16 %1368, metadata !1779, metadata !DIExpression()) #6, !dbg !1784
  call void @llvm.dbg.value(metadata i8* %1255, metadata !2013, metadata !DIExpression()) #6, !dbg !2038
  call void @llvm.dbg.value(metadata %struct.in6_addr* %1184, metadata !2018, metadata !DIExpression()) #6, !dbg !2038
  call void @llvm.dbg.value(metadata i16 %1269, metadata !2021, metadata !DIExpression()) #6, !dbg !2038
  call void @llvm.dbg.value(metadata i16 %1368, metadata !2020, metadata !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2038
  call void @llvm.dbg.value(metadata i16 5, metadata !2019, metadata !DIExpression()) #6, !dbg !2038
  %1369 = and i16 %1368, 15, !dbg !2040
  call void @llvm.dbg.value(metadata i16 %1369, metadata !2020, metadata !DIExpression()) #6, !dbg !2038
  %1370 = icmp ugt i16 %1369, 10, !dbg !2041
  br i1 %1370, label %1411, label %1371, !dbg !2043

1371:                                             ; preds = %1367
  %1372 = zext i16 %1269 to i32, !dbg !2044
  %1373 = icmp eq i16 %1269, 0, !dbg !2045
  %1374 = zext i16 %1369 to i64
  %1375 = getelementptr inbounds i8, i8* %1183, i64 %1374, !dbg !2046
  br i1 %1373, label %1376, label %1379, !dbg !2047

1376:                                             ; preds = %1371
  %1377 = xor i16 %1369, 15, !dbg !2048
  %1378 = zext i16 %1377 to i64, !dbg !2049
  br label %1383, !dbg !2048

1379:                                             ; preds = %1371
  call void @llvm.dbg.value(metadata i16 0, metadata !2030, metadata !DIExpression()) #6, !dbg !2051
  %1380 = sub nuw nsw i32 8, %1372, !dbg !2052
  %1381 = xor i16 %1369, 15, !dbg !2053
  %1382 = zext i16 %1381 to i64, !dbg !2055
  br label %1392, !dbg !2053

1383:                                             ; preds = %1386, %1376
  %1384 = phi i64 [ 0, %1376 ], [ %1390, %1386 ]
  call void @llvm.dbg.value(metadata i64 %1384, metadata !2022, metadata !DIExpression()) #6, !dbg !2057
  call void @llvm.dbg.value(metadata i8* undef, metadata !2026, metadata !DIExpression()) #6, !dbg !2058
  call void @llvm.dbg.value(metadata i8* undef, metadata !2029, metadata !DIExpression()) #6, !dbg !2058
  %1385 = icmp eq i64 %1384, %1378, !dbg !2049
  br i1 %1385, label %1411, label %1386, !dbg !2059

1386:                                             ; preds = %1383
  %1387 = getelementptr inbounds i8, i8* %1375, i64 %1384, !dbg !2060
  call void @llvm.dbg.value(metadata i8* %1387, metadata !2029, metadata !DIExpression()) #6, !dbg !2058
  %1388 = getelementptr inbounds i8, i8* %1255, i64 %1384, !dbg !2061
  call void @llvm.dbg.value(metadata i8* %1388, metadata !2026, metadata !DIExpression()) #6, !dbg !2058
  %1389 = load i8, i8* %1387, align 1, !dbg !2062, !tbaa !674
  store i8 %1389, i8* %1388, align 1, !dbg !2063, !tbaa !674
  %1390 = add nuw nsw i64 %1384, 1, !dbg !2064
  call void @llvm.dbg.value(metadata i64 %1390, metadata !2022, metadata !DIExpression()) #6, !dbg !2057
  %1391 = icmp eq i64 %1390, 5, !dbg !2065
  br i1 %1391, label %1411, label %1383, !dbg !2067, !llvm.loop !2068

1392:                                             ; preds = %1397, %1379
  %1393 = phi i64 [ 0, %1379 ], [ %1409, %1397 ]
  call void @llvm.dbg.value(metadata i64 %1393, metadata !2030, metadata !DIExpression()) #6, !dbg !2051
  %1394 = getelementptr inbounds i8, i8* %1255, i64 %1393, !dbg !2070
  call void @llvm.dbg.value(metadata i8* %1394, metadata !2033, metadata !DIExpression()) #6, !dbg !2052
  %1395 = getelementptr inbounds i8, i8* %1394, i64 1, !dbg !2071
  call void @llvm.dbg.value(metadata i8* %1395, metadata !2036, metadata !DIExpression()) #6, !dbg !2052
  call void @llvm.dbg.value(metadata i8* undef, metadata !2037, metadata !DIExpression()) #6, !dbg !2052
  %1396 = icmp eq i64 %1393, %1382, !dbg !2055
  br i1 %1396, label %1411, label %1397, !dbg !2072

1397:                                             ; preds = %1392
  %1398 = getelementptr inbounds i8, i8* %1375, i64 %1393, !dbg !2073
  call void @llvm.dbg.value(metadata i8* %1398, metadata !2037, metadata !DIExpression()) #6, !dbg !2052
  %1399 = load i8, i8* %1398, align 1, !dbg !2074, !tbaa !674
  %1400 = zext i8 %1399 to i32, !dbg !2074
  %1401 = lshr i32 %1400, %1372, !dbg !2075
  %1402 = load i8, i8* %1394, align 1, !dbg !2076, !tbaa !674
  %1403 = trunc i32 %1401 to i8, !dbg !2076
  %1404 = or i8 %1402, %1403, !dbg !2076
  store i8 %1404, i8* %1394, align 1, !dbg !2076, !tbaa !674
  %1405 = shl i32 %1400, %1380, !dbg !2077
  %1406 = load i8, i8* %1395, align 1, !dbg !2078, !tbaa !674
  %1407 = trunc i32 %1405 to i8, !dbg !2078
  %1408 = or i8 %1406, %1407, !dbg !2078
  store i8 %1408, i8* %1395, align 1, !dbg !2078, !tbaa !674
  %1409 = add nuw nsw i64 %1393, 1, !dbg !2079
  call void @llvm.dbg.value(metadata i64 %1409, metadata !2030, metadata !DIExpression()) #6, !dbg !2051
  %1410 = icmp eq i64 %1409, 4
  br i1 %1410, label %1411, label %1392, !dbg !2053, !llvm.loop !2080

1411:                                             ; preds = %1397, %1392, %1386, %1383, %1367
  %1412 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %1225, i32 3, i32 3) #6, !dbg !2083, !llvm.preserve.access.index !1769
  store i16 0, i16* %1412, align 2, !dbg !2084, !tbaa !2085
  %1413 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %1225, i32 0, i32 0) #6, !dbg !2087, !llvm.preserve.access.index !1769
  store i16 26632, i16* %1413, align 2, !dbg !2088, !tbaa !2089
  %1414 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %1225, i32 1, i32 1) #6, !dbg !2090, !llvm.preserve.access.index !1769
  store i16 26632, i16* %1414, align 2, !dbg !2091, !tbaa !2092
  %1415 = add i16 %1196, 16, !dbg !2093
  %1416 = call i16 @llvm.bswap.i16(i16 %1415) #6, !dbg !2093
  %1417 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.udphdrs(%struct.udphdr* nonnull %1225, i32 2, i32 2) #6, !dbg !2094, !llvm.preserve.access.index !1769
  store i16 %1416, i16* %1417, align 2, !dbg !2095, !tbaa !2096
  %1418 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %1229, i64 0, i32 0, !dbg !2097
  store i8 48, i8* %1418, align 4, !dbg !2098, !tbaa !2099
  %1419 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %1229, i64 0, i32 1, !dbg !2100
  store i8 -1, i8* %1419, align 1, !dbg !2101, !tbaa !888
  %1420 = call i16 @llvm.bswap.i16(i16 %1196) #6
  %1421 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %1229, i64 0, i32 2, !dbg !2102
  store i16 %1420, i16* %1421, align 2, !dbg !2103, !tbaa !890
  %1422 = getelementptr inbounds %struct.args_mob_session, %struct.args_mob_session* %7, i64 0, i32 1, i32 0, !dbg !2104
  %1423 = load i32, i32* %1422, align 1, !dbg !2104, !tbaa !674
  %1424 = getelementptr inbounds %struct.gtp1hdr, %struct.gtp1hdr* %1229, i64 0, i32 3, !dbg !2105
  store i32 %1423, i32* %1424, align 4, !dbg !2106, !tbaa !885
  call void @llvm.dbg.value(metadata %struct.iphdr* %1220, metadata !1600, metadata !DIExpression()) #6, !dbg !2107
  call void @llvm.dbg.value(metadata i32 0, metadata !1606, metadata !DIExpression()) #6, !dbg !2107
  store i16 0, i16* %1250, align 2, !dbg !2109, !tbaa !750
  %1425 = bitcast %struct.iphdr* %1220 to i16*, !dbg !2110
  call void @llvm.dbg.value(metadata i16* %1425, metadata !1605, metadata !DIExpression()) #6, !dbg !2107
  call void @llvm.dbg.value(metadata i32 0, metadata !1607, metadata !DIExpression()) #6, !dbg !2107
  br label %1426, !dbg !2111

1426:                                             ; preds = %1426, %1411
  %1427 = phi i32 [ 0, %1411 ], [ %1434, %1426 ]
  %1428 = phi i32 [ 0, %1411 ], [ %1433, %1426 ]
  %1429 = phi i16* [ %1425, %1411 ], [ %1430, %1426 ]
  call void @llvm.dbg.value(metadata i32 %1427, metadata !1607, metadata !DIExpression()) #6, !dbg !2107
  call void @llvm.dbg.value(metadata i32 %1428, metadata !1606, metadata !DIExpression()) #6, !dbg !2107
  call void @llvm.dbg.value(metadata i16* %1429, metadata !1605, metadata !DIExpression()) #6, !dbg !2107
  %1430 = getelementptr inbounds i16, i16* %1429, i64 1, !dbg !2112
  call void @llvm.dbg.value(metadata i16* %1430, metadata !1605, metadata !DIExpression()) #6, !dbg !2107
  %1431 = load i16, i16* %1429, align 2, !dbg !2113, !tbaa !1618
  %1432 = zext i16 %1431 to i32, !dbg !2113
  %1433 = add i32 %1428, %1432, !dbg !2114
  call void @llvm.dbg.value(metadata i32 %1433, metadata !1606, metadata !DIExpression()) #6, !dbg !2107
  %1434 = add nuw nsw i32 %1427, 1, !dbg !2115
  call void @llvm.dbg.value(metadata i32 %1434, metadata !1607, metadata !DIExpression()) #6, !dbg !2107
  %1435 = icmp eq i32 %1434, 10, !dbg !2116
  br i1 %1435, label %1436, label %1426, !dbg !2111, !llvm.loop !2117

1436:                                             ; preds = %1426
  call void @llvm.dbg.value(metadata i32 %1433, metadata !1606, metadata !DIExpression()) #6, !dbg !2107
  %1437 = lshr i32 %1433, 16, !dbg !2119
  %1438 = add i32 %1437, %1433, !dbg !2120
  %1439 = trunc i32 %1438 to i16, !dbg !2121
  %1440 = xor i16 %1439, -1, !dbg !2121
  store i16 %1440, i16* %1250, align 2, !dbg !2122, !tbaa !750
  store i16 0, i16* %1412, align 2, !dbg !2123, !tbaa !2085
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !585, metadata !DIExpression()) #6, !dbg !2124
  call void @llvm.dbg.value(metadata i32 0, metadata !590, metadata !DIExpression()) #6, !dbg !2124
  %1441 = getelementptr inbounds [6 x i8], [6 x i8]* %20, i64 0, i64 0
  %1442 = getelementptr inbounds [6 x i8], [6 x i8]* %19, i64 0, i64 0
  %1443 = load i32, i32* %23, align 4, !dbg !2126, !tbaa !347
  %1444 = zext i32 %1443 to i64, !dbg !2127
  %1445 = inttoptr i64 %1444 to i8*, !dbg !2128
  call void @llvm.dbg.value(metadata i8* %1445, metadata !591, metadata !DIExpression()) #6, !dbg !2124
  %1446 = load i32, i32* %27, align 4, !dbg !2129, !tbaa !355
  %1447 = zext i32 %1446 to i64, !dbg !2130
  %1448 = inttoptr i64 %1447 to i8*, !dbg !2131
  call void @llvm.dbg.value(metadata i8* %1448, metadata !592, metadata !DIExpression()) #6, !dbg !2124
  %1449 = getelementptr i8, i8* %1445, i64 1, !dbg !2132
  %1450 = icmp ugt i8* %1449, %1448, !dbg !2133
  br i1 %1450, label %1577, label %1451, !dbg !2134

1451:                                             ; preds = %1436
  %1452 = bitcast i32* %5 to i8*, !dbg !2135
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1452) #6, !dbg !2135
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %1442), !dbg !2136
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !594, metadata !DIExpression()) #6, !dbg !2137
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %1441), !dbg !2136
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !595, metadata !DIExpression()) #6, !dbg !2138
  call void @llvm.dbg.value(metadata i32* %5, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !2124
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !616, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i8* %1442, metadata !622, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i8* %1441, metadata !623, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i32* %5, metadata !624, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i32 0, metadata !625, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i8* %1445, metadata !626, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i8* %1448, metadata !627, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata i8* %1445, metadata !628, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i8* %1445, metadata !364, metadata !DIExpression()) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i64 %1447, metadata !365, metadata !DIExpression()) #6, !dbg !2141
  call void @llvm.dbg.value(metadata i8* %1445, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !2141
  %1453 = getelementptr i8, i8* %1445, i64 34, !dbg !2143
  %1454 = bitcast i8* %1453 to %struct.iphdr*, !dbg !2143
  %1455 = inttoptr i64 %1447 to %struct.iphdr*, !dbg !2144
  %1456 = icmp ugt %struct.iphdr* %1454, %1455, !dbg !2145
  %1457 = getelementptr i8, i8* %1445, i64 14, !dbg !2146
  %1458 = bitcast i8* %1457 to %struct.iphdr*, !dbg !2146
  %1459 = select i1 %1456, %struct.iphdr* null, %struct.iphdr* %1458, !dbg !2146
  call void @llvm.dbg.value(metadata %struct.iphdr* %1459, metadata !629, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !2147
  call void @llvm.dbg.value(metadata i8* %1445, metadata !379, metadata !DIExpression()) #6, !dbg !2147
  call void @llvm.dbg.value(metadata i64 %1447, metadata !380, metadata !DIExpression()) #6, !dbg !2147
  call void @llvm.dbg.value(metadata i8* %1445, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !2147
  %1460 = getelementptr i8, i8* %1445, i64 54, !dbg !2149
  %1461 = bitcast i8* %1460 to %struct.ipv6hdr*, !dbg !2149
  %1462 = inttoptr i64 %1447 to %struct.ipv6hdr*, !dbg !2150
  %1463 = icmp ugt %struct.ipv6hdr* %1461, %1462, !dbg !2151
  %1464 = bitcast i8* %1457 to %struct.ipv6hdr*, !dbg !2152
  %1465 = select i1 %1463, %struct.ipv6hdr* null, %struct.ipv6hdr* %1464, !dbg !2152
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1465, metadata !630, metadata !DIExpression()) #6, !dbg !2139
  %1466 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %4, i64 0, i32 0, !dbg !2153
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1466) #6, !dbg !2153
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %4, metadata !631, metadata !DIExpression()) #6, !dbg !2154
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %1466, i8 0, i64 64, i1 false) #6, !dbg !2154
  %1467 = icmp ugt i8* %1457, %1448, !dbg !2155
  br i1 %1467, label %1558, label %1468, !dbg !2156

1468:                                             ; preds = %1451
  %1469 = inttoptr i64 %1444 to %struct.ethhdr*, !dbg !2157
  call void @llvm.dbg.value(metadata %struct.ethhdr* %1469, metadata !628, metadata !DIExpression()) #6, !dbg !2139
  %1470 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %1469, i32 2, i32 2) #6, !dbg !2158, !llvm.preserve.access.index !306
  %1471 = load i16, i16* %1470, align 2, !dbg !2158, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %1471, metadata !632, metadata !DIExpression()) #6, !dbg !2139
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %1466, i8 0, i64 64, i1 false) #6, !dbg !2159
  switch i16 %1471, label %1558 [
    i16 8, label %1472
    i16 -8826, label %1500
  ], !dbg !2160

1472:                                             ; preds = %1468
  %1473 = icmp eq %struct.iphdr* %1459, null, !dbg !2161
  br i1 %1473, label %1558, label %1474, !dbg !2162

1474:                                             ; preds = %1472
  %1475 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 0, i32 0) #6, !dbg !2163, !llvm.preserve.access.index !99
  store i8 2, i8* %1475, align 4, !dbg !2164, !tbaa !668
  %1476 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1459, i32 1, i32 2) #6, !dbg !2165, !llvm.preserve.access.index !314
  %1477 = load i8, i8* %1476, align 1, !dbg !2165, !tbaa !671
  %1478 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 6, i32 6) #6, !dbg !2166, !llvm.preserve.access.index !99
  %1479 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1478, i32 0) #6, !dbg !2166, !llvm.preserve.access.index !98
  %1480 = bitcast %union.anon.5* %1479 to i8*, !dbg !2166
  store i8 %1477, i8* %1480, align 4, !dbg !2167, !tbaa !674
  %1481 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1459, i32 6, i32 7) #6, !dbg !2168, !llvm.preserve.access.index !314
  %1482 = load i8, i8* %1481, align 1, !dbg !2168, !tbaa !676
  %1483 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 1, i32 1) #6, !dbg !2169, !llvm.preserve.access.index !99
  store i8 %1482, i8* %1483, align 1, !dbg !2170, !tbaa !679
  %1484 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 2, i32 2) #6, !dbg !2171, !llvm.preserve.access.index !99
  store i16 0, i16* %1484, align 2, !dbg !2172, !tbaa !682
  %1485 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 3, i32 3) #6, !dbg !2173, !llvm.preserve.access.index !99
  store i16 0, i16* %1485, align 4, !dbg !2174, !tbaa !685
  %1486 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1459, i32 2, i32 3) #6, !dbg !2175, !llvm.preserve.access.index !314
  %1487 = load i16, i16* %1486, align 2, !dbg !2175, !tbaa !445
  %1488 = call i16 @llvm.bswap.i16(i16 %1487) #6
  %1489 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 4, i32 4) #6, !dbg !2176, !llvm.preserve.access.index !99
  store i16 %1488, i16* %1489, align 2, !dbg !2177, !tbaa !689
  %1490 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1459, i32 8, i32 9) #6, !dbg !2178, !llvm.preserve.access.index !314
  %1491 = load i32, i32* %1490, align 4, !dbg !2178, !tbaa !691
  %1492 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 7, i32 7) #6, !dbg !2179, !llvm.preserve.access.index !99
  %1493 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %1492, i32 0) #6, !dbg !2179, !llvm.preserve.access.index !109
  %1494 = getelementptr %union.anon.6, %union.anon.6* %1493, i64 0, i32 0, i64 0, !dbg !2179
  store i32 %1491, i32* %1494, align 4, !dbg !2180, !tbaa !674
  %1495 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1459, i32 9, i32 10) #6, !dbg !2181, !llvm.preserve.access.index !314
  %1496 = load i32, i32* %1495, align 4, !dbg !2181, !tbaa !428
  %1497 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 8, i32 8) #6, !dbg !2182, !llvm.preserve.access.index !99
  %1498 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %1497, i32 0) #6, !dbg !2182, !llvm.preserve.access.index !115
  %1499 = getelementptr %union.anon.7, %union.anon.7* %1498, i64 0, i32 0, i64 0, !dbg !2182
  store i32 %1496, i32* %1499, align 4, !dbg !2183, !tbaa !674
  br label %1535, !dbg !2184

1500:                                             ; preds = %1468
  %1501 = icmp eq %struct.ipv6hdr* %1465, null, !dbg !2185
  br i1 %1501, label %1558, label %1502, !dbg !2186

1502:                                             ; preds = %1500
  %1503 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1465, i32 4, i32 5) #6, !dbg !2187, !llvm.preserve.access.index !329
  %1504 = load i8, i8* %1503, align 1, !dbg !2187, !tbaa !530
  %1505 = icmp ult i8 %1504, 2, !dbg !2188
  br i1 %1505, label %1558, label %1506, !dbg !2189

1506:                                             ; preds = %1502
  %1507 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 7, i32 7) #6, !dbg !2190, !llvm.preserve.access.index !99
  %1508 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %1507, i32 1) #6, !dbg !2190, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %1508, metadata !633, metadata !DIExpression()) #6, !dbg !2191
  %1509 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 8, i32 8) #6, !dbg !2192, !llvm.preserve.access.index !99
  %1510 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %1509, i32 1) #6, !dbg !2192, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %1510, metadata !635, metadata !DIExpression()) #6, !dbg !2191
  %1511 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 0, i32 0) #6, !dbg !2193, !llvm.preserve.access.index !99
  store i8 10, i8* %1511, align 4, !dbg !2194, !tbaa !668
  %1512 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 6, i32 6) #6, !dbg !2195, !llvm.preserve.access.index !99
  %1513 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1512, i32 0) #6, !dbg !2195, !llvm.preserve.access.index !98
  %1514 = bitcast %union.anon.5* %1513 to i8*, !dbg !2195
  store i8 0, i8* %1514, align 4, !dbg !2196, !tbaa !674
  %1515 = bitcast %struct.ipv6hdr* %1465 to i32*, !dbg !2197
  %1516 = load i32, i32* %1515, align 4, !dbg !2197, !tbaa !713
  %1517 = and i32 %1516, -241, !dbg !2198
  %1518 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1512, i32 1) #6, !dbg !2199, !llvm.preserve.access.index !98
  %1519 = getelementptr %union.anon.5, %union.anon.5* %1518, i64 0, i32 0, !dbg !2199
  store i32 %1517, i32* %1519, align 4, !dbg !2200, !tbaa !674
  %1520 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1465, i32 3, i32 4) #6, !dbg !2201, !llvm.preserve.access.index !329
  %1521 = load i8, i8* %1520, align 2, !dbg !2201, !tbaa !526
  %1522 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 1, i32 1) #6, !dbg !2202, !llvm.preserve.access.index !99
  store i8 %1521, i8* %1522, align 1, !dbg !2203, !tbaa !679
  %1523 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 2, i32 2) #6, !dbg !2204, !llvm.preserve.access.index !99
  store i16 0, i16* %1523, align 2, !dbg !2205, !tbaa !682
  %1524 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 3, i32 3) #6, !dbg !2206, !llvm.preserve.access.index !99
  store i16 0, i16* %1524, align 4, !dbg !2207, !tbaa !685
  %1525 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1465, i32 2, i32 3) #6, !dbg !2208, !llvm.preserve.access.index !329
  %1526 = load i16, i16* %1525, align 4, !dbg !2208, !tbaa !533
  %1527 = call i16 @llvm.bswap.i16(i16 %1526) #6
  %1528 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 4, i32 4) #6, !dbg !2209, !llvm.preserve.access.index !99
  store i16 %1527, i16* %1528, align 2, !dbg !2210, !tbaa !689
  %1529 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1465, i32 5, i32 6) #6, !dbg !2211, !llvm.preserve.access.index !329
  %1530 = bitcast %union.anon.6* %1508 to i8*, !dbg !2211
  %1531 = bitcast %struct.in6_addr* %1529 to i8*, !dbg !2211
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1530, i8* nonnull align 4 dereferenceable(16) %1531, i64 16, i1 false) #6, !dbg !2211, !tbaa.struct !728
  %1532 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1465, i32 6, i32 7) #6, !dbg !2212, !llvm.preserve.access.index !329
  %1533 = bitcast %union.anon.7* %1510 to i8*, !dbg !2212
  %1534 = bitcast %struct.in6_addr* %1532 to i8*, !dbg !2212
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1533, i8* nonnull align 4 dereferenceable(16) %1534, i64 16, i1 false) #6, !dbg !2212, !tbaa.struct !728
  br label %1535, !dbg !2213

1535:                                             ; preds = %1506, %1474
  %1536 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #6, !dbg !2214, !llvm.preserve.access.index !62
  %1537 = load i32, i32* %1536, align 4, !dbg !2214, !tbaa !732
  %1538 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 5, i32 5) #6, !dbg !2215, !llvm.preserve.access.index !99
  store i32 %1537, i32* %1538, align 4, !dbg !2216, !tbaa !735
  %1539 = bitcast %struct.xdp_md* %0 to i8*, !dbg !2217
  %1540 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %1539, %struct.bpf_fib_lookup* nonnull %4, i32 64, i32 0) #6, !dbg !2218
  %1541 = trunc i64 %1540 to i32, !dbg !2218
  call void @llvm.dbg.value(metadata i32 %1541, metadata !636, metadata !DIExpression()) #6, !dbg !2139
  %1542 = icmp eq i32 %1541, 0, !dbg !2219
  br i1 %1542, label %1543, label %1558, !dbg !2219

1543:                                             ; preds = %1535
  switch i16 %1471, label %1559 [
    i16 8, label %1544
    i16 -8826, label %1554
  ], !dbg !2220

1544:                                             ; preds = %1543
  call void @llvm.dbg.value(metadata %struct.iphdr* %1459, metadata !740, metadata !DIExpression()) #6, !dbg !2221
  %1545 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* %1459, i32 7, i32 8) #6, !dbg !2223, !llvm.preserve.access.index !314
  %1546 = load i16, i16* %1545, align 2, !dbg !2223, !tbaa !750
  call void @llvm.dbg.value(metadata i16 %1546, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2221
  %1547 = add i16 %1546, 1, !dbg !2224
  call void @llvm.dbg.value(metadata i16 %1546, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !2221
  %1548 = icmp ugt i16 %1546, -3, !dbg !2225
  %1549 = zext i1 %1548 to i16, !dbg !2225
  %1550 = add i16 %1547, %1549, !dbg !2226
  store i16 %1550, i16* %1545, align 2, !dbg !2227, !tbaa !750
  %1551 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %1459, i32 5, i32 6) #6, !dbg !2228, !llvm.preserve.access.index !314
  %1552 = load i8, i8* %1551, align 4, !dbg !2229, !tbaa !757
  %1553 = add i8 %1552, -1, !dbg !2229
  store i8 %1553, i8* %1551, align 4, !dbg !2229, !tbaa !757
  br label %1559, !dbg !2230

1554:                                             ; preds = %1543
  %1555 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1465, i32 4, i32 5) #6, !dbg !2231, !llvm.preserve.access.index !329
  %1556 = load i8, i8* %1555, align 1, !dbg !2232, !tbaa !530
  %1557 = add i8 %1556, -1, !dbg !2232
  store i8 %1557, i8* %1555, align 1, !dbg !2232, !tbaa !530
  br label %1559, !dbg !2233

1558:                                             ; preds = %1535, %1502, %1500, %1472, %1468, %1451
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1466) #6, !dbg !2234
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2124
  br label %1575, !dbg !2235

1559:                                             ; preds = %1554, %1544, %1543
  %1560 = load i32, i32* %1538, align 4, !dbg !2236, !tbaa !735
  store i32 %1560, i32* %5, align 4, !dbg !2237, !tbaa !713
  call void @llvm.dbg.value(metadata i8* %1442, metadata !637, metadata !DIExpression()) #6, !dbg !2238
  call void @llvm.dbg.value(metadata i8* %1441, metadata !639, metadata !DIExpression()) #6, !dbg !2238
  %1561 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 12, i32 12) #6, !dbg !2239, !llvm.preserve.access.index !99
  %1562 = getelementptr inbounds [6 x i8], [6 x i8]* %1561, i64 0, i64 0, !dbg !2240
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %1441, i8* nonnull align 2 dereferenceable(6) %1562, i64 6, i1 false) #6, !dbg !2240
  %1563 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %4, i32 11, i32 11) #6, !dbg !2241, !llvm.preserve.access.index !99
  %1564 = getelementptr inbounds [6 x i8], [6 x i8]* %1563, i64 0, i64 0, !dbg !2242
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %1442, i8* nonnull align 4 dereferenceable(6) %1564, i64 6, i1 false) #6, !dbg !2242
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1466) #6, !dbg !2234
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2124
  call void @llvm.dbg.value(metadata i8* %1445, metadata !772, metadata !DIExpression()) #6, !dbg !2243
  call void @llvm.dbg.value(metadata i8* %1442, metadata !777, metadata !DIExpression()) #6, !dbg !2243
  call void @llvm.dbg.value(metadata i8* %1441, metadata !778, metadata !DIExpression()) #6, !dbg !2243
  call void @llvm.dbg.value(metadata i8* %1442, metadata !779, metadata !DIExpression()) #6, !dbg !2243
  call void @llvm.dbg.value(metadata i8* %1441, metadata !781, metadata !DIExpression()) #6, !dbg !2243
  call void @llvm.dbg.value(metadata i8* %1445, metadata !782, metadata !DIExpression()) #6, !dbg !2243
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %1445, i8* nonnull align 2 dereferenceable(6) %1441, i64 6, i1 false) #6, !dbg !2245
  %1565 = getelementptr inbounds i8, i8* %1445, i64 6, !dbg !2246
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %1565, i8* nonnull align 2 dereferenceable(6) %1442, i64 6, i1 false) #6, !dbg !2247
  call void @llvm.dbg.value(metadata i32* %5, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !2124
  %1566 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %1452) #6, !dbg !2248
  %1567 = icmp eq i8* %1566, null, !dbg !2248
  br i1 %1567, label %1575, label %1568, !dbg !2249

1568:                                             ; preds = %1559
  %1569 = load i32, i32* %1536, align 4, !dbg !2250, !tbaa !732
  %1570 = load i32, i32* %5, align 4, !dbg !2251, !tbaa !713
  call void @llvm.dbg.value(metadata i32 %1570, metadata !593, metadata !DIExpression()) #6, !dbg !2124
  %1571 = icmp eq i32 %1569, %1570, !dbg !2252
  br i1 %1571, label %1575, label %1572, !dbg !2253

1572:                                             ; preds = %1568
  %1573 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %1570, i64 0) #6, !dbg !2254
  %1574 = trunc i64 %1573 to i32, !dbg !2254
  br label %1575, !dbg !2255

1575:                                             ; preds = %1572, %1568, %1559, %1558
  %1576 = phi i32 [ %1574, %1572 ], [ 2, %1559 ], [ 3, %1568 ], [ 2, %1558 ], !dbg !2124
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %1441), !dbg !2256
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %1442), !dbg !2256
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1452) #6, !dbg !2256
  br label %1577

1577:                                             ; preds = %1575, %1436
  %1578 = phi i32 [ %1576, %1575 ], [ 2, %1436 ], !dbg !2124
  call void @llvm.lifetime.end.p0i8(i64 5, i8* nonnull %1255) #6, !dbg !2257
  br label %1579

1579:                                             ; preds = %1577, %1203, %1200, %1179, %1175
  %1580 = phi i32 [ 1, %1175 ], [ 2, %1179 ], [ 2, %1200 ], [ %1578, %1577 ], [ 1, %1203 ], !dbg !1784
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1176) #6, !dbg !2257
  br label %1581

1581:                                             ; preds = %1153, %1579
  %1582 = phi i32 [ %1580, %1579 ], [ 2, %1153 ], !dbg !1784
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !2258
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !2258
  call void @llvm.dbg.value(metadata i32 %1582, metadata !403, metadata !DIExpression()) #6, !dbg !2258
  %1583 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %1582) #6, !dbg !2260
  br label %1845, !dbg !2261

1584:                                             ; preds = %756
  %1585 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.2* @transit_table_v6 to i8*), i8* nonnull %45) #6, !dbg !2262
  %1586 = bitcast i8* %1585 to %struct.transit_behavior*, !dbg !2262
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %1586, metadata !341, metadata !DIExpression()), !dbg !345
  %1587 = icmp eq i8* %1585, null, !dbg !2264
  br i1 %1587, label %1843, label %1588, !dbg !2266

1588:                                             ; preds = %1584
  %1589 = getelementptr inbounds i8, i8* %1585, i64 44, !dbg !2267
  %1590 = bitcast i8* %1589 to i32*, !dbg !2267
  %1591 = load i32, i32* %1590, align 4, !dbg !2267, !tbaa !439
  %1592 = icmp eq i32 %1591, 1, !dbg !2269
  br i1 %1592, label %1593, label %1843, !dbg !2269

1593:                                             ; preds = %1588
  %1594 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %43, i32 2, i32 3), !dbg !2270, !llvm.preserve.access.index !329
  %1595 = load i16, i16* %1594, align 4, !dbg !2270, !tbaa !533
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !446, metadata !DIExpression()) #6, !dbg !2272
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %1586, metadata !451, metadata !DIExpression()) #6, !dbg !2272
  call void @llvm.dbg.value(metadata i8 41, metadata !452, metadata !DIExpression()) #6, !dbg !2272
  call void @llvm.dbg.value(metadata i16 %1595, metadata !453, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2272
  %1596 = and i16 %1595, 255, !dbg !2274
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !457, metadata !DIExpression()) #6, !dbg !2275
  call void @llvm.dbg.value(metadata %struct.transit_behavior* %1586, metadata !462, metadata !DIExpression()) #6, !dbg !2275
  call void @llvm.dbg.value(metadata i8 41, metadata !463, metadata !DIExpression()) #6, !dbg !2275
  call void @llvm.dbg.value(metadata i16 %1596, metadata !464, metadata !DIExpression()) #6, !dbg !2275
  call void @llvm.dbg.value(metadata i32 undef, metadata !465, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2275
  call void @llvm.dbg.value(metadata i32 undef, metadata !466, metadata !DIExpression(DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2275
  %1597 = getelementptr inbounds i8, i8* %1585, i64 40, !dbg !2277
  %1598 = bitcast i8* %1597 to i32*, !dbg !2277
  %1599 = load i32, i32* %1598, align 4, !dbg !2277, !tbaa !490
  %1600 = trunc i32 %1599 to i8, !dbg !2278
  %1601 = shl i8 %1600, 4, !dbg !2279
  %1602 = or i8 %1601, 8, !dbg !2280
  call void @llvm.dbg.value(metadata i8 %1602, metadata !483, metadata !DIExpression()) #6, !dbg !2275
  %1603 = zext i8 %1602 to i32, !dbg !2281
  %1604 = add nuw nsw i32 %1603, 40, !dbg !2282
  %1605 = sub nsw i32 0, %1604, !dbg !2283
  %1606 = call i64 inttoptr (i64 44 to i64 (%struct.xdp_md*, i32)*)(%struct.xdp_md* %0, i32 %1605) #6, !dbg !2284
  %1607 = icmp eq i64 %1606, 0, !dbg !2284
  br i1 %1607, label %1608, label %1840, !dbg !2285

1608:                                             ; preds = %1593
  %1609 = load i32, i32* %23, align 4, !dbg !2286, !tbaa !347
  %1610 = zext i32 %1609 to i64, !dbg !2287
  call void @llvm.dbg.value(metadata i64 %1610, metadata !465, metadata !DIExpression()) #6, !dbg !2275
  %1611 = load i32, i32* %27, align 4, !dbg !2288, !tbaa !355
  %1612 = zext i32 %1611 to i64, !dbg !2289
  %1613 = inttoptr i64 %1612 to i8*, !dbg !2290
  call void @llvm.dbg.value(metadata i8* %1613, metadata !466, metadata !DIExpression()) #6, !dbg !2275
  call void @llvm.dbg.value(metadata i64 %1610, metadata !484, metadata !DIExpression()) #6, !dbg !2275
  %1614 = add nuw nsw i64 %1610, 14, !dbg !2291
  %1615 = inttoptr i64 %1614 to i8*, !dbg !2292
  %1616 = icmp ugt i8* %1615, %1613, !dbg !2293
  br i1 %1616, label %1840, label %1617, !dbg !2294

1617:                                             ; preds = %1608
  %1618 = inttoptr i64 %1610 to %struct.ethhdr*, !dbg !2295
  call void @llvm.dbg.value(metadata %struct.ethhdr* %1618, metadata !484, metadata !DIExpression()) #6, !dbg !2275
  %1619 = inttoptr i64 %1610 to i8*, !dbg !2296
  call void @llvm.dbg.value(metadata i8* %1619, metadata !465, metadata !DIExpression()) #6, !dbg !2275
  %1620 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %1618, i32 2, i32 2) #6, !dbg !2297, !llvm.preserve.access.index !306
  store i16 -8826, i16* %1620, align 2, !dbg !2298, !tbaa !410
  %1621 = getelementptr i8, i8* %1619, i64 14, !dbg !2299
  %1622 = bitcast i8* %1621 to %struct.ipv6hdr*, !dbg !2300
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1622, metadata !467, metadata !DIExpression()) #6, !dbg !2275
  %1623 = getelementptr i8, i8* %1619, i64 54, !dbg !2301
  %1624 = icmp ugt i8* %1623, %1613, !dbg !2302
  br i1 %1624, label %1840, label %1625, !dbg !2303

1625:                                             ; preds = %1617
  %1626 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 0, i32 1) #6, !dbg !2304, !llvm.preserve.access.index !329
  %1627 = load i8, i8* %1626, align 4, !dbg !2305
  %1628 = and i8 %1627, 15, !dbg !2305
  %1629 = or i8 %1628, 96, !dbg !2305
  store i8 %1629, i8* %1626, align 4, !dbg !2305
  %1630 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 0, i32 0) #6, !dbg !2306, !llvm.preserve.access.index !329
  %1631 = load i8, i8* %1630, align 4, !dbg !2307
  %1632 = and i8 %1631, -16, !dbg !2307
  store i8 %1632, i8* %1630, align 4, !dbg !2307
  %1633 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 3, i32 4) #6, !dbg !2308, !llvm.preserve.access.index !329
  store i8 43, i8* %1633, align 2, !dbg !2309, !tbaa !526
  %1634 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 4, i32 5) #6, !dbg !2310, !llvm.preserve.access.index !329
  store i8 64, i8* %1634, align 1, !dbg !2311, !tbaa !530
  %1635 = zext i8 %1602 to i16
  %1636 = add nuw nsw i16 %1596, %1635
  %1637 = call i16 @llvm.bswap.i16(i16 %1636) #6
  %1638 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 2, i32 3) #6, !dbg !2312, !llvm.preserve.access.index !329
  store i16 %1637, i16* %1638, align 4, !dbg !2313, !tbaa !533
  %1639 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 5, i32 6) #6, !dbg !2314, !llvm.preserve.access.index !329
  %1640 = bitcast %struct.in6_addr* %1639 to i8*, !dbg !2315
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1640, i8* nonnull align 4 dereferenceable(16) %1585, i64 16, i1 false) #6, !dbg !2315
  %1641 = load i32, i32* %1598, align 4, !dbg !2316, !tbaa !490
  %1642 = add i32 %1641, -1, !dbg !2317
  %1643 = icmp ugt i32 %1642, 4, !dbg !2317
  br i1 %1643, label %1840, label %1644, !dbg !2317

1644:                                             ; preds = %1625
  %1645 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1622, i32 6, i32 7) #6, !dbg !2318, !llvm.preserve.access.index !329
  %1646 = bitcast %struct.in6_addr* %1645 to i8*, !dbg !2319
  %1647 = zext i32 %1642 to i64, !dbg !2320
  %1648 = getelementptr inbounds %struct.transit_behavior, %struct.transit_behavior* %1586, i64 0, i32 6, i64 %1647, !dbg !2320
  %1649 = bitcast %struct.in6_addr* %1648 to i8*, !dbg !2319
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1646, i8* nonnull align 4 dereferenceable(16) %1649, i64 16, i1 false) #6, !dbg !2319
  call void @llvm.dbg.value(metadata i8* %1623, metadata !468, metadata !DIExpression()) #6, !dbg !2275
  %1650 = getelementptr i8, i8* %1619, i64 62, !dbg !2321
  %1651 = icmp ugt i8* %1650, %1613, !dbg !2322
  br i1 %1651, label %1840, label %1652, !dbg !2323

1652:                                             ; preds = %1644
  store i8 41, i8* %1623, align 4, !dbg !2324, !tbaa !547
  %1653 = lshr exact i8 %1602, 3, !dbg !2325
  %1654 = add nsw i8 %1653, -1, !dbg !2326
  %1655 = getelementptr i8, i8* %1619, i64 55, !dbg !2327
  store i8 %1654, i8* %1655, align 1, !dbg !2328, !tbaa !553
  %1656 = getelementptr i8, i8* %1619, i64 56, !dbg !2329
  store i8 4, i8* %1656, align 2, !dbg !2330, !tbaa !556
  %1657 = load i32, i32* %1598, align 4, !dbg !2331, !tbaa !490
  %1658 = trunc i32 %1657 to i8, !dbg !2332
  %1659 = add i8 %1658, -1, !dbg !2332
  %1660 = getelementptr i8, i8* %1619, i64 57, !dbg !2333
  store i8 %1659, i8* %1660, align 1, !dbg !2334, !tbaa !561
  %1661 = getelementptr i8, i8* %1619, i64 58, !dbg !2335
  store i8 %1659, i8* %1661, align 4, !dbg !2336, !tbaa !564
  %1662 = getelementptr i8, i8* %1619, i64 59, !dbg !2337
  store i8 0, i8* %1662, align 1, !dbg !2338, !tbaa !567
  %1663 = getelementptr i8, i8* %1619, i64 60, !dbg !2339
  %1664 = bitcast i8* %1663 to i16*, !dbg !2339
  store i16 0, i16* %1664, align 2, !dbg !2340, !tbaa !570
  call void @llvm.dbg.value(metadata i64 0, metadata !485, metadata !DIExpression()) #6, !dbg !2341
  %1665 = icmp eq i32 %1657, 0, !dbg !2342
  br i1 %1665, label %1703, label %1666, !dbg !2343

1666:                                             ; preds = %1652
  %1667 = getelementptr i8, i8* %1619, i64 79, !dbg !2344
  %1668 = icmp ugt i8* %1667, %1613, !dbg !2345
  br i1 %1668, label %1840, label %1669, !dbg !2346

1669:                                             ; preds = %1666
  %1670 = getelementptr inbounds i8, i8* %1585, i64 48, !dbg !2347
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1650, i8* nonnull align 4 dereferenceable(16) %1670, i64 16, i1 false) #6, !dbg !2348
  call void @llvm.dbg.value(metadata i64 1, metadata !485, metadata !DIExpression()) #6, !dbg !2341
  %1671 = load i32, i32* %1598, align 4, !dbg !2349, !tbaa !490
  %1672 = icmp ugt i32 %1671, 1, !dbg !2342
  br i1 %1672, label %1673, label %1703, !dbg !2343

1673:                                             ; preds = %1669
  %1674 = getelementptr i8, i8* %1619, i64 95, !dbg !2344
  %1675 = icmp ugt i8* %1674, %1613, !dbg !2345
  br i1 %1675, label %1840, label %1676, !dbg !2346

1676:                                             ; preds = %1673
  %1677 = getelementptr i8, i8* %1619, i64 78, !dbg !2350
  %1678 = getelementptr inbounds i8, i8* %1585, i64 64, !dbg !2347
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1677, i8* nonnull align 4 dereferenceable(16) %1678, i64 16, i1 false) #6, !dbg !2348
  call void @llvm.dbg.value(metadata i64 2, metadata !485, metadata !DIExpression()) #6, !dbg !2341
  %1679 = load i32, i32* %1598, align 4, !dbg !2349, !tbaa !490
  %1680 = icmp ugt i32 %1679, 2, !dbg !2342
  br i1 %1680, label %1681, label %1703, !dbg !2343

1681:                                             ; preds = %1676
  %1682 = getelementptr i8, i8* %1619, i64 111, !dbg !2344
  %1683 = icmp ugt i8* %1682, %1613, !dbg !2345
  br i1 %1683, label %1840, label %1684, !dbg !2346

1684:                                             ; preds = %1681
  %1685 = getelementptr i8, i8* %1619, i64 94, !dbg !2350
  %1686 = getelementptr inbounds i8, i8* %1585, i64 80, !dbg !2347
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1685, i8* nonnull align 4 dereferenceable(16) %1686, i64 16, i1 false) #6, !dbg !2348
  call void @llvm.dbg.value(metadata i64 3, metadata !485, metadata !DIExpression()) #6, !dbg !2341
  %1687 = load i32, i32* %1598, align 4, !dbg !2349, !tbaa !490
  %1688 = icmp ugt i32 %1687, 3, !dbg !2342
  br i1 %1688, label %1689, label %1703, !dbg !2343

1689:                                             ; preds = %1684
  %1690 = getelementptr i8, i8* %1619, i64 127, !dbg !2344
  %1691 = icmp ugt i8* %1690, %1613, !dbg !2345
  br i1 %1691, label %1840, label %1692, !dbg !2346

1692:                                             ; preds = %1689
  %1693 = getelementptr i8, i8* %1619, i64 110, !dbg !2350
  %1694 = getelementptr inbounds i8, i8* %1585, i64 96, !dbg !2347
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1693, i8* nonnull align 4 dereferenceable(16) %1694, i64 16, i1 false) #6, !dbg !2348
  call void @llvm.dbg.value(metadata i64 4, metadata !485, metadata !DIExpression()) #6, !dbg !2341
  %1695 = load i32, i32* %1598, align 4, !dbg !2349, !tbaa !490
  %1696 = icmp ugt i32 %1695, 4, !dbg !2342
  br i1 %1696, label %1697, label %1703, !dbg !2343

1697:                                             ; preds = %1692
  %1698 = getelementptr i8, i8* %1619, i64 143, !dbg !2344
  %1699 = icmp ugt i8* %1698, %1613, !dbg !2345
  br i1 %1699, label %1840, label %1700, !dbg !2346

1700:                                             ; preds = %1697
  %1701 = getelementptr i8, i8* %1619, i64 126, !dbg !2350
  %1702 = getelementptr inbounds i8, i8* %1585, i64 112, !dbg !2347
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1701, i8* nonnull align 4 dereferenceable(16) %1702, i64 16, i1 false) #6, !dbg !2348
  call void @llvm.dbg.value(metadata i64 5, metadata !485, metadata !DIExpression()) #6, !dbg !2341
  br label %1703

1703:                                             ; preds = %1700, %1692, %1684, %1676, %1669, %1652
  call void @llvm.dbg.value(metadata i32 10000, metadata !454, metadata !DIExpression()) #6, !dbg !2272
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !585, metadata !DIExpression()) #6, !dbg !2351
  call void @llvm.dbg.value(metadata i32 2, metadata !590, metadata !DIExpression()) #6, !dbg !2351
  %1704 = getelementptr inbounds [6 x i8], [6 x i8]* %20, i64 0, i64 0
  %1705 = getelementptr inbounds [6 x i8], [6 x i8]* %19, i64 0, i64 0
  %1706 = load i32, i32* %23, align 4, !dbg !2353, !tbaa !347
  %1707 = zext i32 %1706 to i64, !dbg !2354
  %1708 = inttoptr i64 %1707 to i8*, !dbg !2355
  call void @llvm.dbg.value(metadata i8* %1708, metadata !591, metadata !DIExpression()) #6, !dbg !2351
  %1709 = load i32, i32* %27, align 4, !dbg !2356, !tbaa !355
  %1710 = zext i32 %1709 to i64, !dbg !2357
  %1711 = inttoptr i64 %1710 to i8*, !dbg !2358
  call void @llvm.dbg.value(metadata i8* %1711, metadata !592, metadata !DIExpression()) #6, !dbg !2351
  %1712 = getelementptr i8, i8* %1708, i64 1, !dbg !2359
  %1713 = icmp ugt i8* %1712, %1711, !dbg !2360
  br i1 %1713, label %1840, label %1714, !dbg !2361

1714:                                             ; preds = %1703
  %1715 = bitcast i32* %3 to i8*, !dbg !2362
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1715) #6, !dbg !2362
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %1705), !dbg !2363
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !594, metadata !DIExpression()) #6, !dbg !2364
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %1704), !dbg !2363
  call void @llvm.dbg.declare(metadata [6 x i8]* undef, metadata !595, metadata !DIExpression()) #6, !dbg !2365
  call void @llvm.dbg.value(metadata i32* %3, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !2351
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !616, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i8* %1705, metadata !622, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i8* %1704, metadata !623, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i32* %3, metadata !624, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i32 2, metadata !625, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i8* %1708, metadata !626, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i8* %1711, metadata !627, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata i8* %1708, metadata !628, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !358, metadata !DIExpression()) #6, !dbg !2368
  call void @llvm.dbg.value(metadata i8* %1708, metadata !364, metadata !DIExpression()) #6, !dbg !2368
  call void @llvm.dbg.value(metadata i64 %1710, metadata !365, metadata !DIExpression()) #6, !dbg !2368
  call void @llvm.dbg.value(metadata i8* %1708, metadata !366, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !2368
  %1716 = getelementptr i8, i8* %1708, i64 34, !dbg !2370
  %1717 = bitcast i8* %1716 to %struct.iphdr*, !dbg !2370
  %1718 = inttoptr i64 %1710 to %struct.iphdr*, !dbg !2371
  %1719 = icmp ugt %struct.iphdr* %1717, %1718, !dbg !2372
  %1720 = getelementptr i8, i8* %1708, i64 14, !dbg !2373
  %1721 = bitcast i8* %1720 to %struct.iphdr*, !dbg !2373
  %1722 = select i1 %1719, %struct.iphdr* null, %struct.iphdr* %1721, !dbg !2373
  call void @llvm.dbg.value(metadata %struct.iphdr* %1722, metadata !629, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !374, metadata !DIExpression()) #6, !dbg !2374
  call void @llvm.dbg.value(metadata i8* %1708, metadata !379, metadata !DIExpression()) #6, !dbg !2374
  call void @llvm.dbg.value(metadata i64 %1710, metadata !380, metadata !DIExpression()) #6, !dbg !2374
  call void @llvm.dbg.value(metadata i8* %1708, metadata !381, metadata !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value)) #6, !dbg !2374
  %1723 = getelementptr i8, i8* %1708, i64 54, !dbg !2376
  %1724 = bitcast i8* %1723 to %struct.ipv6hdr*, !dbg !2376
  %1725 = inttoptr i64 %1710 to %struct.ipv6hdr*, !dbg !2377
  %1726 = icmp ugt %struct.ipv6hdr* %1724, %1725, !dbg !2378
  %1727 = bitcast i8* %1720 to %struct.ipv6hdr*, !dbg !2379
  %1728 = select i1 %1726, %struct.ipv6hdr* null, %struct.ipv6hdr* %1727, !dbg !2379
  call void @llvm.dbg.value(metadata %struct.ipv6hdr* %1728, metadata !630, metadata !DIExpression()) #6, !dbg !2366
  %1729 = getelementptr inbounds %struct.bpf_fib_lookup, %struct.bpf_fib_lookup* %2, i64 0, i32 0, !dbg !2380
  call void @llvm.lifetime.start.p0i8(i64 64, i8* nonnull %1729) #6, !dbg !2380
  call void @llvm.dbg.declare(metadata %struct.bpf_fib_lookup* %2, metadata !631, metadata !DIExpression()) #6, !dbg !2381
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %1729, i8 0, i64 64, i1 false) #6, !dbg !2381
  %1730 = icmp ugt i8* %1720, %1711, !dbg !2382
  br i1 %1730, label %1821, label %1731, !dbg !2383

1731:                                             ; preds = %1714
  %1732 = inttoptr i64 %1707 to %struct.ethhdr*, !dbg !2384
  call void @llvm.dbg.value(metadata %struct.ethhdr* %1732, metadata !628, metadata !DIExpression()) #6, !dbg !2366
  %1733 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ethhdrs(%struct.ethhdr* %1732, i32 2, i32 2) #6, !dbg !2385, !llvm.preserve.access.index !306
  %1734 = load i16, i16* %1733, align 2, !dbg !2385, !tbaa !410
  call void @llvm.dbg.value(metadata i16 %1734, metadata !632, metadata !DIExpression()) #6, !dbg !2366
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(64) %1729, i8 0, i64 64, i1 false) #6, !dbg !2386
  switch i16 %1734, label %1821 [
    i16 8, label %1735
    i16 -8826, label %1763
  ], !dbg !2387

1735:                                             ; preds = %1731
  %1736 = icmp eq %struct.iphdr* %1722, null, !dbg !2388
  br i1 %1736, label %1821, label %1737, !dbg !2389

1737:                                             ; preds = %1735
  %1738 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 0, i32 0) #6, !dbg !2390, !llvm.preserve.access.index !99
  store i8 2, i8* %1738, align 4, !dbg !2391, !tbaa !668
  %1739 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1722, i32 1, i32 2) #6, !dbg !2392, !llvm.preserve.access.index !314
  %1740 = load i8, i8* %1739, align 1, !dbg !2392, !tbaa !671
  %1741 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 6, i32 6) #6, !dbg !2393, !llvm.preserve.access.index !99
  %1742 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1741, i32 0) #6, !dbg !2393, !llvm.preserve.access.index !98
  %1743 = bitcast %union.anon.5* %1742 to i8*, !dbg !2393
  store i8 %1740, i8* %1743, align 4, !dbg !2394, !tbaa !674
  %1744 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* nonnull %1722, i32 6, i32 7) #6, !dbg !2395, !llvm.preserve.access.index !314
  %1745 = load i8, i8* %1744, align 1, !dbg !2395, !tbaa !676
  %1746 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 1, i32 1) #6, !dbg !2396, !llvm.preserve.access.index !99
  store i8 %1745, i8* %1746, align 1, !dbg !2397, !tbaa !679
  %1747 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 2, i32 2) #6, !dbg !2398, !llvm.preserve.access.index !99
  store i16 0, i16* %1747, align 2, !dbg !2399, !tbaa !682
  %1748 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 3, i32 3) #6, !dbg !2400, !llvm.preserve.access.index !99
  store i16 0, i16* %1748, align 4, !dbg !2401, !tbaa !685
  %1749 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* nonnull %1722, i32 2, i32 3) #6, !dbg !2402, !llvm.preserve.access.index !314
  %1750 = load i16, i16* %1749, align 2, !dbg !2402, !tbaa !445
  %1751 = call i16 @llvm.bswap.i16(i16 %1750) #6
  %1752 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 4, i32 4) #6, !dbg !2403, !llvm.preserve.access.index !99
  store i16 %1751, i16* %1752, align 2, !dbg !2404, !tbaa !689
  %1753 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1722, i32 8, i32 9) #6, !dbg !2405, !llvm.preserve.access.index !314
  %1754 = load i32, i32* %1753, align 4, !dbg !2405, !tbaa !691
  %1755 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 7, i32 7) #6, !dbg !2406, !llvm.preserve.access.index !99
  %1756 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %1755, i32 0) #6, !dbg !2406, !llvm.preserve.access.index !109
  %1757 = getelementptr %union.anon.6, %union.anon.6* %1756, i64 0, i32 0, i64 0, !dbg !2406
  store i32 %1754, i32* %1757, align 4, !dbg !2407, !tbaa !674
  %1758 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.iphdrs(%struct.iphdr* nonnull %1722, i32 9, i32 10) #6, !dbg !2408, !llvm.preserve.access.index !314
  %1759 = load i32, i32* %1758, align 4, !dbg !2408, !tbaa !428
  %1760 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 8, i32 8) #6, !dbg !2409, !llvm.preserve.access.index !99
  %1761 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %1760, i32 0) #6, !dbg !2409, !llvm.preserve.access.index !115
  %1762 = getelementptr %union.anon.7, %union.anon.7* %1761, i64 0, i32 0, i64 0, !dbg !2409
  store i32 %1759, i32* %1762, align 4, !dbg !2410, !tbaa !674
  br label %1798, !dbg !2411

1763:                                             ; preds = %1731
  %1764 = icmp eq %struct.ipv6hdr* %1728, null, !dbg !2412
  br i1 %1764, label %1821, label %1765, !dbg !2413

1765:                                             ; preds = %1763
  %1766 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1728, i32 4, i32 5) #6, !dbg !2414, !llvm.preserve.access.index !329
  %1767 = load i8, i8* %1766, align 1, !dbg !2414, !tbaa !530
  %1768 = icmp ult i8 %1767, 2, !dbg !2415
  br i1 %1768, label %1821, label %1769, !dbg !2416

1769:                                             ; preds = %1765
  %1770 = call %union.anon.6* @llvm.preserve.struct.access.index.p0s_union.anon.6s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 7, i32 7) #6, !dbg !2417, !llvm.preserve.access.index !99
  %1771 = call %union.anon.6* @llvm.preserve.union.access.index.p0s_union.anon.6s.p0s_union.anon.6s(%union.anon.6* %1770, i32 1) #6, !dbg !2417, !llvm.preserve.access.index !109
  call void @llvm.dbg.value(metadata %union.anon.6* %1771, metadata !633, metadata !DIExpression()) #6, !dbg !2418
  %1772 = call %union.anon.7* @llvm.preserve.struct.access.index.p0s_union.anon.7s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 8, i32 8) #6, !dbg !2419, !llvm.preserve.access.index !99
  %1773 = call %union.anon.7* @llvm.preserve.union.access.index.p0s_union.anon.7s.p0s_union.anon.7s(%union.anon.7* %1772, i32 1) #6, !dbg !2419, !llvm.preserve.access.index !115
  call void @llvm.dbg.value(metadata %union.anon.7* %1773, metadata !635, metadata !DIExpression()) #6, !dbg !2418
  %1774 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 0, i32 0) #6, !dbg !2420, !llvm.preserve.access.index !99
  store i8 10, i8* %1774, align 4, !dbg !2421, !tbaa !668
  %1775 = call %union.anon.5* @llvm.preserve.struct.access.index.p0s_union.anon.5s.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 6, i32 6) #6, !dbg !2422, !llvm.preserve.access.index !99
  %1776 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1775, i32 0) #6, !dbg !2422, !llvm.preserve.access.index !98
  %1777 = bitcast %union.anon.5* %1776 to i8*, !dbg !2422
  store i8 0, i8* %1777, align 4, !dbg !2423, !tbaa !674
  %1778 = bitcast %struct.ipv6hdr* %1728 to i32*, !dbg !2424
  %1779 = load i32, i32* %1778, align 4, !dbg !2424, !tbaa !713
  %1780 = and i32 %1779, -241, !dbg !2425
  %1781 = call %union.anon.5* @llvm.preserve.union.access.index.p0s_union.anon.5s.p0s_union.anon.5s(%union.anon.5* %1775, i32 1) #6, !dbg !2426, !llvm.preserve.access.index !98
  %1782 = getelementptr %union.anon.5, %union.anon.5* %1781, i64 0, i32 0, !dbg !2426
  store i32 %1780, i32* %1782, align 4, !dbg !2427, !tbaa !674
  %1783 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1728, i32 3, i32 4) #6, !dbg !2428, !llvm.preserve.access.index !329
  %1784 = load i8, i8* %1783, align 2, !dbg !2428, !tbaa !526
  %1785 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 1, i32 1) #6, !dbg !2429, !llvm.preserve.access.index !99
  store i8 %1784, i8* %1785, align 1, !dbg !2430, !tbaa !679
  %1786 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 2, i32 2) #6, !dbg !2431, !llvm.preserve.access.index !99
  store i16 0, i16* %1786, align 2, !dbg !2432, !tbaa !682
  %1787 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 3, i32 3) #6, !dbg !2433, !llvm.preserve.access.index !99
  store i16 0, i16* %1787, align 4, !dbg !2434, !tbaa !685
  %1788 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1728, i32 2, i32 3) #6, !dbg !2435, !llvm.preserve.access.index !329
  %1789 = load i16, i16* %1788, align 4, !dbg !2435, !tbaa !533
  %1790 = call i16 @llvm.bswap.i16(i16 %1789) #6
  %1791 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 4, i32 4) #6, !dbg !2436, !llvm.preserve.access.index !99
  store i16 %1790, i16* %1791, align 2, !dbg !2437, !tbaa !689
  %1792 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1728, i32 5, i32 6) #6, !dbg !2438, !llvm.preserve.access.index !329
  %1793 = bitcast %union.anon.6* %1771 to i8*, !dbg !2438
  %1794 = bitcast %struct.in6_addr* %1792 to i8*, !dbg !2438
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1793, i8* nonnull align 4 dereferenceable(16) %1794, i64 16, i1 false) #6, !dbg !2438, !tbaa.struct !728
  %1795 = call %struct.in6_addr* @llvm.preserve.struct.access.index.p0s_struct.in6_addrs.p0s_struct.ipv6hdrs(%struct.ipv6hdr* nonnull %1728, i32 6, i32 7) #6, !dbg !2439, !llvm.preserve.access.index !329
  %1796 = bitcast %union.anon.7* %1773 to i8*, !dbg !2439
  %1797 = bitcast %struct.in6_addr* %1795 to i8*, !dbg !2439
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(16) %1796, i8* nonnull align 4 dereferenceable(16) %1797, i64 16, i1 false) #6, !dbg !2439, !tbaa.struct !728
  br label %1798, !dbg !2440

1798:                                             ; preds = %1769, %1737
  %1799 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.xdp_mds(%struct.xdp_md* %0, i32 3, i32 3) #6, !dbg !2441, !llvm.preserve.access.index !62
  %1800 = load i32, i32* %1799, align 4, !dbg !2441, !tbaa !732
  %1801 = call i32* @llvm.preserve.struct.access.index.p0i32.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 5, i32 5) #6, !dbg !2442, !llvm.preserve.access.index !99
  store i32 %1800, i32* %1801, align 4, !dbg !2443, !tbaa !735
  %1802 = bitcast %struct.xdp_md* %0 to i8*, !dbg !2444
  %1803 = call i64 inttoptr (i64 69 to i64 (i8*, %struct.bpf_fib_lookup*, i32, i32)*)(i8* %1802, %struct.bpf_fib_lookup* nonnull %2, i32 64, i32 2) #6, !dbg !2445
  %1804 = trunc i64 %1803 to i32, !dbg !2445
  call void @llvm.dbg.value(metadata i32 %1804, metadata !636, metadata !DIExpression()) #6, !dbg !2366
  %1805 = icmp eq i32 %1804, 0, !dbg !2446
  br i1 %1805, label %1806, label %1821, !dbg !2446

1806:                                             ; preds = %1798
  switch i16 %1734, label %1822 [
    i16 8, label %1807
    i16 -8826, label %1817
  ], !dbg !2447

1807:                                             ; preds = %1806
  call void @llvm.dbg.value(metadata %struct.iphdr* %1722, metadata !740, metadata !DIExpression()) #6, !dbg !2448
  %1808 = call i16* @llvm.preserve.struct.access.index.p0i16.p0s_struct.iphdrs(%struct.iphdr* %1722, i32 7, i32 8) #6, !dbg !2450, !llvm.preserve.access.index !314
  %1809 = load i16, i16* %1808, align 2, !dbg !2450, !tbaa !750
  call void @llvm.dbg.value(metadata i16 %1809, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2448
  %1810 = add i16 %1809, 1, !dbg !2451
  call void @llvm.dbg.value(metadata i16 %1809, metadata !745, metadata !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 1, DW_OP_stack_value)) #6, !dbg !2448
  %1811 = icmp ugt i16 %1809, -3, !dbg !2452
  %1812 = zext i1 %1811 to i16, !dbg !2452
  %1813 = add i16 %1810, %1812, !dbg !2453
  store i16 %1813, i16* %1808, align 2, !dbg !2454, !tbaa !750
  %1814 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.iphdrs(%struct.iphdr* %1722, i32 5, i32 6) #6, !dbg !2455, !llvm.preserve.access.index !314
  %1815 = load i8, i8* %1814, align 4, !dbg !2456, !tbaa !757
  %1816 = add i8 %1815, -1, !dbg !2456
  store i8 %1816, i8* %1814, align 4, !dbg !2456, !tbaa !757
  br label %1822, !dbg !2457

1817:                                             ; preds = %1806
  %1818 = call i8* @llvm.preserve.struct.access.index.p0i8.p0s_struct.ipv6hdrs(%struct.ipv6hdr* %1728, i32 4, i32 5) #6, !dbg !2458, !llvm.preserve.access.index !329
  %1819 = load i8, i8* %1818, align 1, !dbg !2459, !tbaa !530
  %1820 = add i8 %1819, -1, !dbg !2459
  store i8 %1820, i8* %1818, align 1, !dbg !2459, !tbaa !530
  br label %1822, !dbg !2460

1821:                                             ; preds = %1798, %1765, %1763, %1735, %1731, %1714
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1729) #6, !dbg !2461
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2351
  br label %1838, !dbg !2462

1822:                                             ; preds = %1817, %1807, %1806
  %1823 = load i32, i32* %1801, align 4, !dbg !2463, !tbaa !735
  store i32 %1823, i32* %3, align 4, !dbg !2464, !tbaa !713
  call void @llvm.dbg.value(metadata i8* %1705, metadata !637, metadata !DIExpression()) #6, !dbg !2465
  call void @llvm.dbg.value(metadata i8* %1704, metadata !639, metadata !DIExpression()) #6, !dbg !2465
  %1824 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 12, i32 12) #6, !dbg !2466, !llvm.preserve.access.index !99
  %1825 = getelementptr inbounds [6 x i8], [6 x i8]* %1824, i64 0, i64 0, !dbg !2467
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %1704, i8* nonnull align 2 dereferenceable(6) %1825, i64 6, i1 false) #6, !dbg !2467
  %1826 = call [6 x i8]* @llvm.preserve.struct.access.index.p0a6i8.p0s_struct.bpf_fib_lookups(%struct.bpf_fib_lookup* nonnull %2, i32 11, i32 11) #6, !dbg !2468, !llvm.preserve.access.index !99
  %1827 = getelementptr inbounds [6 x i8], [6 x i8]* %1826, i64 0, i64 0, !dbg !2469
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %1705, i8* nonnull align 4 dereferenceable(6) %1827, i64 6, i1 false) #6, !dbg !2469
  call void @llvm.lifetime.end.p0i8(i64 64, i8* nonnull %1729) #6, !dbg !2461
  call void @llvm.dbg.value(metadata i1 true, metadata !596, metadata !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value)) #6, !dbg !2351
  call void @llvm.dbg.value(metadata i8* %1708, metadata !772, metadata !DIExpression()) #6, !dbg !2470
  call void @llvm.dbg.value(metadata i8* %1705, metadata !777, metadata !DIExpression()) #6, !dbg !2470
  call void @llvm.dbg.value(metadata i8* %1704, metadata !778, metadata !DIExpression()) #6, !dbg !2470
  call void @llvm.dbg.value(metadata i8* %1705, metadata !779, metadata !DIExpression()) #6, !dbg !2470
  call void @llvm.dbg.value(metadata i8* %1704, metadata !781, metadata !DIExpression()) #6, !dbg !2470
  call void @llvm.dbg.value(metadata i8* %1708, metadata !782, metadata !DIExpression()) #6, !dbg !2470
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %1708, i8* nonnull align 2 dereferenceable(6) %1704, i64 6, i1 false) #6, !dbg !2472
  %1828 = getelementptr inbounds i8, i8* %1708, i64 6, !dbg !2473
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 2 dereferenceable(6) %1828, i8* nonnull align 2 dereferenceable(6) %1705, i64 6, i1 false) #6, !dbg !2474
  call void @llvm.dbg.value(metadata i32* %3, metadata !593, metadata !DIExpression(DW_OP_deref)) #6, !dbg !2351
  %1829 = call i8* inttoptr (i64 1 to i8* (i8*, i8*)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i8* nonnull %1715) #6, !dbg !2475
  %1830 = icmp eq i8* %1829, null, !dbg !2475
  br i1 %1830, label %1838, label %1831, !dbg !2476

1831:                                             ; preds = %1822
  %1832 = load i32, i32* %1799, align 4, !dbg !2477, !tbaa !732
  %1833 = load i32, i32* %3, align 4, !dbg !2478, !tbaa !713
  call void @llvm.dbg.value(metadata i32 %1833, metadata !593, metadata !DIExpression()) #6, !dbg !2351
  %1834 = icmp eq i32 %1832, %1833, !dbg !2479
  br i1 %1834, label %1838, label %1835, !dbg !2480

1835:                                             ; preds = %1831
  %1836 = call i64 inttoptr (i64 51 to i64 (i8*, i32, i64)*)(i8* bitcast (%struct.anon.3* @tx_port to i8*), i32 %1833, i64 0) #6, !dbg !2481
  %1837 = trunc i64 %1836 to i32, !dbg !2481
  br label %1838, !dbg !2482

1838:                                             ; preds = %1835, %1831, %1822, %1821
  %1839 = phi i32 [ %1837, %1835 ], [ 2, %1822 ], [ 3, %1831 ], [ 2, %1821 ], !dbg !2351
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %1704), !dbg !2483
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %1705), !dbg !2483
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %1715) #6, !dbg !2483
  br label %1840

1840:                                             ; preds = %1593, %1608, %1617, %1625, %1644, %1666, %1673, %1681, %1689, %1697, %1703, %1838
  %1841 = phi i32 [ %1839, %1838 ], [ 2, %1703 ], [ 2, %1608 ], [ 2, %1617 ], [ 2, %1625 ], [ 2, %1644 ], [ 2, %1593 ], [ 2, %1666 ], [ 2, %1673 ], [ 2, %1681 ], [ 2, %1689 ], [ 2, %1697 ], !dbg !2272
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !2484
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !2484
  call void @llvm.dbg.value(metadata i32 %1841, metadata !403, metadata !DIExpression()) #6, !dbg !2484
  %1842 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 %1841) #6, !dbg !2486
  br label %1845, !dbg !2487

1843:                                             ; preds = %49, %57, %765, %1584, %1588, %768, %65
  call void @llvm.dbg.value(metadata %struct.xdp_md* %0, metadata !396, metadata !DIExpression()) #6, !dbg !2488
  call void @llvm.dbg.value(metadata i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), metadata !402, metadata !DIExpression()) #6, !dbg !2488
  call void @llvm.dbg.value(metadata i32 2, metadata !403, metadata !DIExpression()) #6, !dbg !2488
  %1844 = call i32 inttoptr (i64 12 to i32 (%struct.xdp_md*, i8*, i32)*)(%struct.xdp_md* %0, i8* bitcast (%struct.xdpcap_hook* @xdpcap_hook to i8*), i32 2) #6, !dbg !2490
  br label %1845, !dbg !2491

1845:                                             ; preds = %1843, %1840, %1581, %1150, %958, %754, %749, %316, %55, %47
  %1846 = phi i32 [ 2, %47 ], [ 2, %1843 ], [ %750, %749 ], [ %317, %316 ], [ 1, %55 ], [ %1582, %1581 ], [ %1151, %1150 ], [ %959, %958 ], [ %1841, %1840 ], [ 1, %754 ], !dbg !345
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %45) #6, !dbg !2492
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %44) #6, !dbg !2492
  ret i32 %1846, !dbg !2492
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
define dso_local i32 @xdp_pass_func(%struct.xdp_md* nocapture readnone %0) #4 section "xdp_pass" !dbg !2493 {
  call void @llvm.dbg.value(metadata %struct.xdp_md* undef, metadata !2495, metadata !DIExpression()), !dbg !2496
  ret i32 2, !dbg !2497
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

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
attributes #4 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn writeonly }
attributes #6 = { nounwind }

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
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lpm_key_v6", file: !166, line: 32, size: 160, elements: !167)
!166 = !DIFile(filename: "./srv6_structs.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!167 = !{!168, !169}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !165, file: !166, line: 34, baseType: !65, size: 32)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !165, file: !166, line: 35, baseType: !72, size: 128, offset: 32)
!170 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !156, file: !137, line: 23, baseType: !171, size: 64, offset: 128)
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !172, size: 64)
!172 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "end_function", file: !166, line: 38, size: 384, elements: !173)
!173 = !{!174, !175, !187, !188, !189, !190}
!174 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !172, file: !166, line: 40, baseType: !113, size: 128)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "nexthop", scope: !172, file: !166, line: 49, baseType: !176, size: 128, offset: 128)
!176 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !172, file: !166, line: 41, size: 128, elements: !177)
!177 = !{!178, !179}
!178 = !DIDerivedType(tag: DW_TAG_member, name: "v6addr", scope: !176, file: !166, line: 43, baseType: !113, size: 128)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "v4", scope: !176, file: !166, line: 48, baseType: !180, size: 128)
!180 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "v4", file: !166, line: 44, size: 128, elements: !181)
!181 = !{!182, !183}
!182 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !180, file: !166, line: 46, baseType: !65, size: 32)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !180, file: !166, line: 47, baseType: !184, size: 96, offset: 32)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !65, size: 96, elements: !185)
!185 = !{!186}
!186 = !DISubrange(count: 3)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "function", scope: !172, file: !166, line: 52, baseType: !65, size: 32, offset: 256)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "flaver", scope: !172, file: !166, line: 53, baseType: !65, size: 32, offset: 288)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "v4_addr_spos", scope: !172, file: !166, line: 54, baseType: !65, size: 32, offset: 320)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "v4_addr_dpos", scope: !172, file: !166, line: 55, baseType: !65, size: 32, offset: 352)
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
!208 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "lpm_key_v4", file: !166, line: 26, size: 64, elements: !209)
!209 = !{!210, !211}
!210 = !DIDerivedType(tag: DW_TAG_member, name: "prefixlen", scope: !208, file: !166, line: 28, baseType: !65, size: 32)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "addr", scope: !208, file: !166, line: 29, baseType: !65, size: 32, offset: 32)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !203, file: !137, line: 32, baseType: !213, size: 64, offset: 128)
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!214 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "transit_behavior", file: !166, line: 15, size: 1024, elements: !215)
!215 = !{!216, !217, !218, !219, !220, !221, !222}
!216 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !214, file: !166, line: 17, baseType: !72, size: 128)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !214, file: !166, line: 18, baseType: !72, size: 128, offset: 128)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "s_prefixlen", scope: !214, file: !166, line: 19, baseType: !65, size: 32, offset: 256)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "d_prefixlen", scope: !214, file: !166, line: 20, baseType: !65, size: 32, offset: 288)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "segment_length", scope: !214, file: !166, line: 21, baseType: !65, size: 32, offset: 320)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "action", scope: !214, file: !166, line: 22, baseType: !65, size: 32, offset: 352)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "segments", scope: !214, file: !166, line: 23, baseType: !223, size: 640, offset: 384)
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
!252 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "v6addr_heep", file: !166, line: 9, size: 256, elements: !253)
!253 = !{!254, !255}
!254 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !252, file: !166, line: 11, baseType: !72, size: 128)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !252, file: !166, line: 12, baseType: !72, size: 128, offset: 128)
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
!358 = !DILocalVariable(name: "xdp", arg: 1, scope: !359, file: !360, line: 251, type: !61)
!359 = distinct !DISubprogram(name: "get_ipv4", scope: !360, file: !360, line: 251, type: !361, scopeLine: 252, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !363)
!360 = !DIFile(filename: "./srv6_helpers.h", directory: "/root/workspace/go/src/github.com/laik/ebpf-app/ebpf/srv6")
!361 = !DISubroutineType(types: !362)
!362 = !{!313, !61}
!363 = !{!358, !364, !365, !366}
!364 = !DILocalVariable(name: "data", scope: !359, file: !360, line: 253, type: !53)
!365 = !DILocalVariable(name: "data_end", scope: !359, file: !360, line: 254, type: !53)
!366 = !DILocalVariable(name: "iph", scope: !359, file: !360, line: 256, type: !313)
!367 = !DILocation(line: 0, scope: !359, inlinedAt: !368)
!368 = distinct !DILocation(line: 401, column: 25, scope: !297)
!369 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !368)
!370 = distinct !DILexicalBlock(scope: !359, file: !360, line: 257, column: 9)
!371 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !368)
!372 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !368)
!373 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !368)
!374 = !DILocalVariable(name: "xdp", arg: 1, scope: !375, file: !360, line: 238, type: !61)
!375 = distinct !DISubprogram(name: "get_ipv6", scope: !360, file: !360, line: 238, type: !376, scopeLine: 239, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !378)
!376 = !DISubroutineType(types: !377)
!377 = !{!328, !61}
!378 = !{!374, !379, !380, !381}
!379 = !DILocalVariable(name: "data", scope: !375, file: !360, line: 240, type: !53)
!380 = !DILocalVariable(name: "data_end", scope: !375, file: !360, line: 241, type: !53)
!381 = !DILocalVariable(name: "v6h", scope: !375, file: !360, line: 243, type: !328)
!382 = !DILocation(line: 0, scope: !375, inlinedAt: !383)
!383 = distinct !DILocation(line: 402, column: 27, scope: !297)
!384 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !383)
!385 = distinct !DILexicalBlock(scope: !375, file: !360, line: 245, column: 9)
!386 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !383)
!387 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !383)
!388 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !383)
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
!446 = !DILocalVariable(name: "xdp", arg: 1, scope: !447, file: !3, line: 148, type: !61)
!447 = distinct !DISubprogram(name: "transit_encap", scope: !3, file: !3, line: 148, type: !448, scopeLine: 149, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!448 = !DISubroutineType(types: !449)
!449 = !{!60, !61, !213, !79, !79}
!450 = !{!446, !451, !452, !453, !454}
!451 = !DILocalVariable(name: "tb", arg: 2, scope: !447, file: !3, line: 148, type: !213)
!452 = !DILocalVariable(name: "nexthdr", arg: 3, scope: !447, file: !3, line: 148, type: !79)
!453 = !DILocalVariable(name: "innerlen", arg: 4, scope: !447, file: !3, line: 148, type: !79)
!454 = !DILocalVariable(name: "rc", scope: !447, file: !3, line: 150, type: !60)
!455 = !DILocation(line: 0, scope: !447, inlinedAt: !456)
!456 = distinct !DILocation(line: 428, column: 55, scope: !444)
!457 = !DILocalVariable(name: "xdp", arg: 1, scope: !458, file: !3, line: 81, type: !61)
!458 = distinct !DISubprogram(name: "base_encap", scope: !3, file: !3, line: 81, type: !459, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !461)
!459 = !DISubroutineType(types: !460)
!460 = !{!60, !61, !213, !79, !55}
!461 = !{!457, !462, !463, !464, !465, !466, !467, !468, !483, !484, !485}
!462 = !DILocalVariable(name: "tb", arg: 2, scope: !458, file: !3, line: 81, type: !213)
!463 = !DILocalVariable(name: "nexthdr", arg: 3, scope: !458, file: !3, line: 81, type: !79)
!464 = !DILocalVariable(name: "innerlen", arg: 4, scope: !458, file: !3, line: 81, type: !55)
!465 = !DILocalVariable(name: "data", scope: !458, file: !3, line: 83, type: !53)
!466 = !DILocalVariable(name: "data_end", scope: !458, file: !3, line: 84, type: !53)
!467 = !DILocalVariable(name: "v6h", scope: !458, file: !3, line: 86, type: !328)
!468 = !DILocalVariable(name: "srh", scope: !458, file: !3, line: 87, type: !469)
!469 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !470, size: 64)
!470 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "srhhdr", file: !166, line: 60, size: 64, elements: !471)
!471 = !{!472, !473, !474, !475, !476, !477, !478, !479}
!472 = !DIDerivedType(tag: DW_TAG_member, name: "nextHdr", scope: !470, file: !166, line: 62, baseType: !79, size: 8)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "hdrExtLen", scope: !470, file: !166, line: 63, baseType: !79, size: 8, offset: 8)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "routingType", scope: !470, file: !166, line: 64, baseType: !79, size: 8, offset: 16)
!475 = !DIDerivedType(tag: DW_TAG_member, name: "segmentsLeft", scope: !470, file: !166, line: 65, baseType: !79, size: 8, offset: 24)
!476 = !DIDerivedType(tag: DW_TAG_member, name: "lastEntry", scope: !470, file: !166, line: 66, baseType: !79, size: 8, offset: 32)
!477 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !470, file: !166, line: 67, baseType: !79, size: 8, offset: 40)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "tag", scope: !470, file: !166, line: 68, baseType: !55, size: 16, offset: 48)
!479 = !DIDerivedType(tag: DW_TAG_member, name: "segments", scope: !470, file: !166, line: 71, baseType: !480, offset: 64)
!480 = !DICompositeType(tag: DW_TAG_array_type, baseType: !72, elements: !481)
!481 = !{!482}
!482 = !DISubrange(count: 0)
!483 = !DILocalVariable(name: "srh_len", scope: !458, file: !3, line: 88, type: !79)
!484 = !DILocalVariable(name: "new_eth", scope: !458, file: !3, line: 97, type: !305)
!485 = !DILocalVariable(name: "i", scope: !486, file: !3, line: 134, type: !65)
!486 = distinct !DILexicalBlock(scope: !458, file: !3, line: 134, column: 5)
!487 = !DILocation(line: 0, scope: !458, inlinedAt: !488)
!488 = distinct !DILocation(line: 150, column: 14, scope: !447, inlinedAt: !456)
!489 = !DILocation(line: 90, column: 69, scope: !458, inlinedAt: !488)
!490 = !{!440, !349, i64 40}
!491 = !DILocation(line: 90, column: 65, scope: !458, inlinedAt: !488)
!492 = !DILocation(line: 90, column: 63, scope: !458, inlinedAt: !488)
!493 = !DILocation(line: 90, column: 37, scope: !458, inlinedAt: !488)
!494 = !DILocation(line: 91, column: 69, scope: !495, inlinedAt: !488)
!495 = distinct !DILexicalBlock(scope: !458, file: !3, line: 91, column: 9)
!496 = !DILocation(line: 91, column: 67, scope: !495, inlinedAt: !488)
!497 = !DILocation(line: 91, column: 36, scope: !495, inlinedAt: !488)
!498 = !DILocation(line: 91, column: 9, scope: !495, inlinedAt: !488)
!499 = !DILocation(line: 91, column: 9, scope: !458, inlinedAt: !488)
!500 = !DILocation(line: 94, column: 31, scope: !458, inlinedAt: !488)
!501 = !DILocation(line: 94, column: 20, scope: !458, inlinedAt: !488)
!502 = !DILocation(line: 95, column: 35, scope: !458, inlinedAt: !488)
!503 = !DILocation(line: 95, column: 24, scope: !458, inlinedAt: !488)
!504 = !DILocation(line: 95, column: 16, scope: !458, inlinedAt: !488)
!505 = !DILocation(line: 100, column: 32, scope: !506, inlinedAt: !488)
!506 = distinct !DILexicalBlock(scope: !458, file: !3, line: 100, column: 9)
!507 = !DILocation(line: 100, column: 9, scope: !506, inlinedAt: !488)
!508 = !DILocation(line: 100, column: 57, scope: !506, inlinedAt: !488)
!509 = !DILocation(line: 100, column: 9, scope: !458, inlinedAt: !488)
!510 = !DILocation(line: 98, column: 15, scope: !458, inlinedAt: !488)
!511 = !DILocation(line: 94, column: 12, scope: !458, inlinedAt: !488)
!512 = !DILocation(line: 103, column: 14, scope: !458, inlinedAt: !488)
!513 = !DILocation(line: 103, column: 22, scope: !458, inlinedAt: !488)
!514 = !DILocation(line: 105, column: 24, scope: !458, inlinedAt: !488)
!515 = !DILocation(line: 105, column: 11, scope: !458, inlinedAt: !488)
!516 = !DILocation(line: 106, column: 47, scope: !517, inlinedAt: !488)
!517 = distinct !DILexicalBlock(scope: !458, file: !3, line: 106, column: 9)
!518 = !DILocation(line: 106, column: 73, scope: !517, inlinedAt: !488)
!519 = !DILocation(line: 106, column: 9, scope: !458, inlinedAt: !488)
!520 = !DILocation(line: 109, column: 10, scope: !458, inlinedAt: !488)
!521 = !DILocation(line: 109, column: 18, scope: !458, inlinedAt: !488)
!522 = !DILocation(line: 110, column: 10, scope: !458, inlinedAt: !488)
!523 = !DILocation(line: 110, column: 19, scope: !458, inlinedAt: !488)
!524 = !DILocation(line: 111, column: 10, scope: !458, inlinedAt: !488)
!525 = !DILocation(line: 111, column: 18, scope: !458, inlinedAt: !488)
!526 = !{!527, !350, i64 6}
!527 = !{!"ipv6hdr", !350, i64 0, !350, i64 0, !350, i64 1, !412, i64 4, !350, i64 6, !350, i64 7, !441, i64 8, !441, i64 24}
!528 = !DILocation(line: 112, column: 10, scope: !458, inlinedAt: !488)
!529 = !DILocation(line: 112, column: 20, scope: !458, inlinedAt: !488)
!530 = !{!527, !350, i64 7}
!531 = !DILocation(line: 113, column: 10, scope: !458, inlinedAt: !488)
!532 = !DILocation(line: 113, column: 22, scope: !458, inlinedAt: !488)
!533 = !{!527, !412, i64 4}
!534 = !DILocation(line: 114, column: 28, scope: !458, inlinedAt: !488)
!535 = !DILocation(line: 114, column: 5, scope: !458, inlinedAt: !488)
!536 = !DILocation(line: 116, column: 13, scope: !537, inlinedAt: !488)
!537 = distinct !DILexicalBlock(scope: !458, file: !3, line: 116, column: 9)
!538 = !DILocation(line: 116, column: 33, scope: !537, inlinedAt: !488)
!539 = !DILocation(line: 119, column: 28, scope: !458, inlinedAt: !488)
!540 = !DILocation(line: 119, column: 5, scope: !458, inlinedAt: !488)
!541 = !DILocation(line: 119, column: 36, scope: !458, inlinedAt: !488)
!542 = !DILocation(line: 122, column: 72, scope: !543, inlinedAt: !488)
!543 = distinct !DILexicalBlock(scope: !458, file: !3, line: 122, column: 9)
!544 = !DILocation(line: 122, column: 97, scope: !543, inlinedAt: !488)
!545 = !DILocation(line: 122, column: 9, scope: !458, inlinedAt: !488)
!546 = !DILocation(line: 125, column: 18, scope: !458, inlinedAt: !488)
!547 = !{!548, !350, i64 0}
!548 = !{!"srhhdr", !350, i64 0, !350, i64 1, !350, i64 2, !350, i64 3, !350, i64 4, !350, i64 5, !412, i64 6, !350, i64 8}
!549 = !DILocation(line: 126, column: 32, scope: !458, inlinedAt: !488)
!550 = !DILocation(line: 126, column: 37, scope: !458, inlinedAt: !488)
!551 = !DILocation(line: 126, column: 10, scope: !458, inlinedAt: !488)
!552 = !DILocation(line: 126, column: 20, scope: !458, inlinedAt: !488)
!553 = !{!548, !350, i64 1}
!554 = !DILocation(line: 127, column: 10, scope: !458, inlinedAt: !488)
!555 = !DILocation(line: 127, column: 22, scope: !458, inlinedAt: !488)
!556 = !{!548, !350, i64 2}
!557 = !DILocation(line: 128, column: 29, scope: !458, inlinedAt: !488)
!558 = !DILocation(line: 128, column: 25, scope: !458, inlinedAt: !488)
!559 = !DILocation(line: 128, column: 10, scope: !458, inlinedAt: !488)
!560 = !DILocation(line: 128, column: 23, scope: !458, inlinedAt: !488)
!561 = !{!548, !350, i64 3}
!562 = !DILocation(line: 129, column: 10, scope: !458, inlinedAt: !488)
!563 = !DILocation(line: 129, column: 20, scope: !458, inlinedAt: !488)
!564 = !{!548, !350, i64 4}
!565 = !DILocation(line: 130, column: 10, scope: !458, inlinedAt: !488)
!566 = !DILocation(line: 130, column: 16, scope: !458, inlinedAt: !488)
!567 = !{!548, !350, i64 5}
!568 = !DILocation(line: 131, column: 10, scope: !458, inlinedAt: !488)
!569 = !DILocation(line: 131, column: 14, scope: !458, inlinedAt: !488)
!570 = !{!548, !412, i64 6}
!571 = !DILocation(line: 0, scope: !486, inlinedAt: !488)
!572 = !DILocation(line: 136, column: 15, scope: !573, inlinedAt: !488)
!573 = distinct !DILexicalBlock(scope: !574, file: !3, line: 136, column: 13)
!574 = distinct !DILexicalBlock(scope: !575, file: !3, line: 135, column: 5)
!575 = distinct !DILexicalBlock(scope: !486, file: !3, line: 134, column: 5)
!576 = !DILocation(line: 136, column: 13, scope: !574, inlinedAt: !488)
!577 = !DILocation(line: 139, column: 136, scope: !578, inlinedAt: !488)
!578 = distinct !DILexicalBlock(scope: !574, file: !3, line: 139, column: 13)
!579 = !DILocation(line: 139, column: 141, scope: !578, inlinedAt: !488)
!580 = !DILocation(line: 139, column: 13, scope: !574, inlinedAt: !488)
!581 = !DILocation(line: 142, column: 46, scope: !574, inlinedAt: !488)
!582 = !DILocation(line: 142, column: 9, scope: !574, inlinedAt: !488)
!583 = !DILocation(line: 136, column: 22, scope: !573, inlinedAt: !488)
!584 = !DILocation(line: 142, column: 27, scope: !574, inlinedAt: !488)
!585 = !DILocalVariable(name: "xdp", arg: 1, scope: !586, file: !360, line: 456, type: !61)
!586 = distinct !DISubprogram(name: "rewrite_nexthop", scope: !360, file: !360, line: 456, type: !587, scopeLine: 457, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !589)
!587 = !DISubroutineType(types: !588)
!588 = !{!60, !61, !65}
!589 = !{!585, !590, !591, !592, !593, !594, !595, !596}
!590 = !DILocalVariable(name: "flag", arg: 2, scope: !586, file: !360, line: 456, type: !65)
!591 = !DILocalVariable(name: "data", scope: !586, file: !360, line: 458, type: !53)
!592 = !DILocalVariable(name: "data_end", scope: !586, file: !360, line: 459, type: !53)
!593 = !DILocalVariable(name: "ifindex", scope: !586, file: !360, line: 467, type: !65)
!594 = !DILocalVariable(name: "smac", scope: !586, file: !360, line: 468, type: !122)
!595 = !DILocalVariable(name: "dmac", scope: !586, file: !360, line: 468, type: !122)
!596 = !DILocalVariable(name: "is_exist", scope: !586, file: !360, line: 470, type: !597)
!597 = !DIDerivedType(tag: DW_TAG_typedef, name: "bool", file: !6, line: 79, baseType: !598)
!598 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!599 = !DILocation(line: 0, scope: !586, inlinedAt: !600)
!600 = distinct !DILocation(line: 152, column: 16, scope: !601, inlinedAt: !456)
!601 = distinct !DILexicalBlock(scope: !447, file: !3, line: 151, column: 9)
!602 = !DILocation(line: 458, column: 37, scope: !586, inlinedAt: !600)
!603 = !DILocation(line: 458, column: 26, scope: !586, inlinedAt: !600)
!604 = !DILocation(line: 458, column: 18, scope: !586, inlinedAt: !600)
!605 = !DILocation(line: 459, column: 41, scope: !586, inlinedAt: !600)
!606 = !DILocation(line: 459, column: 30, scope: !586, inlinedAt: !600)
!607 = !DILocation(line: 459, column: 22, scope: !586, inlinedAt: !600)
!608 = !DILocation(line: 462, column: 14, scope: !609, inlinedAt: !600)
!609 = distinct !DILexicalBlock(scope: !586, file: !360, line: 462, column: 9)
!610 = !DILocation(line: 462, column: 18, scope: !609, inlinedAt: !600)
!611 = !DILocation(line: 462, column: 9, scope: !586, inlinedAt: !600)
!612 = !DILocation(line: 467, column: 5, scope: !586, inlinedAt: !600)
!613 = !DILocation(line: 468, column: 5, scope: !586, inlinedAt: !600)
!614 = !DILocation(line: 468, column: 10, scope: !586, inlinedAt: !600)
!615 = !DILocation(line: 468, column: 19, scope: !586, inlinedAt: !600)
!616 = !DILocalVariable(name: "xdp", arg: 1, scope: !617, file: !360, line: 344, type: !61)
!617 = distinct !DISubprogram(name: "lookup_nexthop", scope: !360, file: !360, line: 344, type: !618, scopeLine: 345, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !621)
!618 = !DISubroutineType(types: !619)
!619 = !{!597, !61, !53, !53, !620, !65}
!620 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!621 = !{!616, !622, !623, !624, !625, !626, !627, !628, !629, !630, !631, !632, !633, !635, !636, !637, !639}
!622 = !DILocalVariable(name: "smac", arg: 2, scope: !617, file: !360, line: 344, type: !53)
!623 = !DILocalVariable(name: "dmac", arg: 3, scope: !617, file: !360, line: 344, type: !53)
!624 = !DILocalVariable(name: "ifindex", arg: 4, scope: !617, file: !360, line: 344, type: !620)
!625 = !DILocalVariable(name: "flag", arg: 5, scope: !617, file: !360, line: 344, type: !65)
!626 = !DILocalVariable(name: "data", scope: !617, file: !360, line: 346, type: !53)
!627 = !DILocalVariable(name: "data_end", scope: !617, file: !360, line: 347, type: !53)
!628 = !DILocalVariable(name: "eth", scope: !617, file: !360, line: 348, type: !305)
!629 = !DILocalVariable(name: "iph", scope: !617, file: !360, line: 349, type: !313)
!630 = !DILocalVariable(name: "v6h", scope: !617, file: !360, line: 350, type: !328)
!631 = !DILocalVariable(name: "fib_params", scope: !617, file: !360, line: 351, type: !99)
!632 = !DILocalVariable(name: "h_proto", scope: !617, file: !360, line: 352, type: !55)
!633 = !DILocalVariable(name: "src", scope: !634, file: !360, line: 384, type: !71)
!634 = distinct !DILexicalBlock(scope: !617, file: !360, line: 362, column: 5)
!635 = !DILocalVariable(name: "dst", scope: !634, file: !360, line: 385, type: !71)
!636 = !DILocalVariable(name: "rc", scope: !617, file: !360, line: 407, type: !60)
!637 = !DILocalVariable(name: "source", scope: !638, file: !360, line: 419, type: !96)
!638 = distinct !DILexicalBlock(scope: !617, file: !360, line: 410, column: 5)
!639 = !DILocalVariable(name: "dest", scope: !638, file: !360, line: 420, type: !96)
!640 = !DILocation(line: 0, scope: !617, inlinedAt: !641)
!641 = distinct !DILocation(line: 470, column: 21, scope: !586, inlinedAt: !600)
!642 = !DILocation(line: 0, scope: !359, inlinedAt: !643)
!643 = distinct !DILocation(line: 349, column: 25, scope: !617, inlinedAt: !641)
!644 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !643)
!645 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !643)
!646 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !643)
!647 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !643)
!648 = !DILocation(line: 0, scope: !375, inlinedAt: !649)
!649 = distinct !DILocation(line: 350, column: 27, scope: !617, inlinedAt: !641)
!650 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !649)
!651 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !649)
!652 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !649)
!653 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !649)
!654 = !DILocation(line: 351, column: 5, scope: !617, inlinedAt: !641)
!655 = !DILocation(line: 351, column: 27, scope: !617, inlinedAt: !641)
!656 = !DILocation(line: 355, column: 38, scope: !657, inlinedAt: !641)
!657 = distinct !DILexicalBlock(scope: !617, file: !360, line: 355, column: 9)
!658 = !DILocation(line: 355, column: 9, scope: !617, inlinedAt: !641)
!659 = !DILocation(line: 348, column: 26, scope: !617, inlinedAt: !641)
!660 = !DILocation(line: 358, column: 20, scope: !617, inlinedAt: !641)
!661 = !DILocation(line: 359, column: 5, scope: !617, inlinedAt: !641)
!662 = !DILocation(line: 361, column: 5, scope: !617, inlinedAt: !641)
!663 = !DILocation(line: 364, column: 14, scope: !664, inlinedAt: !641)
!664 = distinct !DILexicalBlock(scope: !634, file: !360, line: 364, column: 13)
!665 = !DILocation(line: 364, column: 13, scope: !634, inlinedAt: !641)
!666 = !DILocation(line: 367, column: 20, scope: !634, inlinedAt: !641)
!667 = !DILocation(line: 367, column: 27, scope: !634, inlinedAt: !641)
!668 = !{!669, !350, i64 0}
!669 = !{!"bpf_fib_lookup", !350, i64 0, !350, i64 1, !412, i64 2, !412, i64 4, !412, i64 6, !349, i64 8, !350, i64 12, !350, i64 16, !350, i64 32, !412, i64 48, !412, i64 50, !350, i64 52, !350, i64 58}
!670 = !DILocation(line: 368, column: 31, scope: !634, inlinedAt: !641)
!671 = !{!429, !350, i64 1}
!672 = !DILocation(line: 368, column: 20, scope: !634, inlinedAt: !641)
!673 = !DILocation(line: 368, column: 24, scope: !634, inlinedAt: !641)
!674 = !{!350, !350, i64 0}
!675 = !DILocation(line: 369, column: 39, scope: !634, inlinedAt: !641)
!676 = !{!429, !350, i64 9}
!677 = !DILocation(line: 369, column: 20, scope: !634, inlinedAt: !641)
!678 = !DILocation(line: 369, column: 32, scope: !634, inlinedAt: !641)
!679 = !{!669, !350, i64 1}
!680 = !DILocation(line: 370, column: 20, scope: !634, inlinedAt: !641)
!681 = !DILocation(line: 370, column: 26, scope: !634, inlinedAt: !641)
!682 = !{!669, !412, i64 2}
!683 = !DILocation(line: 371, column: 20, scope: !634, inlinedAt: !641)
!684 = !DILocation(line: 371, column: 26, scope: !634, inlinedAt: !641)
!685 = !{!669, !412, i64 4}
!686 = !DILocation(line: 372, column: 30, scope: !634, inlinedAt: !641)
!687 = !DILocation(line: 372, column: 20, scope: !634, inlinedAt: !641)
!688 = !DILocation(line: 372, column: 28, scope: !634, inlinedAt: !641)
!689 = !{!669, !412, i64 6}
!690 = !DILocation(line: 373, column: 36, scope: !634, inlinedAt: !641)
!691 = !{!429, !349, i64 12}
!692 = !DILocation(line: 373, column: 20, scope: !634, inlinedAt: !641)
!693 = !DILocation(line: 373, column: 29, scope: !634, inlinedAt: !641)
!694 = !DILocation(line: 374, column: 36, scope: !634, inlinedAt: !641)
!695 = !DILocation(line: 374, column: 20, scope: !634, inlinedAt: !641)
!696 = !DILocation(line: 374, column: 29, scope: !634, inlinedAt: !641)
!697 = !DILocation(line: 375, column: 9, scope: !634, inlinedAt: !641)
!698 = !DILocation(line: 378, column: 14, scope: !699, inlinedAt: !641)
!699 = distinct !DILexicalBlock(scope: !634, file: !360, line: 378, column: 13)
!700 = !DILocation(line: 378, column: 13, scope: !634, inlinedAt: !641)
!701 = !DILocation(line: 381, column: 18, scope: !702, inlinedAt: !641)
!702 = distinct !DILexicalBlock(scope: !634, file: !360, line: 381, column: 13)
!703 = !DILocation(line: 381, column: 28, scope: !702, inlinedAt: !641)
!704 = !DILocation(line: 381, column: 13, scope: !634, inlinedAt: !641)
!705 = !DILocation(line: 384, column: 62, scope: !634, inlinedAt: !641)
!706 = !DILocation(line: 0, scope: !634, inlinedAt: !641)
!707 = !DILocation(line: 385, column: 62, scope: !634, inlinedAt: !641)
!708 = !DILocation(line: 387, column: 20, scope: !634, inlinedAt: !641)
!709 = !DILocation(line: 387, column: 27, scope: !634, inlinedAt: !641)
!710 = !DILocation(line: 388, column: 20, scope: !634, inlinedAt: !641)
!711 = !DILocation(line: 388, column: 24, scope: !634, inlinedAt: !641)
!712 = !DILocation(line: 389, column: 31, scope: !634, inlinedAt: !641)
!713 = !{!349, !349, i64 0}
!714 = !DILocation(line: 389, column: 46, scope: !634, inlinedAt: !641)
!715 = !DILocation(line: 389, column: 20, scope: !634, inlinedAt: !641)
!716 = !DILocation(line: 389, column: 29, scope: !634, inlinedAt: !641)
!717 = !DILocation(line: 390, column: 39, scope: !634, inlinedAt: !641)
!718 = !DILocation(line: 390, column: 20, scope: !634, inlinedAt: !641)
!719 = !DILocation(line: 390, column: 32, scope: !634, inlinedAt: !641)
!720 = !DILocation(line: 391, column: 20, scope: !634, inlinedAt: !641)
!721 = !DILocation(line: 391, column: 26, scope: !634, inlinedAt: !641)
!722 = !DILocation(line: 392, column: 20, scope: !634, inlinedAt: !641)
!723 = !DILocation(line: 392, column: 26, scope: !634, inlinedAt: !641)
!724 = !DILocation(line: 393, column: 30, scope: !634, inlinedAt: !641)
!725 = !DILocation(line: 393, column: 20, scope: !634, inlinedAt: !641)
!726 = !DILocation(line: 393, column: 28, scope: !634, inlinedAt: !641)
!727 = !DILocation(line: 394, column: 21, scope: !634, inlinedAt: !641)
!728 = !{i64 0, i64 16, !674, i64 0, i64 16, !674, i64 0, i64 16, !674}
!729 = !DILocation(line: 395, column: 21, scope: !634, inlinedAt: !641)
!730 = !DILocation(line: 396, column: 9, scope: !634, inlinedAt: !641)
!731 = !DILocation(line: 405, column: 31, scope: !617, inlinedAt: !641)
!732 = !{!348, !349, i64 12}
!733 = !DILocation(line: 405, column: 16, scope: !617, inlinedAt: !641)
!734 = !DILocation(line: 405, column: 24, scope: !617, inlinedAt: !641)
!735 = !{!669, !349, i64 8}
!736 = !DILocation(line: 407, column: 29, scope: !617, inlinedAt: !641)
!737 = !DILocation(line: 407, column: 14, scope: !617, inlinedAt: !641)
!738 = !DILocation(line: 409, column: 5, scope: !617, inlinedAt: !641)
!739 = !DILocation(line: 412, column: 13, scope: !638, inlinedAt: !641)
!740 = !DILocalVariable(name: "iph", arg: 1, scope: !741, file: !360, line: 154, type: !313)
!741 = distinct !DISubprogram(name: "ip_decrease_ttl", scope: !360, file: !360, line: 154, type: !742, scopeLine: 155, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !744)
!742 = !DISubroutineType(types: !743)
!743 = !{!60, !313}
!744 = !{!740, !745}
!745 = !DILocalVariable(name: "check", scope: !741, file: !360, line: 156, type: !65)
!746 = !DILocation(line: 0, scope: !741, inlinedAt: !747)
!747 = distinct !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !641)
!748 = distinct !DILexicalBlock(scope: !638, file: !360, line: 412, column: 13)
!749 = !DILocation(line: 156, column: 31, scope: !741, inlinedAt: !747)
!750 = !{!429, !412, i64 10}
!751 = !DILocation(line: 158, column: 11, scope: !741, inlinedAt: !747)
!752 = !DILocation(line: 159, column: 43, scope: !741, inlinedAt: !747)
!753 = !DILocation(line: 159, column: 34, scope: !741, inlinedAt: !747)
!754 = !DILocation(line: 159, column: 16, scope: !741, inlinedAt: !747)
!755 = !DILocation(line: 160, column: 19, scope: !741, inlinedAt: !747)
!756 = !DILocation(line: 160, column: 12, scope: !741, inlinedAt: !747)
!757 = !{!429, !350, i64 8}
!758 = !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !641)
!759 = !DILocation(line: 415, column: 18, scope: !760, inlinedAt: !641)
!760 = distinct !DILexicalBlock(scope: !748, file: !360, line: 414, column: 18)
!761 = !DILocation(line: 415, column: 27, scope: !760, inlinedAt: !641)
!762 = !DILocation(line: 415, column: 13, scope: !760, inlinedAt: !641)
!763 = !DILocation(line: 454, column: 1, scope: !617, inlinedAt: !641)
!764 = !DILocation(line: 471, column: 9, scope: !586, inlinedAt: !600)
!765 = !DILocation(line: 417, column: 31, scope: !638, inlinedAt: !641)
!766 = !DILocation(line: 417, column: 18, scope: !638, inlinedAt: !641)
!767 = !DILocation(line: 0, scope: !638, inlinedAt: !641)
!768 = !DILocation(line: 421, column: 43, scope: !638, inlinedAt: !641)
!769 = !DILocation(line: 421, column: 9, scope: !638, inlinedAt: !641)
!770 = !DILocation(line: 422, column: 45, scope: !638, inlinedAt: !641)
!771 = !DILocation(line: 422, column: 9, scope: !638, inlinedAt: !641)
!772 = !DILocalVariable(name: "data", arg: 1, scope: !773, file: !360, line: 217, type: !53)
!773 = distinct !DISubprogram(name: "set_src_dst_mac", scope: !360, file: !360, line: 217, type: !774, scopeLine: 218, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !776)
!774 = !DISubroutineType(types: !775)
!775 = !{null, !53, !53, !53}
!776 = !{!772, !777, !778, !779, !781, !782}
!777 = !DILocalVariable(name: "src", arg: 2, scope: !773, file: !360, line: 217, type: !53)
!778 = !DILocalVariable(name: "dst", arg: 3, scope: !773, file: !360, line: 217, type: !53)
!779 = !DILocalVariable(name: "source", scope: !773, file: !360, line: 219, type: !780)
!780 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!781 = !DILocalVariable(name: "dest", scope: !773, file: !360, line: 220, type: !780)
!782 = !DILocalVariable(name: "p", scope: !773, file: !360, line: 221, type: !780)
!783 = !DILocation(line: 0, scope: !773, inlinedAt: !784)
!784 = distinct !DILocation(line: 473, column: 9, scope: !785, inlinedAt: !600)
!785 = distinct !DILexicalBlock(scope: !786, file: !360, line: 472, column: 5)
!786 = distinct !DILexicalBlock(scope: !586, file: !360, line: 471, column: 9)
!787 = !DILocation(line: 223, column: 5, scope: !773, inlinedAt: !784)
!788 = !DILocation(line: 224, column: 24, scope: !773, inlinedAt: !784)
!789 = !DILocation(line: 224, column: 5, scope: !773, inlinedAt: !784)
!790 = !DILocation(line: 475, column: 14, scope: !791, inlinedAt: !600)
!791 = distinct !DILexicalBlock(scope: !785, file: !360, line: 475, column: 13)
!792 = !DILocation(line: 475, column: 13, scope: !785, inlinedAt: !600)
!793 = !DILocation(line: 478, column: 18, scope: !794, inlinedAt: !600)
!794 = distinct !DILexicalBlock(scope: !785, file: !360, line: 478, column: 13)
!795 = !DILocation(line: 478, column: 37, scope: !794, inlinedAt: !600)
!796 = !DILocation(line: 478, column: 34, scope: !794, inlinedAt: !600)
!797 = !DILocation(line: 478, column: 13, scope: !785, inlinedAt: !600)
!798 = !DILocation(line: 484, column: 16, scope: !785, inlinedAt: !600)
!799 = !DILocation(line: 484, column: 9, scope: !785, inlinedAt: !600)
!800 = !DILocation(line: 488, column: 1, scope: !586, inlinedAt: !600)
!801 = !DILocation(line: 0, scope: !397, inlinedAt: !802)
!802 = distinct !DILocation(line: 428, column: 24, scope: !444)
!803 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !802)
!804 = !DILocation(line: 428, column: 17, scope: !444)
!805 = !DILocalVariable(name: "xdp", arg: 1, scope: !806, file: !3, line: 156, type: !61)
!806 = distinct !DISubprogram(name: "transit_gtp4_encap", scope: !3, file: !3, line: 156, type: !807, scopeLine: 157, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !809)
!807 = !DISubroutineType(types: !808)
!808 = !{!60, !61, !213}
!809 = !{!805, !810, !811, !812, !813, !814, !815, !816, !817, !818, !819, !820, !821, !822, !823, !824, !832, !833, !834, !849, !850, !851, !852, !853, !854, !855, !856}
!810 = !DILocalVariable(name: "tb", arg: 2, scope: !806, file: !3, line: 156, type: !213)
!811 = !DILocalVariable(name: "data", scope: !806, file: !3, line: 159, type: !53)
!812 = !DILocalVariable(name: "data_end", scope: !806, file: !3, line: 160, type: !53)
!813 = !DILocalVariable(name: "iph", scope: !806, file: !3, line: 161, type: !313)
!814 = !DILocalVariable(name: "type", scope: !806, file: !3, line: 162, type: !79)
!815 = !DILocalVariable(name: "tid", scope: !806, file: !3, line: 163, type: !65)
!816 = !DILocalVariable(name: "v6h", scope: !806, file: !3, line: 165, type: !328)
!817 = !DILocalVariable(name: "srh", scope: !806, file: !3, line: 166, type: !469)
!818 = !DILocalVariable(name: "srh_len", scope: !806, file: !3, line: 167, type: !79)
!819 = !DILocalVariable(name: "decap_len", scope: !806, file: !3, line: 168, type: !55)
!820 = !DILocalVariable(name: "encap_len", scope: !806, file: !3, line: 168, type: !55)
!821 = !DILocalVariable(name: "innerlen", scope: !806, file: !3, line: 169, type: !55)
!822 = !DILocalVariable(name: "outer_saddr", scope: !806, file: !3, line: 170, type: !65)
!823 = !DILocalVariable(name: "outer_daddr", scope: !806, file: !3, line: 170, type: !65)
!824 = !DILocalVariable(name: "gtp1h", scope: !806, file: !3, line: 178, type: !825)
!825 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !826, size: 64)
!826 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "gtp1hdr", file: !166, line: 75, size: 64, elements: !827)
!827 = !{!828, !829, !830, !831}
!828 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !826, file: !166, line: 83, baseType: !79, size: 8)
!829 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !826, file: !166, line: 84, baseType: !79, size: 8, offset: 8)
!830 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !826, file: !166, line: 85, baseType: !55, size: 16, offset: 16)
!831 = !DIDerivedType(tag: DW_TAG_member, name: "tid", scope: !826, file: !166, line: 86, baseType: !65, size: 32, offset: 32)
!832 = !DILocalVariable(name: "seg_len", scope: !806, file: !3, line: 207, type: !65)
!833 = !DILocalVariable(name: "new_eth", scope: !806, file: !3, line: 222, type: !305)
!834 = !DILocalVariable(name: "args", scope: !806, file: !3, line: 243, type: !835)
!835 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "args_mob_session", file: !166, line: 96, size: 40, elements: !836)
!836 = !{!837, !838, !839, !840}
!837 = !DIDerivedType(tag: DW_TAG_member, name: "qfi", scope: !835, file: !166, line: 98, baseType: !79, size: 6, flags: DIFlagBitField, extraData: i64 0)
!838 = !DIDerivedType(tag: DW_TAG_member, name: "r", scope: !835, file: !166, line: 99, baseType: !79, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!839 = !DIDerivedType(tag: DW_TAG_member, name: "u", scope: !835, file: !166, line: 100, baseType: !79, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!840 = !DIDerivedType(tag: DW_TAG_member, name: "session", scope: !835, file: !166, line: 110, baseType: !841, size: 32, offset: 8)
!841 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !835, file: !166, line: 102, size: 32, elements: !842)
!842 = !{!843, !844}
!843 = !DIDerivedType(tag: DW_TAG_member, name: "pdu_session_id", scope: !841, file: !166, line: 104, baseType: !65, size: 32)
!844 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !841, file: !166, line: 109, baseType: !845, size: 32)
!845 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "seq", file: !166, line: 105, size: 32, elements: !846)
!846 = !{!847, !848}
!847 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !845, file: !166, line: 107, baseType: !55, size: 16)
!848 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !845, file: !166, line: 108, baseType: !55, size: 16, offset: 16)
!849 = !DILocalVariable(name: "s_offset", scope: !806, file: !3, line: 244, type: !55)
!850 = !DILocalVariable(name: "s_shift", scope: !806, file: !3, line: 244, type: !55)
!851 = !DILocalVariable(name: "d_offset", scope: !806, file: !3, line: 244, type: !55)
!852 = !DILocalVariable(name: "d_shift", scope: !806, file: !3, line: 244, type: !55)
!853 = !DILocalVariable(name: "src_p", scope: !806, file: !3, line: 258, type: !96)
!854 = !DILocalVariable(name: "dst_p", scope: !806, file: !3, line: 258, type: !96)
!855 = !DILocalVariable(name: "args_p", scope: !806, file: !3, line: 258, type: !96)
!856 = !DILocalVariable(name: "i", scope: !857, file: !3, line: 286, type: !55)
!857 = distinct !DILexicalBlock(scope: !806, file: !3, line: 286, column: 5)
!858 = !DILocation(line: 0, scope: !806, inlinedAt: !859)
!859 = distinct !DILocation(line: 431, column: 55, scope: !444)
!860 = !DILocation(line: 159, column: 46, scope: !806, inlinedAt: !859)
!861 = !DILocation(line: 159, column: 26, scope: !806, inlinedAt: !859)
!862 = !DILocation(line: 159, column: 18, scope: !806, inlinedAt: !859)
!863 = !DILocation(line: 160, column: 50, scope: !806, inlinedAt: !859)
!864 = !DILocation(line: 0, scope: !359, inlinedAt: !865)
!865 = distinct !DILocation(line: 161, column: 25, scope: !806, inlinedAt: !859)
!866 = !DILocation(line: 254, column: 30, scope: !359, inlinedAt: !865)
!867 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !865)
!868 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !865)
!869 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !865)
!870 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !865)
!871 = !DILocation(line: 170, column: 5, scope: !806, inlinedAt: !859)
!872 = !DILocation(line: 171, column: 10, scope: !873, inlinedAt: !859)
!873 = distinct !DILexicalBlock(scope: !806, file: !3, line: 171, column: 9)
!874 = !DILocation(line: 171, column: 9, scope: !806, inlinedAt: !859)
!875 = !DILocation(line: 160, column: 22, scope: !806, inlinedAt: !859)
!876 = !DILocation(line: 175, column: 14, scope: !877, inlinedAt: !859)
!877 = distinct !DILexicalBlock(scope: !806, file: !3, line: 175, column: 9)
!878 = !DILocation(line: 175, column: 23, scope: !877, inlinedAt: !859)
!879 = !DILocation(line: 175, column: 9, scope: !806, inlinedAt: !859)
!880 = !DILocation(line: 182, column: 43, scope: !806, inlinedAt: !859)
!881 = !DILocation(line: 182, column: 5, scope: !806, inlinedAt: !859)
!882 = !DILocation(line: 183, column: 43, scope: !806, inlinedAt: !859)
!883 = !DILocation(line: 183, column: 5, scope: !806, inlinedAt: !859)
!884 = !DILocation(line: 188, column: 18, scope: !806, inlinedAt: !859)
!885 = !{!886, !349, i64 4}
!886 = !{!"gtp1hdr", !350, i64 0, !350, i64 1, !412, i64 2, !349, i64 4}
!887 = !DILocation(line: 189, column: 19, scope: !806, inlinedAt: !859)
!888 = !{!886, !350, i64 1}
!889 = !DILocation(line: 190, column: 16, scope: !806, inlinedAt: !859)
!890 = !{!886, !412, i64 2}
!891 = !DILocation(line: 192, column: 14, scope: !892, inlinedAt: !859)
!892 = distinct !DILexicalBlock(scope: !806, file: !3, line: 192, column: 9)
!893 = !DILocation(line: 192, column: 9, scope: !806, inlinedAt: !859)
!894 = !DILocation(line: 195, column: 13, scope: !895, inlinedAt: !859)
!895 = distinct !DILexicalBlock(scope: !806, file: !3, line: 195, column: 9)
!896 = !{!440, !349, i64 32}
!897 = !DILocation(line: 195, column: 25, scope: !895, inlinedAt: !859)
!898 = !DILocation(line: 195, column: 30, scope: !895, inlinedAt: !859)
!899 = !DILocation(line: 195, column: 37, scope: !895, inlinedAt: !859)
!900 = !{!440, !349, i64 36}
!901 = !DILocation(line: 195, column: 54, scope: !895, inlinedAt: !859)
!902 = !DILocation(line: 207, column: 25, scope: !806, inlinedAt: !859)
!903 = !DILocation(line: 207, column: 40, scope: !806, inlinedAt: !859)
!904 = !DILocation(line: 208, column: 66, scope: !806, inlinedAt: !859)
!905 = !DILocation(line: 208, column: 64, scope: !806, inlinedAt: !859)
!906 = !DILocation(line: 208, column: 37, scope: !806, inlinedAt: !859)
!907 = !DILocation(line: 211, column: 23, scope: !806, inlinedAt: !859)
!908 = !DILocation(line: 213, column: 9, scope: !909, inlinedAt: !859)
!909 = distinct !DILexicalBlock(scope: !806, file: !3, line: 213, column: 9)
!910 = !DILocation(line: 213, column: 9, scope: !806, inlinedAt: !859)
!911 = !DILocation(line: 210, column: 42, scope: !806, inlinedAt: !859)
!912 = !DILocation(line: 210, column: 40, scope: !806, inlinedAt: !859)
!913 = !DILocation(line: 216, column: 36, scope: !914, inlinedAt: !859)
!914 = distinct !DILexicalBlock(scope: !806, file: !3, line: 216, column: 9)
!915 = !DILocation(line: 216, column: 9, scope: !914, inlinedAt: !859)
!916 = !DILocation(line: 216, column: 9, scope: !806, inlinedAt: !859)
!917 = !DILocation(line: 219, column: 31, scope: !806, inlinedAt: !859)
!918 = !DILocation(line: 219, column: 20, scope: !806, inlinedAt: !859)
!919 = !DILocation(line: 220, column: 35, scope: !806, inlinedAt: !859)
!920 = !DILocation(line: 220, column: 24, scope: !806, inlinedAt: !859)
!921 = !DILocation(line: 220, column: 16, scope: !806, inlinedAt: !859)
!922 = !DILocation(line: 223, column: 32, scope: !923, inlinedAt: !859)
!923 = distinct !DILexicalBlock(scope: !806, file: !3, line: 223, column: 9)
!924 = !DILocation(line: 223, column: 9, scope: !923, inlinedAt: !859)
!925 = !DILocation(line: 223, column: 57, scope: !923, inlinedAt: !859)
!926 = !DILocation(line: 223, column: 9, scope: !806, inlinedAt: !859)
!927 = !DILocation(line: 222, column: 30, scope: !806, inlinedAt: !859)
!928 = !DILocation(line: 219, column: 12, scope: !806, inlinedAt: !859)
!929 = !DILocation(line: 226, column: 14, scope: !806, inlinedAt: !859)
!930 = !DILocation(line: 226, column: 22, scope: !806, inlinedAt: !859)
!931 = !DILocation(line: 228, column: 24, scope: !806, inlinedAt: !859)
!932 = !DILocation(line: 228, column: 11, scope: !806, inlinedAt: !859)
!933 = !DILocation(line: 229, column: 47, scope: !934, inlinedAt: !859)
!934 = distinct !DILexicalBlock(scope: !806, file: !3, line: 229, column: 9)
!935 = !DILocation(line: 229, column: 73, scope: !934, inlinedAt: !859)
!936 = !DILocation(line: 229, column: 9, scope: !806, inlinedAt: !859)
!937 = !DILocation(line: 232, column: 10, scope: !806, inlinedAt: !859)
!938 = !DILocation(line: 232, column: 18, scope: !806, inlinedAt: !859)
!939 = !DILocation(line: 233, column: 10, scope: !806, inlinedAt: !859)
!940 = !DILocation(line: 233, column: 19, scope: !806, inlinedAt: !859)
!941 = !DILocation(line: 234, column: 10, scope: !806, inlinedAt: !859)
!942 = !DILocation(line: 234, column: 18, scope: !806, inlinedAt: !859)
!943 = !DILocation(line: 235, column: 10, scope: !806, inlinedAt: !859)
!944 = !DILocation(line: 235, column: 20, scope: !806, inlinedAt: !859)
!945 = !DILocation(line: 236, column: 10, scope: !806, inlinedAt: !859)
!946 = !DILocation(line: 236, column: 22, scope: !806, inlinedAt: !859)
!947 = !DILocation(line: 237, column: 28, scope: !806, inlinedAt: !859)
!948 = !DILocation(line: 237, column: 5, scope: !806, inlinedAt: !859)
!949 = !DILocation(line: 238, column: 21, scope: !950, inlinedAt: !859)
!950 = distinct !DILexicalBlock(scope: !806, file: !3, line: 238, column: 9)
!951 = !DILocation(line: 241, column: 28, scope: !806, inlinedAt: !859)
!952 = !DILocation(line: 241, column: 5, scope: !806, inlinedAt: !859)
!953 = !DILocation(line: 241, column: 40, scope: !806, inlinedAt: !859)
!954 = !DILocation(line: 241, column: 36, scope: !806, inlinedAt: !859)
!955 = !DILocation(line: 243, column: 5, scope: !806, inlinedAt: !859)
!956 = !DILocation(line: 243, column: 29, scope: !806, inlinedAt: !859)
!957 = !DILocation(line: 246, column: 20, scope: !806, inlinedAt: !859)
!958 = !DILocation(line: 246, column: 32, scope: !806, inlinedAt: !859)
!959 = !DILocation(line: 246, column: 16, scope: !806, inlinedAt: !859)
!960 = !DILocation(line: 247, column: 15, scope: !806, inlinedAt: !859)
!961 = !DILocation(line: 248, column: 20, scope: !806, inlinedAt: !859)
!962 = !DILocation(line: 248, column: 32, scope: !806, inlinedAt: !859)
!963 = !DILocation(line: 248, column: 16, scope: !806, inlinedAt: !859)
!964 = !DILocation(line: 249, column: 15, scope: !806, inlinedAt: !859)
!965 = !DILocation(line: 253, column: 12, scope: !806, inlinedAt: !859)
!966 = !DILocation(line: 255, column: 18, scope: !806, inlinedAt: !859)
!967 = !DILocation(line: 255, column: 33, scope: !806, inlinedAt: !859)
!968 = !DILocalVariable(name: "v6addr", arg: 1, scope: !969, file: !360, line: 114, type: !71)
!969 = distinct !DISubprogram(name: "write_v6addr_in_pyload", scope: !360, file: !360, line: 113, type: !970, scopeLine: 115, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !974)
!970 = !DISubroutineType(types: !971)
!971 = !{null, !71, !96, !55, !55, !55, !972}
!972 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !973, size: 64)
!973 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !65)
!974 = !{!968, !975, !976, !977, !978, !979, !980, !984, !987}
!975 = !DILocalVariable(name: "payload", arg: 2, scope: !969, file: !360, line: 114, type: !96)
!976 = !DILocalVariable(name: "payload_size", arg: 3, scope: !969, file: !360, line: 114, type: !55)
!977 = !DILocalVariable(name: "offset", arg: 4, scope: !969, file: !360, line: 114, type: !55)
!978 = !DILocalVariable(name: "shift", arg: 5, scope: !969, file: !360, line: 114, type: !55)
!979 = !DILocalVariable(name: "data_end", arg: 6, scope: !969, file: !360, line: 114, type: !972)
!980 = !DILocalVariable(name: "index", scope: !981, file: !360, line: 133, type: !55)
!981 = distinct !DILexicalBlock(scope: !982, file: !360, line: 133, column: 9)
!982 = distinct !DILexicalBlock(scope: !983, file: !360, line: 131, column: 5)
!983 = distinct !DILexicalBlock(scope: !969, file: !360, line: 123, column: 9)
!984 = !DILocalVariable(name: "v6val1", scope: !985, file: !360, line: 140, type: !96)
!985 = distinct !DILexicalBlock(scope: !986, file: !360, line: 134, column: 9)
!986 = distinct !DILexicalBlock(scope: !981, file: !360, line: 133, column: 9)
!987 = !DILocalVariable(name: "v6val2", scope: !985, file: !360, line: 141, type: !96)
!988 = !DILocation(line: 0, scope: !969, inlinedAt: !989)
!989 = distinct !DILocation(line: 263, column: 5, scope: !806, inlinedAt: !859)
!990 = !DILocation(line: 116, column: 21, scope: !969, inlinedAt: !989)
!991 = !DILocation(line: 118, column: 36, scope: !992, inlinedAt: !989)
!992 = distinct !DILexicalBlock(scope: !969, file: !360, line: 118, column: 9)
!993 = !DILocation(line: 118, column: 43, scope: !992, inlinedAt: !989)
!994 = !DILocation(line: 123, column: 9, scope: !983, inlinedAt: !989)
!995 = !DILocation(line: 123, column: 15, scope: !983, inlinedAt: !989)
!996 = !DILocation(line: 0, scope: !983, inlinedAt: !989)
!997 = !DILocation(line: 123, column: 9, scope: !969, inlinedAt: !989)
!998 = !DILocation(line: 0, scope: !981, inlinedAt: !989)
!999 = !DILocation(line: 0, scope: !1000, inlinedAt: !989)
!1000 = distinct !DILexicalBlock(scope: !1001, file: !360, line: 143, column: 13)
!1001 = distinct !DILexicalBlock(scope: !985, file: !360, line: 142, column: 17)
!1002 = !DILocation(line: 133, column: 9, scope: !981, inlinedAt: !989)
!1003 = !DILocation(line: 125, column: 37, scope: !1004, inlinedAt: !989)
!1004 = distinct !DILexicalBlock(scope: !1005, file: !360, line: 125, column: 13)
!1005 = distinct !DILexicalBlock(scope: !983, file: !360, line: 124, column: 5)
!1006 = !DILocation(line: 125, column: 52, scope: !1004, inlinedAt: !989)
!1007 = !DILocation(line: 125, column: 13, scope: !1005, inlinedAt: !989)
!1008 = !DILocation(line: 128, column: 35, scope: !1005, inlinedAt: !989)
!1009 = !DILocation(line: 128, column: 41, scope: !1005, inlinedAt: !989)
!1010 = !DILocation(line: 128, column: 27, scope: !1005, inlinedAt: !989)
!1011 = !DILocation(line: 128, column: 9, scope: !1005, inlinedAt: !989)
!1012 = !DILocation(line: 129, column: 5, scope: !1005, inlinedAt: !989)
!1013 = !DILocation(line: 140, column: 60, scope: !985, inlinedAt: !989)
!1014 = !DILocation(line: 0, scope: !985, inlinedAt: !989)
!1015 = !DILocation(line: 141, column: 68, scope: !985, inlinedAt: !989)
!1016 = !DILocation(line: 142, column: 28, scope: !1001, inlinedAt: !989)
!1017 = !DILocation(line: 142, column: 40, scope: !1001, inlinedAt: !989)
!1018 = !DILocation(line: 144, column: 28, scope: !1000, inlinedAt: !989)
!1019 = !DILocation(line: 144, column: 43, scope: !1000, inlinedAt: !989)
!1020 = !DILocation(line: 144, column: 25, scope: !1000, inlinedAt: !989)
!1021 = !DILocation(line: 145, column: 43, scope: !1000, inlinedAt: !989)
!1022 = !DILocation(line: 145, column: 25, scope: !1000, inlinedAt: !989)
!1023 = !DILocation(line: 133, column: 69, scope: !986, inlinedAt: !989)
!1024 = distinct !{!1024, !1002, !1025, !1026}
!1025 = !DILocation(line: 149, column: 9, scope: !981, inlinedAt: !989)
!1026 = !{!"llvm.loop.unroll.disable"}
!1027 = !DILocation(line: 266, column: 72, scope: !1028, inlinedAt: !859)
!1028 = distinct !DILexicalBlock(scope: !806, file: !3, line: 266, column: 9)
!1029 = !DILocation(line: 266, column: 97, scope: !1028, inlinedAt: !859)
!1030 = !DILocation(line: 266, column: 9, scope: !806, inlinedAt: !859)
!1031 = !DILocation(line: 269, column: 18, scope: !806, inlinedAt: !859)
!1032 = !DILocation(line: 270, column: 32, scope: !806, inlinedAt: !859)
!1033 = !DILocation(line: 270, column: 37, scope: !806, inlinedAt: !859)
!1034 = !DILocation(line: 270, column: 10, scope: !806, inlinedAt: !859)
!1035 = !DILocation(line: 270, column: 20, scope: !806, inlinedAt: !859)
!1036 = !DILocation(line: 271, column: 10, scope: !806, inlinedAt: !859)
!1037 = !DILocation(line: 271, column: 22, scope: !806, inlinedAt: !859)
!1038 = !DILocation(line: 272, column: 25, scope: !806, inlinedAt: !859)
!1039 = !DILocation(line: 272, column: 10, scope: !806, inlinedAt: !859)
!1040 = !DILocation(line: 272, column: 23, scope: !806, inlinedAt: !859)
!1041 = !DILocation(line: 273, column: 10, scope: !806, inlinedAt: !859)
!1042 = !DILocation(line: 273, column: 20, scope: !806, inlinedAt: !859)
!1043 = !DILocation(line: 274, column: 10, scope: !806, inlinedAt: !859)
!1044 = !DILocation(line: 274, column: 16, scope: !806, inlinedAt: !859)
!1045 = !DILocation(line: 275, column: 10, scope: !806, inlinedAt: !859)
!1046 = !DILocation(line: 275, column: 14, scope: !806, inlinedAt: !859)
!1047 = !DILocation(line: 276, column: 122, scope: !1048, inlinedAt: !859)
!1048 = distinct !DILexicalBlock(scope: !806, file: !3, line: 276, column: 9)
!1049 = !DILocation(line: 276, column: 127, scope: !1048, inlinedAt: !859)
!1050 = !DILocation(line: 276, column: 9, scope: !806, inlinedAt: !859)
!1051 = !DILocation(line: 279, column: 5, scope: !806, inlinedAt: !859)
!1052 = !DILocation(line: 280, column: 28, scope: !806, inlinedAt: !859)
!1053 = !DILocation(line: 280, column: 23, scope: !806, inlinedAt: !859)
!1054 = !DILocation(line: 280, column: 46, scope: !806, inlinedAt: !859)
!1055 = !DILocation(line: 280, column: 5, scope: !806, inlinedAt: !859)
!1056 = !DILocation(line: 0, scope: !969, inlinedAt: !1057)
!1057 = distinct !DILocation(line: 281, column: 5, scope: !806, inlinedAt: !859)
!1058 = !DILocation(line: 116, column: 21, scope: !969, inlinedAt: !1057)
!1059 = !DILocation(line: 118, column: 36, scope: !992, inlinedAt: !1057)
!1060 = !DILocation(line: 118, column: 43, scope: !992, inlinedAt: !1057)
!1061 = !DILocation(line: 123, column: 15, scope: !983, inlinedAt: !1057)
!1062 = !DILocation(line: 0, scope: !983, inlinedAt: !1057)
!1063 = !DILocation(line: 123, column: 9, scope: !969, inlinedAt: !1057)
!1064 = !DILocation(line: 0, scope: !981, inlinedAt: !1057)
!1065 = !DILocation(line: 0, scope: !1000, inlinedAt: !1057)
!1066 = !DILocation(line: 133, column: 9, scope: !981, inlinedAt: !1057)
!1067 = !DILocation(line: 125, column: 37, scope: !1004, inlinedAt: !1057)
!1068 = !DILocation(line: 125, column: 52, scope: !1004, inlinedAt: !1057)
!1069 = !DILocation(line: 125, column: 13, scope: !1005, inlinedAt: !1057)
!1070 = !DILocation(line: 128, column: 35, scope: !1005, inlinedAt: !1057)
!1071 = !DILocation(line: 128, column: 41, scope: !1005, inlinedAt: !1057)
!1072 = !DILocation(line: 128, column: 27, scope: !1005, inlinedAt: !1057)
!1073 = !DILocation(line: 128, column: 9, scope: !1005, inlinedAt: !1057)
!1074 = !DILocation(line: 129, column: 5, scope: !1005, inlinedAt: !1057)
!1075 = !DILocation(line: 140, column: 60, scope: !985, inlinedAt: !1057)
!1076 = !DILocation(line: 0, scope: !985, inlinedAt: !1057)
!1077 = !DILocation(line: 141, column: 68, scope: !985, inlinedAt: !1057)
!1078 = !DILocation(line: 142, column: 28, scope: !1001, inlinedAt: !1057)
!1079 = !DILocation(line: 142, column: 40, scope: !1001, inlinedAt: !1057)
!1080 = !DILocation(line: 144, column: 28, scope: !1000, inlinedAt: !1057)
!1081 = !DILocation(line: 144, column: 43, scope: !1000, inlinedAt: !1057)
!1082 = !DILocation(line: 144, column: 25, scope: !1000, inlinedAt: !1057)
!1083 = !DILocation(line: 145, column: 28, scope: !1000, inlinedAt: !1057)
!1084 = !DILocation(line: 145, column: 43, scope: !1000, inlinedAt: !1057)
!1085 = !DILocation(line: 145, column: 25, scope: !1000, inlinedAt: !1057)
!1086 = !DILocation(line: 133, column: 69, scope: !986, inlinedAt: !1057)
!1087 = distinct !{!1087, !1066, !1088, !1026}
!1088 = !DILocation(line: 149, column: 9, scope: !981, inlinedAt: !1057)
!1089 = !DILocation(line: 282, column: 14, scope: !806, inlinedAt: !859)
!1090 = !DILocation(line: 0, scope: !969, inlinedAt: !1091)
!1091 = distinct !DILocation(line: 283, column: 5, scope: !806, inlinedAt: !859)
!1092 = !DILocation(line: 116, column: 21, scope: !969, inlinedAt: !1091)
!1093 = !DILocation(line: 118, column: 36, scope: !992, inlinedAt: !1091)
!1094 = !DILocation(line: 118, column: 43, scope: !992, inlinedAt: !1091)
!1095 = !DILocation(line: 123, column: 15, scope: !983, inlinedAt: !1091)
!1096 = !DILocation(line: 0, scope: !983, inlinedAt: !1091)
!1097 = !DILocation(line: 123, column: 9, scope: !969, inlinedAt: !1091)
!1098 = !DILocation(line: 0, scope: !981, inlinedAt: !1091)
!1099 = !DILocation(line: 0, scope: !1000, inlinedAt: !1091)
!1100 = !DILocation(line: 133, column: 9, scope: !981, inlinedAt: !1091)
!1101 = !DILocation(line: 125, column: 37, scope: !1004, inlinedAt: !1091)
!1102 = !DILocation(line: 125, column: 52, scope: !1004, inlinedAt: !1091)
!1103 = !DILocation(line: 125, column: 13, scope: !1005, inlinedAt: !1091)
!1104 = !DILocation(line: 128, column: 35, scope: !1005, inlinedAt: !1091)
!1105 = !DILocation(line: 128, column: 41, scope: !1005, inlinedAt: !1091)
!1106 = !DILocation(line: 128, column: 27, scope: !1005, inlinedAt: !1091)
!1107 = !DILocation(line: 128, column: 9, scope: !1005, inlinedAt: !1091)
!1108 = !DILocation(line: 129, column: 5, scope: !1005, inlinedAt: !1091)
!1109 = !DILocation(line: 140, column: 60, scope: !985, inlinedAt: !1091)
!1110 = !DILocation(line: 0, scope: !985, inlinedAt: !1091)
!1111 = !DILocation(line: 141, column: 68, scope: !985, inlinedAt: !1091)
!1112 = !DILocation(line: 142, column: 28, scope: !1001, inlinedAt: !1091)
!1113 = !DILocation(line: 142, column: 40, scope: !1001, inlinedAt: !1091)
!1114 = !DILocation(line: 144, column: 28, scope: !1000, inlinedAt: !1091)
!1115 = !DILocation(line: 144, column: 43, scope: !1000, inlinedAt: !1091)
!1116 = !DILocation(line: 144, column: 25, scope: !1000, inlinedAt: !1091)
!1117 = !DILocation(line: 145, column: 28, scope: !1000, inlinedAt: !1091)
!1118 = !DILocation(line: 145, column: 43, scope: !1000, inlinedAt: !1091)
!1119 = !DILocation(line: 145, column: 25, scope: !1000, inlinedAt: !1091)
!1120 = !DILocation(line: 133, column: 69, scope: !986, inlinedAt: !1091)
!1121 = distinct !{!1121, !1100, !1122, !1026}
!1122 = !DILocation(line: 149, column: 9, scope: !981, inlinedAt: !1091)
!1123 = !DILocation(line: 0, scope: !857, inlinedAt: !859)
!1124 = !DILocation(line: 286, column: 5, scope: !857, inlinedAt: !859)
!1125 = !DILocation(line: 0, scope: !1126, inlinedAt: !859)
!1126 = distinct !DILexicalBlock(scope: !1127, file: !3, line: 292, column: 13)
!1127 = distinct !DILexicalBlock(scope: !1128, file: !3, line: 287, column: 5)
!1128 = distinct !DILexicalBlock(scope: !857, file: !3, line: 286, column: 5)
!1129 = !DILocation(line: 292, column: 126, scope: !1126, inlinedAt: !859)
!1130 = !DILocation(line: 292, column: 136, scope: !1126, inlinedAt: !859)
!1131 = !DILocation(line: 292, column: 141, scope: !1126, inlinedAt: !859)
!1132 = !DILocation(line: 292, column: 13, scope: !1127, inlinedAt: !859)
!1133 = !DILocation(line: 295, column: 27, scope: !1127, inlinedAt: !859)
!1134 = !DILocation(line: 295, column: 9, scope: !1127, inlinedAt: !859)
!1135 = !DILocation(line: 295, column: 61, scope: !1127, inlinedAt: !859)
!1136 = !DILocation(line: 295, column: 46, scope: !1127, inlinedAt: !859)
!1137 = !DILocation(line: 286, column: 42, scope: !1128, inlinedAt: !859)
!1138 = !DILocation(line: 286, column: 23, scope: !1128, inlinedAt: !859)
!1139 = !DILocation(line: 286, column: 25, scope: !1128, inlinedAt: !859)
!1140 = distinct !{!1140, !1124, !1141, !1026}
!1141 = !DILocation(line: 296, column: 5, scope: !857, inlinedAt: !859)
!1142 = !DILocation(line: 0, scope: !586, inlinedAt: !1143)
!1143 = distinct !DILocation(line: 298, column: 12, scope: !806, inlinedAt: !859)
!1144 = !DILocation(line: 458, column: 37, scope: !586, inlinedAt: !1143)
!1145 = !DILocation(line: 458, column: 26, scope: !586, inlinedAt: !1143)
!1146 = !DILocation(line: 458, column: 18, scope: !586, inlinedAt: !1143)
!1147 = !DILocation(line: 459, column: 41, scope: !586, inlinedAt: !1143)
!1148 = !DILocation(line: 459, column: 30, scope: !586, inlinedAt: !1143)
!1149 = !DILocation(line: 459, column: 22, scope: !586, inlinedAt: !1143)
!1150 = !DILocation(line: 462, column: 14, scope: !609, inlinedAt: !1143)
!1151 = !DILocation(line: 462, column: 18, scope: !609, inlinedAt: !1143)
!1152 = !DILocation(line: 462, column: 9, scope: !586, inlinedAt: !1143)
!1153 = !DILocation(line: 467, column: 5, scope: !586, inlinedAt: !1143)
!1154 = !DILocation(line: 468, column: 5, scope: !586, inlinedAt: !1143)
!1155 = !DILocation(line: 468, column: 10, scope: !586, inlinedAt: !1143)
!1156 = !DILocation(line: 468, column: 19, scope: !586, inlinedAt: !1143)
!1157 = !DILocation(line: 0, scope: !617, inlinedAt: !1158)
!1158 = distinct !DILocation(line: 470, column: 21, scope: !586, inlinedAt: !1143)
!1159 = !DILocation(line: 0, scope: !359, inlinedAt: !1160)
!1160 = distinct !DILocation(line: 349, column: 25, scope: !617, inlinedAt: !1158)
!1161 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !1160)
!1162 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !1160)
!1163 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !1160)
!1164 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !1160)
!1165 = !DILocation(line: 0, scope: !375, inlinedAt: !1166)
!1166 = distinct !DILocation(line: 350, column: 27, scope: !617, inlinedAt: !1158)
!1167 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !1166)
!1168 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !1166)
!1169 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !1166)
!1170 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !1166)
!1171 = !DILocation(line: 351, column: 5, scope: !617, inlinedAt: !1158)
!1172 = !DILocation(line: 351, column: 27, scope: !617, inlinedAt: !1158)
!1173 = !DILocation(line: 355, column: 38, scope: !657, inlinedAt: !1158)
!1174 = !DILocation(line: 355, column: 9, scope: !617, inlinedAt: !1158)
!1175 = !DILocation(line: 348, column: 26, scope: !617, inlinedAt: !1158)
!1176 = !DILocation(line: 358, column: 20, scope: !617, inlinedAt: !1158)
!1177 = !DILocation(line: 359, column: 5, scope: !617, inlinedAt: !1158)
!1178 = !DILocation(line: 361, column: 5, scope: !617, inlinedAt: !1158)
!1179 = !DILocation(line: 364, column: 14, scope: !664, inlinedAt: !1158)
!1180 = !DILocation(line: 364, column: 13, scope: !634, inlinedAt: !1158)
!1181 = !DILocation(line: 367, column: 20, scope: !634, inlinedAt: !1158)
!1182 = !DILocation(line: 367, column: 27, scope: !634, inlinedAt: !1158)
!1183 = !DILocation(line: 368, column: 31, scope: !634, inlinedAt: !1158)
!1184 = !DILocation(line: 368, column: 20, scope: !634, inlinedAt: !1158)
!1185 = !DILocation(line: 368, column: 24, scope: !634, inlinedAt: !1158)
!1186 = !DILocation(line: 369, column: 39, scope: !634, inlinedAt: !1158)
!1187 = !DILocation(line: 369, column: 20, scope: !634, inlinedAt: !1158)
!1188 = !DILocation(line: 369, column: 32, scope: !634, inlinedAt: !1158)
!1189 = !DILocation(line: 370, column: 20, scope: !634, inlinedAt: !1158)
!1190 = !DILocation(line: 370, column: 26, scope: !634, inlinedAt: !1158)
!1191 = !DILocation(line: 371, column: 20, scope: !634, inlinedAt: !1158)
!1192 = !DILocation(line: 371, column: 26, scope: !634, inlinedAt: !1158)
!1193 = !DILocation(line: 372, column: 30, scope: !634, inlinedAt: !1158)
!1194 = !DILocation(line: 372, column: 20, scope: !634, inlinedAt: !1158)
!1195 = !DILocation(line: 372, column: 28, scope: !634, inlinedAt: !1158)
!1196 = !DILocation(line: 373, column: 36, scope: !634, inlinedAt: !1158)
!1197 = !DILocation(line: 373, column: 20, scope: !634, inlinedAt: !1158)
!1198 = !DILocation(line: 373, column: 29, scope: !634, inlinedAt: !1158)
!1199 = !DILocation(line: 374, column: 36, scope: !634, inlinedAt: !1158)
!1200 = !DILocation(line: 374, column: 20, scope: !634, inlinedAt: !1158)
!1201 = !DILocation(line: 374, column: 29, scope: !634, inlinedAt: !1158)
!1202 = !DILocation(line: 375, column: 9, scope: !634, inlinedAt: !1158)
!1203 = !DILocation(line: 378, column: 14, scope: !699, inlinedAt: !1158)
!1204 = !DILocation(line: 378, column: 13, scope: !634, inlinedAt: !1158)
!1205 = !DILocation(line: 381, column: 18, scope: !702, inlinedAt: !1158)
!1206 = !DILocation(line: 381, column: 28, scope: !702, inlinedAt: !1158)
!1207 = !DILocation(line: 381, column: 13, scope: !634, inlinedAt: !1158)
!1208 = !DILocation(line: 384, column: 62, scope: !634, inlinedAt: !1158)
!1209 = !DILocation(line: 0, scope: !634, inlinedAt: !1158)
!1210 = !DILocation(line: 385, column: 62, scope: !634, inlinedAt: !1158)
!1211 = !DILocation(line: 387, column: 20, scope: !634, inlinedAt: !1158)
!1212 = !DILocation(line: 387, column: 27, scope: !634, inlinedAt: !1158)
!1213 = !DILocation(line: 388, column: 20, scope: !634, inlinedAt: !1158)
!1214 = !DILocation(line: 388, column: 24, scope: !634, inlinedAt: !1158)
!1215 = !DILocation(line: 389, column: 31, scope: !634, inlinedAt: !1158)
!1216 = !DILocation(line: 389, column: 46, scope: !634, inlinedAt: !1158)
!1217 = !DILocation(line: 389, column: 20, scope: !634, inlinedAt: !1158)
!1218 = !DILocation(line: 389, column: 29, scope: !634, inlinedAt: !1158)
!1219 = !DILocation(line: 390, column: 39, scope: !634, inlinedAt: !1158)
!1220 = !DILocation(line: 390, column: 20, scope: !634, inlinedAt: !1158)
!1221 = !DILocation(line: 390, column: 32, scope: !634, inlinedAt: !1158)
!1222 = !DILocation(line: 391, column: 20, scope: !634, inlinedAt: !1158)
!1223 = !DILocation(line: 391, column: 26, scope: !634, inlinedAt: !1158)
!1224 = !DILocation(line: 392, column: 20, scope: !634, inlinedAt: !1158)
!1225 = !DILocation(line: 392, column: 26, scope: !634, inlinedAt: !1158)
!1226 = !DILocation(line: 393, column: 30, scope: !634, inlinedAt: !1158)
!1227 = !DILocation(line: 393, column: 20, scope: !634, inlinedAt: !1158)
!1228 = !DILocation(line: 393, column: 28, scope: !634, inlinedAt: !1158)
!1229 = !DILocation(line: 394, column: 21, scope: !634, inlinedAt: !1158)
!1230 = !DILocation(line: 395, column: 21, scope: !634, inlinedAt: !1158)
!1231 = !DILocation(line: 396, column: 9, scope: !634, inlinedAt: !1158)
!1232 = !DILocation(line: 405, column: 31, scope: !617, inlinedAt: !1158)
!1233 = !DILocation(line: 405, column: 16, scope: !617, inlinedAt: !1158)
!1234 = !DILocation(line: 405, column: 24, scope: !617, inlinedAt: !1158)
!1235 = !DILocation(line: 407, column: 29, scope: !617, inlinedAt: !1158)
!1236 = !DILocation(line: 407, column: 14, scope: !617, inlinedAt: !1158)
!1237 = !DILocation(line: 409, column: 5, scope: !617, inlinedAt: !1158)
!1238 = !DILocation(line: 412, column: 13, scope: !638, inlinedAt: !1158)
!1239 = !DILocation(line: 0, scope: !741, inlinedAt: !1240)
!1240 = distinct !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !1158)
!1241 = !DILocation(line: 156, column: 31, scope: !741, inlinedAt: !1240)
!1242 = !DILocation(line: 158, column: 11, scope: !741, inlinedAt: !1240)
!1243 = !DILocation(line: 159, column: 43, scope: !741, inlinedAt: !1240)
!1244 = !DILocation(line: 159, column: 34, scope: !741, inlinedAt: !1240)
!1245 = !DILocation(line: 159, column: 16, scope: !741, inlinedAt: !1240)
!1246 = !DILocation(line: 160, column: 19, scope: !741, inlinedAt: !1240)
!1247 = !DILocation(line: 160, column: 12, scope: !741, inlinedAt: !1240)
!1248 = !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !1158)
!1249 = !DILocation(line: 415, column: 18, scope: !760, inlinedAt: !1158)
!1250 = !DILocation(line: 415, column: 27, scope: !760, inlinedAt: !1158)
!1251 = !DILocation(line: 415, column: 13, scope: !760, inlinedAt: !1158)
!1252 = !DILocation(line: 454, column: 1, scope: !617, inlinedAt: !1158)
!1253 = !DILocation(line: 471, column: 9, scope: !586, inlinedAt: !1143)
!1254 = !DILocation(line: 417, column: 31, scope: !638, inlinedAt: !1158)
!1255 = !DILocation(line: 417, column: 18, scope: !638, inlinedAt: !1158)
!1256 = !DILocation(line: 0, scope: !638, inlinedAt: !1158)
!1257 = !DILocation(line: 421, column: 43, scope: !638, inlinedAt: !1158)
!1258 = !DILocation(line: 421, column: 9, scope: !638, inlinedAt: !1158)
!1259 = !DILocation(line: 422, column: 45, scope: !638, inlinedAt: !1158)
!1260 = !DILocation(line: 422, column: 9, scope: !638, inlinedAt: !1158)
!1261 = !DILocation(line: 0, scope: !773, inlinedAt: !1262)
!1262 = distinct !DILocation(line: 473, column: 9, scope: !785, inlinedAt: !1143)
!1263 = !DILocation(line: 223, column: 5, scope: !773, inlinedAt: !1262)
!1264 = !DILocation(line: 224, column: 24, scope: !773, inlinedAt: !1262)
!1265 = !DILocation(line: 224, column: 5, scope: !773, inlinedAt: !1262)
!1266 = !DILocation(line: 475, column: 14, scope: !791, inlinedAt: !1143)
!1267 = !DILocation(line: 475, column: 13, scope: !785, inlinedAt: !1143)
!1268 = !DILocation(line: 478, column: 18, scope: !794, inlinedAt: !1143)
!1269 = !DILocation(line: 478, column: 37, scope: !794, inlinedAt: !1143)
!1270 = !DILocation(line: 478, column: 34, scope: !794, inlinedAt: !1143)
!1271 = !DILocation(line: 478, column: 13, scope: !785, inlinedAt: !1143)
!1272 = !DILocation(line: 484, column: 16, scope: !785, inlinedAt: !1143)
!1273 = !DILocation(line: 484, column: 9, scope: !785, inlinedAt: !1143)
!1274 = !DILocation(line: 488, column: 1, scope: !586, inlinedAt: !1143)
!1275 = !DILocation(line: 299, column: 1, scope: !806, inlinedAt: !859)
!1276 = !DILocation(line: 0, scope: !397, inlinedAt: !1277)
!1277 = distinct !DILocation(line: 431, column: 24, scope: !444)
!1278 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1277)
!1279 = !DILocation(line: 431, column: 17, scope: !444)
!1280 = !DILocation(line: 437, column: 14, scope: !1281)
!1281 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 437, column: 13)
!1282 = distinct !DILexicalBlock(scope: !1283, file: !3, line: 436, column: 5)
!1283 = distinct !DILexicalBlock(scope: !417, file: !3, line: 435, column: 14)
!1284 = !DILocation(line: 437, column: 13, scope: !1282)
!1285 = !DILocation(line: 0, scope: !397, inlinedAt: !1286)
!1286 = distinct !DILocation(line: 438, column: 20, scope: !1281)
!1287 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1286)
!1288 = !DILocation(line: 438, column: 13, scope: !1281)
!1289 = !DILocation(line: 440, column: 15, scope: !1282)
!1290 = !DILocation(line: 440, column: 25, scope: !1282)
!1291 = !{!1292, !349, i64 0}
!1292 = !{!"lpm_key_v6", !349, i64 0, !441, i64 4}
!1293 = !DILocation(line: 441, column: 15, scope: !1282)
!1294 = !DILocation(line: 441, column: 27, scope: !1282)
!1295 = !DILocation(line: 442, column: 18, scope: !1296)
!1296 = distinct !DILexicalBlock(scope: !1282, file: !3, line: 442, column: 13)
!1297 = !DILocation(line: 442, column: 26, scope: !1296)
!1298 = !DILocation(line: 442, column: 13, scope: !1282)
!1299 = !DILocation(line: 445, column: 24, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1296, file: !3, line: 443, column: 9)
!1301 = !DILocation(line: 446, column: 17, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1300, file: !3, line: 446, column: 17)
!1303 = !DILocation(line: 446, column: 17, scope: !1300)
!1304 = !DILocation(line: 448, column: 35, scope: !1305)
!1305 = distinct !DILexicalBlock(scope: !1302, file: !3, line: 447, column: 13)
!1306 = !{!1307, !349, i64 32}
!1307 = !{!"end_function", !350, i64 0, !350, i64 16, !349, i64 32, !349, i64 36, !349, i64 40, !349, i64 44}
!1308 = !DILocation(line: 448, column: 17, scope: !1305)
!1309 = !DILocalVariable(name: "xdp", arg: 1, scope: !1310, file: !3, line: 13, type: !61)
!1310 = distinct !DISubprogram(name: "action_end", scope: !3, file: !3, line: 13, type: !298, scopeLine: 14, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1311)
!1311 = !{!1309, !1312, !1313}
!1312 = !DILocalVariable(name: "srhdr", scope: !1310, file: !3, line: 18, type: !469)
!1313 = !DILocalVariable(name: "v6h", scope: !1310, file: !3, line: 19, type: !328)
!1314 = !DILocation(line: 0, scope: !1310, inlinedAt: !1315)
!1315 = distinct !DILocation(line: 451, column: 59, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1305, file: !3, line: 449, column: 17)
!1317 = !DILocalVariable(name: "xdp", arg: 1, scope: !1318, file: !360, line: 307, type: !61)
!1318 = distinct !DISubprogram(name: "get_and_validate_srh", scope: !360, file: !360, line: 307, type: !1319, scopeLine: 308, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1321)
!1319 = !DISubroutineType(types: !1320)
!1320 = !{!469, !61}
!1321 = !{!1317, !1322}
!1322 = !DILocalVariable(name: "srh", scope: !1318, file: !360, line: 309, type: !469)
!1323 = !DILocation(line: 0, scope: !1318, inlinedAt: !1324)
!1324 = distinct !DILocation(line: 18, column: 28, scope: !1310, inlinedAt: !1315)
!1325 = !DILocalVariable(name: "xdp", arg: 1, scope: !1326, file: !360, line: 263, type: !61)
!1326 = distinct !DISubprogram(name: "get_srh", scope: !360, file: !360, line: 263, type: !1319, scopeLine: 264, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1327)
!1327 = !{!1325, !1328, !1329, !1330}
!1328 = !DILocalVariable(name: "data", scope: !1326, file: !360, line: 265, type: !53)
!1329 = !DILocalVariable(name: "data_end", scope: !1326, file: !360, line: 266, type: !53)
!1330 = !DILocalVariable(name: "srh", scope: !1326, file: !360, line: 268, type: !469)
!1331 = !DILocation(line: 0, scope: !1326, inlinedAt: !1332)
!1332 = distinct !DILocation(line: 311, column: 11, scope: !1318, inlinedAt: !1324)
!1333 = !DILocation(line: 265, column: 37, scope: !1326, inlinedAt: !1332)
!1334 = !DILocation(line: 265, column: 26, scope: !1326, inlinedAt: !1332)
!1335 = !DILocation(line: 265, column: 18, scope: !1326, inlinedAt: !1332)
!1336 = !DILocation(line: 266, column: 41, scope: !1326, inlinedAt: !1332)
!1337 = !DILocation(line: 266, column: 30, scope: !1326, inlinedAt: !1332)
!1338 = !DILocation(line: 272, column: 13, scope: !1339, inlinedAt: !1332)
!1339 = distinct !DILexicalBlock(scope: !1326, file: !360, line: 272, column: 9)
!1340 = !DILocation(line: 272, column: 19, scope: !1339, inlinedAt: !1332)
!1341 = !DILocation(line: 272, column: 17, scope: !1339, inlinedAt: !1332)
!1342 = !DILocation(line: 272, column: 9, scope: !1326, inlinedAt: !1332)
!1343 = !DILocation(line: 312, column: 10, scope: !1344, inlinedAt: !1324)
!1344 = distinct !DILexicalBlock(scope: !1318, file: !360, line: 312, column: 9)
!1345 = !DILocation(line: 312, column: 9, scope: !1318, inlinedAt: !1324)
!1346 = !DILocation(line: 315, column: 14, scope: !1347, inlinedAt: !1324)
!1347 = distinct !DILexicalBlock(scope: !1318, file: !360, line: 315, column: 9)
!1348 = !DILocation(line: 315, column: 27, scope: !1347, inlinedAt: !1324)
!1349 = !DILocation(line: 0, scope: !375, inlinedAt: !1350)
!1350 = distinct !DILocation(line: 19, column: 27, scope: !1310, inlinedAt: !1315)
!1351 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !1350)
!1352 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !1350)
!1353 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !1350)
!1354 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !1350)
!1355 = !DILocation(line: 21, column: 10, scope: !1356, inlinedAt: !1315)
!1356 = distinct !DILexicalBlock(scope: !1310, file: !3, line: 21, column: 9)
!1357 = !DILocation(line: 21, column: 16, scope: !1356, inlinedAt: !1315)
!1358 = !DILocation(line: 24, column: 39, scope: !1359, inlinedAt: !1315)
!1359 = distinct !DILexicalBlock(scope: !1310, file: !3, line: 24, column: 9)
!1360 = !DILocalVariable(name: "srh", arg: 1, scope: !1361, file: !360, line: 327, type: !469)
!1361 = distinct !DISubprogram(name: "advance_nextseg", scope: !360, file: !360, line: 327, type: !1362, scopeLine: 328, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1364)
!1362 = !DISubroutineType(types: !1363)
!1363 = !{!597, !469, !71, !61}
!1364 = !{!1360, !1365, !1366, !1367, !1368}
!1365 = !DILocalVariable(name: "daddr", arg: 2, scope: !1361, file: !360, line: 327, type: !71)
!1366 = !DILocalVariable(name: "xdp", arg: 3, scope: !1361, file: !360, line: 327, type: !61)
!1367 = !DILocalVariable(name: "addr", scope: !1361, file: !360, line: 329, type: !71)
!1368 = !DILocalVariable(name: "data_end", scope: !1361, file: !360, line: 330, type: !53)
!1369 = !DILocation(line: 0, scope: !1361, inlinedAt: !1370)
!1370 = distinct !DILocation(line: 24, column: 10, scope: !1359, inlinedAt: !1315)
!1371 = !DILocation(line: 330, column: 22, scope: !1361, inlinedAt: !1370)
!1372 = !DILocation(line: 332, column: 10, scope: !1361, inlinedAt: !1370)
!1373 = !DILocation(line: 332, column: 22, scope: !1361, inlinedAt: !1370)
!1374 = !DILocation(line: 333, column: 27, scope: !1375, inlinedAt: !1370)
!1375 = distinct !DILexicalBlock(scope: !1361, file: !360, line: 333, column: 9)
!1376 = !DILocation(line: 333, column: 80, scope: !1375, inlinedAt: !1370)
!1377 = !DILocation(line: 333, column: 77, scope: !1375, inlinedAt: !1370)
!1378 = !DILocation(line: 333, column: 51, scope: !1375, inlinedAt: !1370)
!1379 = !DILocation(line: 333, column: 103, scope: !1375, inlinedAt: !1370)
!1380 = !DILocation(line: 333, column: 9, scope: !1361, inlinedAt: !1370)
!1381 = !DILocation(line: 336, column: 26, scope: !1361, inlinedAt: !1370)
!1382 = !DILocation(line: 337, column: 14, scope: !1383, inlinedAt: !1370)
!1383 = distinct !DILexicalBlock(scope: !1361, file: !360, line: 337, column: 9)
!1384 = !DILocation(line: 337, column: 20, scope: !1383, inlinedAt: !1370)
!1385 = !DILocation(line: 337, column: 18, scope: !1383, inlinedAt: !1370)
!1386 = !DILocation(line: 337, column: 9, scope: !1361, inlinedAt: !1370)
!1387 = !DILocation(line: 340, column: 14, scope: !1361, inlinedAt: !1370)
!1388 = !DILocation(line: 0, scope: !586, inlinedAt: !1389)
!1389 = distinct !DILocation(line: 27, column: 12, scope: !1310, inlinedAt: !1315)
!1390 = !DILocation(line: 458, column: 37, scope: !586, inlinedAt: !1389)
!1391 = !DILocation(line: 458, column: 26, scope: !586, inlinedAt: !1389)
!1392 = !DILocation(line: 458, column: 18, scope: !586, inlinedAt: !1389)
!1393 = !DILocation(line: 459, column: 41, scope: !586, inlinedAt: !1389)
!1394 = !DILocation(line: 459, column: 30, scope: !586, inlinedAt: !1389)
!1395 = !DILocation(line: 459, column: 22, scope: !586, inlinedAt: !1389)
!1396 = !DILocation(line: 462, column: 14, scope: !609, inlinedAt: !1389)
!1397 = !DILocation(line: 462, column: 18, scope: !609, inlinedAt: !1389)
!1398 = !DILocation(line: 462, column: 9, scope: !586, inlinedAt: !1389)
!1399 = !DILocation(line: 467, column: 5, scope: !586, inlinedAt: !1389)
!1400 = !DILocation(line: 468, column: 5, scope: !586, inlinedAt: !1389)
!1401 = !DILocation(line: 468, column: 10, scope: !586, inlinedAt: !1389)
!1402 = !DILocation(line: 468, column: 19, scope: !586, inlinedAt: !1389)
!1403 = !DILocation(line: 0, scope: !617, inlinedAt: !1404)
!1404 = distinct !DILocation(line: 470, column: 21, scope: !586, inlinedAt: !1389)
!1405 = !DILocation(line: 0, scope: !359, inlinedAt: !1406)
!1406 = distinct !DILocation(line: 349, column: 25, scope: !617, inlinedAt: !1404)
!1407 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !1406)
!1408 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !1406)
!1409 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !1406)
!1410 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !1406)
!1411 = !DILocation(line: 0, scope: !375, inlinedAt: !1412)
!1412 = distinct !DILocation(line: 350, column: 27, scope: !617, inlinedAt: !1404)
!1413 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !1412)
!1414 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !1412)
!1415 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !1412)
!1416 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !1412)
!1417 = !DILocation(line: 351, column: 5, scope: !617, inlinedAt: !1404)
!1418 = !DILocation(line: 351, column: 27, scope: !617, inlinedAt: !1404)
!1419 = !DILocation(line: 355, column: 38, scope: !657, inlinedAt: !1404)
!1420 = !DILocation(line: 355, column: 9, scope: !617, inlinedAt: !1404)
!1421 = !DILocation(line: 348, column: 26, scope: !617, inlinedAt: !1404)
!1422 = !DILocation(line: 358, column: 20, scope: !617, inlinedAt: !1404)
!1423 = !DILocation(line: 359, column: 5, scope: !617, inlinedAt: !1404)
!1424 = !DILocation(line: 361, column: 5, scope: !617, inlinedAt: !1404)
!1425 = !DILocation(line: 364, column: 14, scope: !664, inlinedAt: !1404)
!1426 = !DILocation(line: 364, column: 13, scope: !634, inlinedAt: !1404)
!1427 = !DILocation(line: 367, column: 20, scope: !634, inlinedAt: !1404)
!1428 = !DILocation(line: 367, column: 27, scope: !634, inlinedAt: !1404)
!1429 = !DILocation(line: 368, column: 31, scope: !634, inlinedAt: !1404)
!1430 = !DILocation(line: 368, column: 20, scope: !634, inlinedAt: !1404)
!1431 = !DILocation(line: 368, column: 24, scope: !634, inlinedAt: !1404)
!1432 = !DILocation(line: 369, column: 39, scope: !634, inlinedAt: !1404)
!1433 = !DILocation(line: 369, column: 20, scope: !634, inlinedAt: !1404)
!1434 = !DILocation(line: 369, column: 32, scope: !634, inlinedAt: !1404)
!1435 = !DILocation(line: 370, column: 20, scope: !634, inlinedAt: !1404)
!1436 = !DILocation(line: 370, column: 26, scope: !634, inlinedAt: !1404)
!1437 = !DILocation(line: 371, column: 20, scope: !634, inlinedAt: !1404)
!1438 = !DILocation(line: 371, column: 26, scope: !634, inlinedAt: !1404)
!1439 = !DILocation(line: 372, column: 30, scope: !634, inlinedAt: !1404)
!1440 = !DILocation(line: 372, column: 20, scope: !634, inlinedAt: !1404)
!1441 = !DILocation(line: 372, column: 28, scope: !634, inlinedAt: !1404)
!1442 = !DILocation(line: 373, column: 36, scope: !634, inlinedAt: !1404)
!1443 = !DILocation(line: 373, column: 20, scope: !634, inlinedAt: !1404)
!1444 = !DILocation(line: 373, column: 29, scope: !634, inlinedAt: !1404)
!1445 = !DILocation(line: 374, column: 36, scope: !634, inlinedAt: !1404)
!1446 = !DILocation(line: 374, column: 20, scope: !634, inlinedAt: !1404)
!1447 = !DILocation(line: 374, column: 29, scope: !634, inlinedAt: !1404)
!1448 = !DILocation(line: 375, column: 9, scope: !634, inlinedAt: !1404)
!1449 = !DILocation(line: 378, column: 14, scope: !699, inlinedAt: !1404)
!1450 = !DILocation(line: 378, column: 13, scope: !634, inlinedAt: !1404)
!1451 = !DILocation(line: 381, column: 18, scope: !702, inlinedAt: !1404)
!1452 = !DILocation(line: 381, column: 28, scope: !702, inlinedAt: !1404)
!1453 = !DILocation(line: 381, column: 13, scope: !634, inlinedAt: !1404)
!1454 = !DILocation(line: 384, column: 62, scope: !634, inlinedAt: !1404)
!1455 = !DILocation(line: 0, scope: !634, inlinedAt: !1404)
!1456 = !DILocation(line: 385, column: 62, scope: !634, inlinedAt: !1404)
!1457 = !DILocation(line: 387, column: 20, scope: !634, inlinedAt: !1404)
!1458 = !DILocation(line: 387, column: 27, scope: !634, inlinedAt: !1404)
!1459 = !DILocation(line: 388, column: 20, scope: !634, inlinedAt: !1404)
!1460 = !DILocation(line: 388, column: 24, scope: !634, inlinedAt: !1404)
!1461 = !DILocation(line: 389, column: 31, scope: !634, inlinedAt: !1404)
!1462 = !DILocation(line: 389, column: 46, scope: !634, inlinedAt: !1404)
!1463 = !DILocation(line: 389, column: 20, scope: !634, inlinedAt: !1404)
!1464 = !DILocation(line: 389, column: 29, scope: !634, inlinedAt: !1404)
!1465 = !DILocation(line: 390, column: 39, scope: !634, inlinedAt: !1404)
!1466 = !DILocation(line: 390, column: 20, scope: !634, inlinedAt: !1404)
!1467 = !DILocation(line: 390, column: 32, scope: !634, inlinedAt: !1404)
!1468 = !DILocation(line: 391, column: 20, scope: !634, inlinedAt: !1404)
!1469 = !DILocation(line: 391, column: 26, scope: !634, inlinedAt: !1404)
!1470 = !DILocation(line: 392, column: 20, scope: !634, inlinedAt: !1404)
!1471 = !DILocation(line: 392, column: 26, scope: !634, inlinedAt: !1404)
!1472 = !DILocation(line: 393, column: 30, scope: !634, inlinedAt: !1404)
!1473 = !DILocation(line: 393, column: 20, scope: !634, inlinedAt: !1404)
!1474 = !DILocation(line: 393, column: 28, scope: !634, inlinedAt: !1404)
!1475 = !DILocation(line: 394, column: 21, scope: !634, inlinedAt: !1404)
!1476 = !DILocation(line: 395, column: 21, scope: !634, inlinedAt: !1404)
!1477 = !DILocation(line: 396, column: 9, scope: !634, inlinedAt: !1404)
!1478 = !DILocation(line: 405, column: 31, scope: !617, inlinedAt: !1404)
!1479 = !DILocation(line: 405, column: 16, scope: !617, inlinedAt: !1404)
!1480 = !DILocation(line: 405, column: 24, scope: !617, inlinedAt: !1404)
!1481 = !DILocation(line: 407, column: 29, scope: !617, inlinedAt: !1404)
!1482 = !DILocation(line: 407, column: 14, scope: !617, inlinedAt: !1404)
!1483 = !DILocation(line: 409, column: 5, scope: !617, inlinedAt: !1404)
!1484 = !DILocation(line: 412, column: 13, scope: !638, inlinedAt: !1404)
!1485 = !DILocation(line: 0, scope: !741, inlinedAt: !1486)
!1486 = distinct !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !1404)
!1487 = !DILocation(line: 156, column: 31, scope: !741, inlinedAt: !1486)
!1488 = !DILocation(line: 158, column: 11, scope: !741, inlinedAt: !1486)
!1489 = !DILocation(line: 159, column: 43, scope: !741, inlinedAt: !1486)
!1490 = !DILocation(line: 159, column: 34, scope: !741, inlinedAt: !1486)
!1491 = !DILocation(line: 159, column: 16, scope: !741, inlinedAt: !1486)
!1492 = !DILocation(line: 160, column: 19, scope: !741, inlinedAt: !1486)
!1493 = !DILocation(line: 160, column: 12, scope: !741, inlinedAt: !1486)
!1494 = !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !1404)
!1495 = !DILocation(line: 415, column: 18, scope: !760, inlinedAt: !1404)
!1496 = !DILocation(line: 415, column: 27, scope: !760, inlinedAt: !1404)
!1497 = !DILocation(line: 415, column: 13, scope: !760, inlinedAt: !1404)
!1498 = !DILocation(line: 454, column: 1, scope: !617, inlinedAt: !1404)
!1499 = !DILocation(line: 471, column: 9, scope: !586, inlinedAt: !1389)
!1500 = !DILocation(line: 417, column: 31, scope: !638, inlinedAt: !1404)
!1501 = !DILocation(line: 417, column: 18, scope: !638, inlinedAt: !1404)
!1502 = !DILocation(line: 0, scope: !638, inlinedAt: !1404)
!1503 = !DILocation(line: 421, column: 43, scope: !638, inlinedAt: !1404)
!1504 = !DILocation(line: 421, column: 9, scope: !638, inlinedAt: !1404)
!1505 = !DILocation(line: 422, column: 45, scope: !638, inlinedAt: !1404)
!1506 = !DILocation(line: 422, column: 9, scope: !638, inlinedAt: !1404)
!1507 = !DILocation(line: 0, scope: !773, inlinedAt: !1508)
!1508 = distinct !DILocation(line: 473, column: 9, scope: !785, inlinedAt: !1389)
!1509 = !DILocation(line: 223, column: 5, scope: !773, inlinedAt: !1508)
!1510 = !DILocation(line: 224, column: 24, scope: !773, inlinedAt: !1508)
!1511 = !DILocation(line: 224, column: 5, scope: !773, inlinedAt: !1508)
!1512 = !DILocation(line: 475, column: 14, scope: !791, inlinedAt: !1389)
!1513 = !DILocation(line: 475, column: 13, scope: !785, inlinedAt: !1389)
!1514 = !DILocation(line: 478, column: 18, scope: !794, inlinedAt: !1389)
!1515 = !DILocation(line: 478, column: 37, scope: !794, inlinedAt: !1389)
!1516 = !DILocation(line: 478, column: 34, scope: !794, inlinedAt: !1389)
!1517 = !DILocation(line: 478, column: 13, scope: !785, inlinedAt: !1389)
!1518 = !DILocation(line: 484, column: 16, scope: !785, inlinedAt: !1389)
!1519 = !DILocation(line: 484, column: 9, scope: !785, inlinedAt: !1389)
!1520 = !DILocation(line: 488, column: 1, scope: !586, inlinedAt: !1389)
!1521 = !DILocation(line: 0, scope: !397, inlinedAt: !1522)
!1522 = distinct !DILocation(line: 451, column: 28, scope: !1316)
!1523 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1522)
!1524 = !DILocation(line: 451, column: 21, scope: !1316)
!1525 = !DILocalVariable(name: "xdp", arg: 1, scope: !1526, file: !3, line: 59, type: !61)
!1526 = distinct !DISubprogram(name: "action_enddx4", scope: !3, file: !3, line: 59, type: !1527, scopeLine: 60, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1529)
!1527 = !DISubroutineType(types: !1528)
!1528 = !{!60, !61, !171}
!1529 = !{!1525, !1530, !1531, !1532}
!1530 = !DILocalVariable(name: "ef", arg: 2, scope: !1526, file: !3, line: 59, type: !171)
!1531 = !DILocalVariable(name: "rc", scope: !1526, file: !3, line: 61, type: !60)
!1532 = !DILocalVariable(name: "iph", scope: !1526, file: !3, line: 69, type: !313)
!1533 = !DILocation(line: 0, scope: !1526, inlinedAt: !1534)
!1534 = distinct !DILocation(line: 453, column: 59, scope: !1316)
!1535 = !DILocalVariable(name: "xdp", arg: 1, scope: !1536, file: !3, line: 30, type: !61)
!1536 = distinct !DISubprogram(name: "base_decap", scope: !3, file: !3, line: 30, type: !1537, scopeLine: 31, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1539)
!1537 = !DISubroutineType(types: !1538)
!1538 = !{!60, !61, !55}
!1539 = !{!1535, !1540, !1541, !1542, !1543, !1544, !1545}
!1540 = !DILocalVariable(name: "proto", arg: 2, scope: !1536, file: !3, line: 30, type: !55)
!1541 = !DILocalVariable(name: "data_end", scope: !1536, file: !3, line: 32, type: !53)
!1542 = !DILocalVariable(name: "data", scope: !1536, file: !3, line: 33, type: !53)
!1543 = !DILocalVariable(name: "srh", scope: !1536, file: !3, line: 35, type: !469)
!1544 = !DILocalVariable(name: "v6h", scope: !1536, file: !3, line: 36, type: !328)
!1545 = !DILocalVariable(name: "new_eth", scope: !1536, file: !3, line: 50, type: !305)
!1546 = !DILocation(line: 0, scope: !1536, inlinedAt: !1547)
!1547 = distinct !DILocation(line: 61, column: 14, scope: !1526, inlinedAt: !1534)
!1548 = !DILocation(line: 0, scope: !1326, inlinedAt: !1549)
!1549 = distinct !DILocation(line: 35, column: 26, scope: !1536, inlinedAt: !1547)
!1550 = !DILocation(line: 265, column: 37, scope: !1326, inlinedAt: !1549)
!1551 = !DILocation(line: 265, column: 26, scope: !1326, inlinedAt: !1549)
!1552 = !DILocation(line: 265, column: 18, scope: !1326, inlinedAt: !1549)
!1553 = !DILocation(line: 266, column: 41, scope: !1326, inlinedAt: !1549)
!1554 = !DILocation(line: 266, column: 30, scope: !1326, inlinedAt: !1549)
!1555 = !DILocation(line: 272, column: 13, scope: !1339, inlinedAt: !1549)
!1556 = !DILocation(line: 272, column: 19, scope: !1339, inlinedAt: !1549)
!1557 = !DILocation(line: 272, column: 17, scope: !1339, inlinedAt: !1549)
!1558 = !DILocation(line: 272, column: 9, scope: !1326, inlinedAt: !1549)
!1559 = !DILocation(line: 0, scope: !375, inlinedAt: !1560)
!1560 = distinct !DILocation(line: 36, column: 27, scope: !1536, inlinedAt: !1547)
!1561 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !1560)
!1562 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !1560)
!1563 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !1560)
!1564 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !1560)
!1565 = !DILocation(line: 38, column: 10, scope: !1566, inlinedAt: !1547)
!1566 = distinct !DILexicalBlock(scope: !1536, file: !3, line: 38, column: 9)
!1567 = !DILocation(line: 38, column: 14, scope: !1566, inlinedAt: !1547)
!1568 = !DILocation(line: 43, column: 71, scope: !1569, inlinedAt: !1547)
!1569 = distinct !DILexicalBlock(scope: !1536, file: !3, line: 43, column: 9)
!1570 = !DILocation(line: 43, column: 66, scope: !1569, inlinedAt: !1547)
!1571 = !DILocation(line: 43, column: 86, scope: !1569, inlinedAt: !1547)
!1572 = !DILocation(line: 43, column: 63, scope: !1569, inlinedAt: !1547)
!1573 = !DILocation(line: 43, column: 9, scope: !1569, inlinedAt: !1547)
!1574 = !DILocation(line: 43, column: 9, scope: !1536, inlinedAt: !1547)
!1575 = !DILocation(line: 48, column: 40, scope: !1536, inlinedAt: !1547)
!1576 = !DILocation(line: 48, column: 20, scope: !1536, inlinedAt: !1547)
!1577 = !DILocation(line: 49, column: 44, scope: !1536, inlinedAt: !1547)
!1578 = !DILocation(line: 49, column: 24, scope: !1536, inlinedAt: !1547)
!1579 = !DILocation(line: 50, column: 30, scope: !1536, inlinedAt: !1547)
!1580 = !DILocation(line: 51, column: 17, scope: !1581, inlinedAt: !1547)
!1581 = distinct !DILexicalBlock(scope: !1536, file: !3, line: 51, column: 9)
!1582 = !DILocation(line: 51, column: 23, scope: !1581, inlinedAt: !1547)
!1583 = !DILocation(line: 51, column: 21, scope: !1581, inlinedAt: !1547)
!1584 = !DILocation(line: 51, column: 9, scope: !1536, inlinedAt: !1547)
!1585 = !DILocation(line: 54, column: 14, scope: !1536, inlinedAt: !1547)
!1586 = !DILocation(line: 54, column: 22, scope: !1536, inlinedAt: !1547)
!1587 = !DILocation(line: 0, scope: !359, inlinedAt: !1588)
!1588 = distinct !DILocation(line: 69, column: 25, scope: !1526, inlinedAt: !1534)
!1589 = !DILocation(line: 253, column: 18, scope: !359, inlinedAt: !1588)
!1590 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !1588)
!1591 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !1588)
!1592 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !1588)
!1593 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !1588)
!1594 = !DILocation(line: 71, column: 10, scope: !1595, inlinedAt: !1534)
!1595 = distinct !DILexicalBlock(scope: !1526, file: !3, line: 71, column: 9)
!1596 = !DILocation(line: 71, column: 9, scope: !1526, inlinedAt: !1534)
!1597 = !DILocation(line: 76, column: 33, scope: !1526, inlinedAt: !1534)
!1598 = !DILocation(line: 76, column: 10, scope: !1526, inlinedAt: !1534)
!1599 = !DILocation(line: 76, column: 16, scope: !1526, inlinedAt: !1534)
!1600 = !DILocalVariable(name: "iph", arg: 1, scope: !1601, file: !360, line: 202, type: !313)
!1601 = distinct !DISubprogram(name: "csum_build", scope: !360, file: !360, line: 202, type: !1602, scopeLine: 203, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1604)
!1602 = !DISubroutineType(types: !1603)
!1603 = !{null, !313}
!1604 = !{!1600, !1605, !1606, !1607}
!1605 = !DILocalVariable(name: "next_iph_u16", scope: !1601, file: !360, line: 204, type: !97)
!1606 = !DILocalVariable(name: "csum", scope: !1601, file: !360, line: 205, type: !65)
!1607 = !DILocalVariable(name: "i", scope: !1601, file: !360, line: 206, type: !60)
!1608 = !DILocation(line: 0, scope: !1601, inlinedAt: !1609)
!1609 = distinct !DILocation(line: 77, column: 5, scope: !1526, inlinedAt: !1534)
!1610 = !DILocation(line: 207, column: 10, scope: !1601, inlinedAt: !1609)
!1611 = !DILocation(line: 207, column: 16, scope: !1601, inlinedAt: !1609)
!1612 = !DILocation(line: 208, column: 20, scope: !1601, inlinedAt: !1609)
!1613 = !DILocation(line: 210, column: 5, scope: !1614, inlinedAt: !1609)
!1614 = distinct !DILexicalBlock(scope: !1601, file: !360, line: 210, column: 5)
!1615 = !DILocation(line: 211, column: 30, scope: !1616, inlinedAt: !1609)
!1616 = distinct !DILexicalBlock(scope: !1614, file: !360, line: 210, column: 5)
!1617 = !DILocation(line: 211, column: 17, scope: !1616, inlinedAt: !1609)
!1618 = !{!412, !412, i64 0}
!1619 = !DILocation(line: 211, column: 14, scope: !1616, inlinedAt: !1609)
!1620 = !DILocation(line: 210, column: 43, scope: !1616, inlinedAt: !1609)
!1621 = !DILocation(line: 210, column: 19, scope: !1616, inlinedAt: !1609)
!1622 = distinct !{!1622, !1613, !1623, !1026}
!1623 = !DILocation(line: 211, column: 30, scope: !1614, inlinedAt: !1609)
!1624 = !DILocation(line: 213, column: 44, scope: !1601, inlinedAt: !1609)
!1625 = !DILocation(line: 213, column: 36, scope: !1601, inlinedAt: !1609)
!1626 = !DILocation(line: 213, column: 18, scope: !1601, inlinedAt: !1609)
!1627 = !DILocation(line: 213, column: 16, scope: !1601, inlinedAt: !1609)
!1628 = !DILocation(line: 0, scope: !586, inlinedAt: !1629)
!1629 = distinct !DILocation(line: 78, column: 12, scope: !1526, inlinedAt: !1534)
!1630 = !DILocation(line: 459, column: 22, scope: !586, inlinedAt: !1629)
!1631 = !DILocation(line: 462, column: 14, scope: !609, inlinedAt: !1629)
!1632 = !DILocation(line: 462, column: 18, scope: !609, inlinedAt: !1629)
!1633 = !DILocation(line: 462, column: 9, scope: !586, inlinedAt: !1629)
!1634 = !DILocation(line: 467, column: 5, scope: !586, inlinedAt: !1629)
!1635 = !DILocation(line: 468, column: 5, scope: !586, inlinedAt: !1629)
!1636 = !DILocation(line: 468, column: 10, scope: !586, inlinedAt: !1629)
!1637 = !DILocation(line: 468, column: 19, scope: !586, inlinedAt: !1629)
!1638 = !DILocation(line: 0, scope: !617, inlinedAt: !1639)
!1639 = distinct !DILocation(line: 470, column: 21, scope: !586, inlinedAt: !1629)
!1640 = !DILocation(line: 0, scope: !359, inlinedAt: !1641)
!1641 = distinct !DILocation(line: 349, column: 25, scope: !617, inlinedAt: !1639)
!1642 = !DILocation(line: 0, scope: !375, inlinedAt: !1643)
!1643 = distinct !DILocation(line: 350, column: 27, scope: !617, inlinedAt: !1639)
!1644 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !1643)
!1645 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !1643)
!1646 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !1643)
!1647 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !1643)
!1648 = !DILocation(line: 351, column: 5, scope: !617, inlinedAt: !1639)
!1649 = !DILocation(line: 351, column: 27, scope: !617, inlinedAt: !1639)
!1650 = !DILocation(line: 355, column: 38, scope: !657, inlinedAt: !1639)
!1651 = !DILocation(line: 355, column: 9, scope: !617, inlinedAt: !1639)
!1652 = !DILocation(line: 358, column: 20, scope: !617, inlinedAt: !1639)
!1653 = !DILocation(line: 359, column: 5, scope: !617, inlinedAt: !1639)
!1654 = !DILocation(line: 361, column: 5, scope: !617, inlinedAt: !1639)
!1655 = !DILocation(line: 367, column: 20, scope: !634, inlinedAt: !1639)
!1656 = !DILocation(line: 367, column: 27, scope: !634, inlinedAt: !1639)
!1657 = !DILocation(line: 368, column: 31, scope: !634, inlinedAt: !1639)
!1658 = !DILocation(line: 368, column: 20, scope: !634, inlinedAt: !1639)
!1659 = !DILocation(line: 368, column: 24, scope: !634, inlinedAt: !1639)
!1660 = !DILocation(line: 369, column: 39, scope: !634, inlinedAt: !1639)
!1661 = !DILocation(line: 369, column: 20, scope: !634, inlinedAt: !1639)
!1662 = !DILocation(line: 369, column: 32, scope: !634, inlinedAt: !1639)
!1663 = !DILocation(line: 370, column: 20, scope: !634, inlinedAt: !1639)
!1664 = !DILocation(line: 370, column: 26, scope: !634, inlinedAt: !1639)
!1665 = !DILocation(line: 371, column: 20, scope: !634, inlinedAt: !1639)
!1666 = !DILocation(line: 371, column: 26, scope: !634, inlinedAt: !1639)
!1667 = !DILocation(line: 372, column: 30, scope: !634, inlinedAt: !1639)
!1668 = !DILocation(line: 372, column: 20, scope: !634, inlinedAt: !1639)
!1669 = !DILocation(line: 372, column: 28, scope: !634, inlinedAt: !1639)
!1670 = !DILocation(line: 373, column: 36, scope: !634, inlinedAt: !1639)
!1671 = !DILocation(line: 373, column: 20, scope: !634, inlinedAt: !1639)
!1672 = !DILocation(line: 373, column: 29, scope: !634, inlinedAt: !1639)
!1673 = !DILocation(line: 374, column: 36, scope: !634, inlinedAt: !1639)
!1674 = !DILocation(line: 374, column: 20, scope: !634, inlinedAt: !1639)
!1675 = !DILocation(line: 374, column: 29, scope: !634, inlinedAt: !1639)
!1676 = !DILocation(line: 375, column: 9, scope: !634, inlinedAt: !1639)
!1677 = !DILocation(line: 378, column: 14, scope: !699, inlinedAt: !1639)
!1678 = !DILocation(line: 378, column: 13, scope: !634, inlinedAt: !1639)
!1679 = !DILocation(line: 381, column: 18, scope: !702, inlinedAt: !1639)
!1680 = !DILocation(line: 381, column: 28, scope: !702, inlinedAt: !1639)
!1681 = !DILocation(line: 381, column: 13, scope: !634, inlinedAt: !1639)
!1682 = !DILocation(line: 384, column: 62, scope: !634, inlinedAt: !1639)
!1683 = !DILocation(line: 0, scope: !634, inlinedAt: !1639)
!1684 = !DILocation(line: 385, column: 62, scope: !634, inlinedAt: !1639)
!1685 = !DILocation(line: 387, column: 20, scope: !634, inlinedAt: !1639)
!1686 = !DILocation(line: 387, column: 27, scope: !634, inlinedAt: !1639)
!1687 = !DILocation(line: 388, column: 20, scope: !634, inlinedAt: !1639)
!1688 = !DILocation(line: 388, column: 24, scope: !634, inlinedAt: !1639)
!1689 = !DILocation(line: 389, column: 31, scope: !634, inlinedAt: !1639)
!1690 = !DILocation(line: 389, column: 46, scope: !634, inlinedAt: !1639)
!1691 = !DILocation(line: 389, column: 20, scope: !634, inlinedAt: !1639)
!1692 = !DILocation(line: 389, column: 29, scope: !634, inlinedAt: !1639)
!1693 = !DILocation(line: 390, column: 39, scope: !634, inlinedAt: !1639)
!1694 = !DILocation(line: 390, column: 20, scope: !634, inlinedAt: !1639)
!1695 = !DILocation(line: 390, column: 32, scope: !634, inlinedAt: !1639)
!1696 = !DILocation(line: 391, column: 20, scope: !634, inlinedAt: !1639)
!1697 = !DILocation(line: 391, column: 26, scope: !634, inlinedAt: !1639)
!1698 = !DILocation(line: 392, column: 20, scope: !634, inlinedAt: !1639)
!1699 = !DILocation(line: 392, column: 26, scope: !634, inlinedAt: !1639)
!1700 = !DILocation(line: 393, column: 30, scope: !634, inlinedAt: !1639)
!1701 = !DILocation(line: 393, column: 20, scope: !634, inlinedAt: !1639)
!1702 = !DILocation(line: 393, column: 28, scope: !634, inlinedAt: !1639)
!1703 = !DILocation(line: 394, column: 21, scope: !634, inlinedAt: !1639)
!1704 = !DILocation(line: 395, column: 21, scope: !634, inlinedAt: !1639)
!1705 = !DILocation(line: 396, column: 9, scope: !634, inlinedAt: !1639)
!1706 = !DILocation(line: 405, column: 31, scope: !617, inlinedAt: !1639)
!1707 = !DILocation(line: 405, column: 16, scope: !617, inlinedAt: !1639)
!1708 = !DILocation(line: 405, column: 24, scope: !617, inlinedAt: !1639)
!1709 = !DILocation(line: 407, column: 29, scope: !617, inlinedAt: !1639)
!1710 = !DILocation(line: 407, column: 14, scope: !617, inlinedAt: !1639)
!1711 = !DILocation(line: 409, column: 5, scope: !617, inlinedAt: !1639)
!1712 = !DILocation(line: 412, column: 13, scope: !638, inlinedAt: !1639)
!1713 = !DILocation(line: 0, scope: !741, inlinedAt: !1714)
!1714 = distinct !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !1639)
!1715 = !DILocation(line: 156, column: 31, scope: !741, inlinedAt: !1714)
!1716 = !DILocation(line: 158, column: 11, scope: !741, inlinedAt: !1714)
!1717 = !DILocation(line: 159, column: 43, scope: !741, inlinedAt: !1714)
!1718 = !DILocation(line: 159, column: 34, scope: !741, inlinedAt: !1714)
!1719 = !DILocation(line: 159, column: 16, scope: !741, inlinedAt: !1714)
!1720 = !DILocation(line: 160, column: 19, scope: !741, inlinedAt: !1714)
!1721 = !DILocation(line: 160, column: 12, scope: !741, inlinedAt: !1714)
!1722 = !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !1639)
!1723 = !DILocation(line: 415, column: 18, scope: !760, inlinedAt: !1639)
!1724 = !DILocation(line: 415, column: 27, scope: !760, inlinedAt: !1639)
!1725 = !DILocation(line: 415, column: 13, scope: !760, inlinedAt: !1639)
!1726 = !DILocation(line: 454, column: 1, scope: !617, inlinedAt: !1639)
!1727 = !DILocation(line: 471, column: 9, scope: !586, inlinedAt: !1629)
!1728 = !DILocation(line: 417, column: 31, scope: !638, inlinedAt: !1639)
!1729 = !DILocation(line: 417, column: 18, scope: !638, inlinedAt: !1639)
!1730 = !DILocation(line: 0, scope: !638, inlinedAt: !1639)
!1731 = !DILocation(line: 421, column: 43, scope: !638, inlinedAt: !1639)
!1732 = !DILocation(line: 421, column: 9, scope: !638, inlinedAt: !1639)
!1733 = !DILocation(line: 422, column: 45, scope: !638, inlinedAt: !1639)
!1734 = !DILocation(line: 422, column: 9, scope: !638, inlinedAt: !1639)
!1735 = !DILocation(line: 0, scope: !773, inlinedAt: !1736)
!1736 = distinct !DILocation(line: 473, column: 9, scope: !785, inlinedAt: !1629)
!1737 = !DILocation(line: 223, column: 5, scope: !773, inlinedAt: !1736)
!1738 = !DILocation(line: 224, column: 24, scope: !773, inlinedAt: !1736)
!1739 = !DILocation(line: 224, column: 5, scope: !773, inlinedAt: !1736)
!1740 = !DILocation(line: 475, column: 14, scope: !791, inlinedAt: !1629)
!1741 = !DILocation(line: 475, column: 13, scope: !785, inlinedAt: !1629)
!1742 = !DILocation(line: 478, column: 18, scope: !794, inlinedAt: !1629)
!1743 = !DILocation(line: 478, column: 37, scope: !794, inlinedAt: !1629)
!1744 = !DILocation(line: 478, column: 34, scope: !794, inlinedAt: !1629)
!1745 = !DILocation(line: 478, column: 13, scope: !785, inlinedAt: !1629)
!1746 = !DILocation(line: 484, column: 16, scope: !785, inlinedAt: !1629)
!1747 = !DILocation(line: 484, column: 9, scope: !785, inlinedAt: !1629)
!1748 = !DILocation(line: 488, column: 1, scope: !586, inlinedAt: !1629)
!1749 = !DILocation(line: 0, scope: !397, inlinedAt: !1750)
!1750 = distinct !DILocation(line: 453, column: 28, scope: !1316)
!1751 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !1750)
!1752 = !DILocation(line: 453, column: 21, scope: !1316)
!1753 = !DILocalVariable(name: "xdp", arg: 1, scope: !1754, file: !3, line: 302, type: !61)
!1754 = distinct !DISubprogram(name: "action_end_m_gtp4_e", scope: !3, file: !3, line: 302, type: !1527, scopeLine: 303, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1755)
!1755 = !{!1753, !1756, !1757, !1758, !1759, !1760, !1761, !1762, !1763, !1764, !1765, !1766, !1767, !1775, !1776, !1777, !1778, !1779, !1780, !1781, !1782, !1783}
!1756 = !DILocalVariable(name: "ef", arg: 2, scope: !1754, file: !3, line: 302, type: !171)
!1757 = !DILocalVariable(name: "data_end", scope: !1754, file: !3, line: 304, type: !53)
!1758 = !DILocalVariable(name: "data", scope: !1754, file: !3, line: 305, type: !53)
!1759 = !DILocalVariable(name: "srh", scope: !1754, file: !3, line: 307, type: !469)
!1760 = !DILocalVariable(name: "v6h", scope: !1754, file: !3, line: 308, type: !328)
!1761 = !DILocalVariable(name: "payload_len", scope: !1754, file: !3, line: 309, type: !55)
!1762 = !DILocalVariable(name: "tot_len", scope: !1754, file: !3, line: 309, type: !55)
!1763 = !DILocalVariable(name: "v6taple_key", scope: !1754, file: !3, line: 314, type: !60)
!1764 = !DILocalVariable(name: "map_addr_taple", scope: !1754, file: !3, line: 315, type: !251)
!1765 = !DILocalVariable(name: "new_eth", scope: !1754, file: !3, line: 334, type: !305)
!1766 = !DILocalVariable(name: "new_iph", scope: !1754, file: !3, line: 335, type: !313)
!1767 = !DILocalVariable(name: "new_uh", scope: !1754, file: !3, line: 336, type: !1768)
!1768 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1769, size: 64)
!1769 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "udphdr", file: !6, line: 43689, size: 64, elements: !1770)
!1770 = !{!1771, !1772, !1773, !1774}
!1771 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !1769, file: !6, line: 43690, baseType: !85, size: 16)
!1772 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !1769, file: !6, line: 43691, baseType: !85, size: 16, offset: 16)
!1773 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !1769, file: !6, line: 43692, baseType: !85, size: 16, offset: 32)
!1774 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !1769, file: !6, line: 43693, baseType: !94, size: 16, offset: 48)
!1775 = !DILocalVariable(name: "new_gtp1", scope: !1754, file: !3, line: 337, type: !825)
!1776 = !DILocalVariable(name: "args", scope: !1754, file: !3, line: 356, type: !835)
!1777 = !DILocalVariable(name: "s_offset", scope: !1754, file: !3, line: 358, type: !55)
!1778 = !DILocalVariable(name: "s_shift", scope: !1754, file: !3, line: 358, type: !55)
!1779 = !DILocalVariable(name: "d_offset", scope: !1754, file: !3, line: 358, type: !55)
!1780 = !DILocalVariable(name: "d_shift", scope: !1754, file: !3, line: 358, type: !55)
!1781 = !DILocalVariable(name: "src_p", scope: !1754, file: !3, line: 365, type: !96)
!1782 = !DILocalVariable(name: "dst_p", scope: !1754, file: !3, line: 365, type: !96)
!1783 = !DILocalVariable(name: "args_p", scope: !1754, file: !3, line: 365, type: !96)
!1784 = !DILocation(line: 0, scope: !1754, inlinedAt: !1785)
!1785 = distinct !DILocation(line: 455, column: 59, scope: !1316)
!1786 = !DILocation(line: 0, scope: !1326, inlinedAt: !1787)
!1787 = distinct !DILocation(line: 307, column: 26, scope: !1754, inlinedAt: !1785)
!1788 = !DILocation(line: 265, column: 37, scope: !1326, inlinedAt: !1787)
!1789 = !DILocation(line: 265, column: 26, scope: !1326, inlinedAt: !1787)
!1790 = !DILocation(line: 265, column: 18, scope: !1326, inlinedAt: !1787)
!1791 = !DILocation(line: 266, column: 41, scope: !1326, inlinedAt: !1787)
!1792 = !DILocation(line: 266, column: 30, scope: !1326, inlinedAt: !1787)
!1793 = !DILocation(line: 272, column: 13, scope: !1339, inlinedAt: !1787)
!1794 = !DILocation(line: 272, column: 19, scope: !1339, inlinedAt: !1787)
!1795 = !DILocation(line: 272, column: 17, scope: !1339, inlinedAt: !1787)
!1796 = !DILocation(line: 272, column: 9, scope: !1326, inlinedAt: !1787)
!1797 = !DILocation(line: 0, scope: !375, inlinedAt: !1798)
!1798 = distinct !DILocation(line: 308, column: 27, scope: !1754, inlinedAt: !1785)
!1799 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !1798)
!1800 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !1798)
!1801 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !1798)
!1802 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !1798)
!1803 = !DILocation(line: 311, column: 10, scope: !1804, inlinedAt: !1785)
!1804 = distinct !DILexicalBlock(scope: !1754, file: !3, line: 311, column: 9)
!1805 = !DILocation(line: 311, column: 14, scope: !1804, inlinedAt: !1785)
!1806 = !DILocation(line: 314, column: 5, scope: !1754, inlinedAt: !1785)
!1807 = !DILocation(line: 314, column: 9, scope: !1754, inlinedAt: !1785)
!1808 = !DILocation(line: 315, column: 42, scope: !1754, inlinedAt: !1785)
!1809 = !DILocation(line: 316, column: 10, scope: !1810, inlinedAt: !1785)
!1810 = distinct !DILexicalBlock(scope: !1754, file: !3, line: 316, column: 9)
!1811 = !DILocation(line: 316, column: 9, scope: !1754, inlinedAt: !1785)
!1812 = !DILocation(line: 319, column: 21, scope: !1754, inlinedAt: !1785)
!1813 = !DILocation(line: 319, column: 34, scope: !1754, inlinedAt: !1785)
!1814 = !DILocation(line: 320, column: 21, scope: !1754, inlinedAt: !1785)
!1815 = !DILocation(line: 320, column: 34, scope: !1754, inlinedAt: !1785)
!1816 = !DILocation(line: 323, column: 19, scope: !1754, inlinedAt: !1785)
!1817 = !DILocation(line: 323, column: 55, scope: !1754, inlinedAt: !1785)
!1818 = !DILocation(line: 323, column: 50, scope: !1754, inlinedAt: !1785)
!1819 = !DILocation(line: 323, column: 70, scope: !1754, inlinedAt: !1785)
!1820 = !DILocation(line: 325, column: 63, scope: !1821, inlinedAt: !1785)
!1821 = distinct !DILexicalBlock(scope: !1754, file: !3, line: 325, column: 9)
!1822 = !DILocation(line: 325, column: 9, scope: !1821, inlinedAt: !1785)
!1823 = !DILocation(line: 325, column: 9, scope: !1754, inlinedAt: !1785)
!1824 = !DILocation(line: 328, column: 9, scope: !1825, inlinedAt: !1785)
!1825 = distinct !DILexicalBlock(scope: !1754, file: !3, line: 328, column: 9)
!1826 = !DILocation(line: 328, column: 9, scope: !1754, inlinedAt: !1785)
!1827 = !DILocalVariable(name: "xdp", arg: 1, scope: !1828, file: !360, line: 227, type: !61)
!1828 = distinct !DISubprogram(name: "get_eth", scope: !360, file: !360, line: 227, type: !1829, scopeLine: 228, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1831)
!1829 = !DISubroutineType(types: !1830)
!1830 = !{!305, !61}
!1831 = !{!1827, !1832, !1833, !1834}
!1832 = !DILocalVariable(name: "data", scope: !1828, file: !360, line: 229, type: !53)
!1833 = !DILocalVariable(name: "data_end", scope: !1828, file: !360, line: 230, type: !53)
!1834 = !DILocalVariable(name: "eth", scope: !1828, file: !360, line: 232, type: !305)
!1835 = !DILocation(line: 0, scope: !1828, inlinedAt: !1836)
!1836 = distinct !DILocation(line: 334, column: 30, scope: !1754, inlinedAt: !1785)
!1837 = !DILocation(line: 229, column: 37, scope: !1828, inlinedAt: !1836)
!1838 = !DILocation(line: 229, column: 26, scope: !1828, inlinedAt: !1836)
!1839 = !DILocation(line: 230, column: 41, scope: !1828, inlinedAt: !1836)
!1840 = !DILocation(line: 230, column: 30, scope: !1828, inlinedAt: !1836)
!1841 = !DILocation(line: 232, column: 26, scope: !1828, inlinedAt: !1836)
!1842 = !DILocation(line: 233, column: 13, scope: !1843, inlinedAt: !1836)
!1843 = distinct !DILexicalBlock(scope: !1828, file: !360, line: 233, column: 9)
!1844 = !DILocation(line: 233, column: 19, scope: !1843, inlinedAt: !1836)
!1845 = !DILocation(line: 233, column: 17, scope: !1843, inlinedAt: !1836)
!1846 = !DILocation(line: 0, scope: !359, inlinedAt: !1847)
!1847 = distinct !DILocation(line: 335, column: 29, scope: !1754, inlinedAt: !1785)
!1848 = !DILocation(line: 253, column: 18, scope: !359, inlinedAt: !1847)
!1849 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !1847)
!1850 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !1847)
!1851 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !1847)
!1852 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !1847)
!1853 = !DILocalVariable(name: "xdp", arg: 1, scope: !1854, file: !360, line: 281, type: !61)
!1854 = distinct !DISubprogram(name: "get_v4_udp", scope: !360, file: !360, line: 281, type: !1855, scopeLine: 282, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1857)
!1855 = !DISubroutineType(types: !1856)
!1856 = !{!1768, !61}
!1857 = !{!1853, !1858, !1859, !1860}
!1858 = !DILocalVariable(name: "data", scope: !1854, file: !360, line: 283, type: !53)
!1859 = !DILocalVariable(name: "data_end", scope: !1854, file: !360, line: 284, type: !53)
!1860 = !DILocalVariable(name: "uh", scope: !1854, file: !360, line: 286, type: !1768)
!1861 = !DILocation(line: 0, scope: !1854, inlinedAt: !1862)
!1862 = distinct !DILocation(line: 336, column: 29, scope: !1754, inlinedAt: !1785)
!1863 = !DILocation(line: 284, column: 22, scope: !1854, inlinedAt: !1862)
!1864 = !DILocation(line: 288, column: 20, scope: !1865, inlinedAt: !1862)
!1865 = distinct !DILexicalBlock(scope: !1854, file: !360, line: 288, column: 9)
!1866 = !DILocation(line: 288, column: 44, scope: !1865, inlinedAt: !1862)
!1867 = !DILocation(line: 288, column: 9, scope: !1854, inlinedAt: !1862)
!1868 = !DILocalVariable(name: "xdp", arg: 1, scope: !1869, file: !360, line: 294, type: !61)
!1869 = distinct !DISubprogram(name: "get_v4_gtp1", scope: !360, file: !360, line: 294, type: !1870, scopeLine: 295, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1872)
!1870 = !DISubroutineType(types: !1871)
!1871 = !{!825, !61}
!1872 = !{!1868, !1873, !1874, !1875}
!1873 = !DILocalVariable(name: "data", scope: !1869, file: !360, line: 296, type: !53)
!1874 = !DILocalVariable(name: "data_end", scope: !1869, file: !360, line: 297, type: !53)
!1875 = !DILocalVariable(name: "gtp1", scope: !1869, file: !360, line: 299, type: !825)
!1876 = !DILocation(line: 0, scope: !1869, inlinedAt: !1877)
!1877 = distinct !DILocation(line: 337, column: 32, scope: !1754, inlinedAt: !1785)
!1878 = !DILocation(line: 301, column: 22, scope: !1879, inlinedAt: !1877)
!1879 = distinct !DILexicalBlock(scope: !1869, file: !360, line: 301, column: 9)
!1880 = !DILocation(line: 301, column: 47, scope: !1879, inlinedAt: !1877)
!1881 = !DILocation(line: 301, column: 9, scope: !1869, inlinedAt: !1877)
!1882 = !DILocation(line: 339, column: 10, scope: !1883, inlinedAt: !1785)
!1883 = distinct !DILexicalBlock(scope: !1754, file: !3, line: 339, column: 9)
!1884 = !DILocation(line: 339, column: 18, scope: !1883, inlinedAt: !1785)
!1885 = !DILocation(line: 342, column: 64, scope: !1754, inlinedAt: !1785)
!1886 = !DILocation(line: 344, column: 14, scope: !1754, inlinedAt: !1785)
!1887 = !DILocation(line: 344, column: 22, scope: !1754, inlinedAt: !1785)
!1888 = !DILocation(line: 347, column: 14, scope: !1754, inlinedAt: !1785)
!1889 = !DILocation(line: 347, column: 22, scope: !1754, inlinedAt: !1785)
!1890 = !DILocation(line: 348, column: 14, scope: !1754, inlinedAt: !1785)
!1891 = !DILocation(line: 348, column: 18, scope: !1754, inlinedAt: !1785)
!1892 = !DILocation(line: 349, column: 14, scope: !1754, inlinedAt: !1785)
!1893 = !DILocation(line: 349, column: 23, scope: !1754, inlinedAt: !1785)
!1894 = !{!429, !412, i64 6}
!1895 = !DILocation(line: 350, column: 14, scope: !1754, inlinedAt: !1785)
!1896 = !DILocation(line: 350, column: 23, scope: !1754, inlinedAt: !1785)
!1897 = !DILocation(line: 351, column: 14, scope: !1754, inlinedAt: !1785)
!1898 = !DILocation(line: 351, column: 20, scope: !1754, inlinedAt: !1785)
!1899 = !DILocation(line: 352, column: 14, scope: !1754, inlinedAt: !1785)
!1900 = !DILocation(line: 352, column: 18, scope: !1754, inlinedAt: !1785)
!1901 = !DILocation(line: 353, column: 14, scope: !1754, inlinedAt: !1785)
!1902 = !DILocation(line: 353, column: 22, scope: !1754, inlinedAt: !1785)
!1903 = !DILocation(line: 354, column: 14, scope: !1754, inlinedAt: !1785)
!1904 = !DILocation(line: 354, column: 18, scope: !1754, inlinedAt: !1785)
!1905 = !DILocation(line: 356, column: 5, scope: !1754, inlinedAt: !1785)
!1906 = !DILocation(line: 356, column: 29, scope: !1754, inlinedAt: !1785)
!1907 = !DILocation(line: 357, column: 5, scope: !1754, inlinedAt: !1785)
!1908 = !DILocation(line: 360, column: 20, scope: !1754, inlinedAt: !1785)
!1909 = !{!1307, !349, i64 40}
!1910 = !DILocation(line: 360, column: 33, scope: !1754, inlinedAt: !1785)
!1911 = !DILocation(line: 360, column: 16, scope: !1754, inlinedAt: !1785)
!1912 = !DILocation(line: 361, column: 15, scope: !1754, inlinedAt: !1785)
!1913 = !DILocation(line: 362, column: 20, scope: !1754, inlinedAt: !1785)
!1914 = !{!1307, !349, i64 44}
!1915 = !DILocation(line: 362, column: 33, scope: !1754, inlinedAt: !1785)
!1916 = !DILocation(line: 362, column: 16, scope: !1754, inlinedAt: !1785)
!1917 = !DILocation(line: 363, column: 15, scope: !1754, inlinedAt: !1785)
!1918 = !DILocation(line: 366, column: 31, scope: !1754, inlinedAt: !1785)
!1919 = !DILocation(line: 366, column: 13, scope: !1754, inlinedAt: !1785)
!1920 = !DILocation(line: 367, column: 31, scope: !1754, inlinedAt: !1785)
!1921 = !DILocation(line: 367, column: 13, scope: !1754, inlinedAt: !1785)
!1922 = !DILocalVariable(name: "payload", arg: 1, scope: !1923, file: !360, line: 75, type: !96)
!1923 = distinct !DISubprogram(name: "read_v6addr_in_pkt_pyload", scope: !360, file: !360, line: 74, type: !1924, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1926)
!1924 = !DISubroutineType(types: !1925)
!1925 = !{null, !96, !71, !55, !55, !55, !972}
!1926 = !{!1922, !1927, !1928, !1929, !1930, !1931, !1932, !1936, !1939, !1940}
!1927 = !DILocalVariable(name: "v6addr", arg: 2, scope: !1923, file: !360, line: 75, type: !71)
!1928 = !DILocalVariable(name: "payload_size", arg: 3, scope: !1923, file: !360, line: 75, type: !55)
!1929 = !DILocalVariable(name: "offset", arg: 4, scope: !1923, file: !360, line: 75, type: !55)
!1930 = !DILocalVariable(name: "shift", arg: 5, scope: !1923, file: !360, line: 75, type: !55)
!1931 = !DILocalVariable(name: "data_end", arg: 6, scope: !1923, file: !360, line: 75, type: !972)
!1932 = !DILocalVariable(name: "index", scope: !1933, file: !360, line: 94, type: !55)
!1933 = distinct !DILexicalBlock(scope: !1934, file: !360, line: 94, column: 9)
!1934 = distinct !DILexicalBlock(scope: !1935, file: !360, line: 92, column: 5)
!1935 = distinct !DILexicalBlock(scope: !1923, file: !360, line: 84, column: 9)
!1936 = !DILocalVariable(name: "payval1", scope: !1937, file: !360, line: 101, type: !96)
!1937 = distinct !DILexicalBlock(scope: !1938, file: !360, line: 95, column: 9)
!1938 = distinct !DILexicalBlock(scope: !1933, file: !360, line: 94, column: 9)
!1939 = !DILocalVariable(name: "payval2", scope: !1937, file: !360, line: 102, type: !96)
!1940 = !DILocalVariable(name: "v6val", scope: !1937, file: !360, line: 103, type: !96)
!1941 = !DILocation(line: 0, scope: !1923, inlinedAt: !1942)
!1942 = distinct !DILocation(line: 370, column: 5, scope: !1754, inlinedAt: !1785)
!1943 = !DILocation(line: 79, column: 36, scope: !1944, inlinedAt: !1942)
!1944 = distinct !DILexicalBlock(scope: !1923, file: !360, line: 79, column: 9)
!1945 = !DILocation(line: 79, column: 43, scope: !1944, inlinedAt: !1942)
!1946 = !DILocation(line: 84, column: 15, scope: !1935, inlinedAt: !1942)
!1947 = !DILocation(line: 84, column: 9, scope: !1923, inlinedAt: !1942)
!1948 = !DILocation(line: 0, scope: !1933, inlinedAt: !1942)
!1949 = !DILocation(line: 0, scope: !1937, inlinedAt: !1942)
!1950 = !DILocation(line: 98, column: 17, scope: !1937, inlinedAt: !1942)
!1951 = !DILocation(line: 86, column: 29, scope: !1952, inlinedAt: !1942)
!1952 = distinct !DILexicalBlock(scope: !1953, file: !360, line: 86, column: 13)
!1953 = distinct !DILexicalBlock(scope: !1935, file: !360, line: 85, column: 5)
!1954 = !DILocation(line: 86, column: 44, scope: !1952, inlinedAt: !1942)
!1955 = !DILocation(line: 86, column: 13, scope: !1953, inlinedAt: !1942)
!1956 = !DILocation(line: 89, column: 44, scope: !1953, inlinedAt: !1942)
!1957 = !DILocation(line: 89, column: 50, scope: !1953, inlinedAt: !1942)
!1958 = !DILocation(line: 89, column: 36, scope: !1953, inlinedAt: !1942)
!1959 = !DILocation(line: 89, column: 9, scope: !1953, inlinedAt: !1942)
!1960 = !DILocation(line: 90, column: 5, scope: !1953, inlinedAt: !1942)
!1961 = !DILocation(line: 101, column: 53, scope: !1937, inlinedAt: !1942)
!1962 = !DILocation(line: 102, column: 61, scope: !1937, inlinedAt: !1942)
!1963 = !DILocation(line: 103, column: 59, scope: !1937, inlinedAt: !1942)
!1964 = !DILocation(line: 104, column: 37, scope: !1965, inlinedAt: !1942)
!1965 = distinct !DILexicalBlock(scope: !1937, file: !360, line: 104, column: 17)
!1966 = !DILocation(line: 104, column: 48, scope: !1965, inlinedAt: !1942)
!1967 = !DILocation(line: 107, column: 25, scope: !1937, inlinedAt: !1942)
!1968 = !DILocation(line: 107, column: 32, scope: !1937, inlinedAt: !1942)
!1969 = !DILocation(line: 107, column: 22, scope: !1937, inlinedAt: !1942)
!1970 = !DILocation(line: 108, column: 25, scope: !1937, inlinedAt: !1942)
!1971 = !DILocation(line: 108, column: 32, scope: !1937, inlinedAt: !1942)
!1972 = !DILocation(line: 108, column: 22, scope: !1937, inlinedAt: !1942)
!1973 = !DILocation(line: 94, column: 69, scope: !1938, inlinedAt: !1942)
!1974 = !DILocation(line: 98, column: 30, scope: !1975, inlinedAt: !1942)
!1975 = distinct !DILexicalBlock(scope: !1937, file: !360, line: 98, column: 17)
!1976 = distinct !{!1976, !1977, !1978, !1026}
!1977 = !DILocation(line: 94, column: 9, scope: !1933, inlinedAt: !1942)
!1978 = !DILocation(line: 109, column: 9, scope: !1933, inlinedAt: !1942)
!1979 = !DILocation(line: 0, scope: !1923, inlinedAt: !1980)
!1980 = distinct !DILocation(line: 371, column: 5, scope: !1754, inlinedAt: !1785)
!1981 = !DILocation(line: 79, column: 36, scope: !1944, inlinedAt: !1980)
!1982 = !DILocation(line: 79, column: 43, scope: !1944, inlinedAt: !1980)
!1983 = !DILocation(line: 84, column: 15, scope: !1935, inlinedAt: !1980)
!1984 = !DILocation(line: 84, column: 9, scope: !1923, inlinedAt: !1980)
!1985 = !DILocation(line: 0, scope: !1933, inlinedAt: !1980)
!1986 = !DILocation(line: 0, scope: !1937, inlinedAt: !1980)
!1987 = !DILocation(line: 98, column: 17, scope: !1937, inlinedAt: !1980)
!1988 = !DILocation(line: 86, column: 29, scope: !1952, inlinedAt: !1980)
!1989 = !DILocation(line: 86, column: 44, scope: !1952, inlinedAt: !1980)
!1990 = !DILocation(line: 86, column: 13, scope: !1953, inlinedAt: !1980)
!1991 = !DILocation(line: 89, column: 44, scope: !1953, inlinedAt: !1980)
!1992 = !DILocation(line: 89, column: 50, scope: !1953, inlinedAt: !1980)
!1993 = !DILocation(line: 89, column: 36, scope: !1953, inlinedAt: !1980)
!1994 = !DILocation(line: 89, column: 9, scope: !1953, inlinedAt: !1980)
!1995 = !DILocation(line: 90, column: 5, scope: !1953, inlinedAt: !1980)
!1996 = !DILocation(line: 101, column: 53, scope: !1937, inlinedAt: !1980)
!1997 = !DILocation(line: 102, column: 61, scope: !1937, inlinedAt: !1980)
!1998 = !DILocation(line: 103, column: 59, scope: !1937, inlinedAt: !1980)
!1999 = !DILocation(line: 104, column: 37, scope: !1965, inlinedAt: !1980)
!2000 = !DILocation(line: 104, column: 48, scope: !1965, inlinedAt: !1980)
!2001 = !DILocation(line: 107, column: 25, scope: !1937, inlinedAt: !1980)
!2002 = !DILocation(line: 107, column: 32, scope: !1937, inlinedAt: !1980)
!2003 = !DILocation(line: 107, column: 22, scope: !1937, inlinedAt: !1980)
!2004 = !DILocation(line: 108, column: 25, scope: !1937, inlinedAt: !1980)
!2005 = !DILocation(line: 108, column: 32, scope: !1937, inlinedAt: !1980)
!2006 = !DILocation(line: 108, column: 22, scope: !1937, inlinedAt: !1980)
!2007 = !DILocation(line: 94, column: 69, scope: !1938, inlinedAt: !1980)
!2008 = !DILocation(line: 98, column: 30, scope: !1975, inlinedAt: !1980)
!2009 = distinct !{!2009, !2010, !2011, !1026}
!2010 = !DILocation(line: 94, column: 9, scope: !1933, inlinedAt: !1980)
!2011 = !DILocation(line: 109, column: 9, scope: !1933, inlinedAt: !1980)
!2012 = !DILocation(line: 372, column: 14, scope: !1754, inlinedAt: !1785)
!2013 = !DILocalVariable(name: "payload", arg: 1, scope: !2014, file: !360, line: 25, type: !96)
!2014 = distinct !DISubprogram(name: "read_v6addr_in_pyload", scope: !360, file: !360, line: 24, type: !2015, scopeLine: 26, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2017)
!2015 = !DISubroutineType(types: !2016)
!2016 = !{null, !96, !71, !55, !55, !55}
!2017 = !{!2013, !2018, !2019, !2020, !2021, !2022, !2026, !2029, !2030, !2033, !2036, !2037}
!2018 = !DILocalVariable(name: "v6addr", arg: 2, scope: !2014, file: !360, line: 25, type: !71)
!2019 = !DILocalVariable(name: "payload_size", arg: 3, scope: !2014, file: !360, line: 25, type: !55)
!2020 = !DILocalVariable(name: "offset", arg: 4, scope: !2014, file: !360, line: 25, type: !55)
!2021 = !DILocalVariable(name: "shift", arg: 5, scope: !2014, file: !360, line: 25, type: !55)
!2022 = !DILocalVariable(name: "index", scope: !2023, file: !360, line: 37, type: !55)
!2023 = distinct !DILexicalBlock(scope: !2024, file: !360, line: 37, column: 9)
!2024 = distinct !DILexicalBlock(scope: !2025, file: !360, line: 35, column: 5)
!2025 = distinct !DILexicalBlock(scope: !2014, file: !360, line: 34, column: 9)
!2026 = !DILocalVariable(name: "payval1", scope: !2027, file: !360, line: 44, type: !96)
!2027 = distinct !DILexicalBlock(scope: !2028, file: !360, line: 38, column: 9)
!2028 = distinct !DILexicalBlock(scope: !2023, file: !360, line: 37, column: 9)
!2029 = !DILocalVariable(name: "v6val", scope: !2027, file: !360, line: 45, type: !96)
!2030 = !DILocalVariable(name: "index", scope: !2031, file: !360, line: 55, type: !55)
!2031 = distinct !DILexicalBlock(scope: !2032, file: !360, line: 55, column: 9)
!2032 = distinct !DILexicalBlock(scope: !2025, file: !360, line: 53, column: 5)
!2033 = !DILocalVariable(name: "payval1", scope: !2034, file: !360, line: 62, type: !96)
!2034 = distinct !DILexicalBlock(scope: !2035, file: !360, line: 56, column: 9)
!2035 = distinct !DILexicalBlock(scope: !2031, file: !360, line: 55, column: 9)
!2036 = !DILocalVariable(name: "payval2", scope: !2034, file: !360, line: 63, type: !96)
!2037 = !DILocalVariable(name: "v6val", scope: !2034, file: !360, line: 64, type: !96)
!2038 = !DILocation(line: 0, scope: !2014, inlinedAt: !2039)
!2039 = distinct !DILocation(line: 374, column: 5, scope: !1754, inlinedAt: !1785)
!2040 = !DILocation(line: 27, column: 21, scope: !2014, inlinedAt: !2039)
!2041 = !DILocation(line: 30, column: 33, scope: !2042, inlinedAt: !2039)
!2042 = distinct !DILexicalBlock(scope: !2014, file: !360, line: 29, column: 9)
!2043 = !DILocation(line: 30, column: 58, scope: !2042, inlinedAt: !2039)
!2044 = !DILocation(line: 34, column: 9, scope: !2025, inlinedAt: !2039)
!2045 = !DILocation(line: 34, column: 15, scope: !2025, inlinedAt: !2039)
!2046 = !DILocation(line: 0, scope: !2025, inlinedAt: !2039)
!2047 = !DILocation(line: 34, column: 9, scope: !2014, inlinedAt: !2039)
!2048 = !DILocation(line: 37, column: 9, scope: !2023, inlinedAt: !2039)
!2049 = !DILocation(line: 46, column: 36, scope: !2050, inlinedAt: !2039)
!2050 = distinct !DILexicalBlock(scope: !2027, file: !360, line: 46, column: 17)
!2051 = !DILocation(line: 0, scope: !2031, inlinedAt: !2039)
!2052 = !DILocation(line: 0, scope: !2034, inlinedAt: !2039)
!2053 = !DILocation(line: 59, column: 39, scope: !2054, inlinedAt: !2039)
!2054 = distinct !DILexicalBlock(scope: !2034, file: !360, line: 59, column: 17)
!2055 = !DILocation(line: 65, column: 36, scope: !2056, inlinedAt: !2039)
!2056 = distinct !DILexicalBlock(scope: !2034, file: !360, line: 65, column: 17)
!2057 = !DILocation(line: 0, scope: !2023, inlinedAt: !2039)
!2058 = !DILocation(line: 0, scope: !2027, inlinedAt: !2039)
!2059 = !DILocation(line: 46, column: 17, scope: !2027, inlinedAt: !2039)
!2060 = !DILocation(line: 45, column: 59, scope: !2027, inlinedAt: !2039)
!2061 = !DILocation(line: 44, column: 53, scope: !2027, inlinedAt: !2039)
!2062 = !DILocation(line: 49, column: 24, scope: !2027, inlinedAt: !2039)
!2063 = !DILocation(line: 49, column: 22, scope: !2027, inlinedAt: !2039)
!2064 = !DILocation(line: 37, column: 69, scope: !2028, inlinedAt: !2039)
!2065 = !DILocation(line: 41, column: 30, scope: !2066, inlinedAt: !2039)
!2066 = distinct !DILexicalBlock(scope: !2027, file: !360, line: 41, column: 17)
!2067 = !DILocation(line: 41, column: 17, scope: !2027, inlinedAt: !2039)
!2068 = distinct !{!2068, !2048, !2069, !1026}
!2069 = !DILocation(line: 50, column: 9, scope: !2023, inlinedAt: !2039)
!2070 = !DILocation(line: 62, column: 53, scope: !2034, inlinedAt: !2039)
!2071 = !DILocation(line: 63, column: 61, scope: !2034, inlinedAt: !2039)
!2072 = !DILocation(line: 65, column: 17, scope: !2034, inlinedAt: !2039)
!2073 = !DILocation(line: 64, column: 59, scope: !2034, inlinedAt: !2039)
!2074 = !DILocation(line: 68, column: 25, scope: !2034, inlinedAt: !2039)
!2075 = !DILocation(line: 68, column: 32, scope: !2034, inlinedAt: !2039)
!2076 = !DILocation(line: 68, column: 22, scope: !2034, inlinedAt: !2039)
!2077 = !DILocation(line: 69, column: 32, scope: !2034, inlinedAt: !2039)
!2078 = !DILocation(line: 69, column: 22, scope: !2034, inlinedAt: !2039)
!2079 = !DILocation(line: 55, column: 69, scope: !2035, inlinedAt: !2039)
!2080 = distinct !{!2080, !2081, !2082, !1026}
!2081 = !DILocation(line: 55, column: 9, scope: !2031, inlinedAt: !2039)
!2082 = !DILocation(line: 70, column: 9, scope: !2031, inlinedAt: !2039)
!2083 = !DILocation(line: 377, column: 13, scope: !1754, inlinedAt: !1785)
!2084 = !DILocation(line: 377, column: 19, scope: !1754, inlinedAt: !1785)
!2085 = !{!2086, !412, i64 6}
!2086 = !{!"udphdr", !412, i64 0, !412, i64 2, !412, i64 4, !412, i64 6}
!2087 = !DILocation(line: 378, column: 13, scope: !1754, inlinedAt: !1785)
!2088 = !DILocation(line: 378, column: 20, scope: !1754, inlinedAt: !1785)
!2089 = !{!2086, !412, i64 0}
!2090 = !DILocation(line: 379, column: 13, scope: !1754, inlinedAt: !1785)
!2091 = !DILocation(line: 379, column: 18, scope: !1754, inlinedAt: !1785)
!2092 = !{!2086, !412, i64 2}
!2093 = !DILocation(line: 380, column: 19, scope: !1754, inlinedAt: !1785)
!2094 = !DILocation(line: 380, column: 13, scope: !1754, inlinedAt: !1785)
!2095 = !DILocation(line: 380, column: 17, scope: !1754, inlinedAt: !1785)
!2096 = !{!2086, !412, i64 4}
!2097 = !DILocation(line: 383, column: 15, scope: !1754, inlinedAt: !1785)
!2098 = !DILocation(line: 383, column: 21, scope: !1754, inlinedAt: !1785)
!2099 = !{!886, !350, i64 0}
!2100 = !DILocation(line: 385, column: 15, scope: !1754, inlinedAt: !1785)
!2101 = !DILocation(line: 385, column: 20, scope: !1754, inlinedAt: !1785)
!2102 = !DILocation(line: 386, column: 15, scope: !1754, inlinedAt: !1785)
!2103 = !DILocation(line: 386, column: 22, scope: !1754, inlinedAt: !1785)
!2104 = !DILocation(line: 387, column: 34, scope: !1754, inlinedAt: !1785)
!2105 = !DILocation(line: 387, column: 15, scope: !1754, inlinedAt: !1785)
!2106 = !DILocation(line: 387, column: 19, scope: !1754, inlinedAt: !1785)
!2107 = !DILocation(line: 0, scope: !1601, inlinedAt: !2108)
!2108 = distinct !DILocation(line: 389, column: 5, scope: !1754, inlinedAt: !1785)
!2109 = !DILocation(line: 207, column: 16, scope: !1601, inlinedAt: !2108)
!2110 = !DILocation(line: 208, column: 20, scope: !1601, inlinedAt: !2108)
!2111 = !DILocation(line: 210, column: 5, scope: !1614, inlinedAt: !2108)
!2112 = !DILocation(line: 211, column: 30, scope: !1616, inlinedAt: !2108)
!2113 = !DILocation(line: 211, column: 17, scope: !1616, inlinedAt: !2108)
!2114 = !DILocation(line: 211, column: 14, scope: !1616, inlinedAt: !2108)
!2115 = !DILocation(line: 210, column: 43, scope: !1616, inlinedAt: !2108)
!2116 = !DILocation(line: 210, column: 19, scope: !1616, inlinedAt: !2108)
!2117 = distinct !{!2117, !2111, !2118, !1026}
!2118 = !DILocation(line: 211, column: 30, scope: !1614, inlinedAt: !2108)
!2119 = !DILocation(line: 213, column: 44, scope: !1601, inlinedAt: !2108)
!2120 = !DILocation(line: 213, column: 36, scope: !1601, inlinedAt: !2108)
!2121 = !DILocation(line: 213, column: 18, scope: !1601, inlinedAt: !2108)
!2122 = !DILocation(line: 213, column: 16, scope: !1601, inlinedAt: !2108)
!2123 = !DILocation(line: 391, column: 19, scope: !1754, inlinedAt: !1785)
!2124 = !DILocation(line: 0, scope: !586, inlinedAt: !2125)
!2125 = distinct !DILocation(line: 392, column: 12, scope: !1754, inlinedAt: !1785)
!2126 = !DILocation(line: 458, column: 37, scope: !586, inlinedAt: !2125)
!2127 = !DILocation(line: 458, column: 26, scope: !586, inlinedAt: !2125)
!2128 = !DILocation(line: 458, column: 18, scope: !586, inlinedAt: !2125)
!2129 = !DILocation(line: 459, column: 41, scope: !586, inlinedAt: !2125)
!2130 = !DILocation(line: 459, column: 30, scope: !586, inlinedAt: !2125)
!2131 = !DILocation(line: 459, column: 22, scope: !586, inlinedAt: !2125)
!2132 = !DILocation(line: 462, column: 14, scope: !609, inlinedAt: !2125)
!2133 = !DILocation(line: 462, column: 18, scope: !609, inlinedAt: !2125)
!2134 = !DILocation(line: 462, column: 9, scope: !586, inlinedAt: !2125)
!2135 = !DILocation(line: 467, column: 5, scope: !586, inlinedAt: !2125)
!2136 = !DILocation(line: 468, column: 5, scope: !586, inlinedAt: !2125)
!2137 = !DILocation(line: 468, column: 10, scope: !586, inlinedAt: !2125)
!2138 = !DILocation(line: 468, column: 19, scope: !586, inlinedAt: !2125)
!2139 = !DILocation(line: 0, scope: !617, inlinedAt: !2140)
!2140 = distinct !DILocation(line: 470, column: 21, scope: !586, inlinedAt: !2125)
!2141 = !DILocation(line: 0, scope: !359, inlinedAt: !2142)
!2142 = distinct !DILocation(line: 349, column: 25, scope: !617, inlinedAt: !2140)
!2143 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !2142)
!2144 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !2142)
!2145 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !2142)
!2146 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !2142)
!2147 = !DILocation(line: 0, scope: !375, inlinedAt: !2148)
!2148 = distinct !DILocation(line: 350, column: 27, scope: !617, inlinedAt: !2140)
!2149 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !2148)
!2150 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !2148)
!2151 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !2148)
!2152 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !2148)
!2153 = !DILocation(line: 351, column: 5, scope: !617, inlinedAt: !2140)
!2154 = !DILocation(line: 351, column: 27, scope: !617, inlinedAt: !2140)
!2155 = !DILocation(line: 355, column: 38, scope: !657, inlinedAt: !2140)
!2156 = !DILocation(line: 355, column: 9, scope: !617, inlinedAt: !2140)
!2157 = !DILocation(line: 348, column: 26, scope: !617, inlinedAt: !2140)
!2158 = !DILocation(line: 358, column: 20, scope: !617, inlinedAt: !2140)
!2159 = !DILocation(line: 359, column: 5, scope: !617, inlinedAt: !2140)
!2160 = !DILocation(line: 361, column: 5, scope: !617, inlinedAt: !2140)
!2161 = !DILocation(line: 364, column: 14, scope: !664, inlinedAt: !2140)
!2162 = !DILocation(line: 364, column: 13, scope: !634, inlinedAt: !2140)
!2163 = !DILocation(line: 367, column: 20, scope: !634, inlinedAt: !2140)
!2164 = !DILocation(line: 367, column: 27, scope: !634, inlinedAt: !2140)
!2165 = !DILocation(line: 368, column: 31, scope: !634, inlinedAt: !2140)
!2166 = !DILocation(line: 368, column: 20, scope: !634, inlinedAt: !2140)
!2167 = !DILocation(line: 368, column: 24, scope: !634, inlinedAt: !2140)
!2168 = !DILocation(line: 369, column: 39, scope: !634, inlinedAt: !2140)
!2169 = !DILocation(line: 369, column: 20, scope: !634, inlinedAt: !2140)
!2170 = !DILocation(line: 369, column: 32, scope: !634, inlinedAt: !2140)
!2171 = !DILocation(line: 370, column: 20, scope: !634, inlinedAt: !2140)
!2172 = !DILocation(line: 370, column: 26, scope: !634, inlinedAt: !2140)
!2173 = !DILocation(line: 371, column: 20, scope: !634, inlinedAt: !2140)
!2174 = !DILocation(line: 371, column: 26, scope: !634, inlinedAt: !2140)
!2175 = !DILocation(line: 372, column: 30, scope: !634, inlinedAt: !2140)
!2176 = !DILocation(line: 372, column: 20, scope: !634, inlinedAt: !2140)
!2177 = !DILocation(line: 372, column: 28, scope: !634, inlinedAt: !2140)
!2178 = !DILocation(line: 373, column: 36, scope: !634, inlinedAt: !2140)
!2179 = !DILocation(line: 373, column: 20, scope: !634, inlinedAt: !2140)
!2180 = !DILocation(line: 373, column: 29, scope: !634, inlinedAt: !2140)
!2181 = !DILocation(line: 374, column: 36, scope: !634, inlinedAt: !2140)
!2182 = !DILocation(line: 374, column: 20, scope: !634, inlinedAt: !2140)
!2183 = !DILocation(line: 374, column: 29, scope: !634, inlinedAt: !2140)
!2184 = !DILocation(line: 375, column: 9, scope: !634, inlinedAt: !2140)
!2185 = !DILocation(line: 378, column: 14, scope: !699, inlinedAt: !2140)
!2186 = !DILocation(line: 378, column: 13, scope: !634, inlinedAt: !2140)
!2187 = !DILocation(line: 381, column: 18, scope: !702, inlinedAt: !2140)
!2188 = !DILocation(line: 381, column: 28, scope: !702, inlinedAt: !2140)
!2189 = !DILocation(line: 381, column: 13, scope: !634, inlinedAt: !2140)
!2190 = !DILocation(line: 384, column: 62, scope: !634, inlinedAt: !2140)
!2191 = !DILocation(line: 0, scope: !634, inlinedAt: !2140)
!2192 = !DILocation(line: 385, column: 62, scope: !634, inlinedAt: !2140)
!2193 = !DILocation(line: 387, column: 20, scope: !634, inlinedAt: !2140)
!2194 = !DILocation(line: 387, column: 27, scope: !634, inlinedAt: !2140)
!2195 = !DILocation(line: 388, column: 20, scope: !634, inlinedAt: !2140)
!2196 = !DILocation(line: 388, column: 24, scope: !634, inlinedAt: !2140)
!2197 = !DILocation(line: 389, column: 31, scope: !634, inlinedAt: !2140)
!2198 = !DILocation(line: 389, column: 46, scope: !634, inlinedAt: !2140)
!2199 = !DILocation(line: 389, column: 20, scope: !634, inlinedAt: !2140)
!2200 = !DILocation(line: 389, column: 29, scope: !634, inlinedAt: !2140)
!2201 = !DILocation(line: 390, column: 39, scope: !634, inlinedAt: !2140)
!2202 = !DILocation(line: 390, column: 20, scope: !634, inlinedAt: !2140)
!2203 = !DILocation(line: 390, column: 32, scope: !634, inlinedAt: !2140)
!2204 = !DILocation(line: 391, column: 20, scope: !634, inlinedAt: !2140)
!2205 = !DILocation(line: 391, column: 26, scope: !634, inlinedAt: !2140)
!2206 = !DILocation(line: 392, column: 20, scope: !634, inlinedAt: !2140)
!2207 = !DILocation(line: 392, column: 26, scope: !634, inlinedAt: !2140)
!2208 = !DILocation(line: 393, column: 30, scope: !634, inlinedAt: !2140)
!2209 = !DILocation(line: 393, column: 20, scope: !634, inlinedAt: !2140)
!2210 = !DILocation(line: 393, column: 28, scope: !634, inlinedAt: !2140)
!2211 = !DILocation(line: 394, column: 21, scope: !634, inlinedAt: !2140)
!2212 = !DILocation(line: 395, column: 21, scope: !634, inlinedAt: !2140)
!2213 = !DILocation(line: 396, column: 9, scope: !634, inlinedAt: !2140)
!2214 = !DILocation(line: 405, column: 31, scope: !617, inlinedAt: !2140)
!2215 = !DILocation(line: 405, column: 16, scope: !617, inlinedAt: !2140)
!2216 = !DILocation(line: 405, column: 24, scope: !617, inlinedAt: !2140)
!2217 = !DILocation(line: 407, column: 29, scope: !617, inlinedAt: !2140)
!2218 = !DILocation(line: 407, column: 14, scope: !617, inlinedAt: !2140)
!2219 = !DILocation(line: 409, column: 5, scope: !617, inlinedAt: !2140)
!2220 = !DILocation(line: 412, column: 13, scope: !638, inlinedAt: !2140)
!2221 = !DILocation(line: 0, scope: !741, inlinedAt: !2222)
!2222 = distinct !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !2140)
!2223 = !DILocation(line: 156, column: 31, scope: !741, inlinedAt: !2222)
!2224 = !DILocation(line: 158, column: 11, scope: !741, inlinedAt: !2222)
!2225 = !DILocation(line: 159, column: 43, scope: !741, inlinedAt: !2222)
!2226 = !DILocation(line: 159, column: 34, scope: !741, inlinedAt: !2222)
!2227 = !DILocation(line: 159, column: 16, scope: !741, inlinedAt: !2222)
!2228 = !DILocation(line: 160, column: 19, scope: !741, inlinedAt: !2222)
!2229 = !DILocation(line: 160, column: 12, scope: !741, inlinedAt: !2222)
!2230 = !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !2140)
!2231 = !DILocation(line: 415, column: 18, scope: !760, inlinedAt: !2140)
!2232 = !DILocation(line: 415, column: 27, scope: !760, inlinedAt: !2140)
!2233 = !DILocation(line: 415, column: 13, scope: !760, inlinedAt: !2140)
!2234 = !DILocation(line: 454, column: 1, scope: !617, inlinedAt: !2140)
!2235 = !DILocation(line: 471, column: 9, scope: !586, inlinedAt: !2125)
!2236 = !DILocation(line: 417, column: 31, scope: !638, inlinedAt: !2140)
!2237 = !DILocation(line: 417, column: 18, scope: !638, inlinedAt: !2140)
!2238 = !DILocation(line: 0, scope: !638, inlinedAt: !2140)
!2239 = !DILocation(line: 421, column: 43, scope: !638, inlinedAt: !2140)
!2240 = !DILocation(line: 421, column: 9, scope: !638, inlinedAt: !2140)
!2241 = !DILocation(line: 422, column: 45, scope: !638, inlinedAt: !2140)
!2242 = !DILocation(line: 422, column: 9, scope: !638, inlinedAt: !2140)
!2243 = !DILocation(line: 0, scope: !773, inlinedAt: !2244)
!2244 = distinct !DILocation(line: 473, column: 9, scope: !785, inlinedAt: !2125)
!2245 = !DILocation(line: 223, column: 5, scope: !773, inlinedAt: !2244)
!2246 = !DILocation(line: 224, column: 24, scope: !773, inlinedAt: !2244)
!2247 = !DILocation(line: 224, column: 5, scope: !773, inlinedAt: !2244)
!2248 = !DILocation(line: 475, column: 14, scope: !791, inlinedAt: !2125)
!2249 = !DILocation(line: 475, column: 13, scope: !785, inlinedAt: !2125)
!2250 = !DILocation(line: 478, column: 18, scope: !794, inlinedAt: !2125)
!2251 = !DILocation(line: 478, column: 37, scope: !794, inlinedAt: !2125)
!2252 = !DILocation(line: 478, column: 34, scope: !794, inlinedAt: !2125)
!2253 = !DILocation(line: 478, column: 13, scope: !785, inlinedAt: !2125)
!2254 = !DILocation(line: 484, column: 16, scope: !785, inlinedAt: !2125)
!2255 = !DILocation(line: 484, column: 9, scope: !785, inlinedAt: !2125)
!2256 = !DILocation(line: 488, column: 1, scope: !586, inlinedAt: !2125)
!2257 = !DILocation(line: 393, column: 1, scope: !1754, inlinedAt: !1785)
!2258 = !DILocation(line: 0, scope: !397, inlinedAt: !2259)
!2259 = distinct !DILocation(line: 455, column: 28, scope: !1316)
!2260 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !2259)
!2261 = !DILocation(line: 455, column: 21, scope: !1316)
!2262 = !DILocation(line: 462, column: 18, scope: !2263)
!2263 = distinct !DILexicalBlock(scope: !1296, file: !3, line: 460, column: 9)
!2264 = !DILocation(line: 463, column: 17, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2263, file: !3, line: 463, column: 17)
!2266 = !DILocation(line: 463, column: 17, scope: !2263)
!2267 = !DILocation(line: 466, column: 29, scope: !2268)
!2268 = distinct !DILexicalBlock(scope: !2265, file: !3, line: 464, column: 13)
!2269 = !DILocation(line: 466, column: 17, scope: !2268)
!2270 = !DILocation(line: 469, column: 101, scope: !2271)
!2271 = distinct !DILexicalBlock(scope: !2268, file: !3, line: 467, column: 17)
!2272 = !DILocation(line: 0, scope: !447, inlinedAt: !2273)
!2273 = distinct !DILocation(line: 469, column: 59, scope: !2271)
!2274 = !DILocation(line: 150, column: 43, scope: !447, inlinedAt: !2273)
!2275 = !DILocation(line: 0, scope: !458, inlinedAt: !2276)
!2276 = distinct !DILocation(line: 150, column: 14, scope: !447, inlinedAt: !2273)
!2277 = !DILocation(line: 90, column: 69, scope: !458, inlinedAt: !2276)
!2278 = !DILocation(line: 90, column: 65, scope: !458, inlinedAt: !2276)
!2279 = !DILocation(line: 90, column: 63, scope: !458, inlinedAt: !2276)
!2280 = !DILocation(line: 90, column: 37, scope: !458, inlinedAt: !2276)
!2281 = !DILocation(line: 91, column: 69, scope: !495, inlinedAt: !2276)
!2282 = !DILocation(line: 91, column: 67, scope: !495, inlinedAt: !2276)
!2283 = !DILocation(line: 91, column: 36, scope: !495, inlinedAt: !2276)
!2284 = !DILocation(line: 91, column: 9, scope: !495, inlinedAt: !2276)
!2285 = !DILocation(line: 91, column: 9, scope: !458, inlinedAt: !2276)
!2286 = !DILocation(line: 94, column: 31, scope: !458, inlinedAt: !2276)
!2287 = !DILocation(line: 94, column: 20, scope: !458, inlinedAt: !2276)
!2288 = !DILocation(line: 95, column: 35, scope: !458, inlinedAt: !2276)
!2289 = !DILocation(line: 95, column: 24, scope: !458, inlinedAt: !2276)
!2290 = !DILocation(line: 95, column: 16, scope: !458, inlinedAt: !2276)
!2291 = !DILocation(line: 100, column: 32, scope: !506, inlinedAt: !2276)
!2292 = !DILocation(line: 100, column: 9, scope: !506, inlinedAt: !2276)
!2293 = !DILocation(line: 100, column: 57, scope: !506, inlinedAt: !2276)
!2294 = !DILocation(line: 100, column: 9, scope: !458, inlinedAt: !2276)
!2295 = !DILocation(line: 98, column: 15, scope: !458, inlinedAt: !2276)
!2296 = !DILocation(line: 94, column: 12, scope: !458, inlinedAt: !2276)
!2297 = !DILocation(line: 103, column: 14, scope: !458, inlinedAt: !2276)
!2298 = !DILocation(line: 103, column: 22, scope: !458, inlinedAt: !2276)
!2299 = !DILocation(line: 105, column: 24, scope: !458, inlinedAt: !2276)
!2300 = !DILocation(line: 105, column: 11, scope: !458, inlinedAt: !2276)
!2301 = !DILocation(line: 106, column: 47, scope: !517, inlinedAt: !2276)
!2302 = !DILocation(line: 106, column: 73, scope: !517, inlinedAt: !2276)
!2303 = !DILocation(line: 106, column: 9, scope: !458, inlinedAt: !2276)
!2304 = !DILocation(line: 109, column: 10, scope: !458, inlinedAt: !2276)
!2305 = !DILocation(line: 109, column: 18, scope: !458, inlinedAt: !2276)
!2306 = !DILocation(line: 110, column: 10, scope: !458, inlinedAt: !2276)
!2307 = !DILocation(line: 110, column: 19, scope: !458, inlinedAt: !2276)
!2308 = !DILocation(line: 111, column: 10, scope: !458, inlinedAt: !2276)
!2309 = !DILocation(line: 111, column: 18, scope: !458, inlinedAt: !2276)
!2310 = !DILocation(line: 112, column: 10, scope: !458, inlinedAt: !2276)
!2311 = !DILocation(line: 112, column: 20, scope: !458, inlinedAt: !2276)
!2312 = !DILocation(line: 113, column: 10, scope: !458, inlinedAt: !2276)
!2313 = !DILocation(line: 113, column: 22, scope: !458, inlinedAt: !2276)
!2314 = !DILocation(line: 114, column: 28, scope: !458, inlinedAt: !2276)
!2315 = !DILocation(line: 114, column: 5, scope: !458, inlinedAt: !2276)
!2316 = !DILocation(line: 116, column: 13, scope: !537, inlinedAt: !2276)
!2317 = !DILocation(line: 116, column: 33, scope: !537, inlinedAt: !2276)
!2318 = !DILocation(line: 119, column: 28, scope: !458, inlinedAt: !2276)
!2319 = !DILocation(line: 119, column: 5, scope: !458, inlinedAt: !2276)
!2320 = !DILocation(line: 119, column: 36, scope: !458, inlinedAt: !2276)
!2321 = !DILocation(line: 122, column: 72, scope: !543, inlinedAt: !2276)
!2322 = !DILocation(line: 122, column: 97, scope: !543, inlinedAt: !2276)
!2323 = !DILocation(line: 122, column: 9, scope: !458, inlinedAt: !2276)
!2324 = !DILocation(line: 125, column: 18, scope: !458, inlinedAt: !2276)
!2325 = !DILocation(line: 126, column: 32, scope: !458, inlinedAt: !2276)
!2326 = !DILocation(line: 126, column: 37, scope: !458, inlinedAt: !2276)
!2327 = !DILocation(line: 126, column: 10, scope: !458, inlinedAt: !2276)
!2328 = !DILocation(line: 126, column: 20, scope: !458, inlinedAt: !2276)
!2329 = !DILocation(line: 127, column: 10, scope: !458, inlinedAt: !2276)
!2330 = !DILocation(line: 127, column: 22, scope: !458, inlinedAt: !2276)
!2331 = !DILocation(line: 128, column: 29, scope: !458, inlinedAt: !2276)
!2332 = !DILocation(line: 128, column: 25, scope: !458, inlinedAt: !2276)
!2333 = !DILocation(line: 128, column: 10, scope: !458, inlinedAt: !2276)
!2334 = !DILocation(line: 128, column: 23, scope: !458, inlinedAt: !2276)
!2335 = !DILocation(line: 129, column: 10, scope: !458, inlinedAt: !2276)
!2336 = !DILocation(line: 129, column: 20, scope: !458, inlinedAt: !2276)
!2337 = !DILocation(line: 130, column: 10, scope: !458, inlinedAt: !2276)
!2338 = !DILocation(line: 130, column: 16, scope: !458, inlinedAt: !2276)
!2339 = !DILocation(line: 131, column: 10, scope: !458, inlinedAt: !2276)
!2340 = !DILocation(line: 131, column: 14, scope: !458, inlinedAt: !2276)
!2341 = !DILocation(line: 0, scope: !486, inlinedAt: !2276)
!2342 = !DILocation(line: 136, column: 15, scope: !573, inlinedAt: !2276)
!2343 = !DILocation(line: 136, column: 13, scope: !574, inlinedAt: !2276)
!2344 = !DILocation(line: 139, column: 136, scope: !578, inlinedAt: !2276)
!2345 = !DILocation(line: 139, column: 141, scope: !578, inlinedAt: !2276)
!2346 = !DILocation(line: 139, column: 13, scope: !574, inlinedAt: !2276)
!2347 = !DILocation(line: 142, column: 46, scope: !574, inlinedAt: !2276)
!2348 = !DILocation(line: 142, column: 9, scope: !574, inlinedAt: !2276)
!2349 = !DILocation(line: 136, column: 22, scope: !573, inlinedAt: !2276)
!2350 = !DILocation(line: 142, column: 27, scope: !574, inlinedAt: !2276)
!2351 = !DILocation(line: 0, scope: !586, inlinedAt: !2352)
!2352 = distinct !DILocation(line: 152, column: 16, scope: !601, inlinedAt: !2273)
!2353 = !DILocation(line: 458, column: 37, scope: !586, inlinedAt: !2352)
!2354 = !DILocation(line: 458, column: 26, scope: !586, inlinedAt: !2352)
!2355 = !DILocation(line: 458, column: 18, scope: !586, inlinedAt: !2352)
!2356 = !DILocation(line: 459, column: 41, scope: !586, inlinedAt: !2352)
!2357 = !DILocation(line: 459, column: 30, scope: !586, inlinedAt: !2352)
!2358 = !DILocation(line: 459, column: 22, scope: !586, inlinedAt: !2352)
!2359 = !DILocation(line: 462, column: 14, scope: !609, inlinedAt: !2352)
!2360 = !DILocation(line: 462, column: 18, scope: !609, inlinedAt: !2352)
!2361 = !DILocation(line: 462, column: 9, scope: !586, inlinedAt: !2352)
!2362 = !DILocation(line: 467, column: 5, scope: !586, inlinedAt: !2352)
!2363 = !DILocation(line: 468, column: 5, scope: !586, inlinedAt: !2352)
!2364 = !DILocation(line: 468, column: 10, scope: !586, inlinedAt: !2352)
!2365 = !DILocation(line: 468, column: 19, scope: !586, inlinedAt: !2352)
!2366 = !DILocation(line: 0, scope: !617, inlinedAt: !2367)
!2367 = distinct !DILocation(line: 470, column: 21, scope: !586, inlinedAt: !2352)
!2368 = !DILocation(line: 0, scope: !359, inlinedAt: !2369)
!2369 = distinct !DILocation(line: 349, column: 25, scope: !617, inlinedAt: !2367)
!2370 = !DILocation(line: 257, column: 13, scope: !370, inlinedAt: !2369)
!2371 = !DILocation(line: 257, column: 19, scope: !370, inlinedAt: !2369)
!2372 = !DILocation(line: 257, column: 17, scope: !370, inlinedAt: !2369)
!2373 = !DILocation(line: 257, column: 9, scope: !359, inlinedAt: !2369)
!2374 = !DILocation(line: 0, scope: !375, inlinedAt: !2375)
!2375 = distinct !DILocation(line: 350, column: 27, scope: !617, inlinedAt: !2367)
!2376 = !DILocation(line: 245, column: 13, scope: !385, inlinedAt: !2375)
!2377 = !DILocation(line: 245, column: 19, scope: !385, inlinedAt: !2375)
!2378 = !DILocation(line: 245, column: 17, scope: !385, inlinedAt: !2375)
!2379 = !DILocation(line: 245, column: 9, scope: !375, inlinedAt: !2375)
!2380 = !DILocation(line: 351, column: 5, scope: !617, inlinedAt: !2367)
!2381 = !DILocation(line: 351, column: 27, scope: !617, inlinedAt: !2367)
!2382 = !DILocation(line: 355, column: 38, scope: !657, inlinedAt: !2367)
!2383 = !DILocation(line: 355, column: 9, scope: !617, inlinedAt: !2367)
!2384 = !DILocation(line: 348, column: 26, scope: !617, inlinedAt: !2367)
!2385 = !DILocation(line: 358, column: 20, scope: !617, inlinedAt: !2367)
!2386 = !DILocation(line: 359, column: 5, scope: !617, inlinedAt: !2367)
!2387 = !DILocation(line: 361, column: 5, scope: !617, inlinedAt: !2367)
!2388 = !DILocation(line: 364, column: 14, scope: !664, inlinedAt: !2367)
!2389 = !DILocation(line: 364, column: 13, scope: !634, inlinedAt: !2367)
!2390 = !DILocation(line: 367, column: 20, scope: !634, inlinedAt: !2367)
!2391 = !DILocation(line: 367, column: 27, scope: !634, inlinedAt: !2367)
!2392 = !DILocation(line: 368, column: 31, scope: !634, inlinedAt: !2367)
!2393 = !DILocation(line: 368, column: 20, scope: !634, inlinedAt: !2367)
!2394 = !DILocation(line: 368, column: 24, scope: !634, inlinedAt: !2367)
!2395 = !DILocation(line: 369, column: 39, scope: !634, inlinedAt: !2367)
!2396 = !DILocation(line: 369, column: 20, scope: !634, inlinedAt: !2367)
!2397 = !DILocation(line: 369, column: 32, scope: !634, inlinedAt: !2367)
!2398 = !DILocation(line: 370, column: 20, scope: !634, inlinedAt: !2367)
!2399 = !DILocation(line: 370, column: 26, scope: !634, inlinedAt: !2367)
!2400 = !DILocation(line: 371, column: 20, scope: !634, inlinedAt: !2367)
!2401 = !DILocation(line: 371, column: 26, scope: !634, inlinedAt: !2367)
!2402 = !DILocation(line: 372, column: 30, scope: !634, inlinedAt: !2367)
!2403 = !DILocation(line: 372, column: 20, scope: !634, inlinedAt: !2367)
!2404 = !DILocation(line: 372, column: 28, scope: !634, inlinedAt: !2367)
!2405 = !DILocation(line: 373, column: 36, scope: !634, inlinedAt: !2367)
!2406 = !DILocation(line: 373, column: 20, scope: !634, inlinedAt: !2367)
!2407 = !DILocation(line: 373, column: 29, scope: !634, inlinedAt: !2367)
!2408 = !DILocation(line: 374, column: 36, scope: !634, inlinedAt: !2367)
!2409 = !DILocation(line: 374, column: 20, scope: !634, inlinedAt: !2367)
!2410 = !DILocation(line: 374, column: 29, scope: !634, inlinedAt: !2367)
!2411 = !DILocation(line: 375, column: 9, scope: !634, inlinedAt: !2367)
!2412 = !DILocation(line: 378, column: 14, scope: !699, inlinedAt: !2367)
!2413 = !DILocation(line: 378, column: 13, scope: !634, inlinedAt: !2367)
!2414 = !DILocation(line: 381, column: 18, scope: !702, inlinedAt: !2367)
!2415 = !DILocation(line: 381, column: 28, scope: !702, inlinedAt: !2367)
!2416 = !DILocation(line: 381, column: 13, scope: !634, inlinedAt: !2367)
!2417 = !DILocation(line: 384, column: 62, scope: !634, inlinedAt: !2367)
!2418 = !DILocation(line: 0, scope: !634, inlinedAt: !2367)
!2419 = !DILocation(line: 385, column: 62, scope: !634, inlinedAt: !2367)
!2420 = !DILocation(line: 387, column: 20, scope: !634, inlinedAt: !2367)
!2421 = !DILocation(line: 387, column: 27, scope: !634, inlinedAt: !2367)
!2422 = !DILocation(line: 388, column: 20, scope: !634, inlinedAt: !2367)
!2423 = !DILocation(line: 388, column: 24, scope: !634, inlinedAt: !2367)
!2424 = !DILocation(line: 389, column: 31, scope: !634, inlinedAt: !2367)
!2425 = !DILocation(line: 389, column: 46, scope: !634, inlinedAt: !2367)
!2426 = !DILocation(line: 389, column: 20, scope: !634, inlinedAt: !2367)
!2427 = !DILocation(line: 389, column: 29, scope: !634, inlinedAt: !2367)
!2428 = !DILocation(line: 390, column: 39, scope: !634, inlinedAt: !2367)
!2429 = !DILocation(line: 390, column: 20, scope: !634, inlinedAt: !2367)
!2430 = !DILocation(line: 390, column: 32, scope: !634, inlinedAt: !2367)
!2431 = !DILocation(line: 391, column: 20, scope: !634, inlinedAt: !2367)
!2432 = !DILocation(line: 391, column: 26, scope: !634, inlinedAt: !2367)
!2433 = !DILocation(line: 392, column: 20, scope: !634, inlinedAt: !2367)
!2434 = !DILocation(line: 392, column: 26, scope: !634, inlinedAt: !2367)
!2435 = !DILocation(line: 393, column: 30, scope: !634, inlinedAt: !2367)
!2436 = !DILocation(line: 393, column: 20, scope: !634, inlinedAt: !2367)
!2437 = !DILocation(line: 393, column: 28, scope: !634, inlinedAt: !2367)
!2438 = !DILocation(line: 394, column: 21, scope: !634, inlinedAt: !2367)
!2439 = !DILocation(line: 395, column: 21, scope: !634, inlinedAt: !2367)
!2440 = !DILocation(line: 396, column: 9, scope: !634, inlinedAt: !2367)
!2441 = !DILocation(line: 405, column: 31, scope: !617, inlinedAt: !2367)
!2442 = !DILocation(line: 405, column: 16, scope: !617, inlinedAt: !2367)
!2443 = !DILocation(line: 405, column: 24, scope: !617, inlinedAt: !2367)
!2444 = !DILocation(line: 407, column: 29, scope: !617, inlinedAt: !2367)
!2445 = !DILocation(line: 407, column: 14, scope: !617, inlinedAt: !2367)
!2446 = !DILocation(line: 409, column: 5, scope: !617, inlinedAt: !2367)
!2447 = !DILocation(line: 412, column: 13, scope: !638, inlinedAt: !2367)
!2448 = !DILocation(line: 0, scope: !741, inlinedAt: !2449)
!2449 = distinct !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !2367)
!2450 = !DILocation(line: 156, column: 31, scope: !741, inlinedAt: !2449)
!2451 = !DILocation(line: 158, column: 11, scope: !741, inlinedAt: !2449)
!2452 = !DILocation(line: 159, column: 43, scope: !741, inlinedAt: !2449)
!2453 = !DILocation(line: 159, column: 34, scope: !741, inlinedAt: !2449)
!2454 = !DILocation(line: 159, column: 16, scope: !741, inlinedAt: !2449)
!2455 = !DILocation(line: 160, column: 19, scope: !741, inlinedAt: !2449)
!2456 = !DILocation(line: 160, column: 12, scope: !741, inlinedAt: !2449)
!2457 = !DILocation(line: 413, column: 13, scope: !748, inlinedAt: !2367)
!2458 = !DILocation(line: 415, column: 18, scope: !760, inlinedAt: !2367)
!2459 = !DILocation(line: 415, column: 27, scope: !760, inlinedAt: !2367)
!2460 = !DILocation(line: 415, column: 13, scope: !760, inlinedAt: !2367)
!2461 = !DILocation(line: 454, column: 1, scope: !617, inlinedAt: !2367)
!2462 = !DILocation(line: 471, column: 9, scope: !586, inlinedAt: !2352)
!2463 = !DILocation(line: 417, column: 31, scope: !638, inlinedAt: !2367)
!2464 = !DILocation(line: 417, column: 18, scope: !638, inlinedAt: !2367)
!2465 = !DILocation(line: 0, scope: !638, inlinedAt: !2367)
!2466 = !DILocation(line: 421, column: 43, scope: !638, inlinedAt: !2367)
!2467 = !DILocation(line: 421, column: 9, scope: !638, inlinedAt: !2367)
!2468 = !DILocation(line: 422, column: 45, scope: !638, inlinedAt: !2367)
!2469 = !DILocation(line: 422, column: 9, scope: !638, inlinedAt: !2367)
!2470 = !DILocation(line: 0, scope: !773, inlinedAt: !2471)
!2471 = distinct !DILocation(line: 473, column: 9, scope: !785, inlinedAt: !2352)
!2472 = !DILocation(line: 223, column: 5, scope: !773, inlinedAt: !2471)
!2473 = !DILocation(line: 224, column: 24, scope: !773, inlinedAt: !2471)
!2474 = !DILocation(line: 224, column: 5, scope: !773, inlinedAt: !2471)
!2475 = !DILocation(line: 475, column: 14, scope: !791, inlinedAt: !2352)
!2476 = !DILocation(line: 475, column: 13, scope: !785, inlinedAt: !2352)
!2477 = !DILocation(line: 478, column: 18, scope: !794, inlinedAt: !2352)
!2478 = !DILocation(line: 478, column: 37, scope: !794, inlinedAt: !2352)
!2479 = !DILocation(line: 478, column: 34, scope: !794, inlinedAt: !2352)
!2480 = !DILocation(line: 478, column: 13, scope: !785, inlinedAt: !2352)
!2481 = !DILocation(line: 484, column: 16, scope: !785, inlinedAt: !2352)
!2482 = !DILocation(line: 484, column: 9, scope: !785, inlinedAt: !2352)
!2483 = !DILocation(line: 488, column: 1, scope: !586, inlinedAt: !2352)
!2484 = !DILocation(line: 0, scope: !397, inlinedAt: !2485)
!2485 = distinct !DILocation(line: 469, column: 28, scope: !2271)
!2486 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !2485)
!2487 = !DILocation(line: 469, column: 21, scope: !2271)
!2488 = !DILocation(line: 0, scope: !397, inlinedAt: !2489)
!2489 = distinct !DILocation(line: 477, column: 12, scope: !297)
!2490 = !DILocation(line: 32, column: 2, scope: !397, inlinedAt: !2489)
!2491 = !DILocation(line: 477, column: 5, scope: !297)
!2492 = !DILocation(line: 478, column: 1, scope: !297)
!2493 = distinct !DISubprogram(name: "xdp_pass_func", scope: !3, file: !3, line: 481, type: !298, scopeLine: 482, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2494)
!2494 = !{!2495}
!2495 = !DILocalVariable(name: "ctx", arg: 1, scope: !2493, file: !3, line: 481, type: !61)
!2496 = !DILocation(line: 0, scope: !2493)
!2497 = !DILocation(line: 483, column: 5, scope: !2493)
