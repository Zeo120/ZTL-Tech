    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 168], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0042, .-seed_cell_0042

# ============================================
# Wave Field Seeder - Grid Cell 43
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0043, @function
seed_cell_0043:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4045800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 172], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0043, .-seed_cell_0043

# ============================================
# Wave Field Seeder - Grid Cell 44
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0044, @function
seed_cell_0044:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4046000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 176], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0044, .-seed_cell_0044

# ============================================
# Wave Field Seeder - Grid Cell 45
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0045, @function
seed_cell_0045:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4046800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 180], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0045, .-seed_cell_0045

# ============================================
# Wave Field Seeder - Grid Cell 46
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0046, @function
seed_cell_0046:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4047000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 184], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0046, .-seed_cell_0046

# ============================================
# Wave Field Seeder - Grid Cell 47
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0047, @function
seed_cell_0047:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4047800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 188], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0047, .-seed_cell_0047

# ============================================
# Wave Field Seeder - Grid Cell 48
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0048, @function
seed_cell_0048:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4048000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 192], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0048, .-seed_cell_0048

# ============================================
# Wave Field Seeder - Grid Cell 49
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0049, @function
seed_cell_0049:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4048800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 196], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0049, .-seed_cell_0049

# ============================================
# Wave Field Seeder - Grid Cell 50
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0050, @function
seed_cell_0050:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4049000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 200], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0050, .-seed_cell_0050

# ============================================
# Wave Field Seeder - Grid Cell 51
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0051, @function
seed_cell_0051:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4049800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 204], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0051, .-seed_cell_0051

# ============================================
# Wave Field Seeder - Grid Cell 52
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0052, @function
seed_cell_0052:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404A000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 208], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0052, .-seed_cell_0052

# ============================================
# Wave Field Seeder - Grid Cell 53
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0053, @function
seed_cell_0053:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404A800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 212], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0053, .-seed_cell_0053

# ============================================
# Wave Field Seeder - Grid Cell 54
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0054, @function
seed_cell_0054:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404B000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 216], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0054, .-seed_cell_0054

# ============================================
# Wave Field Seeder - Grid Cell 55
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0055, @function
seed_cell_0055:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404B800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 220], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0055, .-seed_cell_0055

# ============================================
# Wave Field Seeder - Grid Cell 56
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0056, @function
seed_cell_0056:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404C000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 224], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0056, .-seed_cell_0056

# ============================================
# Wave Field Seeder - Grid Cell 57
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0057, @function
seed_cell_0057:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404C800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 228], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0057, .-seed_cell_0057

# ============================================
# Wave Field Seeder - Grid Cell 58
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0058, @function
seed_cell_0058:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404D000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 232], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0058, .-seed_cell_0058

# ============================================
# Wave Field Seeder - Grid Cell 59
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0059, @function
seed_cell_0059:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404D800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 236], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0059, .-seed_cell_0059

# ============================================
# Wave Field Seeder - Grid Cell 60
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0060, @function
seed_cell_0060:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404E000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 240], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0060, .-seed_cell_0060

# ============================================
# Wave Field Seeder - Grid Cell 61
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0061, @function
seed_cell_0061:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404E800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 244], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0061, .-seed_cell_0061

# ============================================
# Wave Field Seeder - Grid Cell 62
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0062, @function
seed_cell_0062:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404F000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 248], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0062, .-seed_cell_0062

# ============================================
# Wave Field Seeder - Grid Cell 63
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0063, @function
seed_cell_0063:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x404F800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 252], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0063, .-seed_cell_0063

# ============================================
# Wave Field Seeder - Grid Cell 64
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0064, @function
seed_cell_0064:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4050000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 256], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0064, .-seed_cell_0064

# ============================================
# Wave Field Seeder - Grid Cell 65
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0065, @function
seed_cell_0065:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4050400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 260], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0065, .-seed_cell_0065

# ============================================
# Wave Field Seeder - Grid Cell 66
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0066, @function
seed_cell_0066:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4050800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 264], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0066, .-seed_cell_0066

# ============================================
# Wave Field Seeder - Grid Cell 67
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0067, @function
seed_cell_0067:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4050C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 268], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0067, .-seed_cell_0067

# ============================================
# Wave Field Seeder - Grid Cell 68
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0068, @function
seed_cell_0068:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4051000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 272], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0068, .-seed_cell_0068

# ============================================
# Wave Field Seeder - Grid Cell 69
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0069, @function
seed_cell_0069:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4051400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 276], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0069, .-seed_cell_0069

# ============================================
# Wave Field Seeder - Grid Cell 70
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0070, @function
seed_cell_0070:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4051800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 280], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0070, .-seed_cell_0070

# ============================================
# Wave Field Seeder - Grid Cell 71
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0071, @function
seed_cell_0071:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4051C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 284], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0071, .-seed_cell_0071

# ============================================
# Wave Field Seeder - Grid Cell 72
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0072, @function
seed_cell_0072:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4052000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 288], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0072, .-seed_cell_0072

# ============================================
# Wave Field Seeder - Grid Cell 73
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0073, @function
seed_cell_0073:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4052400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 292], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0073, .-seed_cell_0073

# ============================================
# Wave Field Seeder - Grid Cell 74
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0074, @function
seed_cell_0074:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4052800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 296], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0074, .-seed_cell_0074

# ============================================
# Wave Field Seeder - Grid Cell 75
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0075, @function
seed_cell_0075:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4052C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 300], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0075, .-seed_cell_0075

