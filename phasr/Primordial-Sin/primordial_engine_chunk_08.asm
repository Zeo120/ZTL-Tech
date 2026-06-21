    test eax, eax
    jz entropy_bin_159_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(159) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(159) * log2(P(159)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_159_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_159 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 160
; Computes -P(160) * log2(P(160))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 160
; ============================================
entropy_bin_160 PROC
    mov eax, dword ptr [rcx + 640]
    test eax, eax
    jz entropy_bin_160_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(160) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(160) * log2(P(160)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_160_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_160 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 161
; Computes -P(161) * log2(P(161))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 161
; ============================================
entropy_bin_161 PROC
    mov eax, dword ptr [rcx + 644]
    test eax, eax
    jz entropy_bin_161_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(161) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(161) * log2(P(161)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_161_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_161 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 162
; Computes -P(162) * log2(P(162))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 162
; ============================================
entropy_bin_162 PROC
    mov eax, dword ptr [rcx + 648]
    test eax, eax
    jz entropy_bin_162_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(162) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(162) * log2(P(162)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_162_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_162 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 163
; Computes -P(163) * log2(P(163))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 163
; ============================================
entropy_bin_163 PROC
    mov eax, dword ptr [rcx + 652]
    test eax, eax
    jz entropy_bin_163_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(163) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(163) * log2(P(163)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_163_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_163 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 164
; Computes -P(164) * log2(P(164))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 164
; ============================================
entropy_bin_164 PROC
    mov eax, dword ptr [rcx + 656]
    test eax, eax
    jz entropy_bin_164_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(164) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(164) * log2(P(164)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_164_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_164 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 165
; Computes -P(165) * log2(P(165))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 165
; ============================================
entropy_bin_165 PROC
    mov eax, dword ptr [rcx + 660]
    test eax, eax
    jz entropy_bin_165_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(165) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(165) * log2(P(165)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_165_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_165 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 166
; Computes -P(166) * log2(P(166))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 166
; ============================================
entropy_bin_166 PROC
    mov eax, dword ptr [rcx + 664]
    test eax, eax
    jz entropy_bin_166_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(166) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(166) * log2(P(166)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_166_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_166 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 167
; Computes -P(167) * log2(P(167))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 167
; ============================================
entropy_bin_167 PROC
    mov eax, dword ptr [rcx + 668]
    test eax, eax
    jz entropy_bin_167_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(167) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(167) * log2(P(167)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_167_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_167 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 168
; Computes -P(168) * log2(P(168))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 168
; ============================================
entropy_bin_168 PROC
    mov eax, dword ptr [rcx + 672]
    test eax, eax
    jz entropy_bin_168_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(168) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(168) * log2(P(168)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_168_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_168 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 169
; Computes -P(169) * log2(P(169))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 169
; ============================================
entropy_bin_169 PROC
    mov eax, dword ptr [rcx + 676]
    test eax, eax
    jz entropy_bin_169_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(169) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(169) * log2(P(169)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_169_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_169 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 170
; Computes -P(170) * log2(P(170))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 170
; ============================================
entropy_bin_170 PROC
    mov eax, dword ptr [rcx + 680]
    test eax, eax
    jz entropy_bin_170_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(170) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(170) * log2(P(170)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_170_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_170 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 171
; Computes -P(171) * log2(P(171))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 171
; ============================================
entropy_bin_171 PROC
    mov eax, dword ptr [rcx + 684]
    test eax, eax
    jz entropy_bin_171_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(171) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(171) * log2(P(171)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_171_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_171 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 172
; Computes -P(172) * log2(P(172))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 172
; ============================================
entropy_bin_172 PROC
    mov eax, dword ptr [rcx + 688]
    test eax, eax
    jz entropy_bin_172_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(172) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(172) * log2(P(172)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_172_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_172 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 173
; Computes -P(173) * log2(P(173))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 173
; ============================================
entropy_bin_173 PROC
    mov eax, dword ptr [rcx + 692]
    test eax, eax
    jz entropy_bin_173_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(173) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(173) * log2(P(173)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_173_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_173 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 174
; Computes -P(174) * log2(P(174))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 174
; ============================================
entropy_bin_174 PROC
    mov eax, dword ptr [rcx + 696]
    test eax, eax
    jz entropy_bin_174_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(174) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(174) * log2(P(174)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_174_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_174 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 175
; Computes -P(175) * log2(P(175))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 175
; ============================================
entropy_bin_175 PROC
    mov eax, dword ptr [rcx + 700]
    test eax, eax
    jz entropy_bin_175_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(175) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(175) * log2(P(175)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_175_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_175 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 176
; Computes -P(176) * log2(P(176))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 176
; ============================================
entropy_bin_176 PROC
    mov eax, dword ptr [rcx + 704]
    test eax, eax
    jz entropy_bin_176_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(176) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(176) * log2(P(176)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_176_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_176 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 177
; Computes -P(177) * log2(P(177))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 177
; ============================================
entropy_bin_177 PROC
    mov eax, dword ptr [rcx + 708]
    test eax, eax
    jz entropy_bin_177_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(177) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(177) * log2(P(177)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_177_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_177 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 178
; Computes -P(178) * log2(P(178))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 178
; ============================================
entropy_bin_178 PROC
    mov eax, dword ptr [rcx + 712]
    test eax, eax
    jz entropy_bin_178_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(178) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(178) * log2(P(178)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_178_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_178 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 179
; Computes -P(179) * log2(P(179))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 179
; ============================================
entropy_bin_179 PROC
    mov eax, dword ptr [rcx + 716]
    test eax, eax
    jz entropy_bin_179_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(179) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(179) * log2(P(179)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_179_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_179 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 180
; Computes -P(180) * log2(P(180))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 180
; ============================================
entropy_bin_180 PROC
    mov eax, dword ptr [rcx + 720]
    test eax, eax
    jz entropy_bin_180_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(180) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(180) * log2(P(180)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_180_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_180 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 181
; Computes -P(181) * log2(P(181))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 181
; ============================================
entropy_bin_181 PROC
    mov eax, dword ptr [rcx + 724]
    test eax, eax
    jz entropy_bin_181_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(181) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(181) * log2(P(181)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_181_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_181 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 182
; Computes -P(182) * log2(P(182))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 182
; ============================================
entropy_bin_182 PROC
    mov eax, dword ptr [rcx + 728]
    test eax, eax
    jz entropy_bin_182_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(182) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(182) * log2(P(182)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_182_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_182 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 183
; Computes -P(183) * log2(P(183))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 183
; ============================================
entropy_bin_183 PROC
    mov eax, dword ptr [rcx + 732]
    test eax, eax
    jz entropy_bin_183_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(183) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(183) * log2(P(183)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_183_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_183 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 184
; Computes -P(184) * log2(P(184))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 184
; ============================================
entropy_bin_184 PROC
    mov eax, dword ptr [rcx + 736]
    test eax, eax
    jz entropy_bin_184_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(184) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(184) * log2(P(184)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_184_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_184 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 185
; Computes -P(185) * log2(P(185))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 185
; ============================================
entropy_bin_185 PROC
    mov eax, dword ptr [rcx + 740]
    test eax, eax
    jz entropy_bin_185_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(185) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(185) * log2(P(185)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_185_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_185 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 186
; Computes -P(186) * log2(P(186))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 186
; ============================================
entropy_bin_186 PROC
    mov eax, dword ptr [rcx + 744]
    test eax, eax
    jz entropy_bin_186_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(186) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(186) * log2(P(186)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_186_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_186 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 187
; Computes -P(187) * log2(P(187))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 187
; ============================================
entropy_bin_187 PROC
    mov eax, dword ptr [rcx + 748]
    test eax, eax
    jz entropy_bin_187_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(187) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(187) * log2(P(187)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_187_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_187 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 188
; Computes -P(188) * log2(P(188))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 188
; ============================================
entropy_bin_188 PROC
    mov eax, dword ptr [rcx + 752]
    test eax, eax
    jz entropy_bin_188_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(188) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(188) * log2(P(188)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_188_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_188 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 189
; Computes -P(189) * log2(P(189))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 189
; ============================================
entropy_bin_189 PROC
    mov eax, dword ptr [rcx + 756]
    test eax, eax
    jz entropy_bin_189_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(189) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(189) * log2(P(189)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_189_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_189 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 190
; Computes -P(190) * log2(P(190))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 190
; ============================================
entropy_bin_190 PROC
    mov eax, dword ptr [rcx + 760]
    test eax, eax
    jz entropy_bin_190_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(190) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(190) * log2(P(190)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_190_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_190 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 191
; Computes -P(191) * log2(P(191))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 191
; ============================================
entropy_bin_191 PROC
    mov eax, dword ptr [rcx + 764]
    test eax, eax
    jz entropy_bin_191_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(191) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(191) * log2(P(191)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_191_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_191 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 192
; Computes -P(192) * log2(P(192))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 192
; ============================================
entropy_bin_192 PROC
    mov eax, dword ptr [rcx + 768]
    test eax, eax
    jz entropy_bin_192_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(192) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(192) * log2(P(192)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_192_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_192 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 193
; Computes -P(193) * log2(P(193))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 193
; ============================================
entropy_bin_193 PROC
    mov eax, dword ptr [rcx + 772]
    test eax, eax
    jz entropy_bin_193_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(193) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(193) * log2(P(193)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_193_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_193 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 194
; Computes -P(194) * log2(P(194))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 194
; ============================================
entropy_bin_194 PROC
    mov eax, dword ptr [rcx + 776]
    test eax, eax
    jz entropy_bin_194_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(194) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(194) * log2(P(194)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_194_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_194 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 195
; Computes -P(195) * log2(P(195))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 195
; ============================================
entropy_bin_195 PROC
    mov eax, dword ptr [rcx + 780]
    test eax, eax
    jz entropy_bin_195_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(195) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(195) * log2(P(195)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_195_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_195 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 196
; Computes -P(196) * log2(P(196))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 196
; ============================================
entropy_bin_196 PROC
    mov eax, dword ptr [rcx + 784]
    test eax, eax
    jz entropy_bin_196_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(196) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(196) * log2(P(196)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_196_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_196 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 197
; Computes -P(197) * log2(P(197))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 197
; ============================================
entropy_bin_197 PROC
    mov eax, dword ptr [rcx + 788]
    test eax, eax
    jz entropy_bin_197_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(197) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(197) * log2(P(197)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_197_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_197 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 198
; Computes -P(198) * log2(P(198))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 198
; ============================================
entropy_bin_198 PROC
    mov eax, dword ptr [rcx + 792]
    test eax, eax
    jz entropy_bin_198_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(198) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(198) * log2(P(198)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_198_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_198 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 199
; Computes -P(199) * log2(P(199))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 199
; ============================================
entropy_bin_199 PROC
    mov eax, dword ptr [rcx + 796]
    test eax, eax
    jz entropy_bin_199_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(199) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(199) * log2(P(199)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_199_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_199 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 200
; Computes -P(200) * log2(P(200))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 200
; ============================================
entropy_bin_200 PROC
    mov eax, dword ptr [rcx + 800]
    test eax, eax
    jz entropy_bin_200_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(200) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(200) * log2(P(200)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_200_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_200 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 201
; Computes -P(201) * log2(P(201))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 201
; ============================================
entropy_bin_201 PROC
    mov eax, dword ptr [rcx + 804]
    test eax, eax
    jz entropy_bin_201_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(201) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(201) * log2(P(201)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_201_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_201 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 202
; Computes -P(202) * log2(P(202))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 202
; ============================================
entropy_bin_202 PROC
    mov eax, dword ptr [rcx + 808]
    test eax, eax
    jz entropy_bin_202_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(202) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(202) * log2(P(202)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_202_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_202 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 203
; Computes -P(203) * log2(P(203))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 203
; ============================================
entropy_bin_203 PROC
    mov eax, dword ptr [rcx + 812]
    test eax, eax
    jz entropy_bin_203_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(203) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(203) * log2(P(203)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_203_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_203 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 204
; Computes -P(204) * log2(P(204))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 204
; ============================================
entropy_bin_204 PROC
    mov eax, dword ptr [rcx + 816]
    test eax, eax
    jz entropy_bin_204_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(204) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(204) * log2(P(204)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_204_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_204 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 205
; Computes -P(205) * log2(P(205))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 205
; ============================================
entropy_bin_205 PROC
    mov eax, dword ptr [rcx + 820]
    test eax, eax
    jz entropy_bin_205_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(205) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(205) * log2(P(205)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_205_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_205 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 206
; Computes -P(206) * log2(P(206))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 206
; ============================================
entropy_bin_206 PROC
    mov eax, dword ptr [rcx + 824]
    test eax, eax
    jz entropy_bin_206_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(206) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(206) * log2(P(206)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_206_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_206 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 207
; Computes -P(207) * log2(P(207))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 207
; ============================================
entropy_bin_207 PROC
    mov eax, dword ptr [rcx + 828]
    test eax, eax
    jz entropy_bin_207_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(207) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(207) * log2(P(207)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_207_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_207 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 208
; Computes -P(208) * log2(P(208))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 208
; ============================================
entropy_bin_208 PROC
    mov eax, dword ptr [rcx + 832]
    test eax, eax
    jz entropy_bin_208_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(208) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(208) * log2(P(208)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_208_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_208 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 209
; Computes -P(209) * log2(P(209))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 209
; ============================================
entropy_bin_209 PROC
    mov eax, dword ptr [rcx + 836]
    test eax, eax
    jz entropy_bin_209_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(209) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(209) * log2(P(209)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_209_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_209 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 210
; Computes -P(210) * log2(P(210))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 210
; ============================================
entropy_bin_210 PROC
    mov eax, dword ptr [rcx + 840]
    test eax, eax
    jz entropy_bin_210_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(210) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(210) * log2(P(210)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_210_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_210 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 211
; Computes -P(211) * log2(P(211))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 211
; ============================================
entropy_bin_211 PROC
    mov eax, dword ptr [rcx + 844]
    test eax, eax
    jz entropy_bin_211_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(211) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(211) * log2(P(211)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_211_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_211 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 212
; Computes -P(212) * log2(P(212))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 212
; ============================================
entropy_bin_212 PROC
    mov eax, dword ptr [rcx + 848]
    test eax, eax
    jz entropy_bin_212_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(212) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(212) * log2(P(212)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_212_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_212 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 213
; Computes -P(213) * log2(P(213))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 213
; ============================================
entropy_bin_213 PROC
    mov eax, dword ptr [rcx + 852]
    test eax, eax
    jz entropy_bin_213_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(213) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(213) * log2(P(213)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_213_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_213 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 214
; Computes -P(214) * log2(P(214))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 214
; ============================================
entropy_bin_214 PROC
    mov eax, dword ptr [rcx + 856]
    test eax, eax
    jz entropy_bin_214_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(214) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(214) * log2(P(214)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_214_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_214 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 215
; Computes -P(215) * log2(P(215))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 215
; ============================================
entropy_bin_215 PROC
    mov eax, dword ptr [rcx + 860]
    test eax, eax
    jz entropy_bin_215_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(215) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(215) * log2(P(215)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_215_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_215 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 216
; Computes -P(216) * log2(P(216))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 216
; ============================================
entropy_bin_216 PROC
    mov eax, dword ptr [rcx + 864]
    test eax, eax
    jz entropy_bin_216_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(216) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(216) * log2(P(216)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_216_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_216 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 217
; Computes -P(217) * log2(P(217))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 217
; ============================================
entropy_bin_217 PROC
    mov eax, dword ptr [rcx + 868]
    test eax, eax
    jz entropy_bin_217_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(217) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(217) * log2(P(217)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_217_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_217 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 218
; Computes -P(218) * log2(P(218))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 218
; ============================================
entropy_bin_218 PROC
    mov eax, dword ptr [rcx + 872]
    test eax, eax
    jz entropy_bin_218_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(218) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(218) * log2(P(218)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_218_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_218 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 219
; Computes -P(219) * log2(P(219))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 219
; ============================================
entropy_bin_219 PROC
    mov eax, dword ptr [rcx + 876]
    test eax, eax
    jz entropy_bin_219_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(219) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(219) * log2(P(219)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_219_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_219 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 220
; Computes -P(220) * log2(P(220))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 220
; ============================================
entropy_bin_220 PROC
    mov eax, dword ptr [rcx + 880]
    test eax, eax
    jz entropy_bin_220_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(220) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(220) * log2(P(220)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_220_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_220 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 221
; Computes -P(221) * log2(P(221))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 221
; ============================================
entropy_bin_221 PROC
    mov eax, dword ptr [rcx + 884]
    test eax, eax
    jz entropy_bin_221_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(221) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(221) * log2(P(221)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_221_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_221 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 222
; Computes -P(222) * log2(P(222))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 222
; ============================================
entropy_bin_222 PROC
    mov eax, dword ptr [rcx + 888]
    test eax, eax
    jz entropy_bin_222_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(222) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(222) * log2(P(222)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_222_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_222 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 223
; Computes -P(223) * log2(P(223))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 223
; ============================================
entropy_bin_223 PROC
    mov eax, dword ptr [rcx + 892]
    test eax, eax
    jz entropy_bin_223_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(223) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(223) * log2(P(223)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_223_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_223 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 224
; Computes -P(224) * log2(P(224))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 224
; ============================================
entropy_bin_224 PROC
    mov eax, dword ptr [rcx + 896]
    test eax, eax
    jz entropy_bin_224_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(224) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(224) * log2(P(224)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_224_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_224 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 225
; Computes -P(225) * log2(P(225))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 225
; ============================================
entropy_bin_225 PROC
    mov eax, dword ptr [rcx + 900]
    test eax, eax
    jz entropy_bin_225_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(225) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(225) * log2(P(225)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_225_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_225 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 226
; Computes -P(226) * log2(P(226))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 226
; ============================================
entropy_bin_226 PROC
    mov eax, dword ptr [rcx + 904]
    test eax, eax
    jz entropy_bin_226_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(226) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(226) * log2(P(226)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_226_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_226 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 227
; Computes -P(227) * log2(P(227))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 227
; ============================================
entropy_bin_227 PROC
    mov eax, dword ptr [rcx + 908]
    test eax, eax
    jz entropy_bin_227_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(227) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(227) * log2(P(227)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_227_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_227 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 228
; Computes -P(228) * log2(P(228))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 228
; ============================================
entropy_bin_228 PROC
    mov eax, dword ptr [rcx + 912]
    test eax, eax
    jz entropy_bin_228_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(228) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(228) * log2(P(228)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_228_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_228 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 229
; Computes -P(229) * log2(P(229))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 229
; ============================================
entropy_bin_229 PROC
    mov eax, dword ptr [rcx + 916]
    test eax, eax
    jz entropy_bin_229_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(229) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(229) * log2(P(229)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_229_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_229 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 230
; Computes -P(230) * log2(P(230))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 230
; ============================================
entropy_bin_230 PROC
    mov eax, dword ptr [rcx + 920]
    test eax, eax
    jz entropy_bin_230_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(230) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(230) * log2(P(230)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_230_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_230 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 231
; Computes -P(231) * log2(P(231))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 231
; ============================================
entropy_bin_231 PROC
    mov eax, dword ptr [rcx + 924]
    test eax, eax
    jz entropy_bin_231_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(231) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(231) * log2(P(231)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_231_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_231 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 232
; Computes -P(232) * log2(P(232))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 232
; ============================================
entropy_bin_232 PROC
    mov eax, dword ptr [rcx + 928]
    test eax, eax
    jz entropy_bin_232_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(232) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(232) * log2(P(232)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_232_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_232 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 233
; Computes -P(233) * log2(P(233))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 233
; ============================================
entropy_bin_233 PROC
    mov eax, dword ptr [rcx + 932]
    test eax, eax
    jz entropy_bin_233_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(233) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(233) * log2(P(233)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_233_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_233 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 234
; Computes -P(234) * log2(P(234))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 234
; ============================================
entropy_bin_234 PROC
    mov eax, dword ptr [rcx + 936]
    test eax, eax
    jz entropy_bin_234_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(234) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(234) * log2(P(234)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_234_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_234 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 235
; Computes -P(235) * log2(P(235))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 235
; ============================================
entropy_bin_235 PROC
    mov eax, dword ptr [rcx + 940]
    test eax, eax
    jz entropy_bin_235_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(235) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(235) * log2(P(235)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_235_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_235 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 236
; Computes -P(236) * log2(P(236))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 236
; ============================================
entropy_bin_236 PROC
    mov eax, dword ptr [rcx + 944]
    test eax, eax
    jz entropy_bin_236_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(236) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(236) * log2(P(236)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_236_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_236 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 237
; Computes -P(237) * log2(P(237))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 237
; ============================================
entropy_bin_237 PROC
    mov eax, dword ptr [rcx + 948]
    test eax, eax
    jz entropy_bin_237_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(237) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(237) * log2(P(237)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_237_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_237 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 238
; Computes -P(238) * log2(P(238))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 238
; ============================================
entropy_bin_238 PROC
    mov eax, dword ptr [rcx + 952]
    test eax, eax
    jz entropy_bin_238_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(238) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(238) * log2(P(238)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_238_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_238 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 239
; Computes -P(239) * log2(P(239))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 239
; ============================================
entropy_bin_239 PROC
    mov eax, dword ptr [rcx + 956]
    test eax, eax
    jz entropy_bin_239_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(239) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(239) * log2(P(239)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_239_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_239 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 240
; Computes -P(240) * log2(P(240))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 240
; ============================================
entropy_bin_240 PROC
    mov eax, dword ptr [rcx + 960]
    test eax, eax
    jz entropy_bin_240_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(240) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(240) * log2(P(240)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_240_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_240 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 241
; Computes -P(241) * log2(P(241))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 241
; ============================================
entropy_bin_241 PROC
    mov eax, dword ptr [rcx + 964]
    test eax, eax
    jz entropy_bin_241_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(241) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(241) * log2(P(241)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_241_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_241 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 242
; Computes -P(242) * log2(P(242))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 242
; ============================================
entropy_bin_242 PROC
    mov eax, dword ptr [rcx + 968]
    test eax, eax
    jz entropy_bin_242_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(242) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(242) * log2(P(242)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_242_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_242 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 243
; Computes -P(243) * log2(P(243))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 243
; ============================================
entropy_bin_243 PROC
    mov eax, dword ptr [rcx + 972]
    test eax, eax
    jz entropy_bin_243_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(243) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(243) * log2(P(243)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_243_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_243 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 244
; Computes -P(244) * log2(P(244))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 244
; ============================================
entropy_bin_244 PROC
    mov eax, dword ptr [rcx + 976]
    test eax, eax
    jz entropy_bin_244_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(244) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(244) * log2(P(244)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_244_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_244 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 245
; Computes -P(245) * log2(P(245))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 245
; ============================================
entropy_bin_245 PROC
    mov eax, dword ptr [rcx + 980]
    test eax, eax
    jz entropy_bin_245_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(245) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(245) * log2(P(245)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_245_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_245 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 246
; Computes -P(246) * log2(P(246))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 246
; ============================================
entropy_bin_246 PROC
    mov eax, dword ptr [rcx + 984]
    test eax, eax
    jz entropy_bin_246_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(246) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(246) * log2(P(246)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_246_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_246 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 247
; Computes -P(247) * log2(P(247))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 247
; ============================================
entropy_bin_247 PROC
    mov eax, dword ptr [rcx + 988]
    test eax, eax
    jz entropy_bin_247_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(247) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(247) * log2(P(247)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_247_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_247 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 248
; Computes -P(248) * log2(P(248))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 248
; ============================================
entropy_bin_248 PROC
    mov eax, dword ptr [rcx + 992]
    test eax, eax
    jz entropy_bin_248_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(248) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(248) * log2(P(248)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_248_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_248 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 249
; Computes -P(249) * log2(P(249))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 249
; ============================================
entropy_bin_249 PROC
    mov eax, dword ptr [rcx + 996]
    test eax, eax
    jz entropy_bin_249_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(249) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(249) * log2(P(249)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_249_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_249 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 250
; Computes -P(250) * log2(P(250))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 250
; ============================================
entropy_bin_250 PROC
    mov eax, dword ptr [rcx + 1000]
    test eax, eax
    jz entropy_bin_250_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(250) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(250) * log2(P(250)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_250_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_250 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 251
; Computes -P(251) * log2(P(251))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 251
; ============================================
entropy_bin_251 PROC
    mov eax, dword ptr [rcx + 1004]
    test eax, eax
    jz entropy_bin_251_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(251) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(251) * log2(P(251)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_251_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_251 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 252
; Computes -P(252) * log2(P(252))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 252
; ============================================
entropy_bin_252 PROC
    mov eax, dword ptr [rcx + 1008]
    test eax, eax
    jz entropy_bin_252_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(252) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(252) * log2(P(252)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_252_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_252 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 253
; Computes -P(253) * log2(P(253))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 253
; ============================================
entropy_bin_253 PROC
    mov eax, dword ptr [rcx + 1012]
    test eax, eax
    jz entropy_bin_253_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(253) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(253) * log2(P(253)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_253_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_253 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 254
; Computes -P(254) * log2(P(254))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 254
; ============================================
entropy_bin_254 PROC
    mov eax, dword ptr [rcx + 1016]
    test eax, eax
    jz entropy_bin_254_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(254) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(254) * log2(P(254)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_254_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_254 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 255
; Computes -P(255) * log2(P(255))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 255
; ============================================
entropy_bin_255 PROC
    mov eax, dword ptr [rcx + 1020]
    test eax, eax
    jz entropy_bin_255_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(255) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(255) * log2(P(255)) via x87 FPU
    movq qword ptr [rsp], xmm0
    fld qword ptr [rsp]
    fld st(0)
    fld1
    fchs
    fxch st(1)
    fyl2x
    fmulp st(1), st(0)
    fstp qword ptr [rsp]
    movsd xmm0, qword ptr [rsp]
    ;
    mov rsp, rbp
    pop rbp
    ret
entropy_bin_255_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_255 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 0
; Seeds Gaussian displacement at phi[0]
; phi[0] = factor * exp(-((0 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[0] = factor * exp(...)
; ============================================
seed_cell_0000 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 0.0 - center
    mov rax, 0000000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[0] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 0], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0000 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 1
; Seeds Gaussian displacement at phi[1]
; phi[1] = factor * exp(-((1 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[1] = factor * exp(...)
; ============================================
seed_cell_0001 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 1.0 - center
    mov rax, 3FF0000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[1] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 4], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0001 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 2
; Seeds Gaussian displacement at phi[2]
; phi[2] = factor * exp(-((2 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[2] = factor * exp(...)
; ============================================
seed_cell_0002 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 2.0 - center
    mov rax, 4000000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[2] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 8], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0002 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 3
; Seeds Gaussian displacement at phi[3]
; phi[3] = factor * exp(-((3 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[3] = factor * exp(...)
; ============================================
seed_cell_0003 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 3.0 - center
    mov rax, 4008000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[3] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 12], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0003 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 4
; Seeds Gaussian displacement at phi[4]
; phi[4] = factor * exp(-((4 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[4] = factor * exp(...)
; ============================================
seed_cell_0004 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 4.0 - center
    mov rax, 4010000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[4] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 16], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0004 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 5
; Seeds Gaussian displacement at phi[5]
; phi[5] = factor * exp(-((5 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[5] = factor * exp(...)
; ============================================
seed_cell_0005 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 5.0 - center
    mov rax, 4014000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[5] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 20], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0005 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 6
; Seeds Gaussian displacement at phi[6]
; phi[6] = factor * exp(-((6 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[6] = factor * exp(...)
; ============================================
seed_cell_0006 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 6.0 - center
    mov rax, 4018000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[6] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 24], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0006 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 7
; Seeds Gaussian displacement at phi[7]
; phi[7] = factor * exp(-((7 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[7] = factor * exp(...)
; ============================================
seed_cell_0007 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 7.0 - center
    mov rax, 401C000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[7] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 28], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0007 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 8
; Seeds Gaussian displacement at phi[8]
; phi[8] = factor * exp(-((8 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[8] = factor * exp(...)
; ============================================
seed_cell_0008 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 8.0 - center
    mov rax, 4020000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[8] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 32], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0008 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 9
; Seeds Gaussian displacement at phi[9]
; phi[9] = factor * exp(-((9 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[9] = factor * exp(...)
; ============================================
seed_cell_0009 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 9.0 - center
    mov rax, 4022000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[9] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 36], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0009 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 10
; Seeds Gaussian displacement at phi[10]
; phi[10] = factor * exp(-((10 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[10] = factor * exp(...)
; ============================================
seed_cell_0010 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 10.0 - center
    mov rax, 4024000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[10] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 40], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0010 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 11
; Seeds Gaussian displacement at phi[11]
; phi[11] = factor * exp(-((11 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[11] = factor * exp(...)
; ============================================
seed_cell_0011 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 11.0 - center
    mov rax, 4026000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[11] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 44], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0011 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 12
; Seeds Gaussian displacement at phi[12]
; phi[12] = factor * exp(-((12 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[12] = factor * exp(...)
; ============================================
seed_cell_0012 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 12.0 - center
    mov rax, 4028000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[12] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 48], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0012 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 13
; Seeds Gaussian displacement at phi[13]
; phi[13] = factor * exp(-((13 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[13] = factor * exp(...)
; ============================================
seed_cell_0013 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 13.0 - center
    mov rax, 402A000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[13] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 52], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0013 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 14
; Seeds Gaussian displacement at phi[14]
; phi[14] = factor * exp(-((14 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[14] = factor * exp(...)
; ============================================
seed_cell_0014 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 14.0 - center
    mov rax, 402C000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[14] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 56], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0014 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 15
; Seeds Gaussian displacement at phi[15]
; phi[15] = factor * exp(-((15 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[15] = factor * exp(...)
; ============================================
seed_cell_0015 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 15.0 - center
    mov rax, 402E000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[15] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 60], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0015 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 16
; Seeds Gaussian displacement at phi[16]
; phi[16] = factor * exp(-((16 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[16] = factor * exp(...)
; ============================================
seed_cell_0016 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 16.0 - center
    mov rax, 4030000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[16] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 64], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0016 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 17
; Seeds Gaussian displacement at phi[17]
; phi[17] = factor * exp(-((17 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[17] = factor * exp(...)
; ============================================
seed_cell_0017 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 17.0 - center
    mov rax, 4031000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[17] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 68], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0017 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 18
; Seeds Gaussian displacement at phi[18]
; phi[18] = factor * exp(-((18 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[18] = factor * exp(...)
; ============================================
seed_cell_0018 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 18.0 - center
    mov rax, 4032000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[18] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 72], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0018 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 19
; Seeds Gaussian displacement at phi[19]
; phi[19] = factor * exp(-((19 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[19] = factor * exp(...)
; ============================================
seed_cell_0019 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 19.0 - center
    mov rax, 4033000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[19] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 76], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0019 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 20
; Seeds Gaussian displacement at phi[20]
; phi[20] = factor * exp(-((20 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[20] = factor * exp(...)
; ============================================
seed_cell_0020 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 20.0 - center
    mov rax, 4034000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[20] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 80], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0020 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 21
; Seeds Gaussian displacement at phi[21]
; phi[21] = factor * exp(-((21 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[21] = factor * exp(...)
; ============================================
seed_cell_0021 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 21.0 - center
    mov rax, 4035000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[21] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 84], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0021 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 22
; Seeds Gaussian displacement at phi[22]
; phi[22] = factor * exp(-((22 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[22] = factor * exp(...)
; ============================================
seed_cell_0022 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 22.0 - center
    mov rax, 4036000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[22] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 88], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0022 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 23
; Seeds Gaussian displacement at phi[23]
; phi[23] = factor * exp(-((23 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[23] = factor * exp(...)
; ============================================
seed_cell_0023 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 23.0 - center
    mov rax, 4037000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[23] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 92], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0023 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 24
; Seeds Gaussian displacement at phi[24]
; phi[24] = factor * exp(-((24 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[24] = factor * exp(...)
; ============================================
seed_cell_0024 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 24.0 - center
    mov rax, 4038000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[24] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 96], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0024 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 25
; Seeds Gaussian displacement at phi[25]
; phi[25] = factor * exp(-((25 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[25] = factor * exp(...)
; ============================================
seed_cell_0025 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 25.0 - center
    mov rax, 4039000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[25] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 100], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0025 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 26
; Seeds Gaussian displacement at phi[26]
; phi[26] = factor * exp(-((26 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[26] = factor * exp(...)
; ============================================
seed_cell_0026 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 26.0 - center
    mov rax, 403A000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[26] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 104], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0026 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 27
; Seeds Gaussian displacement at phi[27]
; phi[27] = factor * exp(-((27 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[27] = factor * exp(...)
; ============================================
seed_cell_0027 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 27.0 - center
    mov rax, 403B000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[27] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 108], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0027 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 28
; Seeds Gaussian displacement at phi[28]
; phi[28] = factor * exp(-((28 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[28] = factor * exp(...)
; ============================================
seed_cell_0028 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 28.0 - center
    mov rax, 403C000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[28] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 112], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0028 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 29
; Seeds Gaussian displacement at phi[29]
; phi[29] = factor * exp(-((29 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[29] = factor * exp(...)
; ============================================
seed_cell_0029 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 29.0 - center
    mov rax, 403D000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[29] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 116], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0029 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 30
; Seeds Gaussian displacement at phi[30]
; phi[30] = factor * exp(-((30 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[30] = factor * exp(...)
; ============================================
seed_cell_0030 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 30.0 - center
    mov rax, 403E000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[30] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 120], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0030 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 31
; Seeds Gaussian displacement at phi[31]
; phi[31] = factor * exp(-((31 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[31] = factor * exp(...)
; ============================================
seed_cell_0031 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 31.0 - center
    mov rax, 403F000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[31] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 124], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0031 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 32
; Seeds Gaussian displacement at phi[32]
; phi[32] = factor * exp(-((32 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[32] = factor * exp(...)
; ============================================
seed_cell_0032 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 32.0 - center
    mov rax, 4040000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[32] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 128], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0032 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 33
; Seeds Gaussian displacement at phi[33]
; phi[33] = factor * exp(-((33 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[33] = factor * exp(...)
; ============================================
seed_cell_0033 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 33.0 - center
    mov rax, 4040800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[33] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 132], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0033 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 34
; Seeds Gaussian displacement at phi[34]
; phi[34] = factor * exp(-((34 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[34] = factor * exp(...)
; ============================================
seed_cell_0034 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 34.0 - center
    mov rax, 4041000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[34] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 136], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0034 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 35
; Seeds Gaussian displacement at phi[35]
; phi[35] = factor * exp(-((35 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[35] = factor * exp(...)
; ============================================
seed_cell_0035 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 35.0 - center
    mov rax, 4041800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[35] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 140], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0035 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 36
; Seeds Gaussian displacement at phi[36]
; phi[36] = factor * exp(-((36 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[36] = factor * exp(...)
; ============================================
seed_cell_0036 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 36.0 - center
    mov rax, 4042000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[36] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 144], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0036 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 37
; Seeds Gaussian displacement at phi[37]
; phi[37] = factor * exp(-((37 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[37] = factor * exp(...)
; ============================================
seed_cell_0037 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 37.0 - center
    mov rax, 4042800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[37] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 148], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0037 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 38
; Seeds Gaussian displacement at phi[38]
; phi[38] = factor * exp(-((38 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[38] = factor * exp(...)
; ============================================
seed_cell_0038 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 38.0 - center
    mov rax, 4043000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[38] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 152], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0038 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 39
; Seeds Gaussian displacement at phi[39]
; phi[39] = factor * exp(-((39 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[39] = factor * exp(...)
; ============================================
seed_cell_0039 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 39.0 - center
    mov rax, 4043800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[39] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 156], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0039 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 40
; Seeds Gaussian displacement at phi[40]
; phi[40] = factor * exp(-((40 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[40] = factor * exp(...)
; ============================================
seed_cell_0040 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 40.0 - center
    mov rax, 4044000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[40] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 160], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0040 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 41
; Seeds Gaussian displacement at phi[41]
; phi[41] = factor * exp(-((41 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[41] = factor * exp(...)
; ============================================
seed_cell_0041 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 41.0 - center
    mov rax, 4044800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[41] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 164], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0041 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 42
; Seeds Gaussian displacement at phi[42]
; phi[42] = factor * exp(-((42 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[42] = factor * exp(...)
; ============================================
seed_cell_0042 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 42.0 - center
    mov rax, 4045000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[42] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 168], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0042 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 43
; Seeds Gaussian displacement at phi[43]
; phi[43] = factor * exp(-((43 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[43] = factor * exp(...)
; ============================================
seed_cell_0043 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 43.0 - center
    mov rax, 4045800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[43] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 172], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0043 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 44
; Seeds Gaussian displacement at phi[44]
; phi[44] = factor * exp(-((44 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[44] = factor * exp(...)
; ============================================
seed_cell_0044 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 44.0 - center
    mov rax, 4046000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[44] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 176], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0044 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 45
; Seeds Gaussian displacement at phi[45]
; phi[45] = factor * exp(-((45 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[45] = factor * exp(...)
; ============================================
seed_cell_0045 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 45.0 - center
    mov rax, 4046800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[45] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 180], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0045 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 46
; Seeds Gaussian displacement at phi[46]
; phi[46] = factor * exp(-((46 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[46] = factor * exp(...)
; ============================================
seed_cell_0046 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 46.0 - center
    mov rax, 4047000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[46] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 184], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0046 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 47
; Seeds Gaussian displacement at phi[47]
; phi[47] = factor * exp(-((47 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[47] = factor * exp(...)
; ============================================
seed_cell_0047 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 47.0 - center
    mov rax, 4047800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[47] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 188], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0047 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 48
; Seeds Gaussian displacement at phi[48]
; phi[48] = factor * exp(-((48 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[48] = factor * exp(...)
; ============================================
seed_cell_0048 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 48.0 - center
    mov rax, 4048000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[48] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 192], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0048 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 49
; Seeds Gaussian displacement at phi[49]
; phi[49] = factor * exp(-((49 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[49] = factor * exp(...)
; ============================================
seed_cell_0049 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 49.0 - center
    mov rax, 4048800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[49] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 196], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0049 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 50
; Seeds Gaussian displacement at phi[50]
; phi[50] = factor * exp(-((50 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[50] = factor * exp(...)
; ============================================
seed_cell_0050 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 50.0 - center
    mov rax, 4049000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[50] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 200], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0050 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 51
; Seeds Gaussian displacement at phi[51]
; phi[51] = factor * exp(-((51 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[51] = factor * exp(...)
; ============================================
seed_cell_0051 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 51.0 - center
    mov rax, 4049800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[51] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 204], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0051 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 52
; Seeds Gaussian displacement at phi[52]
; phi[52] = factor * exp(-((52 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[52] = factor * exp(...)
; ============================================
seed_cell_0052 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 52.0 - center
    mov rax, 404A000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[52] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 208], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0052 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 53
; Seeds Gaussian displacement at phi[53]
; phi[53] = factor * exp(-((53 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[53] = factor * exp(...)
; ============================================
seed_cell_0053 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 53.0 - center
    mov rax, 404A800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[53] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 212], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0053 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 54
; Seeds Gaussian displacement at phi[54]
; phi[54] = factor * exp(-((54 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[54] = factor * exp(...)
; ============================================
seed_cell_0054 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 54.0 - center
    mov rax, 404B000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[54] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 216], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0054 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 55
; Seeds Gaussian displacement at phi[55]
; phi[55] = factor * exp(-((55 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[55] = factor * exp(...)
; ============================================
seed_cell_0055 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 55.0 - center
    mov rax, 404B800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[55] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 220], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0055 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 56
; Seeds Gaussian displacement at phi[56]
; phi[56] = factor * exp(-((56 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[56] = factor * exp(...)
; ============================================
seed_cell_0056 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 56.0 - center
    mov rax, 404C000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[56] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 224], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0056 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 57
; Seeds Gaussian displacement at phi[57]
; phi[57] = factor * exp(-((57 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[57] = factor * exp(...)
; ============================================
seed_cell_0057 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 57.0 - center
    mov rax, 404C800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[57] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 228], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0057 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 58
; Seeds Gaussian displacement at phi[58]
; phi[58] = factor * exp(-((58 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[58] = factor * exp(...)
; ============================================
seed_cell_0058 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 58.0 - center
    mov rax, 404D000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[58] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 232], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0058 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 59
; Seeds Gaussian displacement at phi[59]
; phi[59] = factor * exp(-((59 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[59] = factor * exp(...)
; ============================================
seed_cell_0059 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 59.0 - center
    mov rax, 404D800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[59] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 236], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0059 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 60
; Seeds Gaussian displacement at phi[60]
; phi[60] = factor * exp(-((60 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[60] = factor * exp(...)
; ============================================
seed_cell_0060 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 60.0 - center
    mov rax, 404E000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[60] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 240], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0060 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 61
; Seeds Gaussian displacement at phi[61]
; phi[61] = factor * exp(-((61 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[61] = factor * exp(...)
; ============================================
seed_cell_0061 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 61.0 - center
    mov rax, 404E800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[61] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 244], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0061 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 62
; Seeds Gaussian displacement at phi[62]
; phi[62] = factor * exp(-((62 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[62] = factor * exp(...)
; ============================================
seed_cell_0062 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 62.0 - center
    mov rax, 404F000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[62] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 248], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0062 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 63
; Seeds Gaussian displacement at phi[63]
; phi[63] = factor * exp(-((63 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[63] = factor * exp(...)
; ============================================
seed_cell_0063 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 63.0 - center
    mov rax, 404F800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[63] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 252], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0063 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 64
; Seeds Gaussian displacement at phi[64]
; phi[64] = factor * exp(-((64 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[64] = factor * exp(...)
; ============================================
seed_cell_0064 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 64.0 - center
    mov rax, 4050000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[64] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 256], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0064 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 65
; Seeds Gaussian displacement at phi[65]
; phi[65] = factor * exp(-((65 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[65] = factor * exp(...)
; ============================================
seed_cell_0065 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 65.0 - center
    mov rax, 4050400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[65] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 260], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0065 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 66
; Seeds Gaussian displacement at phi[66]
; phi[66] = factor * exp(-((66 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[66] = factor * exp(...)
; ============================================
seed_cell_0066 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 66.0 - center
    mov rax, 4050800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[66] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 264], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0066 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 67
; Seeds Gaussian displacement at phi[67]
; phi[67] = factor * exp(-((67 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[67] = factor * exp(...)
; ============================================
seed_cell_0067 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 67.0 - center
    mov rax, 4050C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[67] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 268], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0067 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 68
; Seeds Gaussian displacement at phi[68]
; phi[68] = factor * exp(-((68 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[68] = factor * exp(...)
; ============================================
seed_cell_0068 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 68.0 - center
    mov rax, 4051000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[68] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 272], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0068 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 69
; Seeds Gaussian displacement at phi[69]
; phi[69] = factor * exp(-((69 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[69] = factor * exp(...)
; ============================================
seed_cell_0069 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 69.0 - center
    mov rax, 4051400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[69] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 276], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0069 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 70
; Seeds Gaussian displacement at phi[70]
; phi[70] = factor * exp(-((70 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[70] = factor * exp(...)
; ============================================
seed_cell_0070 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 70.0 - center
    mov rax, 4051800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[70] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 280], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0070 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 71
; Seeds Gaussian displacement at phi[71]
; phi[71] = factor * exp(-((71 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[71] = factor * exp(...)
; ============================================
seed_cell_0071 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 71.0 - center
    mov rax, 4051C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[71] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 284], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0071 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 72
; Seeds Gaussian displacement at phi[72]
; phi[72] = factor * exp(-((72 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[72] = factor * exp(...)
; ============================================
seed_cell_0072 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 72.0 - center
    mov rax, 4052000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[72] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 288], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0072 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 73
; Seeds Gaussian displacement at phi[73]
; phi[73] = factor * exp(-((73 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[73] = factor * exp(...)
; ============================================
seed_cell_0073 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 73.0 - center
    mov rax, 4052400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[73] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 292], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0073 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 74
; Seeds Gaussian displacement at phi[74]
; phi[74] = factor * exp(-((74 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[74] = factor * exp(...)
; ============================================
seed_cell_0074 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 74.0 - center
    mov rax, 4052800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[74] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 296], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0074 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 75
; Seeds Gaussian displacement at phi[75]
; phi[75] = factor * exp(-((75 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[75] = factor * exp(...)
; ============================================
seed_cell_0075 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 75.0 - center
    mov rax, 4052C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[75] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 300], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0075 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 76
; Seeds Gaussian displacement at phi[76]
; phi[76] = factor * exp(-((76 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[76] = factor * exp(...)
; ============================================
seed_cell_0076 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 76.0 - center
    mov rax, 4053000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[76] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 304], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0076 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 77
; Seeds Gaussian displacement at phi[77]
; phi[77] = factor * exp(-((77 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[77] = factor * exp(...)
; ============================================
seed_cell_0077 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 77.0 - center
    mov rax, 4053400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[77] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 308], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0077 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 78
; Seeds Gaussian displacement at phi[78]
; phi[78] = factor * exp(-((78 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[78] = factor * exp(...)
; ============================================
seed_cell_0078 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 78.0 - center
    mov rax, 4053800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[78] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 312], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0078 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 79
; Seeds Gaussian displacement at phi[79]
; phi[79] = factor * exp(-((79 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[79] = factor * exp(...)
; ============================================
seed_cell_0079 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 79.0 - center
    mov rax, 4053C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[79] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 316], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0079 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 80
; Seeds Gaussian displacement at phi[80]
; phi[80] = factor * exp(-((80 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[80] = factor * exp(...)
; ============================================
seed_cell_0080 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 80.0 - center
    mov rax, 4054000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[80] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 320], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0080 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 81
; Seeds Gaussian displacement at phi[81]
; phi[81] = factor * exp(-((81 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[81] = factor * exp(...)
; ============================================
seed_cell_0081 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 81.0 - center
    mov rax, 4054400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[81] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 324], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0081 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 82
; Seeds Gaussian displacement at phi[82]
; phi[82] = factor * exp(-((82 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[82] = factor * exp(...)
; ============================================
seed_cell_0082 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 82.0 - center
    mov rax, 4054800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[82] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 328], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0082 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 83
; Seeds Gaussian displacement at phi[83]
; phi[83] = factor * exp(-((83 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[83] = factor * exp(...)
; ============================================
seed_cell_0083 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 83.0 - center
    mov rax, 4054C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[83] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 332], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0083 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 84
; Seeds Gaussian displacement at phi[84]
; phi[84] = factor * exp(-((84 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[84] = factor * exp(...)
; ============================================
seed_cell_0084 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 84.0 - center
    mov rax, 4055000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[84] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 336], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0084 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 85
; Seeds Gaussian displacement at phi[85]
; phi[85] = factor * exp(-((85 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[85] = factor * exp(...)
; ============================================
seed_cell_0085 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 85.0 - center
    mov rax, 4055400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[85] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 340], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0085 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 86
; Seeds Gaussian displacement at phi[86]
; phi[86] = factor * exp(-((86 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[86] = factor * exp(...)
; ============================================
seed_cell_0086 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 86.0 - center
    mov rax, 4055800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[86] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 344], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0086 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 87
; Seeds Gaussian displacement at phi[87]
; phi[87] = factor * exp(-((87 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[87] = factor * exp(...)
; ============================================
seed_cell_0087 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 87.0 - center
    mov rax, 4055C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[87] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 348], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0087 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 88
; Seeds Gaussian displacement at phi[88]
; phi[88] = factor * exp(-((88 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[88] = factor * exp(...)
; ============================================
seed_cell_0088 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 88.0 - center
    mov rax, 4056000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[88] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 352], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0088 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 89
; Seeds Gaussian displacement at phi[89]
; phi[89] = factor * exp(-((89 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[89] = factor * exp(...)
; ============================================
seed_cell_0089 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 89.0 - center
    mov rax, 4056400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[89] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 356], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0089 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 90
; Seeds Gaussian displacement at phi[90]
; phi[90] = factor * exp(-((90 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[90] = factor * exp(...)
; ============================================
seed_cell_0090 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 90.0 - center
    mov rax, 4056800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[90] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 360], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0090 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 91
; Seeds Gaussian displacement at phi[91]
; phi[91] = factor * exp(-((91 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[91] = factor * exp(...)
; ============================================
seed_cell_0091 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 91.0 - center
    mov rax, 4056C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[91] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 364], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0091 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 92
; Seeds Gaussian displacement at phi[92]
; phi[92] = factor * exp(-((92 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[92] = factor * exp(...)
; ============================================
seed_cell_0092 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 92.0 - center
    mov rax, 4057000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[92] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 368], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0092 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 93
; Seeds Gaussian displacement at phi[93]
; phi[93] = factor * exp(-((93 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[93] = factor * exp(...)
; ============================================
seed_cell_0093 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 93.0 - center
    mov rax, 4057400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[93] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 372], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0093 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 94
; Seeds Gaussian displacement at phi[94]
; phi[94] = factor * exp(-((94 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[94] = factor * exp(...)
; ============================================
seed_cell_0094 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 94.0 - center
    mov rax, 4057800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[94] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 376], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0094 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 95
; Seeds Gaussian displacement at phi[95]
; phi[95] = factor * exp(-((95 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[95] = factor * exp(...)
; ============================================
seed_cell_0095 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 95.0 - center
    mov rax, 4057C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[95] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 380], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0095 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 96
; Seeds Gaussian displacement at phi[96]
; phi[96] = factor * exp(-((96 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[96] = factor * exp(...)
; ============================================
seed_cell_0096 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 96.0 - center
    mov rax, 4058000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[96] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 384], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0096 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 97
; Seeds Gaussian displacement at phi[97]
; phi[97] = factor * exp(-((97 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[97] = factor * exp(...)
; ============================================
seed_cell_0097 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 97.0 - center
    mov rax, 4058400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[97] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 388], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0097 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 98
; Seeds Gaussian displacement at phi[98]
; phi[98] = factor * exp(-((98 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[98] = factor * exp(...)
; ============================================
seed_cell_0098 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 98.0 - center
    mov rax, 4058800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[98] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 392], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0098 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 99
; Seeds Gaussian displacement at phi[99]
; phi[99] = factor * exp(-((99 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[99] = factor * exp(...)
; ============================================
seed_cell_0099 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 99.0 - center
    mov rax, 4058C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[99] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 396], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0099 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 100
; Seeds Gaussian displacement at phi[100]
; phi[100] = factor * exp(-((100 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[100] = factor * exp(...)
; ============================================
seed_cell_0100 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 100.0 - center
    mov rax, 4059000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[100] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 400], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0100 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 101
; Seeds Gaussian displacement at phi[101]
; phi[101] = factor * exp(-((101 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[101] = factor * exp(...)
; ============================================
seed_cell_0101 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 101.0 - center
    mov rax, 4059400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[101] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 404], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0101 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 102
; Seeds Gaussian displacement at phi[102]
; phi[102] = factor * exp(-((102 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[102] = factor * exp(...)
; ============================================
seed_cell_0102 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 102.0 - center
    mov rax, 4059800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[102] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 408], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0102 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 103
; Seeds Gaussian displacement at phi[103]
; phi[103] = factor * exp(-((103 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[103] = factor * exp(...)
; ============================================
seed_cell_0103 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 103.0 - center
    mov rax, 4059C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[103] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 412], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0103 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 104
; Seeds Gaussian displacement at phi[104]
; phi[104] = factor * exp(-((104 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[104] = factor * exp(...)
; ============================================
seed_cell_0104 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 104.0 - center
    mov rax, 405A000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[104] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 416], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0104 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 105
; Seeds Gaussian displacement at phi[105]
; phi[105] = factor * exp(-((105 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[105] = factor * exp(...)
; ============================================
seed_cell_0105 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 105.0 - center
    mov rax, 405A400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[105] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 420], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0105 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 106
; Seeds Gaussian displacement at phi[106]
; phi[106] = factor * exp(-((106 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[106] = factor * exp(...)
; ============================================
seed_cell_0106 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 106.0 - center
    mov rax, 405A800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[106] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 424], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0106 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 107
; Seeds Gaussian displacement at phi[107]
; phi[107] = factor * exp(-((107 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[107] = factor * exp(...)
; ============================================
seed_cell_0107 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 107.0 - center
    mov rax, 405AC00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[107] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 428], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0107 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 108
; Seeds Gaussian displacement at phi[108]
; phi[108] = factor * exp(-((108 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[108] = factor * exp(...)
; ============================================
seed_cell_0108 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 108.0 - center
    mov rax, 405B000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[108] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 432], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0108 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 109
; Seeds Gaussian displacement at phi[109]
; phi[109] = factor * exp(-((109 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[109] = factor * exp(...)
; ============================================
seed_cell_0109 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 109.0 - center
    mov rax, 405B400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[109] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 436], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0109 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 110
; Seeds Gaussian displacement at phi[110]
; phi[110] = factor * exp(-((110 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[110] = factor * exp(...)
; ============================================
seed_cell_0110 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 110.0 - center
    mov rax, 405B800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[110] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 440], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0110 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 111
; Seeds Gaussian displacement at phi[111]
; phi[111] = factor * exp(-((111 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[111] = factor * exp(...)
; ============================================
seed_cell_0111 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 111.0 - center
    mov rax, 405BC00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[111] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 444], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0111 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 112
; Seeds Gaussian displacement at phi[112]
; phi[112] = factor * exp(-((112 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[112] = factor * exp(...)
; ============================================
seed_cell_0112 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 112.0 - center
    mov rax, 405C000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[112] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 448], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0112 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 113
; Seeds Gaussian displacement at phi[113]
; phi[113] = factor * exp(-((113 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[113] = factor * exp(...)
; ============================================
seed_cell_0113 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 113.0 - center
    mov rax, 405C400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[113] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 452], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0113 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 114
; Seeds Gaussian displacement at phi[114]
; phi[114] = factor * exp(-((114 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[114] = factor * exp(...)
; ============================================
seed_cell_0114 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 114.0 - center
    mov rax, 405C800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[114] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 456], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0114 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 115
; Seeds Gaussian displacement at phi[115]
; phi[115] = factor * exp(-((115 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[115] = factor * exp(...)
; ============================================
seed_cell_0115 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 115.0 - center
    mov rax, 405CC00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[115] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 460], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0115 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 116
; Seeds Gaussian displacement at phi[116]
; phi[116] = factor * exp(-((116 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[116] = factor * exp(...)
; ============================================
seed_cell_0116 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 116.0 - center
    mov rax, 405D000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[116] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 464], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0116 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 117
; Seeds Gaussian displacement at phi[117]
; phi[117] = factor * exp(-((117 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[117] = factor * exp(...)
; ============================================
seed_cell_0117 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 117.0 - center
    mov rax, 405D400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[117] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 468], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0117 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 118
; Seeds Gaussian displacement at phi[118]
; phi[118] = factor * exp(-((118 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[118] = factor * exp(...)
; ============================================
seed_cell_0118 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 118.0 - center
    mov rax, 405D800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[118] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 472], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0118 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 119
; Seeds Gaussian displacement at phi[119]
; phi[119] = factor * exp(-((119 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[119] = factor * exp(...)
; ============================================
seed_cell_0119 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 119.0 - center
    mov rax, 405DC00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[119] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 476], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0119 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 120
; Seeds Gaussian displacement at phi[120]
; phi[120] = factor * exp(-((120 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[120] = factor * exp(...)
; ============================================
seed_cell_0120 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 120.0 - center
    mov rax, 405E000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[120] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 480], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0120 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 121
; Seeds Gaussian displacement at phi[121]
; phi[121] = factor * exp(-((121 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[121] = factor * exp(...)
; ============================================
seed_cell_0121 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 121.0 - center
    mov rax, 405E400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[121] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 484], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0121 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 122
; Seeds Gaussian displacement at phi[122]
; phi[122] = factor * exp(-((122 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[122] = factor * exp(...)
; ============================================
seed_cell_0122 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 122.0 - center
    mov rax, 405E800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[122] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 488], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0122 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 123
; Seeds Gaussian displacement at phi[123]
; phi[123] = factor * exp(-((123 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[123] = factor * exp(...)
; ============================================
seed_cell_0123 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 123.0 - center
    mov rax, 405EC00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[123] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 492], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0123 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 124
; Seeds Gaussian displacement at phi[124]
; phi[124] = factor * exp(-((124 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[124] = factor * exp(...)
; ============================================
seed_cell_0124 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 124.0 - center
    mov rax, 405F000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[124] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 496], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0124 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 125
; Seeds Gaussian displacement at phi[125]
; phi[125] = factor * exp(-((125 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[125] = factor * exp(...)
; ============================================
seed_cell_0125 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 125.0 - center
    mov rax, 405F400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[125] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 500], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0125 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 126
; Seeds Gaussian displacement at phi[126]
; phi[126] = factor * exp(-((126 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[126] = factor * exp(...)
; ============================================
seed_cell_0126 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 126.0 - center
    mov rax, 405F800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[126] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 504], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0126 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 127
; Seeds Gaussian displacement at phi[127]
; phi[127] = factor * exp(-((127 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[127] = factor * exp(...)
; ============================================
seed_cell_0127 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 127.0 - center
    mov rax, 405FC00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[127] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 508], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0127 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 128
; Seeds Gaussian displacement at phi[128]
; phi[128] = factor * exp(-((128 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[128] = factor * exp(...)
; ============================================
seed_cell_0128 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 128.0 - center
    mov rax, 4060000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[128] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 512], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0128 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 129
; Seeds Gaussian displacement at phi[129]
; phi[129] = factor * exp(-((129 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[129] = factor * exp(...)
; ============================================
seed_cell_0129 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 129.0 - center
    mov rax, 4060200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[129] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 516], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0129 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 130
; Seeds Gaussian displacement at phi[130]
; phi[130] = factor * exp(-((130 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[130] = factor * exp(...)
; ============================================
seed_cell_0130 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 130.0 - center
    mov rax, 4060400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[130] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 520], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0130 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 131
; Seeds Gaussian displacement at phi[131]
; phi[131] = factor * exp(-((131 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[131] = factor * exp(...)
; ============================================
seed_cell_0131 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 131.0 - center
    mov rax, 4060600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[131] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 524], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0131 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 132
; Seeds Gaussian displacement at phi[132]
; phi[132] = factor * exp(-((132 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[132] = factor * exp(...)
; ============================================
seed_cell_0132 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 132.0 - center
    mov rax, 4060800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[132] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 528], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0132 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 133
; Seeds Gaussian displacement at phi[133]
; phi[133] = factor * exp(-((133 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[133] = factor * exp(...)
; ============================================
seed_cell_0133 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 133.0 - center
    mov rax, 4060A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[133] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 532], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0133 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 134
; Seeds Gaussian displacement at phi[134]
; phi[134] = factor * exp(-((134 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[134] = factor * exp(...)
; ============================================
seed_cell_0134 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 134.0 - center
    mov rax, 4060C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[134] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 536], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0134 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 135
; Seeds Gaussian displacement at phi[135]
; phi[135] = factor * exp(-((135 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[135] = factor * exp(...)
; ============================================
seed_cell_0135 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 135.0 - center
    mov rax, 4060E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[135] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 540], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0135 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 136
; Seeds Gaussian displacement at phi[136]
; phi[136] = factor * exp(-((136 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[136] = factor * exp(...)
; ============================================
seed_cell_0136 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 136.0 - center
    mov rax, 4061000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[136] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 544], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0136 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 137
; Seeds Gaussian displacement at phi[137]
; phi[137] = factor * exp(-((137 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[137] = factor * exp(...)
; ============================================
seed_cell_0137 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 137.0 - center
    mov rax, 4061200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[137] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 548], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0137 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 138
; Seeds Gaussian displacement at phi[138]
; phi[138] = factor * exp(-((138 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[138] = factor * exp(...)
; ============================================
seed_cell_0138 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 138.0 - center
    mov rax, 4061400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[138] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 552], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0138 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 139
; Seeds Gaussian displacement at phi[139]
; phi[139] = factor * exp(-((139 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[139] = factor * exp(...)
; ============================================
seed_cell_0139 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 139.0 - center
    mov rax, 4061600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[139] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 556], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0139 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 140
; Seeds Gaussian displacement at phi[140]
; phi[140] = factor * exp(-((140 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[140] = factor * exp(...)
; ============================================
seed_cell_0140 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 140.0 - center
    mov rax, 4061800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[140] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 560], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0140 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 141
; Seeds Gaussian displacement at phi[141]
; phi[141] = factor * exp(-((141 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[141] = factor * exp(...)
; ============================================
seed_cell_0141 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 141.0 - center
    mov rax, 4061A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[141] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 564], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0141 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 142
; Seeds Gaussian displacement at phi[142]
; phi[142] = factor * exp(-((142 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[142] = factor * exp(...)
; ============================================
seed_cell_0142 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 142.0 - center
    mov rax, 4061C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[142] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 568], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0142 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 143
; Seeds Gaussian displacement at phi[143]
; phi[143] = factor * exp(-((143 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[143] = factor * exp(...)
; ============================================
seed_cell_0143 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 143.0 - center
    mov rax, 4061E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[143] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 572], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0143 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 144
; Seeds Gaussian displacement at phi[144]
; phi[144] = factor * exp(-((144 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[144] = factor * exp(...)
; ============================================
seed_cell_0144 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 144.0 - center
    mov rax, 4062000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[144] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 576], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0144 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 145
; Seeds Gaussian displacement at phi[145]
; phi[145] = factor * exp(-((145 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[145] = factor * exp(...)
; ============================================
seed_cell_0145 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 145.0 - center
    mov rax, 4062200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[145] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 580], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0145 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 146
; Seeds Gaussian displacement at phi[146]
; phi[146] = factor * exp(-((146 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[146] = factor * exp(...)
; ============================================
seed_cell_0146 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 146.0 - center
    mov rax, 4062400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[146] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 584], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0146 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 147
; Seeds Gaussian displacement at phi[147]
; phi[147] = factor * exp(-((147 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[147] = factor * exp(...)
; ============================================
seed_cell_0147 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 147.0 - center
    mov rax, 4062600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[147] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 588], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0147 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 148
; Seeds Gaussian displacement at phi[148]
; phi[148] = factor * exp(-((148 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[148] = factor * exp(...)
; ============================================
seed_cell_0148 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 148.0 - center
    mov rax, 4062800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[148] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 592], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0148 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 149
; Seeds Gaussian displacement at phi[149]
; phi[149] = factor * exp(-((149 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[149] = factor * exp(...)
; ============================================
seed_cell_0149 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 149.0 - center
    mov rax, 4062A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[149] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 596], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0149 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 150
; Seeds Gaussian displacement at phi[150]
; phi[150] = factor * exp(-((150 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[150] = factor * exp(...)
; ============================================
seed_cell_0150 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 150.0 - center
    mov rax, 4062C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[150] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 600], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0150 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 151
; Seeds Gaussian displacement at phi[151]
; phi[151] = factor * exp(-((151 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[151] = factor * exp(...)
; ============================================
seed_cell_0151 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 151.0 - center
    mov rax, 4062E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[151] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 604], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0151 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 152
; Seeds Gaussian displacement at phi[152]
; phi[152] = factor * exp(-((152 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[152] = factor * exp(...)
; ============================================
seed_cell_0152 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 152.0 - center
    mov rax, 4063000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[152] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 608], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0152 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 153
; Seeds Gaussian displacement at phi[153]
; phi[153] = factor * exp(-((153 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[153] = factor * exp(...)
; ============================================
seed_cell_0153 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 153.0 - center
    mov rax, 4063200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[153] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 612], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0153 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 154
; Seeds Gaussian displacement at phi[154]
; phi[154] = factor * exp(-((154 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[154] = factor * exp(...)
; ============================================
seed_cell_0154 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 154.0 - center
    mov rax, 4063400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[154] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 616], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0154 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 155
; Seeds Gaussian displacement at phi[155]
; phi[155] = factor * exp(-((155 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[155] = factor * exp(...)
; ============================================
seed_cell_0155 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 155.0 - center
    mov rax, 4063600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[155] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 620], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0155 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 156
; Seeds Gaussian displacement at phi[156]
; phi[156] = factor * exp(-((156 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[156] = factor * exp(...)
; ============================================
seed_cell_0156 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 156.0 - center
    mov rax, 4063800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[156] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 624], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0156 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 157
; Seeds Gaussian displacement at phi[157]
; phi[157] = factor * exp(-((157 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[157] = factor * exp(...)
; ============================================
seed_cell_0157 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 157.0 - center
    mov rax, 4063A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[157] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 628], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0157 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 158
; Seeds Gaussian displacement at phi[158]
; phi[158] = factor * exp(-((158 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[158] = factor * exp(...)
; ============================================
seed_cell_0158 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 158.0 - center
    mov rax, 4063C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[158] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 632], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0158 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 159
; Seeds Gaussian displacement at phi[159]
; phi[159] = factor * exp(-((159 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[159] = factor * exp(...)
; ============================================
seed_cell_0159 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 159.0 - center
    mov rax, 4063E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[159] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 636], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0159 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 160
; Seeds Gaussian displacement at phi[160]
; phi[160] = factor * exp(-((160 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[160] = factor * exp(...)
; ============================================
seed_cell_0160 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 160.0 - center
    mov rax, 4064000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[160] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 640], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0160 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 161
; Seeds Gaussian displacement at phi[161]
; phi[161] = factor * exp(-((161 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[161] = factor * exp(...)
; ============================================
seed_cell_0161 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 161.0 - center
    mov rax, 4064200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[161] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 644], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0161 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 162
; Seeds Gaussian displacement at phi[162]
; phi[162] = factor * exp(-((162 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[162] = factor * exp(...)
; ============================================
seed_cell_0162 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 162.0 - center
    mov rax, 4064400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[162] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 648], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0162 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 163
; Seeds Gaussian displacement at phi[163]
; phi[163] = factor * exp(-((163 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[163] = factor * exp(...)
; ============================================
seed_cell_0163 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 163.0 - center
    mov rax, 4064600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[163] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 652], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0163 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 164
; Seeds Gaussian displacement at phi[164]
; phi[164] = factor * exp(-((164 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[164] = factor * exp(...)
; ============================================
seed_cell_0164 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 164.0 - center
    mov rax, 4064800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[164] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 656], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0164 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 165
; Seeds Gaussian displacement at phi[165]
; phi[165] = factor * exp(-((165 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[165] = factor * exp(...)
; ============================================
seed_cell_0165 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 165.0 - center
    mov rax, 4064A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[165] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 660], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0165 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 166
; Seeds Gaussian displacement at phi[166]
; phi[166] = factor * exp(-((166 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[166] = factor * exp(...)
; ============================================
seed_cell_0166 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 166.0 - center
    mov rax, 4064C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[166] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 664], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0166 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 167
; Seeds Gaussian displacement at phi[167]
; phi[167] = factor * exp(-((167 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[167] = factor * exp(...)
; ============================================
seed_cell_0167 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 167.0 - center
    mov rax, 4064E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[167] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 668], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0167 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 168
; Seeds Gaussian displacement at phi[168]
; phi[168] = factor * exp(-((168 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[168] = factor * exp(...)
; ============================================
seed_cell_0168 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 168.0 - center
    mov rax, 4065000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[168] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 672], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0168 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 169
; Seeds Gaussian displacement at phi[169]
; phi[169] = factor * exp(-((169 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[169] = factor * exp(...)
; ============================================
seed_cell_0169 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 169.0 - center
    mov rax, 4065200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[169] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 676], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0169 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 170
; Seeds Gaussian displacement at phi[170]
; phi[170] = factor * exp(-((170 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[170] = factor * exp(...)
; ============================================
seed_cell_0170 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 170.0 - center
    mov rax, 4065400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[170] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 680], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0170 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 171
; Seeds Gaussian displacement at phi[171]
; phi[171] = factor * exp(-((171 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[171] = factor * exp(...)
; ============================================
seed_cell_0171 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 171.0 - center
    mov rax, 4065600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[171] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 684], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0171 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 172
; Seeds Gaussian displacement at phi[172]
; phi[172] = factor * exp(-((172 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[172] = factor * exp(...)
; ============================================
seed_cell_0172 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 172.0 - center
    mov rax, 4065800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[172] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 688], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0172 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 173
; Seeds Gaussian displacement at phi[173]
; phi[173] = factor * exp(-((173 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[173] = factor * exp(...)
; ============================================
seed_cell_0173 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 173.0 - center
    mov rax, 4065A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[173] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 692], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0173 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 174
; Seeds Gaussian displacement at phi[174]
; phi[174] = factor * exp(-((174 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[174] = factor * exp(...)
; ============================================
seed_cell_0174 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 174.0 - center
    mov rax, 4065C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[174] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 696], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0174 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 175
; Seeds Gaussian displacement at phi[175]
; phi[175] = factor * exp(-((175 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[175] = factor * exp(...)
; ============================================
seed_cell_0175 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 175.0 - center
    mov rax, 4065E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[175] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 700], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0175 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 176
; Seeds Gaussian displacement at phi[176]
; phi[176] = factor * exp(-((176 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[176] = factor * exp(...)
; ============================================
seed_cell_0176 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 176.0 - center
    mov rax, 4066000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[176] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 704], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0176 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 177
; Seeds Gaussian displacement at phi[177]
; phi[177] = factor * exp(-((177 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[177] = factor * exp(...)
; ============================================
seed_cell_0177 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 177.0 - center
    mov rax, 4066200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[177] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 708], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0177 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 178
; Seeds Gaussian displacement at phi[178]
; phi[178] = factor * exp(-((178 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[178] = factor * exp(...)
; ============================================
seed_cell_0178 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 178.0 - center
    mov rax, 4066400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[178] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 712], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0178 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 179
; Seeds Gaussian displacement at phi[179]
; phi[179] = factor * exp(-((179 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[179] = factor * exp(...)
; ============================================
seed_cell_0179 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 179.0 - center
    mov rax, 4066600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[179] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 716], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0179 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 180
; Seeds Gaussian displacement at phi[180]
; phi[180] = factor * exp(-((180 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[180] = factor * exp(...)
; ============================================
seed_cell_0180 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 180.0 - center
    mov rax, 4066800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[180] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 720], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0180 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 181
; Seeds Gaussian displacement at phi[181]
; phi[181] = factor * exp(-((181 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[181] = factor * exp(...)
; ============================================
seed_cell_0181 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 181.0 - center
    mov rax, 4066A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[181] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 724], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0181 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 182
; Seeds Gaussian displacement at phi[182]
; phi[182] = factor * exp(-((182 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[182] = factor * exp(...)
; ============================================
seed_cell_0182 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 182.0 - center
    mov rax, 4066C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[182] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 728], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0182 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 183
; Seeds Gaussian displacement at phi[183]
; phi[183] = factor * exp(-((183 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[183] = factor * exp(...)
; ============================================
seed_cell_0183 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 183.0 - center
    mov rax, 4066E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[183] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 732], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0183 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 184
; Seeds Gaussian displacement at phi[184]
; phi[184] = factor * exp(-((184 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[184] = factor * exp(...)
; ============================================
seed_cell_0184 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 184.0 - center
    mov rax, 4067000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[184] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 736], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0184 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 185
; Seeds Gaussian displacement at phi[185]
; phi[185] = factor * exp(-((185 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[185] = factor * exp(...)
; ============================================
seed_cell_0185 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 185.0 - center
    mov rax, 4067200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[185] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 740], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0185 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 186
; Seeds Gaussian displacement at phi[186]
; phi[186] = factor * exp(-((186 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[186] = factor * exp(...)
; ============================================
seed_cell_0186 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 186.0 - center
    mov rax, 4067400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[186] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 744], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0186 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 187
; Seeds Gaussian displacement at phi[187]
; phi[187] = factor * exp(-((187 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[187] = factor * exp(...)
; ============================================
seed_cell_0187 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 187.0 - center
    mov rax, 4067600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[187] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 748], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0187 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 188
; Seeds Gaussian displacement at phi[188]
; phi[188] = factor * exp(-((188 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[188] = factor * exp(...)
; ============================================
seed_cell_0188 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 188.0 - center
    mov rax, 4067800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[188] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 752], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0188 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 189
; Seeds Gaussian displacement at phi[189]
; phi[189] = factor * exp(-((189 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[189] = factor * exp(...)
; ============================================
seed_cell_0189 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 189.0 - center
    mov rax, 4067A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[189] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 756], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0189 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 190
; Seeds Gaussian displacement at phi[190]
; phi[190] = factor * exp(-((190 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[190] = factor * exp(...)
; ============================================
seed_cell_0190 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 190.0 - center
    mov rax, 4067C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[190] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 760], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0190 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 191
; Seeds Gaussian displacement at phi[191]
; phi[191] = factor * exp(-((191 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[191] = factor * exp(...)
; ============================================
seed_cell_0191 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 191.0 - center
    mov rax, 4067E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[191] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 764], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0191 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 192
; Seeds Gaussian displacement at phi[192]
; phi[192] = factor * exp(-((192 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[192] = factor * exp(...)
; ============================================
seed_cell_0192 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 192.0 - center
    mov rax, 4068000000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[192] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 768], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0192 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 193
; Seeds Gaussian displacement at phi[193]
; phi[193] = factor * exp(-((193 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[193] = factor * exp(...)
; ============================================
seed_cell_0193 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 193.0 - center
    mov rax, 4068200000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[193] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 772], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0193 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 194
; Seeds Gaussian displacement at phi[194]
; phi[194] = factor * exp(-((194 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[194] = factor * exp(...)
; ============================================
seed_cell_0194 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 194.0 - center
    mov rax, 4068400000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[194] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 776], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0194 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 195
; Seeds Gaussian displacement at phi[195]
; phi[195] = factor * exp(-((195 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[195] = factor * exp(...)
; ============================================
seed_cell_0195 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 195.0 - center
    mov rax, 4068600000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[195] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 780], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0195 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 196
; Seeds Gaussian displacement at phi[196]
; phi[196] = factor * exp(-((196 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[196] = factor * exp(...)
; ============================================
seed_cell_0196 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 196.0 - center
    mov rax, 4068800000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[196] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 784], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0196 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 197
; Seeds Gaussian displacement at phi[197]
; phi[197] = factor * exp(-((197 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[197] = factor * exp(...)
; ============================================
seed_cell_0197 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 197.0 - center
    mov rax, 4068A00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[197] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 788], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0197 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 198
; Seeds Gaussian displacement at phi[198]
; phi[198] = factor * exp(-((198 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[198] = factor * exp(...)
; ============================================
seed_cell_0198 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 198.0 - center
    mov rax, 4068C00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[198] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 792], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0198 ENDP

; ============================================
; Wave Field Seeder - Grid Cell 199
; Seeds Gaussian displacement at phi[199]
; phi[199] = factor * exp(-((199 - center)^2)/(2*sigma^2))
; ============================================
; Arguments:
;   RCX = phi pointer (float*)
;   XMM0 = factor (amplitude * (1 - D_initial))
;   XMM1 = inv_denom (-1 / (2 * sigma^2))
;   XMM2 = center (double)
;
; Side Effect: phi[199] = factor * exp(...)
; ============================================
seed_cell_0199 PROC
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; diff = 199.0 - center
    mov rax, 4068E00000000000h
    movq xmm3, rax
    subsd xmm3, xmm2
    ;
    ; exponent = diff^2 * inv_denom
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
    ;
    ; exp(exponent) via x87 FPU
    movq qword ptr [rsp], xmm3
    fld qword ptr [rsp]
    fldl2e
    fmulp st(1), st(0)
    fld st(0)
    frndint
    fsub st(1), st(0)
    fxch st(1)
    f2xm1
    fld1
    faddp st(1), st(0)
    fscale
    fstp st(1)
    fstp qword ptr [rsp]
    movsd xmm3, qword ptr [rsp]
    ;
    ; phi[199] = factor * exp(...)
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rcx + 796], xmm3
    ;
    mov rsp, rbp
    pop rbp
    ret
seed_cell_0199 ENDP

; ============================================
; Master Dispatcher: validate_boot_memory
; Calls all 4096 unrolled attestation procs
; ============================================
; RCX = boot_data, RDX = baseline_data
; R8  = hash_accum ptr, R9 = histogram ptr
; Returns: EAX = total matches (0..4096)
validate_boot_memory PROC
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    sub rsp, 40
    mov r12, rcx
    mov r13, rdx
    mov r14, r8
    mov r15, r9
    xor esi, esi

    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0000
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0001
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0002
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0003
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0004
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0005
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0006
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0007
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0008
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0009
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0010
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0011
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0012
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0013
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0014
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0015
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0016
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0017
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0018
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0019
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0020
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0021
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0022
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0023
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0024
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0025
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0026
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0027
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0028
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0029
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0030
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0031
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0032
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0033
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0034
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0035
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0036
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0037
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0038
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0039
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0040
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0041
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0042
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0043
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0044
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0045
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0046
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0047
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0048
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0049
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0050
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0051
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0052
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0053
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0054
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0055
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0056
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0057
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0058
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0059
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0060
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0061
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0062
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0063
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0064
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0065
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0066
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0067
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0068
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0069
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0070
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0071
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0072
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0073
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0074
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0075
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0076
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0077
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0078
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0079
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0080
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0081
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0082
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0083
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0084
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0085
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0086
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0087
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0088
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0089
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0090
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0091
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0092
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0093
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0094
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0095
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0096
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0097
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0098
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0099
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0100
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0101
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0102
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0103
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0104
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0105
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0106
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0107
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0108
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0109
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0110
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0111
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0112
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0113
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0114
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0115
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0116
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0117
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0118
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0119
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0120
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0121
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0122
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0123
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0124
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0125
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0126
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0127
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0128
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0129
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0130
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0131
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0132
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0133
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0134
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0135
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0136
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0137
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0138
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0139
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0140
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0141
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0142
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0143
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0144
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0145
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0146
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0147
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0148
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0149
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0150
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0151
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0152
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0153
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0154
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0155
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0156
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0157
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0158
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0159
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0160
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0161
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0162
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0163
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0164
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0165
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0166
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0167
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0168
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0169
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0170
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0171
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0172
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0173
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0174
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0175
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0176
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0177
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0178
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0179
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0180
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0181
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0182
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0183
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0184
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0185
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0186
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0187
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0188
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0189
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0190
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0191
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0192
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0193
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0194
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0195
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0196
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0197
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0198
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0199
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0200
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0201
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0202
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0203
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0204
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0205
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0206
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0207
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0208
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0209
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0210
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0211
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0212
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0213
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0214
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0215
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0216
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0217
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0218
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0219
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0220
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0221
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0222
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0223
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0224
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0225
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0226
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0227
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0228
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0229
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0230
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0231
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0232
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0233
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0234
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0235
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0236
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0237
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0238
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0239
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0240
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0241
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0242
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0243
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0244
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0245
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0246
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0247
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0248
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0249
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0250
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0251
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0252
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0253
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0254
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0255
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0256
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0257
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0258
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0259
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0260
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0261
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0262
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0263
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0264
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0265
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0266
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0267
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0268
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0269
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0270
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0271
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0272
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0273
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0274
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0275
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0276
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0277
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0278
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0279
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0280
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0281
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0282
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0283
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0284
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0285
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0286
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0287
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0288
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0289
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0290
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0291
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0292
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0293
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0294
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0295
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0296
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0297
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0298
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0299
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0300
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0301
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0302
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0303
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0304
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0305
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0306
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0307
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0308
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0309
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0310
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0311
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0312
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0313
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0314
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0315
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0316
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0317
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0318
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0319
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0320
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0321
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0322
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0323
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0324
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0325
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0326
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0327
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0328
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0329
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0330
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0331
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0332
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0333
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0334
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0335
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0336
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0337
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0338
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0339
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0340
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0341
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0342
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0343
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0344
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0345
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0346
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0347
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0348
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0349
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0350
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0351
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0352
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0353
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0354
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0355
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0356
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0357
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0358
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0359
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0360
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0361
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0362
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0363
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0364
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0365
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0366
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0367
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0368
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0369
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0370
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0371
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0372
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0373
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0374
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0375
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0376
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0377
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0378
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0379
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0380
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0381
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0382
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0383
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0384
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0385
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0386
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0387
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0388
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0389
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0390
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0391
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0392
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0393
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0394
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0395
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0396
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0397
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0398
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0399
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0400
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0401
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0402
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0403
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0404
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0405
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0406
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0407
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0408
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0409
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0410
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0411
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0412
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0413
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0414
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0415
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0416
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0417
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0418
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0419
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0420
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0421
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0422
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0423
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0424
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0425
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0426
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0427
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0428
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0429
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0430
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0431
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0432
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0433
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0434
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0435
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0436
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0437
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0438
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0439
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0440
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0441
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0442
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0443
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0444
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0445
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0446
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0447
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0448
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0449
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0450
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0451
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0452
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0453
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0454
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0455
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0456
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0457
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0458
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0459
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0460
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0461
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0462
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0463
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0464
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0465
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0466
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0467
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0468
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0469
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0470
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0471
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0472
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0473
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0474
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0475
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0476
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0477
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0478
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0479
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0480
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0481
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0482
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0483
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0484
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0485
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0486
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0487
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0488
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0489
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0490
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0491
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0492
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0493
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0494
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0495
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0496
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0497
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0498
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0499
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0500
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0501
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0502
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0503
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0504
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0505
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0506
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0507
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0508
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0509
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0510
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0511
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0512
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0513
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0514
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0515
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0516
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0517
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0518
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0519
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0520
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0521
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0522
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0523
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0524
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0525
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0526
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0527
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0528
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0529
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0530
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0531
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0532
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0533
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0534
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0535
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0536
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0537
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0538
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0539
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0540
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0541
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0542
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0543
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0544
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0545
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0546
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0547
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0548
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0549
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0550
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0551
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0552
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0553
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0554
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0555
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0556
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0557
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0558
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0559
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0560
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0561
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0562
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0563
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0564
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0565
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0566
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0567
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0568
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0569
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0570
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0571
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0572
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0573
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0574
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0575
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0576
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0577
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0578
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0579
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0580
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0581
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0582
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0583
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0584
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0585
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0586
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0587
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0588
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0589
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0590
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0591
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0592
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0593
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0594
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0595
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0596
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0597
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0598
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0599
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0600
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0601
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0602
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0603
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0604
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0605
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0606
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0607
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0608
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0609
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0610
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0611
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0612
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0613
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0614
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0615
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0616
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0617
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0618
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0619
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0620
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0621
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0622
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0623
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0624
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0625
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0626
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0627
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0628
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0629
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0630
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0631
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0632
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0633
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0634
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0635
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0636
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0637
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0638
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0639
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0640
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0641
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0642
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0643
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0644
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0645
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0646
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0647
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0648
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0649
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0650
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0651
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0652
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0653
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0654
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0655
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0656
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0657
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0658
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0659
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0660
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0661
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0662
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0663
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0664
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0665
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0666
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0667
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0668
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0669
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0670
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0671
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0672
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0673
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0674
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0675
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0676
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0677
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0678
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0679
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0680
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0681
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0682
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0683
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0684
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0685
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0686
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0687
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0688
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0689
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0690
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0691
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0692
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0693
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0694
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0695
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0696
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0697
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0698
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0699
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0700
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0701
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0702
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0703
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0704
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0705
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0706
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0707
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0708
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0709
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0710
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0711
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0712
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0713
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0714
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0715
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0716
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0717
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0718
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0719
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0720
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0721
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0722
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0723
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0724
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0725
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0726
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0727
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0728
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0729
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0730
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0731
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0732
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0733
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0734
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0735
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0736
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0737
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0738
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0739
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0740
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0741
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0742
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0743
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0744
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0745
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0746
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0747
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0748
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0749
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0750
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0751
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0752
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0753
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0754
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0755
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0756
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0757
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0758
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0759
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0760
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0761
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0762
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0763
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0764
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0765
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0766
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0767
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0768
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0769
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0770
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0771
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0772
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0773
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0774
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0775
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0776
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0777
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0778
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0779
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0780
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0781
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0782
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0783
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0784
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0785
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0786
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0787
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0788
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0789
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0790
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0791
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0792
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0793
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0794
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0795
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0796
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0797
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0798
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0799
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0800
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0801
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0802
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0803
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0804
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0805
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0806
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0807
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0808
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0809
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0810
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0811
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0812
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0813
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0814
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0815
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0816
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0817
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0818
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0819
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0820
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0821
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0822
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0823
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0824
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0825
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0826
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0827
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0828
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0829
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0830
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0831
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0832
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0833
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0834
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0835
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0836
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0837
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0838
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0839
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0840
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0841
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0842
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0843
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0844
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0845
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0846
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0847
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0848
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0849
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0850
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0851
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0852
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0853
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0854
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0855
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0856
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0857
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0858
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0859
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0860
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0861
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0862
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0863
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0864
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0865
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0866
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0867
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0868
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0869
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0870
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0871
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0872
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0873
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0874
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0875
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0876
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0877
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0878
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0879
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0880
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0881
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0882
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0883
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0884
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0885
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0886
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0887
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0888
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0889
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0890
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0891
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0892
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0893
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0894
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0895
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0896
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0897
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0898
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0899
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0900
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0901
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0902
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0903
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0904
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0905
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0906
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0907
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0908
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0909
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0910
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0911
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0912
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0913
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0914
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0915
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0916
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0917
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0918
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0919
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0920
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0921
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0922
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0923
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0924
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0925
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0926
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0927
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0928
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0929
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0930
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0931
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0932
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0933
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0934
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0935
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0936
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0937
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0938
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0939
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0940
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0941
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0942
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0943
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0944
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0945
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0946
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0947
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0948
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0949
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0950
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0951
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0952
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0953
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0954
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0955
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0956
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0957
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0958
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0959
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0960
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0961
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0962
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0963
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0964
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0965
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0966
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0967
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0968
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0969
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0970
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0971
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0972
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0973
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0974
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0975
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0976
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0977
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0978
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0979
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0980
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0981
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0982
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0983
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0984
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0985
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0986
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0987
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0988
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0989
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0990
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0991
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0992
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0993
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0994
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0995
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0996
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0997
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0998
    add esi, eax
    mov rcx, r12
    mov rdx, r13
    mov r8, r14
    mov r9, r15
    call attest_byte_0999
    add esi, eax
    mov rcx, r12
    mov rdx, r13
