; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-linux-pc -mcpu=atom | FileCheck %s

define <16 x i8> @foo(<16 x i8> %in) {
; CHECK-LABEL: foo:
; CHECK:       # %bb.0:
; CHECK-NEXT:    pshufb {{.*#+}} xmm0 = xmm0[7,3,2,11,u,u,u,u,u,u,u,u,u,u,u,u]
; CHECK-NEXT:    retq
  %r = shufflevector <16 x i8> %in, <16 x i8> undef, <16 x i32> < i32 7, i32 3, i32 2, i32 11, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, i32 undef>
  ret <16 x i8> %r
}