# ============================================
# Wave Field Seeder - Grid Cell 76
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0076, @function
seed_cell_0076:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4053000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 304], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0076, .-seed_cell_0076

# ============================================
# Wave Field Seeder - Grid Cell 77
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0077, @function
seed_cell_0077:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4053400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 308], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0077, .-seed_cell_0077

# ============================================
# Wave Field Seeder - Grid Cell 78
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0078, @function
seed_cell_0078:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4053800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 312], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0078, .-seed_cell_0078

# ============================================
# Wave Field Seeder - Grid Cell 79
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0079, @function
seed_cell_0079:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4053C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 316], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0079, .-seed_cell_0079

# ============================================
# Wave Field Seeder - Grid Cell 80
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0080, @function
seed_cell_0080:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4054000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 320], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0080, .-seed_cell_0080

# ============================================
# Wave Field Seeder - Grid Cell 81
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0081, @function
seed_cell_0081:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4054400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 324], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0081, .-seed_cell_0081

# ============================================
# Wave Field Seeder - Grid Cell 82
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0082, @function
seed_cell_0082:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4054800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 328], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0082, .-seed_cell_0082

# ============================================
# Wave Field Seeder - Grid Cell 83
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0083, @function
seed_cell_0083:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4054C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 332], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0083, .-seed_cell_0083

# ============================================
# Wave Field Seeder - Grid Cell 84
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0084, @function
seed_cell_0084:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4055000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 336], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0084, .-seed_cell_0084

# ============================================
# Wave Field Seeder - Grid Cell 85
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0085, @function
seed_cell_0085:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4055400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 340], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0085, .-seed_cell_0085

# ============================================
# Wave Field Seeder - Grid Cell 86
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0086, @function
seed_cell_0086:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4055800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 344], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0086, .-seed_cell_0086

# ============================================
# Wave Field Seeder - Grid Cell 87
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0087, @function
seed_cell_0087:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4055C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 348], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0087, .-seed_cell_0087

# ============================================
# Wave Field Seeder - Grid Cell 88
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0088, @function
seed_cell_0088:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4056000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 352], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0088, .-seed_cell_0088

# ============================================
# Wave Field Seeder - Grid Cell 89
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0089, @function
seed_cell_0089:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4056400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 356], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0089, .-seed_cell_0089

# ============================================
# Wave Field Seeder - Grid Cell 90
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0090, @function
seed_cell_0090:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4056800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 360], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0090, .-seed_cell_0090

# ============================================
# Wave Field Seeder - Grid Cell 91
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0091, @function
seed_cell_0091:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4056C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 364], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0091, .-seed_cell_0091

# ============================================
# Wave Field Seeder - Grid Cell 92
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0092, @function
seed_cell_0092:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4057000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 368], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0092, .-seed_cell_0092

# ============================================
# Wave Field Seeder - Grid Cell 93
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0093, @function
seed_cell_0093:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4057400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 372], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0093, .-seed_cell_0093

# ============================================
# Wave Field Seeder - Grid Cell 94
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0094, @function
seed_cell_0094:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4057800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 376], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0094, .-seed_cell_0094

# ============================================
# Wave Field Seeder - Grid Cell 95
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0095, @function
seed_cell_0095:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4057C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 380], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0095, .-seed_cell_0095

# ============================================
# Wave Field Seeder - Grid Cell 96
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0096, @function
seed_cell_0096:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4058000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 384], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0096, .-seed_cell_0096

# ============================================
# Wave Field Seeder - Grid Cell 97
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0097, @function
seed_cell_0097:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4058400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 388], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0097, .-seed_cell_0097

# ============================================
# Wave Field Seeder - Grid Cell 98
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0098, @function
seed_cell_0098:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4058800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 392], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0098, .-seed_cell_0098

# ============================================
# Wave Field Seeder - Grid Cell 99
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0099, @function
seed_cell_0099:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4058C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 396], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0099, .-seed_cell_0099

# ============================================
# Wave Field Seeder - Grid Cell 100
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0100, @function
seed_cell_0100:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4059000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 400], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0100, .-seed_cell_0100

# ============================================
# Wave Field Seeder - Grid Cell 101
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0101, @function
seed_cell_0101:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4059400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 404], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0101, .-seed_cell_0101

# ============================================
# Wave Field Seeder - Grid Cell 102
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0102, @function
seed_cell_0102:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4059800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 408], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0102, .-seed_cell_0102

# ============================================
# Wave Field Seeder - Grid Cell 103
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0103, @function
seed_cell_0103:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4059C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 412], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0103, .-seed_cell_0103

# ============================================
# Wave Field Seeder - Grid Cell 104
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0104, @function
seed_cell_0104:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405A000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 416], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0104, .-seed_cell_0104

# ============================================
# Wave Field Seeder - Grid Cell 105
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0105, @function
seed_cell_0105:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405A400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 420], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0105, .-seed_cell_0105

# ============================================
# Wave Field Seeder - Grid Cell 106
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0106, @function
seed_cell_0106:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405A800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 424], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0106, .-seed_cell_0106

# ============================================
# Wave Field Seeder - Grid Cell 107
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0107, @function
seed_cell_0107:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405AC00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 428], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0107, .-seed_cell_0107

# ============================================
# Wave Field Seeder - Grid Cell 108
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0108, @function
seed_cell_0108:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405B000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 432], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0108, .-seed_cell_0108

