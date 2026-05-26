; primordial_engine.asm - MASM x86-64 version for Windows
.code

; double calculate_shannon_entropy(const uint8_t* boot_data, uint64_t size)
; RCX = boot_data
; RDX = size
calculate_shannon_entropy PROC
    push rbp
    mov rbp, rsp
    sub rsp, 1040                     ; Allocate 1024 bytes for counts + 16 bytes alignment/temp
    and rsp, -16                      ; Align to 16 bytes

    ; Zero out the 1024 bytes on stack using a simple register loop
    xor eax, eax
    xor r8, r8
zero_loop:
    cmp r8, 256
    jge zero_done
    mov dword ptr [rsp + r8*4], eax
    inc r8
    jmp zero_loop

zero_done:
    ; Count frequencies
    xor r8, r8                        ; r8 = index
count_loop:
    cmp r8, rdx
    jge count_done
    movzx eax, byte ptr [rcx + r8]
    inc dword ptr [rsp + rax*4]
    inc r8
    jmp count_loop

count_done:
    ; Accumulate Shannon Entropy using x87 FPU
    fldz                              ; st(0) = H = 0.0
    mov qword ptr [rsp + 1024], rdx   ; Store size N as 64-bit int

    xor r8, r8                        ; r8 = byte value i
entropy_loop:
    cmp r8, 256
    jge entropy_done

    mov eax, dword ptr [rsp + r8*4]
    test eax, eax
    jz next_byte

    fild dword ptr [rsp + r8*4]       ; st(0) = count_i, st(1) = H
    fild qword ptr [rsp + 1024]       ; st(0) = N, st(1) = count_i, st(2) = H
    fdivp st(1), st(0)                ; st(0) = P(i) = count_i / N, st(1) = H

    ; Compute -P(i) * log2(P(i))
    fld st(0)                         ; st(0) = P(i), st(1) = P(i), st(2) = H
    fld1
    fchs                              ; st(0) = -1.0, st(1) = P(i), st(2) = P(i), st(3) = H
    fxch st(1)                        ; st(0) = P(i), st(1) = -1.0, st(2) = P(i), st(3) = H
    fyl2x                             ; st(0) = -1.0 * log2(P(i)), st(1) = P(i), st(2) = H
    fmulp st(1), st(0)                ; st(0) = -P(i) * log2(P(i)), st(1) = H
    faddp st(1), st(0)                ; st(0) = H_new

next_byte:
    inc r8
    jmp entropy_loop

entropy_done:
    fstp qword ptr [rsp + 1024]
    movsd xmm0, qword ptr [rsp + 1024] ; Return value in xmm0

    mov rsp, rbp
    pop rbp
    ret
calculate_shannon_entropy ENDP

; double evaluate_bayesian_trust(const double* likelihoods_trust, const double* likelihoods_compromised, int n, double prior_trust)
; RCX = likelihoods_trust
; RDX = likelihoods_compromised
; R8D = n
; XMM3 = prior_trust (pi_0)
evaluate_bayesian_trust PROC
    ; 1.0 - prior_trust in XMM5
    mov rax, 3FF0000000000000h
    movq xmm4, rax                    ; xmm4 = 1.0
    movsd xmm5, xmm4
    subsd xmm5, xmm3                  ; xmm5 = 1.0 - prior_trust

    xor r9d, r9d                      ; r9d = k = 0

bayes_loop:
    cmp r9d, r8d
    jge bayes_done

    movsxd rax, r9d
    movsd xmm1, qword ptr [rcx + rax*8]
    mulsd xmm3, xmm1                  ; num *= likelihoods_trust[k]

    movsd xmm2, qword ptr [rdx + rax*8]
    mulsd xmm5, xmm2                  ; comp *= likelihoods_compromised[k]

    inc r9d
    jmp bayes_loop

bayes_done:
    movsd xmm0, xmm3
    addsd xmm0, xmm5                  ; xmm0 = denom = num + comp
    divsd xmm3, xmm0                  ; xmm3 = num / denom
    movsd xmm0, xmm3                  ; Return value in xmm0
    ret
evaluate_bayesian_trust ENDP

; void initialize_wave_field(float* phi, int grid_size, double d_initial, double amplitude, double sigma, double center)
; RCX = phi
; RDX = grid_size
; XMM2 = d_initial
; XMM3 = amplitude
; [rbp + 48] = sigma
; [rbp + 56] = center
initialize_wave_field PROC
    push rbp
    mov rbp, rsp
    push rbx
    push rdi

    ; Calculate 1.0 - d_initial in XMM4
    mov rax, 3FF0000000000000h
    movq xmm4, rax
    subsd xmm4, xmm2                  ; xmm4 = 1.0 - d_initial

    ; Loop counter i = 0 in r9d (volatile, safe from clobbering)
    xor r9d, r9d

wave_loop:
    cmp r9d, edx
    jge wave_done

    ; Use RDX shadow space at [rbp + 32] as a scratch buffer
    mov dword ptr [rbp + 32], r9d
    fild dword ptr [rbp + 32]         ; st(0) = i
    
    fld qword ptr [rbp + 56]          ; st(0) = center, st(1) = i
    fsubp st(1), st(0)                ; st(0) = i - center
    
    fld st(0)
    fmulp st(1), st(0)                ; st(0) = (i - center)^2
    
    fld qword ptr [rbp + 48]          ; st(0) = sigma, st(1) = (i - center)^2
    fld st(0)
    fmulp st(1), st(0)                ; st(0) = sigma^2
    
    mov rax, 4000000000000000h         ; Double 2.0
    mov qword ptr [rbp + 32], rax
    fld qword ptr [rbp + 32]          ; st(0) = 2.0, st(1) = sigma^2
    fmulp st(1), st(0)                ; st(0) = 2.0 * sigma^2
    
    fdivp st(1), st(0)                ; st(0) = (i - center)^2 / (2.0 * sigma^2)
    fchs                              ; st(0) = - (i - center)^2 / (2.0 * sigma^2)

    ; exp(st(0))
    fldl2e                            ; st(0) = log2(e), st(1) = x
    fmulp st(1), st(0)                ; st(0) = t = x * log2(e)
    
    fld st(0)                         ; st(0) = t, st(1) = t
    frndint                           ; st(0) = I, st(1) = t
    fsub st(1), st(0)                 ; st(0) = I, st(1) = F
    fxch st(1)                        ; st(0) = F, st(1) = I
    f2xm1                             ; st(0) = 2^F - 1, st(1) = I
    fld1
    faddp st(1), st(0)                ; st(0) = 2^F, st(1) = I
    fscale                            ; st(0) = e^x, st(1) = I
    fstp st(1)                        ; st(0) = exp(...)

    ; Multiply by amplitude
    movq qword ptr [rbp + 32], xmm3
    fld qword ptr [rbp + 32]          ; st(0) = amplitude, st(1) = exp(...)
    fmulp st(1), st(0)                ; st(0) = amplitude * exp(...)

    ; Multiply by (1.0 - d_initial)
    movq qword ptr [rbp + 32], xmm4
    fld qword ptr [rbp + 32]          ; st(0) = (1-d), st(1) = amp*exp(...)
    fmulp st(1), st(0)                ; st(0) = amp * exp(...) * (1-d)

    ; Store in phi[i] (convert double to float)
    movsxd rdi, r9d
    fstp dword ptr [rcx + rdi*4]

    inc r9d
    jmp wave_loop

wave_done:
    pop rdi
    pop rbx
    mov rsp, rbp
    pop rbp
    ret
initialize_wave_field ENDP

END
