; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+avx512bw -mattr=+avx512vl -mattr=+avx512dq  | FileCheck %s

; This test checks combinations of FNEG and FMA intrinsics on AVX-512 target
; PR28892

define <16 x float> @test1(<16 x float> %a, <16 x float> %b, <16 x float> %c)  {
; CHECK-LABEL: test1:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vxorps {{.*}}(%rip), %zmm2, %zmm2
; CHECK-NEXT:    vfmadd213ps %zmm2, %zmm1, %zmm0
; CHECK-NEXT:    retq
entry:
  %sub.i = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %c
  %0 = tail call <16 x float> @llvm.x86.avx512.mask.vfmadd.ps.512(<16 x float> %a, <16 x float> %b, <16 x float> %sub.i, i16 -1, i32 4) #2
  ret <16 x float> %0
}

declare <16 x float> @llvm.x86.avx512.mask.vfmadd.ps.512(<16 x float>, <16 x float>, <16 x float>, i16, i32)
declare <16 x float> @llvm.x86.avx512.mask.vfnmadd.ps.512(<16 x float>, <16 x float>, <16 x float>, i16, i32)
declare <16 x float> @llvm.x86.avx512.mask.vfnmsub.ps.512(<16 x float>, <16 x float>, <16 x float>, i16, i32)


define <16 x float> @test2(<16 x float> %a, <16 x float> %b, <16 x float> %c) {
; CHECK-LABEL: test2:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vfmadd213ps %zmm2, %zmm1, %zmm0
; CHECK-NEXT:    vxorps {{.*}}(%rip), %zmm0, %zmm0
; CHECK-NEXT:    retq
entry:
  %0 = tail call <16 x float> @llvm.x86.avx512.mask.vfmadd.ps.512(<16 x float> %a, <16 x float> %b, <16 x float> %c, i16 -1, i32 4) #2
  %sub.i = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %0
  ret <16 x float> %sub.i
}

define <16 x float> @test3(<16 x float> %a, <16 x float> %b, <16 x float> %c)  {
; CHECK-LABEL: test3:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vfnmadd213ps %zmm2, %zmm1, %zmm0
; CHECK-NEXT:    vxorps {{.*}}(%rip), %zmm0, %zmm0
; CHECK-NEXT:    retq
entry:
  %0 = tail call <16 x float> @llvm.x86.avx512.mask.vfnmadd.ps.512(<16 x float> %a, <16 x float> %b, <16 x float> %c, i16 -1, i32 4) #2
  %sub.i = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %0
  ret <16 x float> %sub.i
}

define <16 x float> @test4(<16 x float> %a, <16 x float> %b, <16 x float> %c) {
; CHECK-LABEL: test4:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vfnmsub213ps %zmm2, %zmm1, %zmm0
; CHECK-NEXT:    vxorps {{.*}}(%rip), %zmm0, %zmm0
; CHECK-NEXT:    retq
entry:
  %0 = tail call <16 x float> @llvm.x86.avx512.mask.vfnmsub.ps.512(<16 x float> %a, <16 x float> %b, <16 x float> %c, i16 -1, i32 4) #2
  %sub.i = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %0
  ret <16 x float> %sub.i
}

define <16 x float> @test5(<16 x float> %a, <16 x float> %b, <16 x float> %c) {
; CHECK-LABEL: test5:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vxorps {{.*}}(%rip), %zmm2, %zmm2
; CHECK-NEXT:    vfmadd213ps {ru-sae}, %zmm2, %zmm0, %zmm1
; CHECK-NEXT:    vmovaps %zmm1, %zmm0
; CHECK-NEXT:    retq
entry:
  %sub.i = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %c
  %0 = tail call <16 x float> @llvm.x86.avx512.mask.vfmadd.ps.512(<16 x float> %a, <16 x float> %b, <16 x float> %sub.i, i16 -1, i32 2) #2
  ret <16 x float> %0
}

define <16 x float> @test6(<16 x float> %a, <16 x float> %b, <16 x float> %c) {
; CHECK-LABEL: test6:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vfnmsub213ps {ru-sae}, %zmm2, %zmm0, %zmm1
; CHECK-NEXT:    vxorps {{.*}}(%rip), %zmm1, %zmm0
; CHECK-NEXT:    retq
entry:
  %0 = tail call <16 x float> @llvm.x86.avx512.mask.vfnmsub.ps.512(<16 x float> %a, <16 x float> %b, <16 x float> %c, i16 -1, i32 2) #2
  %sub.i = fsub <16 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %0
  ret <16 x float> %sub.i
}


define <8 x float> @test7(<8 x float> %a, <8 x float> %b, <8 x float> %c) {
; CHECK-LABEL: test7:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vfmsub213ps %ymm2, %ymm1, %ymm0
; CHECK-NEXT:    vxorps {{.*}}(%rip), %ymm0, %ymm0
; CHECK-NEXT:    retq
entry:
  %0 = tail call <8 x float> @llvm.x86.fma.vfmsub.ps.256(<8 x float> %a, <8 x float> %b, <8 x float> %c) #2
  %sub.i = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %0
  ret <8 x float> %sub.i
}

define <8 x float> @test8(<8 x float> %a, <8 x float> %b, <8 x float> %c) {
; CHECK-LABEL: test8:
; CHECK:       # BB#0: # %entry
; CHECK-NEXT:    vxorps {{.*}}(%rip), %ymm2, %ymm2
; CHECK-NEXT:    vfmsub213ps %ymm2, %ymm1, %ymm0
; CHECK-NEXT:    retq
entry:
  %sub.c = fsub <8 x float> <float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00, float -0.000000e+00>, %c
  %0 = tail call <8 x float> @llvm.x86.fma.vfmsub.ps.256(<8 x float> %a, <8 x float> %b, <8 x float> %sub.c) #2
  ret <8 x float> %0
}

declare <8 x float> @llvm.x86.fma.vfmsub.ps.256(<8 x float>, <8 x float>, <8 x float>)

