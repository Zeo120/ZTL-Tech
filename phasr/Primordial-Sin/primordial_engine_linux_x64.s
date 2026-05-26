# primordial_engine_linux_x64.s - GAS Intel Syntax x86-64 version for Linux
.intel_syntax noprefix
.text

.globl calculate_shannon_entropy
.type calculate_shannon_entropy, @function
calculate_shannon_entropy:
    # RDI = boot_data
    # RSI = size
    push rbp
    mov rbp, rsp
    push rdi
    push rbx
    sub rsp, 1040                     # Allocate 1024 bytes for counts + 16 bytes for size/temp
    and rsp, -16                      # Align to 16 bytes

    # Zero out the 1024 bytes on stack using a simple register loop
    xor eax, eax
    xor r8, r8
.Lzero_loop:
    cmp r8, 256
    jge .Lzero_done
    mov dword ptr [rsp + r8*4], eax
    inc r8
    jmp .Lzero_loop

.Lzero_done:
    # Restore RDI = boot_data (which was pushed on stack at [rbp - 8])
    mov rdi, qword ptr [rbp - 8]

    # Count frequencies
    xor r8, r8                        # r8 = index
.Lcount_loop:
    cmp r8, rsi
    jge .Lcount_done
    movzx eax, byte ptr [rdi + r8]
    inc dword ptr [rsp + rax*4]
    inc r8
    jmp .Lcount_loop

.Lcount_done:
    # Accumulate Shannon Entropy using x87 FPU
    fldz                              # st(0) = H = 0.0
    mov qword ptr [rsp + 1024], rsi   # Store size N as 64-bit int

    xor r8, r8                        # r8 = byte value i
.Lentropy_loop:
    cmp r8, 256
    jge .Lentropy_done

    mov eax, dword ptr [rsp + r8*4]
    test eax, eax
    jz .Lnext_byte

    fild dword ptr [rsp + r8*4]       # st(0) = count_i, st(1) = H
    fild qword ptr [rsp + 1024]       # st(0) = N, st(1) = count_i, st(2) = H
    fdivp st(1), st(0)                # st(0) = P(i) = count_i / N, st(1) = H

    # Compute -P(i) * log2(P(i))
    fld st(0)                         # st(0) = P(i), st(1) = P(i), st(2) = H
    fld1
    fchs                              # st(0) = -1.0, st(1) = P(i), st(2) = P(i), st(3) = H
    fxch st(1)                        # st(0) = P(i), st(1) = -1.0, st(2) = P(i), st(3) = H
    fyl2x                             # st(0) = -1.0 * log2(P(i)), st(1) = P(i), st(2) = H
    fmulp st(1), st(0)                # st(0) = -P(i) * log2(P(i)), st(1) = H
    faddp st(1), st(0)                # st(0) = H_new

.Lnext_byte:
    inc r8
    jmp .Lentropy_loop

.Lentropy_done:
    fstp qword ptr [rsp + 1024]
    movsd xmm0, qword ptr [rsp + 1024] # Return value in xmm0

    lea rsp, [rbp - 16]
    pop rbx
    pop rdi
    pop rbp
    ret
.size calculate_shannon_entropy, .-calculate_shannon_entropy

.globl evaluate_bayesian_trust
.type evaluate_bayesian_trust, @function
evaluate_bayesian_trust:
    # RDI = likelihoods_trust
    # RSI = likelihoods_compromised
    # EDX = n
    # XMM0 = prior_trust (pi_0)

    # 1.0 - prior_trust in XMM5
    mov rax, 0x3FF0000000000000
    movq xmm4, rax                    # xmm4 = 1.0
    movsd xmm5, xmm4
    subsd xmm5, xmm0                  # xmm5 = 1.0 - prior_trust

    xor r9d, r9d                      # r9d = k = 0

.Lbayes_loop:
    cmp r9d, edx
    jge .Lbayes_done

    movsxd rax, r9d
    movsd xmm1, qword ptr [rdi + rax*8]
    mulsd xmm0, xmm1                  # num *= likelihoods_trust[k]

    movsd xmm2, qword ptr [rsi + rax*8]
    mulsd xmm5, xmm2                  # comp *= likelihoods_compromised[k]

    inc r9d
    jmp .Lbayes_loop