# ============================================
# Wave Field Seeder - Grid Cell 109
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0109, @function
seed_cell_0109:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405B400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 436], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0109, .-seed_cell_0109

# ============================================
# Wave Field Seeder - Grid Cell 110
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0110, @function
seed_cell_0110:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405B800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 440], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0110, .-seed_cell_0110

# ============================================
# Wave Field Seeder - Grid Cell 111
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0111, @function
seed_cell_0111:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405BC00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 444], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0111, .-seed_cell_0111

# ============================================
# Wave Field Seeder - Grid Cell 112
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0112, @function
seed_cell_0112:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405C000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 448], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0112, .-seed_cell_0112

# ============================================
# Wave Field Seeder - Grid Cell 113
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0113, @function
seed_cell_0113:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405C400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 452], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0113, .-seed_cell_0113

# ============================================
# Wave Field Seeder - Grid Cell 114
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0114, @function
seed_cell_0114:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405C800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 456], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0114, .-seed_cell_0114

# ============================================
# Wave Field Seeder - Grid Cell 115
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0115, @function
seed_cell_0115:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405CC00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 460], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0115, .-seed_cell_0115

# ============================================
# Wave Field Seeder - Grid Cell 116
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0116, @function
seed_cell_0116:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405D000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 464], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0116, .-seed_cell_0116

# ============================================
# Wave Field Seeder - Grid Cell 117
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0117, @function
seed_cell_0117:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405D400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 468], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0117, .-seed_cell_0117

# ============================================
# Wave Field Seeder - Grid Cell 118
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0118, @function
seed_cell_0118:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405D800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 472], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0118, .-seed_cell_0118

# ============================================
# Wave Field Seeder - Grid Cell 119
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0119, @function
seed_cell_0119:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405DC00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 476], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0119, .-seed_cell_0119

# ============================================
# Wave Field Seeder - Grid Cell 120
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0120, @function
seed_cell_0120:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405E000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 480], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0120, .-seed_cell_0120

# ============================================
# Wave Field Seeder - Grid Cell 121
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0121, @function
seed_cell_0121:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405E400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 484], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0121, .-seed_cell_0121

# ============================================
# Wave Field Seeder - Grid Cell 122
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0122, @function
seed_cell_0122:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405E800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 488], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0122, .-seed_cell_0122

# ============================================
# Wave Field Seeder - Grid Cell 123
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0123, @function
seed_cell_0123:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405EC00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 492], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0123, .-seed_cell_0123

# ============================================
# Wave Field Seeder - Grid Cell 124
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0124, @function
seed_cell_0124:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405F000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 496], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0124, .-seed_cell_0124

# ============================================
# Wave Field Seeder - Grid Cell 125
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0125, @function
seed_cell_0125:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405F400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 500], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0125, .-seed_cell_0125

# ============================================
# Wave Field Seeder - Grid Cell 126
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0126, @function
seed_cell_0126:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405F800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 504], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0126, .-seed_cell_0126

# ============================================
# Wave Field Seeder - Grid Cell 127
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0127, @function
seed_cell_0127:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x405FC00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 508], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0127, .-seed_cell_0127

# ============================================
# Wave Field Seeder - Grid Cell 128
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0128, @function
seed_cell_0128:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 512], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0128, .-seed_cell_0128

# ============================================
# Wave Field Seeder - Grid Cell 129
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0129, @function
seed_cell_0129:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 516], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0129, .-seed_cell_0129

# ============================================
# Wave Field Seeder - Grid Cell 130
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0130, @function
seed_cell_0130:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 520], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0130, .-seed_cell_0130

# ============================================
# Wave Field Seeder - Grid Cell 131
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0131, @function
seed_cell_0131:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 524], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0131, .-seed_cell_0131

# ============================================
# Wave Field Seeder - Grid Cell 132
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0132, @function
seed_cell_0132:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 528], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0132, .-seed_cell_0132

# ============================================
# Wave Field Seeder - Grid Cell 133
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0133, @function
seed_cell_0133:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 532], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0133, .-seed_cell_0133

# ============================================
# Wave Field Seeder - Grid Cell 134
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0134, @function
seed_cell_0134:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 536], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0134, .-seed_cell_0134

# ============================================
# Wave Field Seeder - Grid Cell 135
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0135, @function
seed_cell_0135:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4060E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 540], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0135, .-seed_cell_0135

# ============================================
# Wave Field Seeder - Grid Cell 136
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0136, @function
seed_cell_0136:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 544], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0136, .-seed_cell_0136

# ============================================
# Wave Field Seeder - Grid Cell 137
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0137, @function
seed_cell_0137:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 548], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0137, .-seed_cell_0137

# ============================================
# Wave Field Seeder - Grid Cell 138
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0138, @function
seed_cell_0138:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 552], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0138, .-seed_cell_0138

# ============================================
# Wave Field Seeder - Grid Cell 139
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0139, @function
seed_cell_0139:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 556], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0139, .-seed_cell_0139

# ============================================
# Wave Field Seeder - Grid Cell 140
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0140, @function
seed_cell_0140:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 560], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0140, .-seed_cell_0140

# ============================================
# Wave Field Seeder - Grid Cell 141
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0141, @function
seed_cell_0141:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 564], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0141, .-seed_cell_0141

# ============================================
# Wave Field Seeder - Grid Cell 142
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0142, @function
seed_cell_0142:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 568], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0142, .-seed_cell_0142

# ============================================
# Wave Field Seeder - Grid Cell 143
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0143, @function
seed_cell_0143:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4061E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 572], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0143, .-seed_cell_0143

