# lucifer_engine_linux_x64.s - GAS Intel Syntax x86-64 version for Linux
.intel_syntax noprefix
.text

.globl evaluate_critical_threshold
.type evaluate_critical_threshold, @function
evaluate_critical_threshold:
    # RDI contains pointer to params
    movsd xmm0, qword ptr [rdi]       # xmm0 = D_total
    movsd xmm1, qword ptr [rdi + 8]   # xmm1 = G_e
    movsd xmm2, qword ptr [rdi + 16]  # xmm2 = R_a
    movsd xmm3, qword ptr [rdi + 24]  # xmm3 = C_c
    movsd xmm4, qword ptr [rdi + 32]  # xmm4 = P_m

    # num = G_e - R_a + C_c
    subsd xmm1, xmm2                  # xmm1 = G_e - R_a
    addsd xmm1, xmm3                  # xmm1 = G_e - R_a + C_c

    # denom = G_e + P_m
    movsd xmm5, qword ptr [rdi + 8]   # xmm5 = G_e
    addsd xmm5, xmm4                  # xmm5 = G_e + P_m

    # D_critical = num / denom
    divsd xmm1, xmm5                  # xmm1 = D_critical

    # Compare D_total >= D_critical
    ucomisd xmm0, xmm1
    setae al                          # AL = 1 if D_total >= D_critical, else 0
    movzx eax, al
    ret
.size evaluate_critical_threshold, .-evaluate_critical_threshold

.globl evaluate_replica_challenge
.type evaluate_replica_challenge, @function
evaluate_replica_challenge:
    # RDI contains pointer to params
    movsd xmm0, qword ptr [rdi]       # xmm0 = D_r
    movsd xmm1, qword ptr [rdi + 8]   # xmm1 = C_challenge
    movsd xmm2, qword ptr [rdi + 16]  # xmm2 = R_promo

    # ratio = C_challenge / R_promo
    divsd xmm1, xmm2                  # xmm1 = ratio

    # limit = 1.0 - ratio
    mov rax, 0x3FF0000000000000
    movq xmm2, rax                    # xmm2 = 1.0
    subsd xmm2, xmm1                  # xmm2 = 1.0 - ratio

    # Compare limit > D_r
    ucomisd xmm2, xmm0
    seta al                           # AL = 1 if limit > D_r, else 0
    movzx eax, al
    ret
.size evaluate_replica_challenge, .-evaluate_replica_challenge

.globl modulate_damping
.type modulate_damping, @function
modulate_damping:
    # RDI contains pointer to params
    movsd xmm0, qword ptr [rdi]       # xmm0 = D_r
    movsd xmm1, qword ptr [rdi + 8]   # xmm1 = gamma_0
    movsd xmm2, qword ptr [rdi + 16]  # xmm2 = gamma_transient

    # 1.0 - D_r
    mov rax, 0x3FF0000000000000
    movq xmm3, rax
    subsd xmm3, xmm0                  # xmm3 = 1.0 - D_r

    # term1 = gamma_0 * D_r
    mulsd xmm1, xmm0

    # term2 = gamma_transient * (1.0 - D_r)
    mulsd xmm2, xmm3

    # result = term1 + term2
    addsd xmm1, xmm2
    movsd xmm0, xmm1                  # Return value in xmm0
    ret
.size modulate_damping, .-modulate_damping

.globl fdtd_wave_step
.type fdtd_wave_step, @function
fdtd_wave_step:
    # RDI contains pointer to params
    push rbx
    push rdi
    push rsi

    # Move RDI to RCX so we can read from it easily
    mov rcx, rdi

    # Load pointers
    mov rdi, qword ptr [rcx]          # rdi = phi
    mov rsi, qword ptr [rcx + 8]      # rsi = phi_prev
    mov rbx, qword ptr [rcx + 16]     # rbx = phi_next

    # Load parameters
    movsd xmm0, qword ptr [rcx + 24]  # xmm0 = gamma_r
    movsd xmm1, qword ptr [rcx + 32]  # xmm1 = dt
    movsd xmm2, qword ptr [rcx + 40]  # xmm2 = r2
    mov r8d, dword ptr [rcx + 48]     # r8d = grid_size

    # Calculate half_gamma_dt = gamma_r * dt / 2.0
    mulsd xmm0, xmm1
    mov rax, 0x3FE0000000000000
    movq xmm3, rax
    mulsd xmm0, xmm3                  # xmm0 = half_gamma_dt

    # denom = 1.0 + half_gamma_dt
    mov rax, 0x3FF0000000000000
    movq xmm3, rax
    addsd xmm3, xmm0                  # xmm3 = denom

    # prev_coeff = 1.0 - half_gamma_dt
    movq xmm4, rax                    # xmm4 = 1.0
    subsd xmm4, xmm0                  # xmm4 = prev_coeff

    # Prepare 2.0 constant
    mov rax, 0x4000000000000000
    movq xmm5, rax                    # xmm5 = 2.0

    # Loop counter i = 1
    mov r9d, 1
    dec r8d                           # r8d = grid_size - 1

.Lloop_start:
    cmp r9d, r8d
    jge .Lloop_end

    # Load floats to double representation
    movsxd rax, r9d

    # load phi[i+1] (float to double)
    cvtss2sd xmm0, dword ptr [rdi + rax*4 + 4]

    # load phi[i] (float to double)
    cvtss2sd xmm1, dword ptr [rdi + rax*4]

    # xmm1 = 2.0 * phi[i]
    mulsd xmm1, xmm5

    # xmm0 = phi[i+1] - 2.0 * phi[i]
    subsd xmm0, xmm1

    # load phi[i-1] (float to double)
    cvtss2sd xmm1, dword ptr [rdi + rax*4 - 4]

    # xmm0 = phi[i+1] - 2.0 * phi[i] + phi[i-1] (laplacian)
    addsd xmm0, xmm1

    # xmm0 = r2 * laplacian
    mulsd xmm0, xmm2

    # load phi[i] again (float to double)
    cvtss2sd xmm1, dword ptr [rdi + rax*4]

    # xmm1 = 2.0 * phi[i]
    mulsd xmm1, xmm5

    # xmm0 = 2.0 * phi[i] + r2 * laplacian
    addsd xmm0, xmm1

    # load phi_prev[i] (float to double)
    cvtss2sd xmm1, dword ptr [rsi + rax*4]

    # xmm1 = phi_prev[i] * prev_coeff
    mulsd xmm1, xmm4

    # xmm0 = 2.0 * phi[i] - phi_prev[i] * prev_coeff + r2 * laplacian
    subsd xmm0, xmm1

    # xmm0 = next_val = num / denom
    divsd xmm0, xmm3

    # Convert next_val to float and store in phi_next[i]
    cvtsd2ss xmm0, xmm0
    movss dword ptr [rbx + rax*4], xmm0

    inc r9d
    jmp .Lloop_start

.Lloop_end:
    pop rsi
    pop rdi
    pop rbx
    ret
.size fdtd_wave_step, .-fdtd_wave_step