.Lbayes_done:
    movsd xmm1, xmm0
    addsd xmm1, xmm5                  # xmm1 = denom = num + comp
    divsd xmm0, xmm1                  # xmm0 = num / denom
    ret
.size evaluate_bayesian_trust, .-evaluate_bayesian_trust

.globl initialize_wave_field
.type initialize_wave_field, @function
initialize_wave_field:
    # RDI = phi
    # RSI = grid_size (represented as 32-bit register ESI)
    # XMM0 = d_initial
    # XMM1 = amplitude
    # XMM2 = sigma
    # XMM3 = center
    push rbp
    mov rbp, rsp
    push rbx
    push rdi
    sub rsp, 32                       # Local scratch space

    # Restore RDI = phi
    mov rdi, qword ptr [rbp - 16]

    # Calculate 1.0 - d_initial in XMM4
    mov rax, 0x3FF0000000000000
    movq xmm4, rax
    subsd xmm4, xmm0                  # xmm4 = 1.0 - d_initial

    # Loop counter i = 0 in r9d (volatile, safe from clobbering)
    xor r9d, r9d

.Lwave_loop:
    cmp r9d, esi
    jge .Lwave_done

    # Store i on stack to load into FPU
    mov dword ptr [rsp], r9d
    fild dword ptr [rsp]              # st(0) = i
    
    # Load center (XMM3) on stack
    movsd qword ptr [rsp], xmm3
    fld qword ptr [rsp]               # st(0) = center, st(1) = i
    fsubp st(1), st(0)                # st(0) = i - center
    
    fld st(0)
    fmulp st(1), st(0)                # st(0) = (i - center)^2
    
    # Load sigma (XMM2) on stack
    movsd qword ptr [rsp], xmm2
    fld qword ptr [rsp]               # st(0) = sigma, st(1) = (i-center)^2
    fld st(0)
    fmulp st(1), st(0)                # st(0) = sigma^2
    
    mov rax, 0x4000000000000000        # Double 2.0
    mov qword ptr [rsp], rax
    fld qword ptr [rsp]               # st(0) = 2.0, st(1) = sigma^2
    fmulp st(1), st(0)                # st(0) = 2.0 * sigma^2
    
    fdivp st(1), st(0)                # st(0) = (i-center)^2 / (2.0*sigma^2)
    fchs                              # st(0) = - (i-center)^2 / (2.0*sigma^2)

    # exp(st(0))
    fldl2e                            # st(0) = log2(e), st(1) = x
    fmulp st(1), st(0)                # st(0) = t = x * log2(e)
    
    fld st(0)                         # st(0) = t, st(1) = t
    frndint                           # st(0) = I, st(1) = t
    fsub st(1), st(0)                 # st(0) = I, st(1) = F
    fxch st(1)                        # st(0) = F, st(1) = I
    f2xm1                             # st(0) = 2^F - 1, st(1) = I
    fld1
    faddp st(1), st(0)                # st(0) = 2^F, st(1) = I
    fscale                            # st(0) = e^x, st(1) = I
    fstp st(1)                        # st(0) = exp(...)

    # Multiply by amplitude (XMM1)
    movsd qword ptr [rsp], xmm1
    fld qword ptr [rsp]               # st(0) = amplitude, st(1) = exp(...)
    fmulp st(1), st(0)                # st(0) = amplitude * exp(...)

    # Multiply by (1.0 - d_initial) (XMM4)
    movsd qword ptr [rsp], xmm4
    fld qword ptr [rsp]               # st(0) = (1-d), st(1) = amp*exp(...)
    fmulp st(1), st(0)                # st(0) = amp * exp(...) * (1-d)

    # Store in phi[i] (convert double to float)
    movsxd rbx, r9d
    fstp dword ptr [rdi + rbx*4]

    inc r9d
    jmp .Lwave_loop

.Lwave_done:
    lea rsp, [rbp - 16]
    pop rbx
    pop rdi
    pop rbp
    ret
.size initialize_wave_field, .-initialize_wave_field