# ============================================
# Wave Field Seeder - Grid Cell 144
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0144, @function
seed_cell_0144:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 576], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0144, .-seed_cell_0144

# ============================================
# Wave Field Seeder - Grid Cell 145
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0145, @function
seed_cell_0145:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 580], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0145, .-seed_cell_0145

# ============================================
# Wave Field Seeder - Grid Cell 146
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0146, @function
seed_cell_0146:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 584], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0146, .-seed_cell_0146

# ============================================
# Wave Field Seeder - Grid Cell 147
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0147, @function
seed_cell_0147:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 588], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0147, .-seed_cell_0147

# ============================================
# Wave Field Seeder - Grid Cell 148
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0148, @function
seed_cell_0148:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 592], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0148, .-seed_cell_0148

# ============================================
# Wave Field Seeder - Grid Cell 149
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0149, @function
seed_cell_0149:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 596], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0149, .-seed_cell_0149

# ============================================
# Wave Field Seeder - Grid Cell 150
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0150, @function
seed_cell_0150:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 600], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0150, .-seed_cell_0150

# ============================================
# Wave Field Seeder - Grid Cell 151
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0151, @function
seed_cell_0151:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4062E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 604], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0151, .-seed_cell_0151

# ============================================
# Wave Field Seeder - Grid Cell 152
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0152, @function
seed_cell_0152:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 608], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0152, .-seed_cell_0152

# ============================================
# Wave Field Seeder - Grid Cell 153
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0153, @function
seed_cell_0153:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 612], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0153, .-seed_cell_0153

# ============================================
# Wave Field Seeder - Grid Cell 154
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0154, @function
seed_cell_0154:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 616], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0154, .-seed_cell_0154

# ============================================
# Wave Field Seeder - Grid Cell 155
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0155, @function
seed_cell_0155:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 620], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0155, .-seed_cell_0155

# ============================================
# Wave Field Seeder - Grid Cell 156
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0156, @function
seed_cell_0156:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 624], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0156, .-seed_cell_0156

# ============================================
# Wave Field Seeder - Grid Cell 157
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0157, @function
seed_cell_0157:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 628], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0157, .-seed_cell_0157

# ============================================
# Wave Field Seeder - Grid Cell 158
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0158, @function
seed_cell_0158:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 632], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0158, .-seed_cell_0158

# ============================================
# Wave Field Seeder - Grid Cell 159
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0159, @function
seed_cell_0159:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4063E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 636], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0159, .-seed_cell_0159

# ============================================
# Wave Field Seeder - Grid Cell 160
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0160, @function
seed_cell_0160:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 640], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0160, .-seed_cell_0160

# ============================================
# Wave Field Seeder - Grid Cell 161
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0161, @function
seed_cell_0161:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 644], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0161, .-seed_cell_0161

# ============================================
# Wave Field Seeder - Grid Cell 162
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0162, @function
seed_cell_0162:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 648], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0162, .-seed_cell_0162

# ============================================
# Wave Field Seeder - Grid Cell 163
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0163, @function
seed_cell_0163:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 652], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0163, .-seed_cell_0163

# ============================================
# Wave Field Seeder - Grid Cell 164
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0164, @function
seed_cell_0164:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 656], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0164, .-seed_cell_0164

# ============================================
# Wave Field Seeder - Grid Cell 165
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0165, @function
seed_cell_0165:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 660], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0165, .-seed_cell_0165

# ============================================
# Wave Field Seeder - Grid Cell 166
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0166, @function
seed_cell_0166:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 664], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0166, .-seed_cell_0166

# ============================================
# Wave Field Seeder - Grid Cell 167
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0167, @function
seed_cell_0167:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4064E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 668], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0167, .-seed_cell_0167

# ============================================
# Wave Field Seeder - Grid Cell 168
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0168, @function
seed_cell_0168:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 672], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0168, .-seed_cell_0168

# ============================================
# Wave Field Seeder - Grid Cell 169
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0169, @function
seed_cell_0169:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 676], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0169, .-seed_cell_0169

# ============================================
# Wave Field Seeder - Grid Cell 170
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0170, @function
seed_cell_0170:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 680], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0170, .-seed_cell_0170

# ============================================
# Wave Field Seeder - Grid Cell 171
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0171, @function
seed_cell_0171:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 684], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0171, .-seed_cell_0171

# ============================================
# Wave Field Seeder - Grid Cell 172
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0172, @function
seed_cell_0172:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 688], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0172, .-seed_cell_0172

# ============================================
# Wave Field Seeder - Grid Cell 173
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0173, @function
seed_cell_0173:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 692], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0173, .-seed_cell_0173

# ============================================
# Wave Field Seeder - Grid Cell 174
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0174, @function
seed_cell_0174:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 696], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0174, .-seed_cell_0174

# ============================================
# Wave Field Seeder - Grid Cell 175
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0175, @function
seed_cell_0175:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4065E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 700], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0175, .-seed_cell_0175

# ============================================
# Wave Field Seeder - Grid Cell 176
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0176, @function
seed_cell_0176:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 704], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0176, .-seed_cell_0176

# ============================================
# Wave Field Seeder - Grid Cell 177
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0177, @function
seed_cell_0177:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 708], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0177, .-seed_cell_0177

# ============================================
# Wave Field Seeder - Grid Cell 178
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0178, @function
seed_cell_0178:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 712], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0178, .-seed_cell_0178

# ============================================
# Wave Field Seeder - Grid Cell 179
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0179, @function
seed_cell_0179:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 716], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0179, .-seed_cell_0179

# ============================================
# Wave Field Seeder - Grid Cell 180
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0180, @function
seed_cell_0180:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 720], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0180, .-seed_cell_0180

# ============================================
# Wave Field Seeder - Grid Cell 181
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0181, @function
seed_cell_0181:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 724], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0181, .-seed_cell_0181

# ============================================
# Wave Field Seeder - Grid Cell 182
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0182, @function
seed_cell_0182:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 728], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0182, .-seed_cell_0182

# ============================================
# Wave Field Seeder - Grid Cell 183
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0183, @function
seed_cell_0183:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4066E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 732], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0183, .-seed_cell_0183

# ============================================
# Wave Field Seeder - Grid Cell 184
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0184, @function
seed_cell_0184:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 736], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0184, .-seed_cell_0184

# ============================================
# Wave Field Seeder - Grid Cell 185
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0185, @function
seed_cell_0185:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 740], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0185, .-seed_cell_0185

# ============================================
# Wave Field Seeder - Grid Cell 186
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0186, @function
seed_cell_0186:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 744], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0186, .-seed_cell_0186

# ============================================
# Wave Field Seeder - Grid Cell 187
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0187, @function
seed_cell_0187:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 748], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0187, .-seed_cell_0187

# ============================================
# Wave Field Seeder - Grid Cell 188
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0188, @function
seed_cell_0188:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 752], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0188, .-seed_cell_0188

# ============================================
# Wave Field Seeder - Grid Cell 189
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0189, @function
seed_cell_0189:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 756], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0189, .-seed_cell_0189

# ============================================
# Wave Field Seeder - Grid Cell 190
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0190, @function
seed_cell_0190:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 760], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0190, .-seed_cell_0190

# ============================================
# Wave Field Seeder - Grid Cell 191
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0191, @function
seed_cell_0191:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4067E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 764], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0191, .-seed_cell_0191

# ============================================
# Wave Field Seeder - Grid Cell 192
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0192, @function
seed_cell_0192:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068000000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 768], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0192, .-seed_cell_0192

# ============================================
# Wave Field Seeder - Grid Cell 193
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0193, @function
seed_cell_0193:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068200000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 772], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0193, .-seed_cell_0193

# ============================================
# Wave Field Seeder - Grid Cell 194
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0194, @function
seed_cell_0194:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068400000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 776], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0194, .-seed_cell_0194

# ============================================
# Wave Field Seeder - Grid Cell 195
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0195, @function
seed_cell_0195:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068600000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 780], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0195, .-seed_cell_0195

# ============================================
# Wave Field Seeder - Grid Cell 196
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0196, @function
seed_cell_0196:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068800000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 784], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0196, .-seed_cell_0196

# ============================================
# Wave Field Seeder - Grid Cell 197
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0197, @function
seed_cell_0197:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068A00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 788], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0197, .-seed_cell_0197

# ============================================
# Wave Field Seeder - Grid Cell 198
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0198, @function
seed_cell_0198:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068C00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 792], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0198, .-seed_cell_0198

# ============================================
# Wave Field Seeder - Grid Cell 199
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0199, @function
seed_cell_0199:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4068E00000000000
    movq xmm3, rax
    subsd xmm3, xmm2
    mulsd xmm3, xmm3
    mulsd xmm3, xmm1
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
    mulsd xmm3, xmm0
    cvtsd2ss xmm3, xmm3
    movss dword ptr [rdi + 796], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0199, .-seed_cell_0199

.globl validate_boot_memory
.type validate_boot_memory, @function
validate_boot_memory:
    push rbx
    push rsi
    push rdi
    push r12
    push r13
    push r14
    push r15
    sub rsp, 8
    mov r12, rdi
    mov r13, rsi
    mov r14, rdx
    mov r15, rcx
    xor ebx, ebx
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0000
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0001
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0002
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0003
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0004
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0005
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0006
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0007
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0008
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0009
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0010
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0011
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0012
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0013
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0014
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0015
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0016
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0017
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0018
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0019
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0020
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0021
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0022
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0023
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0024
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0025
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0026
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0027
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0028
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0029
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0030
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0031
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0032
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0033
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0034
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0035
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0036
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0037
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0038
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0039
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0040
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0041
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0042
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0043
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0044
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0045
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0046
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0047
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0048
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0049
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0050
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0051
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0052
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0053
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0054
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0055
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0056
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0057
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0058
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0059
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0060
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0061
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0062
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0063
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0064
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0065
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0066
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0067
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0068
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0069
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0070
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0071
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0072
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0073
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0074
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0075
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0076
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0077
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0078
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0079
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0080
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0081
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0082
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0083
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0084
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0085
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0086
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0087
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0088
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0089
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0090
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0091
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0092
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0093
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0094
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0095
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0096
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0097
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0098
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0099
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0100
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0101
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0102
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0103
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0104
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0105
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0106
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0107
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0108
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0109
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0110
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0111
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0112
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0113
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0114
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0115
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0116
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0117
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0118
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0119
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0120
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0121
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0122
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0123
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0124
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0125
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0126
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0127
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0128
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0129
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0130
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0131
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0132
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0133
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0134
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0135
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0136
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0137
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0138
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0139
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0140
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0141
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0142
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0143
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0144
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0145
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0146
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0147
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0148
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0149
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0150
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0151
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0152
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0153
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0154
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0155
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0156
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0157
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0158
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0159
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0160
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0161
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0162
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0163
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0164
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0165
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0166
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0167
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0168
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0169
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0170
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0171
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0172
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0173
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0174
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0175
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0176
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0177
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0178
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0179
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0180
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0181
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0182
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0183
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0184
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0185
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0186
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0187
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0188
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0189
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0190
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0191
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0192
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0193
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0194
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0195
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0196
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0197
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0198
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0199
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0200
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0201
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0202
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0203
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0204
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0205
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0206
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0207
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0208
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0209
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0210
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0211
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0212
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0213
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0214
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0215
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0216
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0217
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0218
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0219
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0220
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0221
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0222
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0223
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0224
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0225
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0226
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0227
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0228
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0229
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0230
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0231
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0232
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0233
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0234
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0235
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0236
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0237
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0238
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0239
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0240
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0241
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0242
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0243
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0244
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0245
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0246
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0247
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0248
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0249
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0250
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0251
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0252
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0253
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0254
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0255
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0256
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0257
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0258
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0259
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0260
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0261
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0262
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0263
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0264
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0265
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0266
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0267
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0268
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0269
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0270
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0271
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0272
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0273
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0274
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0275
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0276
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0277
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0278
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0279
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0280
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0281
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0282
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0283
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0284
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0285
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0286
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0287
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0288
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0289
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0290
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0291
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0292
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0293
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0294
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0295
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0296
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0297
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0298
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0299
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0300
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0301
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0302
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0303
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0304
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0305
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0306
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0307
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0308
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0309
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0310
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0311
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0312
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0313
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0314
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0315
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0316
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0317
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0318
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0319
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0320
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0321
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0322
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0323
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0324
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0325
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0326
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0327
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0328
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0329
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0330
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0331
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0332
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0333
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0334
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0335
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0336
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0337
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0338
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0339
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0340
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0341
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0342
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0343
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0344
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0345
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0346
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0347
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0348
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0349
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0350
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0351
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0352
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0353
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0354
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0355
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0356
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0357
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0358
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0359
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0360
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0361
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0362
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0363
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0364
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0365
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0366
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0367
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0368
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0369
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0370
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0371
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0372
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0373
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0374
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0375
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0376
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0377
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0378
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0379
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0380
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0381
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0382
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0383
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0384
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0385
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0386
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0387
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0388
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0389
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0390
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0391
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0392
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0393
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0394
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0395
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0396
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0397
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0398
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0399
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0400
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0401
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0402
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0403
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0404
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0405
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0406
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0407
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0408
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0409
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0410
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0411
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0412
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0413
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0414
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0415
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0416
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0417
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0418
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0419
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0420
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0421
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0422
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0423
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0424
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0425
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0426
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0427
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0428
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0429
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0430
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0431
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0432
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0433
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0434
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0435
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0436
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0437
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0438
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0439
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0440
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0441
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0442
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0443
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0444
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0445
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0446
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0447
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0448
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0449
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0450
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0451
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0452
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0453
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0454
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0455
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0456
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0457
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0458
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0459
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0460
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0461
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0462
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0463
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0464
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0465
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0466
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0467
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0468
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0469
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0470
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0471
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0472
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0473
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0474
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0475
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0476
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0477
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0478
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0479
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0480
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0481
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0482
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0483
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0484
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0485
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0486
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0487
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0488
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0489
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0490
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0491
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0492
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0493
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0494
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0495
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0496
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0497
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0498
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0499
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0500
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0501
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0502
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0503
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0504
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0505
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0506
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0507
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0508
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0509
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0510
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0511
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0512
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0513
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0514
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0515
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0516
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0517
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0518
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0519
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0520
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0521
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0522
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0523
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0524
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0525
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0526
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0527
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0528
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0529
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0530
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0531
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0532
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0533
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0534
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0535
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0536
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0537
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0538
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0539
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0540
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0541
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0542
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0543
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0544
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0545
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0546
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0547
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0548
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0549
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0550
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0551
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0552
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0553
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0554
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0555
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0556
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0557
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0558
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0559
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0560
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0561
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0562
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0563
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0564
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0565
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0566
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0567
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0568
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0569
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0570
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0571
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0572
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0573
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0574
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0575
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0576
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0577
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0578
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0579
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0580
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0581
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0582
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0583
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0584
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0585
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0586
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0587
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0588
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0589
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0590
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0591
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0592
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0593
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0594
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0595
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0596
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0597
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0598
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0599
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0600
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0601
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0602
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0603
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0604
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0605
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0606
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0607
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0608
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0609
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0610
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0611
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0612
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0613
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0614
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0615
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0616
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0617
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0618
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0619
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0620
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0621
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0622
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0623
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0624
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0625
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0626
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0627
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0628
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0629
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0630
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0631
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0632
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0633
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0634
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0635
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0636
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0637
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0638
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0639
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0640
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0641
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0642
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0643
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0644
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0645
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0646
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0647
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0648
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0649
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0650
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0651
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0652
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0653
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0654
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0655
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0656
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0657
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0658
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0659
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0660
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0661
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0662
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0663
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0664
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0665
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0666
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0667
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0668
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0669
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0670
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0671
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0672
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0673
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0674
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0675
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0676
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0677
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0678
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0679
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0680
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0681
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0682
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0683
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0684
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0685
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0686
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0687
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0688
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0689
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0690
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0691
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0692
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0693
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0694
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0695
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0696
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0697
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0698
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0699
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0700
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0701
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0702
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0703
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0704
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0705
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0706
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0707
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0708
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0709
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0710
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0711
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0712
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0713
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0714
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0715
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0716
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0717
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0718
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0719
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0720
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0721
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0722
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0723
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0724
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0725
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0726
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0727
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0728
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0729
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0730
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0731
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0732
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0733
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0734
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0735
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0736
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0737
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0738
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0739
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0740
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0741
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0742
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0743
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0744
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0745
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0746
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0747
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0748
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0749
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0750
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0751
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0752
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0753
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0754
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0755
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0756
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0757
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0758
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0759
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0760
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0761
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0762
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0763
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0764
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0765
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0766
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0767
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0768
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0769
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0770
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0771
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0772
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0773
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0774
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0775
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0776
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0777
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0778
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0779
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0780
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0781
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0782
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0783
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0784
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0785
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0786
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0787
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0788
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0789
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0790
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0791
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0792
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0793
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0794
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0795
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0796
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0797
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0798
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0799
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0800
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0801
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0802
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0803
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0804
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0805
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0806
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0807
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0808
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0809
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0810
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0811
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0812
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0813
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0814
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0815
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0816
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0817
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0818
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0819
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0820
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0821
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0822
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0823
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0824
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0825
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0826
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0827
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0828
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0829
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0830
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0831
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0832
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0833
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0834
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0835
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0836
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0837
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0838
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0839
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0840
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0841
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0842
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0843
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0844
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0845
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0846
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0847
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0848
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0849
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0850
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0851
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0852
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0853
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0854
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0855
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0856
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0857
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0858
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0859
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0860
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0861
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0862
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0863
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0864
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0865
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0866
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0867
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0868
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0869
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0870
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0871
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0872
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0873
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0874
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0875
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0876
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0877
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0878
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0879
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0880
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0881
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0882
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0883
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0884
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0885
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0886
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0887
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0888
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0889
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0890
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0891
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0892
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0893
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0894
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0895
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0896
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0897
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0898
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0899
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0900
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0901
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0902
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0903
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0904
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0905
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0906
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0907
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0908
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0909
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0910
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0911
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0912
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0913
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0914
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0915
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0916
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0917
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0918
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0919
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0920
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0921
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0922
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0923
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0924
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0925
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0926
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0927
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0928
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0929
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0930
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0931
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0932
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0933
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0934
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0935
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0936
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0937
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0938
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0939
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0940
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0941
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0942
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0943
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0944
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0945
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0946
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0947
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0948
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0949
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0950
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0951
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0952
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0953
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0954
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0955
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0956
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0957
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0958
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0959
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0960
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0961
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0962
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0963
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0964
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0965
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0966
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0967
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0968
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0969
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0970
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0971
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0972
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0973
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0974
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0975
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0976
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0977
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0978
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0979
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0980
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0981
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0982
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0983
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0984
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0985
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0986
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0987
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0988
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0989
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0990
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0991
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0992
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0993
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0994
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0995
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0996
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0997
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0998
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_0999
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1000
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1001
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1002
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1003
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1004
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1005
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1006
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1007
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1008
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1009
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1010
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1011
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1012
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1013
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1014
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1015
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1016
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1017
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1018
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1019
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1020
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1021
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1022
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1023
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1024
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1025
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1026
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1027
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1028
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1029
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1030
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1031
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1032
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1033
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1034
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1035
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1036
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1037
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1038
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1039
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1040
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1041
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1042
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1043
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1044
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1045
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1046
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1047
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1048
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1049
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1050
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1051
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1052
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1053
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1054
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1055
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1056
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1057
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1058
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1059
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1060
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1061
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1062
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1063
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1064
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1065
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1066
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1067
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1068
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1069
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1070
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1071
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1072
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1073
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1074
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1075
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1076
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1077
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1078
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1079
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1080
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1081
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1082
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1083
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1084
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1085
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1086
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1087
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1088
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1089
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1090
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1091
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1092
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1093
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1094
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1095
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1096
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1097
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1098
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1099
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1100
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1101
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1102
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1103
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1104
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1105
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1106
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1107
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1108
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1109
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1110
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1111
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1112
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1113
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1114
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1115
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1116
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1117
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1118
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1119
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1120
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1121
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1122
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1123
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1124
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1125
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1126
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1127
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1128
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1129
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1130
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1131
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1132
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1133
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1134
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1135
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1136
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1137
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1138
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1139
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1140
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1141
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1142
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1143
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1144
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1145
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1146
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1147
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1148
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1149
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1150
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1151
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1152
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1153
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1154
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1155
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1156
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1157
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1158
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1159
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1160
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1161
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1162
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1163
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1164
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1165
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1166
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1167
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1168
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1169
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1170
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1171
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1172
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1173
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1174
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1175
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1176
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1177
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1178
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1179
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1180
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1181
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1182
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1183
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1184
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1185
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1186
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1187
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1188
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1189
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1190
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1191
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1192
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1193
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1194
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1195
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1196
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1197
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1198
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1199
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1200
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1201
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1202
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1203
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1204
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1205
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1206
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1207
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1208
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1209
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1210
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1211
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1212
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1213
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1214
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1215
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1216
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1217
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1218
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1219
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1220
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1221
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1222
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1223
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1224
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1225
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1226
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1227
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1228
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1229
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1230
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1231
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1232
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1233
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1234
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1235
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1236
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1237
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1238
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1239
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1240
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1241
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1242
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1243
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1244
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1245
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1246
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1247
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1248
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1249
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1250
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1251
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1252
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1253
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1254
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1255
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1256
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1257
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1258
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1259
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1260
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1261
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1262
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1263
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1264
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1265
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1266
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1267
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1268
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1269
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1270
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1271
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1272
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1273
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1274
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1275
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1276
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1277
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1278
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1279
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1280
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1281
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1282
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1283
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1284
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1285
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1286
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1287
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1288
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1289
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1290
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1291
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1292
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1293
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1294
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1295
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1296
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1297
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1298
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1299
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1300
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1301
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1302
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1303
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1304
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1305
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1306
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1307
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1308
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1309
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1310
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1311
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1312
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1313
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1314
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1315
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1316
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1317
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1318
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1319
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1320
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1321
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1322
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1323
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1324
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1325
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1326
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1327
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1328
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1329
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1330
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1331
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1332
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1333
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1334
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1335
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1336
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1337
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1338
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1339
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1340
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1341
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1342
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1343
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1344
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1345
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1346
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1347
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1348
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1349
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1350
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1351
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1352
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1353
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1354
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1355
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1356
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1357
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1358
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1359
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1360
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1361
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1362
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1363
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1364
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1365
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1366
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1367
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1368
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1369
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1370
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1371
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1372
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1373
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1374
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1375
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1376
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1377
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1378
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1379
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1380
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1381
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1382
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1383
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1384
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1385
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1386
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1387
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1388
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1389
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1390
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1391
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1392
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1393
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1394
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1395
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1396
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1397
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1398
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1399
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1400
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1401
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1402
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1403
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1404
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1405
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1406
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1407
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1408
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1409
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1410
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1411
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1412
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1413
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1414
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1415
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1416
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1417
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1418
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1419
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1420
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1421
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1422
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1423
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1424
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1425
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1426
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1427
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1428
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1429
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1430
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1431
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1432
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1433
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1434
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1435
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1436
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1437
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1438
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1439
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1440
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1441
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1442
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1443
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1444
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1445
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1446
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1447
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1448
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1449
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1450
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1451
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1452
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1453
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1454
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1455
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1456
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1457
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1458
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1459
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1460
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1461
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1462
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1463
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1464
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1465
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1466
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1467
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1468
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1469
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1470
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1471
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1472
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1473
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1474
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1475
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1476
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1477
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1478
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1479
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1480
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1481
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1482
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1483
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1484
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1485
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1486
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1487
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1488
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1489
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1490
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1491
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1492
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1493
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1494
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1495
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1496
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1497
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1498
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1499
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1500
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1501
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1502
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1503
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1504
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1505
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1506
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1507
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1508
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1509
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1510
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1511
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1512
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1513
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1514
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1515
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1516
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1517
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1518
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1519
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1520
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1521
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1522
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1523
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1524
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1525
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1526
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1527
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1528
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1529
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1530
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1531
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1532
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1533
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1534
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1535
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1536
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1537
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1538
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1539
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1540
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1541
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1542
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1543
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1544
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1545
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1546
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1547
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1548
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1549
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1550
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1551
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1552
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1553
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1554
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1555
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1556
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1557
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1558
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1559
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1560
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1561
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1562
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1563
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1564
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1565
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1566
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1567
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1568
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1569
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1570
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1571
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1572
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1573
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1574
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1575
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1576
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1577
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1578
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1579
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1580
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1581
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1582
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1583
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1584
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1585
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1586
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1587
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1588
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1589
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1590
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1591
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1592
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1593
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1594
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1595
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1596
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1597
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1598
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1599
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1600
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1601
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1602
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1603
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1604
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1605
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1606
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1607
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1608
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1609
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1610
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1611
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1612
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1613
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1614
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1615
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1616
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1617
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1618
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1619
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1620
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1621
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1622
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1623
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1624
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1625
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1626
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1627
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1628
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1629
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1630
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1631
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1632
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1633
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1634
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1635
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1636
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1637
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1638
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1639
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1640
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1641
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1642
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1643
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1644
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1645
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1646
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1647
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1648
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1649
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1650
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1651
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1652
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1653
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1654
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1655
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1656
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1657
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1658
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1659
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1660
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1661
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1662
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1663
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1664
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1665
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1666
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1667
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1668
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1669
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1670
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1671
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1672
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1673
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1674
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1675
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1676
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1677
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1678
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1679
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1680
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1681
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1682
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1683
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1684
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1685
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1686
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1687
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1688
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1689
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1690
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1691
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1692
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1693
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1694
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1695
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1696
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1697
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1698
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1699
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1700
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1701
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1702
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1703
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1704
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1705
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1706
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1707
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1708
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1709
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1710
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1711
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1712
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1713
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1714
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1715
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1716
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1717
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1718
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1719
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1720
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1721
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1722
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1723
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1724
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1725
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1726
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1727
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1728
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1729
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1730
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1731
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1732
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1733
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1734
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1735
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1736
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1737
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1738
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1739
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1740
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1741
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1742
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1743
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1744
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1745
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1746
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1747
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1748
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1749
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1750
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1751
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1752
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1753
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1754
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1755
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1756
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1757
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1758
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1759
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1760
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1761
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1762
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1763
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1764
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1765
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1766
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1767
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1768
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1769
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1770
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1771
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1772
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1773
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1774
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1775
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1776
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
    call attest_byte_1777
    add ebx, eax
    mov rdi, r12
    mov rsi, r13
    mov rdx, r14
    mov rcx, r15
