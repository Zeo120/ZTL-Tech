.type attest_byte_3892, @function
attest_byte_3892:
    movzx eax, byte ptr [rdi + 3892]
    movzx r10d, byte ptr [rsi + 3892]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3892, .-attest_byte_3892

# ============================================
# Boot Byte Attestation - Position 3893
# Constant-time branchless validation
# of boot_data[3893] against baseline[3893]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3893, @function
attest_byte_3893:
    movzx eax, byte ptr [rdi + 3893]
    movzx r10d, byte ptr [rsi + 3893]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3893, .-attest_byte_3893

# ============================================
# Boot Byte Attestation - Position 3894
# Constant-time branchless validation
# of boot_data[3894] against baseline[3894]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3894, @function
attest_byte_3894:
    movzx eax, byte ptr [rdi + 3894]
    movzx r10d, byte ptr [rsi + 3894]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3894, .-attest_byte_3894

# ============================================
# Boot Byte Attestation - Position 3895
# Constant-time branchless validation
# of boot_data[3895] against baseline[3895]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3895, @function
attest_byte_3895:
    movzx eax, byte ptr [rdi + 3895]
    movzx r10d, byte ptr [rsi + 3895]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3895, .-attest_byte_3895

# ============================================
# Boot Byte Attestation - Position 3896
# Constant-time branchless validation
# of boot_data[3896] against baseline[3896]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3896, @function
attest_byte_3896:
    movzx eax, byte ptr [rdi + 3896]
    movzx r10d, byte ptr [rsi + 3896]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3896, .-attest_byte_3896

# ============================================
# Boot Byte Attestation - Position 3897
# Constant-time branchless validation
# of boot_data[3897] against baseline[3897]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3897, @function
attest_byte_3897:
    movzx eax, byte ptr [rdi + 3897]
    movzx r10d, byte ptr [rsi + 3897]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3897, .-attest_byte_3897

# ============================================
# Boot Byte Attestation - Position 3898
# Constant-time branchless validation
# of boot_data[3898] against baseline[3898]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3898, @function
attest_byte_3898:
    movzx eax, byte ptr [rdi + 3898]
    movzx r10d, byte ptr [rsi + 3898]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3898, .-attest_byte_3898

# ============================================
# Boot Byte Attestation - Position 3899
# Constant-time branchless validation
# of boot_data[3899] against baseline[3899]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3899, @function
attest_byte_3899:
    movzx eax, byte ptr [rdi + 3899]
    movzx r10d, byte ptr [rsi + 3899]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3899, .-attest_byte_3899

# ============================================
# Boot Byte Attestation - Position 3900
# Constant-time branchless validation
# of boot_data[3900] against baseline[3900]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3900, @function
attest_byte_3900:
    movzx eax, byte ptr [rdi + 3900]
    movzx r10d, byte ptr [rsi + 3900]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3900, .-attest_byte_3900

# ============================================
# Boot Byte Attestation - Position 3901
# Constant-time branchless validation
# of boot_data[3901] against baseline[3901]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3901, @function
attest_byte_3901:
    movzx eax, byte ptr [rdi + 3901]
    movzx r10d, byte ptr [rsi + 3901]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3901, .-attest_byte_3901

# ============================================
# Boot Byte Attestation - Position 3902
# Constant-time branchless validation
# of boot_data[3902] against baseline[3902]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3902, @function
attest_byte_3902:
    movzx eax, byte ptr [rdi + 3902]
    movzx r10d, byte ptr [rsi + 3902]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3902, .-attest_byte_3902

# ============================================
# Boot Byte Attestation - Position 3903
# Constant-time branchless validation
# of boot_data[3903] against baseline[3903]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3903, @function
attest_byte_3903:
    movzx eax, byte ptr [rdi + 3903]
    movzx r10d, byte ptr [rsi + 3903]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3903, .-attest_byte_3903

# ============================================
# Boot Byte Attestation - Position 3904
# Constant-time branchless validation
# of boot_data[3904] against baseline[3904]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3904, @function
attest_byte_3904:
    movzx eax, byte ptr [rdi + 3904]
    movzx r10d, byte ptr [rsi + 3904]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3904, .-attest_byte_3904

# ============================================
# Boot Byte Attestation - Position 3905
# Constant-time branchless validation
# of boot_data[3905] against baseline[3905]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3905, @function
attest_byte_3905:
    movzx eax, byte ptr [rdi + 3905]
    movzx r10d, byte ptr [rsi + 3905]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3905, .-attest_byte_3905

# ============================================
# Boot Byte Attestation - Position 3906
# Constant-time branchless validation
# of boot_data[3906] against baseline[3906]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3906, @function
attest_byte_3906:
    movzx eax, byte ptr [rdi + 3906]
    movzx r10d, byte ptr [rsi + 3906]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3906, .-attest_byte_3906

# ============================================
# Boot Byte Attestation - Position 3907
# Constant-time branchless validation
# of boot_data[3907] against baseline[3907]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3907, @function
attest_byte_3907:
    movzx eax, byte ptr [rdi + 3907]
    movzx r10d, byte ptr [rsi + 3907]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3907, .-attest_byte_3907

# ============================================
# Boot Byte Attestation - Position 3908
# Constant-time branchless validation
# of boot_data[3908] against baseline[3908]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3908, @function
attest_byte_3908:
    movzx eax, byte ptr [rdi + 3908]
    movzx r10d, byte ptr [rsi + 3908]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3908, .-attest_byte_3908

# ============================================
# Boot Byte Attestation - Position 3909
# Constant-time branchless validation
# of boot_data[3909] against baseline[3909]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3909, @function
attest_byte_3909:
    movzx eax, byte ptr [rdi + 3909]
    movzx r10d, byte ptr [rsi + 3909]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3909, .-attest_byte_3909

# ============================================
# Boot Byte Attestation - Position 3910
# Constant-time branchless validation
# of boot_data[3910] against baseline[3910]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3910, @function
attest_byte_3910:
    movzx eax, byte ptr [rdi + 3910]
    movzx r10d, byte ptr [rsi + 3910]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3910, .-attest_byte_3910

# ============================================
# Boot Byte Attestation - Position 3911
# Constant-time branchless validation
# of boot_data[3911] against baseline[3911]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3911, @function
attest_byte_3911:
    movzx eax, byte ptr [rdi + 3911]
    movzx r10d, byte ptr [rsi + 3911]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3911, .-attest_byte_3911

# ============================================
# Boot Byte Attestation - Position 3912
# Constant-time branchless validation
# of boot_data[3912] against baseline[3912]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3912, @function
attest_byte_3912:
    movzx eax, byte ptr [rdi + 3912]
    movzx r10d, byte ptr [rsi + 3912]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3912, .-attest_byte_3912

# ============================================
# Boot Byte Attestation - Position 3913
# Constant-time branchless validation
# of boot_data[3913] against baseline[3913]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3913, @function
attest_byte_3913:
    movzx eax, byte ptr [rdi + 3913]
    movzx r10d, byte ptr [rsi + 3913]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3913, .-attest_byte_3913

# ============================================
# Boot Byte Attestation - Position 3914
# Constant-time branchless validation
# of boot_data[3914] against baseline[3914]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3914, @function
attest_byte_3914:
    movzx eax, byte ptr [rdi + 3914]
    movzx r10d, byte ptr [rsi + 3914]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3914, .-attest_byte_3914

# ============================================
# Boot Byte Attestation - Position 3915
# Constant-time branchless validation
# of boot_data[3915] against baseline[3915]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3915, @function
attest_byte_3915:
    movzx eax, byte ptr [rdi + 3915]
    movzx r10d, byte ptr [rsi + 3915]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3915, .-attest_byte_3915

# ============================================
# Boot Byte Attestation - Position 3916
# Constant-time branchless validation
# of boot_data[3916] against baseline[3916]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3916, @function
attest_byte_3916:
    movzx eax, byte ptr [rdi + 3916]
    movzx r10d, byte ptr [rsi + 3916]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3916, .-attest_byte_3916

# ============================================
# Boot Byte Attestation - Position 3917
# Constant-time branchless validation
# of boot_data[3917] against baseline[3917]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3917, @function
attest_byte_3917:
    movzx eax, byte ptr [rdi + 3917]
    movzx r10d, byte ptr [rsi + 3917]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3917, .-attest_byte_3917

# ============================================
# Boot Byte Attestation - Position 3918
# Constant-time branchless validation
# of boot_data[3918] against baseline[3918]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3918, @function
attest_byte_3918:
    movzx eax, byte ptr [rdi + 3918]
    movzx r10d, byte ptr [rsi + 3918]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3918, .-attest_byte_3918

# ============================================
# Boot Byte Attestation - Position 3919
# Constant-time branchless validation
# of boot_data[3919] against baseline[3919]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3919, @function
attest_byte_3919:
    movzx eax, byte ptr [rdi + 3919]
    movzx r10d, byte ptr [rsi + 3919]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3919, .-attest_byte_3919

# ============================================
# Boot Byte Attestation - Position 3920
# Constant-time branchless validation
# of boot_data[3920] against baseline[3920]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3920, @function
attest_byte_3920:
    movzx eax, byte ptr [rdi + 3920]
    movzx r10d, byte ptr [rsi + 3920]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3920, .-attest_byte_3920

# ============================================
# Boot Byte Attestation - Position 3921
# Constant-time branchless validation
# of boot_data[3921] against baseline[3921]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3921, @function
attest_byte_3921:
    movzx eax, byte ptr [rdi + 3921]
    movzx r10d, byte ptr [rsi + 3921]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3921, .-attest_byte_3921

# ============================================
# Boot Byte Attestation - Position 3922
# Constant-time branchless validation
# of boot_data[3922] against baseline[3922]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3922, @function
attest_byte_3922:
    movzx eax, byte ptr [rdi + 3922]
    movzx r10d, byte ptr [rsi + 3922]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3922, .-attest_byte_3922

# ============================================
# Boot Byte Attestation - Position 3923
# Constant-time branchless validation
# of boot_data[3923] against baseline[3923]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3923, @function
attest_byte_3923:
    movzx eax, byte ptr [rdi + 3923]
    movzx r10d, byte ptr [rsi + 3923]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3923, .-attest_byte_3923

# ============================================
# Boot Byte Attestation - Position 3924
# Constant-time branchless validation
# of boot_data[3924] against baseline[3924]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3924, @function
attest_byte_3924:
    movzx eax, byte ptr [rdi + 3924]
    movzx r10d, byte ptr [rsi + 3924]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3924, .-attest_byte_3924

# ============================================
# Boot Byte Attestation - Position 3925
# Constant-time branchless validation
# of boot_data[3925] against baseline[3925]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3925, @function
attest_byte_3925:
    movzx eax, byte ptr [rdi + 3925]
    movzx r10d, byte ptr [rsi + 3925]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3925, .-attest_byte_3925

# ============================================
# Boot Byte Attestation - Position 3926
# Constant-time branchless validation
# of boot_data[3926] against baseline[3926]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3926, @function
attest_byte_3926:
    movzx eax, byte ptr [rdi + 3926]
    movzx r10d, byte ptr [rsi + 3926]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3926, .-attest_byte_3926

# ============================================
# Boot Byte Attestation - Position 3927
# Constant-time branchless validation
# of boot_data[3927] against baseline[3927]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3927, @function
attest_byte_3927:
    movzx eax, byte ptr [rdi + 3927]
    movzx r10d, byte ptr [rsi + 3927]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3927, .-attest_byte_3927

# ============================================
# Boot Byte Attestation - Position 3928
# Constant-time branchless validation
# of boot_data[3928] against baseline[3928]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3928, @function
attest_byte_3928:
    movzx eax, byte ptr [rdi + 3928]
    movzx r10d, byte ptr [rsi + 3928]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3928, .-attest_byte_3928

# ============================================
# Boot Byte Attestation - Position 3929
# Constant-time branchless validation
# of boot_data[3929] against baseline[3929]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3929, @function
attest_byte_3929:
    movzx eax, byte ptr [rdi + 3929]
    movzx r10d, byte ptr [rsi + 3929]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3929, .-attest_byte_3929

# ============================================
# Boot Byte Attestation - Position 3930
# Constant-time branchless validation
# of boot_data[3930] against baseline[3930]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3930, @function
attest_byte_3930:
    movzx eax, byte ptr [rdi + 3930]
    movzx r10d, byte ptr [rsi + 3930]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3930, .-attest_byte_3930

# ============================================
# Boot Byte Attestation - Position 3931
# Constant-time branchless validation
# of boot_data[3931] against baseline[3931]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3931, @function
attest_byte_3931:
    movzx eax, byte ptr [rdi + 3931]
    movzx r10d, byte ptr [rsi + 3931]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3931, .-attest_byte_3931

# ============================================
# Boot Byte Attestation - Position 3932
# Constant-time branchless validation
# of boot_data[3932] against baseline[3932]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3932, @function
attest_byte_3932:
    movzx eax, byte ptr [rdi + 3932]
    movzx r10d, byte ptr [rsi + 3932]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3932, .-attest_byte_3932

# ============================================
# Boot Byte Attestation - Position 3933
# Constant-time branchless validation
# of boot_data[3933] against baseline[3933]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3933, @function
attest_byte_3933:
    movzx eax, byte ptr [rdi + 3933]
    movzx r10d, byte ptr [rsi + 3933]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3933, .-attest_byte_3933

# ============================================
# Boot Byte Attestation - Position 3934
# Constant-time branchless validation
# of boot_data[3934] against baseline[3934]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3934, @function
attest_byte_3934:
    movzx eax, byte ptr [rdi + 3934]
    movzx r10d, byte ptr [rsi + 3934]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3934, .-attest_byte_3934

# ============================================
# Boot Byte Attestation - Position 3935
# Constant-time branchless validation
# of boot_data[3935] against baseline[3935]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3935, @function
attest_byte_3935:
    movzx eax, byte ptr [rdi + 3935]
    movzx r10d, byte ptr [rsi + 3935]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3935, .-attest_byte_3935

# ============================================
# Boot Byte Attestation - Position 3936
# Constant-time branchless validation
# of boot_data[3936] against baseline[3936]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3936, @function
attest_byte_3936:
    movzx eax, byte ptr [rdi + 3936]
    movzx r10d, byte ptr [rsi + 3936]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3936, .-attest_byte_3936

# ============================================
# Boot Byte Attestation - Position 3937
# Constant-time branchless validation
# of boot_data[3937] against baseline[3937]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3937, @function
attest_byte_3937:
    movzx eax, byte ptr [rdi + 3937]
    movzx r10d, byte ptr [rsi + 3937]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3937, .-attest_byte_3937

# ============================================
# Boot Byte Attestation - Position 3938
# Constant-time branchless validation
# of boot_data[3938] against baseline[3938]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3938, @function
attest_byte_3938:
    movzx eax, byte ptr [rdi + 3938]
    movzx r10d, byte ptr [rsi + 3938]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3938, .-attest_byte_3938

# ============================================
# Boot Byte Attestation - Position 3939
# Constant-time branchless validation
# of boot_data[3939] against baseline[3939]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3939, @function
attest_byte_3939:
    movzx eax, byte ptr [rdi + 3939]
    movzx r10d, byte ptr [rsi + 3939]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3939, .-attest_byte_3939

# ============================================
# Boot Byte Attestation - Position 3940
# Constant-time branchless validation
# of boot_data[3940] against baseline[3940]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3940, @function
attest_byte_3940:
    movzx eax, byte ptr [rdi + 3940]
    movzx r10d, byte ptr [rsi + 3940]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3940, .-attest_byte_3940

# ============================================
# Boot Byte Attestation - Position 3941
# Constant-time branchless validation
# of boot_data[3941] against baseline[3941]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3941, @function
attest_byte_3941:
    movzx eax, byte ptr [rdi + 3941]
    movzx r10d, byte ptr [rsi + 3941]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3941, .-attest_byte_3941

# ============================================
# Boot Byte Attestation - Position 3942
# Constant-time branchless validation
# of boot_data[3942] against baseline[3942]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3942, @function
attest_byte_3942:
    movzx eax, byte ptr [rdi + 3942]
    movzx r10d, byte ptr [rsi + 3942]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3942, .-attest_byte_3942

# ============================================
# Boot Byte Attestation - Position 3943
# Constant-time branchless validation
# of boot_data[3943] against baseline[3943]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3943, @function
attest_byte_3943:
    movzx eax, byte ptr [rdi + 3943]
    movzx r10d, byte ptr [rsi + 3943]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3943, .-attest_byte_3943

# ============================================
# Boot Byte Attestation - Position 3944
# Constant-time branchless validation
# of boot_data[3944] against baseline[3944]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3944, @function
attest_byte_3944:
    movzx eax, byte ptr [rdi + 3944]
    movzx r10d, byte ptr [rsi + 3944]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3944, .-attest_byte_3944

# ============================================
# Boot Byte Attestation - Position 3945
# Constant-time branchless validation
# of boot_data[3945] against baseline[3945]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3945, @function
attest_byte_3945:
    movzx eax, byte ptr [rdi + 3945]
    movzx r10d, byte ptr [rsi + 3945]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3945, .-attest_byte_3945

# ============================================
# Boot Byte Attestation - Position 3946
# Constant-time branchless validation
# of boot_data[3946] against baseline[3946]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3946, @function
attest_byte_3946:
    movzx eax, byte ptr [rdi + 3946]
    movzx r10d, byte ptr [rsi + 3946]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3946, .-attest_byte_3946

# ============================================
# Boot Byte Attestation - Position 3947
# Constant-time branchless validation
# of boot_data[3947] against baseline[3947]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3947, @function
attest_byte_3947:
    movzx eax, byte ptr [rdi + 3947]
    movzx r10d, byte ptr [rsi + 3947]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3947, .-attest_byte_3947

# ============================================
# Boot Byte Attestation - Position 3948
# Constant-time branchless validation
# of boot_data[3948] against baseline[3948]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3948, @function
attest_byte_3948:
    movzx eax, byte ptr [rdi + 3948]
    movzx r10d, byte ptr [rsi + 3948]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3948, .-attest_byte_3948

# ============================================
# Boot Byte Attestation - Position 3949
# Constant-time branchless validation
# of boot_data[3949] against baseline[3949]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3949, @function
attest_byte_3949:
    movzx eax, byte ptr [rdi + 3949]
    movzx r10d, byte ptr [rsi + 3949]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3949, .-attest_byte_3949

# ============================================
# Boot Byte Attestation - Position 3950
# Constant-time branchless validation
# of boot_data[3950] against baseline[3950]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3950, @function
attest_byte_3950:
    movzx eax, byte ptr [rdi + 3950]
    movzx r10d, byte ptr [rsi + 3950]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3950, .-attest_byte_3950

# ============================================
# Boot Byte Attestation - Position 3951
# Constant-time branchless validation
# of boot_data[3951] against baseline[3951]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3951, @function
attest_byte_3951:
    movzx eax, byte ptr [rdi + 3951]
    movzx r10d, byte ptr [rsi + 3951]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3951, .-attest_byte_3951

# ============================================
# Boot Byte Attestation - Position 3952
# Constant-time branchless validation
# of boot_data[3952] against baseline[3952]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3952, @function
attest_byte_3952:
    movzx eax, byte ptr [rdi + 3952]
    movzx r10d, byte ptr [rsi + 3952]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3952, .-attest_byte_3952

# ============================================
# Boot Byte Attestation - Position 3953
# Constant-time branchless validation
# of boot_data[3953] against baseline[3953]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3953, @function
attest_byte_3953:
    movzx eax, byte ptr [rdi + 3953]
    movzx r10d, byte ptr [rsi + 3953]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3953, .-attest_byte_3953

# ============================================
# Boot Byte Attestation - Position 3954
# Constant-time branchless validation
# of boot_data[3954] against baseline[3954]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3954, @function
attest_byte_3954:
    movzx eax, byte ptr [rdi + 3954]
    movzx r10d, byte ptr [rsi + 3954]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3954, .-attest_byte_3954

# ============================================
# Boot Byte Attestation - Position 3955
# Constant-time branchless validation
# of boot_data[3955] against baseline[3955]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3955, @function
attest_byte_3955:
    movzx eax, byte ptr [rdi + 3955]
    movzx r10d, byte ptr [rsi + 3955]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3955, .-attest_byte_3955

# ============================================
# Boot Byte Attestation - Position 3956
# Constant-time branchless validation
# of boot_data[3956] against baseline[3956]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3956, @function
attest_byte_3956:
    movzx eax, byte ptr [rdi + 3956]
    movzx r10d, byte ptr [rsi + 3956]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3956, .-attest_byte_3956

# ============================================
# Boot Byte Attestation - Position 3957
# Constant-time branchless validation
# of boot_data[3957] against baseline[3957]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3957, @function
attest_byte_3957:
    movzx eax, byte ptr [rdi + 3957]
    movzx r10d, byte ptr [rsi + 3957]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3957, .-attest_byte_3957

# ============================================
# Boot Byte Attestation - Position 3958
# Constant-time branchless validation
# of boot_data[3958] against baseline[3958]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3958, @function
attest_byte_3958:
    movzx eax, byte ptr [rdi + 3958]
    movzx r10d, byte ptr [rsi + 3958]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3958, .-attest_byte_3958

# ============================================
# Boot Byte Attestation - Position 3959
# Constant-time branchless validation
# of boot_data[3959] against baseline[3959]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3959, @function
attest_byte_3959:
    movzx eax, byte ptr [rdi + 3959]
    movzx r10d, byte ptr [rsi + 3959]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3959, .-attest_byte_3959

# ============================================
# Boot Byte Attestation - Position 3960
# Constant-time branchless validation
# of boot_data[3960] against baseline[3960]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3960, @function
attest_byte_3960:
    movzx eax, byte ptr [rdi + 3960]
    movzx r10d, byte ptr [rsi + 3960]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3960, .-attest_byte_3960

# ============================================
# Boot Byte Attestation - Position 3961
# Constant-time branchless validation
# of boot_data[3961] against baseline[3961]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3961, @function
attest_byte_3961:
    movzx eax, byte ptr [rdi + 3961]
    movzx r10d, byte ptr [rsi + 3961]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3961, .-attest_byte_3961

# ============================================
# Boot Byte Attestation - Position 3962
# Constant-time branchless validation
# of boot_data[3962] against baseline[3962]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3962, @function
attest_byte_3962:
    movzx eax, byte ptr [rdi + 3962]
    movzx r10d, byte ptr [rsi + 3962]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3962, .-attest_byte_3962

# ============================================
# Boot Byte Attestation - Position 3963
# Constant-time branchless validation
# of boot_data[3963] against baseline[3963]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3963, @function
attest_byte_3963:
    movzx eax, byte ptr [rdi + 3963]
    movzx r10d, byte ptr [rsi + 3963]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3963, .-attest_byte_3963

# ============================================
# Boot Byte Attestation - Position 3964
# Constant-time branchless validation
# of boot_data[3964] against baseline[3964]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3964, @function
attest_byte_3964:
    movzx eax, byte ptr [rdi + 3964]
    movzx r10d, byte ptr [rsi + 3964]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3964, .-attest_byte_3964

# ============================================
# Boot Byte Attestation - Position 3965
# Constant-time branchless validation
# of boot_data[3965] against baseline[3965]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3965, @function
attest_byte_3965:
    movzx eax, byte ptr [rdi + 3965]
    movzx r10d, byte ptr [rsi + 3965]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3965, .-attest_byte_3965

# ============================================
# Boot Byte Attestation - Position 3966
# Constant-time branchless validation
# of boot_data[3966] against baseline[3966]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3966, @function
attest_byte_3966:
    movzx eax, byte ptr [rdi + 3966]
    movzx r10d, byte ptr [rsi + 3966]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3966, .-attest_byte_3966

# ============================================
# Boot Byte Attestation - Position 3967
# Constant-time branchless validation
# of boot_data[3967] against baseline[3967]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3967, @function
attest_byte_3967:
    movzx eax, byte ptr [rdi + 3967]
    movzx r10d, byte ptr [rsi + 3967]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3967, .-attest_byte_3967

# ============================================
# Boot Byte Attestation - Position 3968
# Constant-time branchless validation
# of boot_data[3968] against baseline[3968]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3968, @function
attest_byte_3968:
    movzx eax, byte ptr [rdi + 3968]
    movzx r10d, byte ptr [rsi + 3968]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3968, .-attest_byte_3968

# ============================================
# Boot Byte Attestation - Position 3969
# Constant-time branchless validation
# of boot_data[3969] against baseline[3969]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3969, @function
attest_byte_3969:
    movzx eax, byte ptr [rdi + 3969]
    movzx r10d, byte ptr [rsi + 3969]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3969, .-attest_byte_3969

# ============================================
# Boot Byte Attestation - Position 3970
# Constant-time branchless validation
# of boot_data[3970] against baseline[3970]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3970, @function
attest_byte_3970:
    movzx eax, byte ptr [rdi + 3970]
    movzx r10d, byte ptr [rsi + 3970]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3970, .-attest_byte_3970

# ============================================
# Boot Byte Attestation - Position 3971
# Constant-time branchless validation
# of boot_data[3971] against baseline[3971]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3971, @function
attest_byte_3971:
    movzx eax, byte ptr [rdi + 3971]
    movzx r10d, byte ptr [rsi + 3971]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3971, .-attest_byte_3971

# ============================================
# Boot Byte Attestation - Position 3972
# Constant-time branchless validation
# of boot_data[3972] against baseline[3972]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3972, @function
attest_byte_3972:
    movzx eax, byte ptr [rdi + 3972]
    movzx r10d, byte ptr [rsi + 3972]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3972, .-attest_byte_3972

# ============================================
# Boot Byte Attestation - Position 3973
# Constant-time branchless validation
# of boot_data[3973] against baseline[3973]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3973, @function
attest_byte_3973:
    movzx eax, byte ptr [rdi + 3973]
    movzx r10d, byte ptr [rsi + 3973]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3973, .-attest_byte_3973

# ============================================
# Boot Byte Attestation - Position 3974
# Constant-time branchless validation
# of boot_data[3974] against baseline[3974]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3974, @function
attest_byte_3974:
    movzx eax, byte ptr [rdi + 3974]
    movzx r10d, byte ptr [rsi + 3974]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3974, .-attest_byte_3974

# ============================================
# Boot Byte Attestation - Position 3975
# Constant-time branchless validation
# of boot_data[3975] against baseline[3975]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3975, @function
attest_byte_3975:
    movzx eax, byte ptr [rdi + 3975]
    movzx r10d, byte ptr [rsi + 3975]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3975, .-attest_byte_3975

# ============================================
# Boot Byte Attestation - Position 3976
# Constant-time branchless validation
# of boot_data[3976] against baseline[3976]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3976, @function
attest_byte_3976:
    movzx eax, byte ptr [rdi + 3976]
    movzx r10d, byte ptr [rsi + 3976]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3976, .-attest_byte_3976

# ============================================
# Boot Byte Attestation - Position 3977
# Constant-time branchless validation
# of boot_data[3977] against baseline[3977]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3977, @function
attest_byte_3977:
    movzx eax, byte ptr [rdi + 3977]
    movzx r10d, byte ptr [rsi + 3977]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3977, .-attest_byte_3977

# ============================================
# Boot Byte Attestation - Position 3978
# Constant-time branchless validation
# of boot_data[3978] against baseline[3978]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3978, @function
attest_byte_3978:
    movzx eax, byte ptr [rdi + 3978]
    movzx r10d, byte ptr [rsi + 3978]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3978, .-attest_byte_3978

# ============================================
# Boot Byte Attestation - Position 3979
# Constant-time branchless validation
# of boot_data[3979] against baseline[3979]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3979, @function
attest_byte_3979:
    movzx eax, byte ptr [rdi + 3979]
    movzx r10d, byte ptr [rsi + 3979]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3979, .-attest_byte_3979

# ============================================
# Boot Byte Attestation - Position 3980
# Constant-time branchless validation
# of boot_data[3980] against baseline[3980]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3980, @function
attest_byte_3980:
    movzx eax, byte ptr [rdi + 3980]
    movzx r10d, byte ptr [rsi + 3980]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3980, .-attest_byte_3980

# ============================================
# Boot Byte Attestation - Position 3981
# Constant-time branchless validation
# of boot_data[3981] against baseline[3981]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3981, @function
attest_byte_3981:
    movzx eax, byte ptr [rdi + 3981]
    movzx r10d, byte ptr [rsi + 3981]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3981, .-attest_byte_3981

# ============================================
# Boot Byte Attestation - Position 3982
# Constant-time branchless validation
# of boot_data[3982] against baseline[3982]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3982, @function
attest_byte_3982:
    movzx eax, byte ptr [rdi + 3982]
    movzx r10d, byte ptr [rsi + 3982]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3982, .-attest_byte_3982

# ============================================
# Boot Byte Attestation - Position 3983
# Constant-time branchless validation
# of boot_data[3983] against baseline[3983]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3983, @function
attest_byte_3983:
    movzx eax, byte ptr [rdi + 3983]
    movzx r10d, byte ptr [rsi + 3983]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3983, .-attest_byte_3983

# ============================================
# Boot Byte Attestation - Position 3984
# Constant-time branchless validation
# of boot_data[3984] against baseline[3984]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3984, @function
attest_byte_3984:
    movzx eax, byte ptr [rdi + 3984]
    movzx r10d, byte ptr [rsi + 3984]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3984, .-attest_byte_3984

# ============================================
# Boot Byte Attestation - Position 3985
# Constant-time branchless validation
# of boot_data[3985] against baseline[3985]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3985, @function
attest_byte_3985:
    movzx eax, byte ptr [rdi + 3985]
    movzx r10d, byte ptr [rsi + 3985]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3985, .-attest_byte_3985

# ============================================
# Boot Byte Attestation - Position 3986
# Constant-time branchless validation
# of boot_data[3986] against baseline[3986]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3986, @function
attest_byte_3986:
    movzx eax, byte ptr [rdi + 3986]
    movzx r10d, byte ptr [rsi + 3986]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3986, .-attest_byte_3986

# ============================================
# Boot Byte Attestation - Position 3987
# Constant-time branchless validation
# of boot_data[3987] against baseline[3987]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3987, @function
attest_byte_3987:
    movzx eax, byte ptr [rdi + 3987]
    movzx r10d, byte ptr [rsi + 3987]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3987, .-attest_byte_3987

# ============================================
# Boot Byte Attestation - Position 3988
# Constant-time branchless validation
# of boot_data[3988] against baseline[3988]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3988, @function
attest_byte_3988:
    movzx eax, byte ptr [rdi + 3988]
    movzx r10d, byte ptr [rsi + 3988]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3988, .-attest_byte_3988

# ============================================
# Boot Byte Attestation - Position 3989
# Constant-time branchless validation
# of boot_data[3989] against baseline[3989]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3989, @function
attest_byte_3989:
    movzx eax, byte ptr [rdi + 3989]
    movzx r10d, byte ptr [rsi + 3989]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3989, .-attest_byte_3989

# ============================================
# Boot Byte Attestation - Position 3990
# Constant-time branchless validation
# of boot_data[3990] against baseline[3990]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3990, @function
attest_byte_3990:
    movzx eax, byte ptr [rdi + 3990]
    movzx r10d, byte ptr [rsi + 3990]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3990, .-attest_byte_3990

# ============================================
# Boot Byte Attestation - Position 3991
# Constant-time branchless validation
# of boot_data[3991] against baseline[3991]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3991, @function
attest_byte_3991:
    movzx eax, byte ptr [rdi + 3991]
    movzx r10d, byte ptr [rsi + 3991]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3991, .-attest_byte_3991

# ============================================
# Boot Byte Attestation - Position 3992
# Constant-time branchless validation
# of boot_data[3992] against baseline[3992]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3992, @function
attest_byte_3992:
    movzx eax, byte ptr [rdi + 3992]
    movzx r10d, byte ptr [rsi + 3992]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3992, .-attest_byte_3992

# ============================================
# Boot Byte Attestation - Position 3993
# Constant-time branchless validation
# of boot_data[3993] against baseline[3993]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3993, @function
attest_byte_3993:
    movzx eax, byte ptr [rdi + 3993]
    movzx r10d, byte ptr [rsi + 3993]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3993, .-attest_byte_3993

# ============================================
# Boot Byte Attestation - Position 3994
# Constant-time branchless validation
# of boot_data[3994] against baseline[3994]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3994, @function
attest_byte_3994:
    movzx eax, byte ptr [rdi + 3994]
    movzx r10d, byte ptr [rsi + 3994]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3994, .-attest_byte_3994

# ============================================
# Boot Byte Attestation - Position 3995
# Constant-time branchless validation
# of boot_data[3995] against baseline[3995]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3995, @function
attest_byte_3995:
    movzx eax, byte ptr [rdi + 3995]
    movzx r10d, byte ptr [rsi + 3995]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3995, .-attest_byte_3995

# ============================================
# Boot Byte Attestation - Position 3996
# Constant-time branchless validation
# of boot_data[3996] against baseline[3996]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3996, @function
attest_byte_3996:
    movzx eax, byte ptr [rdi + 3996]
    movzx r10d, byte ptr [rsi + 3996]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3996, .-attest_byte_3996

# ============================================
# Boot Byte Attestation - Position 3997
# Constant-time branchless validation
# of boot_data[3997] against baseline[3997]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3997, @function
attest_byte_3997:
    movzx eax, byte ptr [rdi + 3997]
    movzx r10d, byte ptr [rsi + 3997]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3997, .-attest_byte_3997

# ============================================
# Boot Byte Attestation - Position 3998
# Constant-time branchless validation
# of boot_data[3998] against baseline[3998]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3998, @function
attest_byte_3998:
    movzx eax, byte ptr [rdi + 3998]
    movzx r10d, byte ptr [rsi + 3998]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3998, .-attest_byte_3998

# ============================================
# Boot Byte Attestation - Position 3999
# Constant-time branchless validation
# of boot_data[3999] against baseline[3999]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_3999, @function
attest_byte_3999:
    movzx eax, byte ptr [rdi + 3999]
    movzx r10d, byte ptr [rsi + 3999]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_3999, .-attest_byte_3999

# ============================================
# Boot Byte Attestation - Position 4000
# Constant-time branchless validation
# of boot_data[4000] against baseline[4000]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4000, @function
attest_byte_4000:
    movzx eax, byte ptr [rdi + 4000]
    movzx r10d, byte ptr [rsi + 4000]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4000, .-attest_byte_4000

# ============================================
# Boot Byte Attestation - Position 4001
# Constant-time branchless validation
# of boot_data[4001] against baseline[4001]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4001, @function
attest_byte_4001:
    movzx eax, byte ptr [rdi + 4001]
    movzx r10d, byte ptr [rsi + 4001]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4001, .-attest_byte_4001

# ============================================
# Boot Byte Attestation - Position 4002
# Constant-time branchless validation
# of boot_data[4002] against baseline[4002]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4002, @function
attest_byte_4002:
    movzx eax, byte ptr [rdi + 4002]
    movzx r10d, byte ptr [rsi + 4002]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4002, .-attest_byte_4002

# ============================================
# Boot Byte Attestation - Position 4003
# Constant-time branchless validation
# of boot_data[4003] against baseline[4003]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4003, @function
attest_byte_4003:
    movzx eax, byte ptr [rdi + 4003]
    movzx r10d, byte ptr [rsi + 4003]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4003, .-attest_byte_4003

# ============================================
# Boot Byte Attestation - Position 4004
# Constant-time branchless validation
# of boot_data[4004] against baseline[4004]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4004, @function
attest_byte_4004:
    movzx eax, byte ptr [rdi + 4004]
    movzx r10d, byte ptr [rsi + 4004]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4004, .-attest_byte_4004

# ============================================
# Boot Byte Attestation - Position 4005
# Constant-time branchless validation
# of boot_data[4005] against baseline[4005]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4005, @function
attest_byte_4005:
    movzx eax, byte ptr [rdi + 4005]
    movzx r10d, byte ptr [rsi + 4005]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4005, .-attest_byte_4005

# ============================================
# Boot Byte Attestation - Position 4006
# Constant-time branchless validation
# of boot_data[4006] against baseline[4006]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4006, @function
attest_byte_4006:
    movzx eax, byte ptr [rdi + 4006]
    movzx r10d, byte ptr [rsi + 4006]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4006, .-attest_byte_4006

# ============================================
# Boot Byte Attestation - Position 4007
# Constant-time branchless validation
# of boot_data[4007] against baseline[4007]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4007, @function
attest_byte_4007:
    movzx eax, byte ptr [rdi + 4007]
    movzx r10d, byte ptr [rsi + 4007]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4007, .-attest_byte_4007

# ============================================
# Boot Byte Attestation - Position 4008
# Constant-time branchless validation
# of boot_data[4008] against baseline[4008]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4008, @function
attest_byte_4008:
    movzx eax, byte ptr [rdi + 4008]
    movzx r10d, byte ptr [rsi + 4008]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4008, .-attest_byte_4008

# ============================================
# Boot Byte Attestation - Position 4009
# Constant-time branchless validation
# of boot_data[4009] against baseline[4009]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4009, @function
attest_byte_4009:
    movzx eax, byte ptr [rdi + 4009]
    movzx r10d, byte ptr [rsi + 4009]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4009, .-attest_byte_4009

# ============================================
# Boot Byte Attestation - Position 4010
# Constant-time branchless validation
# of boot_data[4010] against baseline[4010]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4010, @function
attest_byte_4010:
    movzx eax, byte ptr [rdi + 4010]
    movzx r10d, byte ptr [rsi + 4010]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4010, .-attest_byte_4010

# ============================================
# Boot Byte Attestation - Position 4011
# Constant-time branchless validation
# of boot_data[4011] against baseline[4011]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4011, @function
attest_byte_4011:
    movzx eax, byte ptr [rdi + 4011]
    movzx r10d, byte ptr [rsi + 4011]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4011, .-attest_byte_4011

# ============================================
# Boot Byte Attestation - Position 4012
# Constant-time branchless validation
# of boot_data[4012] against baseline[4012]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4012, @function
attest_byte_4012:
    movzx eax, byte ptr [rdi + 4012]
    movzx r10d, byte ptr [rsi + 4012]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4012, .-attest_byte_4012

# ============================================
# Boot Byte Attestation - Position 4013
# Constant-time branchless validation
# of boot_data[4013] against baseline[4013]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4013, @function
attest_byte_4013:
    movzx eax, byte ptr [rdi + 4013]
    movzx r10d, byte ptr [rsi + 4013]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4013, .-attest_byte_4013

# ============================================
# Boot Byte Attestation - Position 4014
# Constant-time branchless validation
# of boot_data[4014] against baseline[4014]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4014, @function
attest_byte_4014:
    movzx eax, byte ptr [rdi + 4014]
    movzx r10d, byte ptr [rsi + 4014]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4014, .-attest_byte_4014

# ============================================
# Boot Byte Attestation - Position 4015
# Constant-time branchless validation
# of boot_data[4015] against baseline[4015]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4015, @function
attest_byte_4015:
    movzx eax, byte ptr [rdi + 4015]
    movzx r10d, byte ptr [rsi + 4015]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4015, .-attest_byte_4015

# ============================================
# Boot Byte Attestation - Position 4016
# Constant-time branchless validation
# of boot_data[4016] against baseline[4016]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4016, @function
attest_byte_4016:
    movzx eax, byte ptr [rdi + 4016]
    movzx r10d, byte ptr [rsi + 4016]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4016, .-attest_byte_4016

# ============================================
# Boot Byte Attestation - Position 4017
# Constant-time branchless validation
# of boot_data[4017] against baseline[4017]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4017, @function
attest_byte_4017:
    movzx eax, byte ptr [rdi + 4017]
    movzx r10d, byte ptr [rsi + 4017]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4017, .-attest_byte_4017

# ============================================
# Boot Byte Attestation - Position 4018
# Constant-time branchless validation
# of boot_data[4018] against baseline[4018]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4018, @function
attest_byte_4018:
    movzx eax, byte ptr [rdi + 4018]
    movzx r10d, byte ptr [rsi + 4018]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4018, .-attest_byte_4018

# ============================================
# Boot Byte Attestation - Position 4019
# Constant-time branchless validation
# of boot_data[4019] against baseline[4019]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4019, @function
attest_byte_4019:
    movzx eax, byte ptr [rdi + 4019]
    movzx r10d, byte ptr [rsi + 4019]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4019, .-attest_byte_4019

# ============================================
# Boot Byte Attestation - Position 4020
# Constant-time branchless validation
# of boot_data[4020] against baseline[4020]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4020, @function
attest_byte_4020:
    movzx eax, byte ptr [rdi + 4020]
    movzx r10d, byte ptr [rsi + 4020]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4020, .-attest_byte_4020

# ============================================
# Boot Byte Attestation - Position 4021
# Constant-time branchless validation
# of boot_data[4021] against baseline[4021]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4021, @function
attest_byte_4021:
    movzx eax, byte ptr [rdi + 4021]
    movzx r10d, byte ptr [rsi + 4021]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4021, .-attest_byte_4021

# ============================================
# Boot Byte Attestation - Position 4022
# Constant-time branchless validation
# of boot_data[4022] against baseline[4022]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4022, @function
attest_byte_4022:
    movzx eax, byte ptr [rdi + 4022]
    movzx r10d, byte ptr [rsi + 4022]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4022, .-attest_byte_4022

# ============================================
# Boot Byte Attestation - Position 4023
# Constant-time branchless validation
# of boot_data[4023] against baseline[4023]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4023, @function
attest_byte_4023:
    movzx eax, byte ptr [rdi + 4023]
    movzx r10d, byte ptr [rsi + 4023]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4023, .-attest_byte_4023

# ============================================
# Boot Byte Attestation - Position 4024
# Constant-time branchless validation
# of boot_data[4024] against baseline[4024]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4024, @function
attest_byte_4024:
    movzx eax, byte ptr [rdi + 4024]
    movzx r10d, byte ptr [rsi + 4024]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4024, .-attest_byte_4024

# ============================================
# Boot Byte Attestation - Position 4025
# Constant-time branchless validation
# of boot_data[4025] against baseline[4025]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4025, @function
attest_byte_4025:
    movzx eax, byte ptr [rdi + 4025]
    movzx r10d, byte ptr [rsi + 4025]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4025, .-attest_byte_4025

# ============================================
# Boot Byte Attestation - Position 4026
# Constant-time branchless validation
# of boot_data[4026] against baseline[4026]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4026, @function
attest_byte_4026:
    movzx eax, byte ptr [rdi + 4026]
    movzx r10d, byte ptr [rsi + 4026]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4026, .-attest_byte_4026

# ============================================
# Boot Byte Attestation - Position 4027
# Constant-time branchless validation
# of boot_data[4027] against baseline[4027]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4027, @function
attest_byte_4027:
    movzx eax, byte ptr [rdi + 4027]
    movzx r10d, byte ptr [rsi + 4027]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4027, .-attest_byte_4027

# ============================================
# Boot Byte Attestation - Position 4028
# Constant-time branchless validation
# of boot_data[4028] against baseline[4028]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4028, @function
attest_byte_4028:
    movzx eax, byte ptr [rdi + 4028]
    movzx r10d, byte ptr [rsi + 4028]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4028, .-attest_byte_4028

# ============================================
# Boot Byte Attestation - Position 4029
# Constant-time branchless validation
# of boot_data[4029] against baseline[4029]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4029, @function
attest_byte_4029:
    movzx eax, byte ptr [rdi + 4029]
    movzx r10d, byte ptr [rsi + 4029]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4029, .-attest_byte_4029

# ============================================
# Boot Byte Attestation - Position 4030
# Constant-time branchless validation
# of boot_data[4030] against baseline[4030]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4030, @function
attest_byte_4030:
    movzx eax, byte ptr [rdi + 4030]
    movzx r10d, byte ptr [rsi + 4030]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4030, .-attest_byte_4030

# ============================================
# Boot Byte Attestation - Position 4031
# Constant-time branchless validation
# of boot_data[4031] against baseline[4031]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4031, @function
attest_byte_4031:
    movzx eax, byte ptr [rdi + 4031]
    movzx r10d, byte ptr [rsi + 4031]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4031, .-attest_byte_4031

# ============================================
# Boot Byte Attestation - Position 4032
# Constant-time branchless validation
# of boot_data[4032] against baseline[4032]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4032, @function
attest_byte_4032:
    movzx eax, byte ptr [rdi + 4032]
    movzx r10d, byte ptr [rsi + 4032]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4032, .-attest_byte_4032

# ============================================
# Boot Byte Attestation - Position 4033
# Constant-time branchless validation
# of boot_data[4033] against baseline[4033]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4033, @function
attest_byte_4033:
    movzx eax, byte ptr [rdi + 4033]
    movzx r10d, byte ptr [rsi + 4033]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4033, .-attest_byte_4033

# ============================================
# Boot Byte Attestation - Position 4034
# Constant-time branchless validation
# of boot_data[4034] against baseline[4034]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4034, @function
attest_byte_4034:
    movzx eax, byte ptr [rdi + 4034]
    movzx r10d, byte ptr [rsi + 4034]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4034, .-attest_byte_4034

# ============================================
# Boot Byte Attestation - Position 4035
# Constant-time branchless validation
# of boot_data[4035] against baseline[4035]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4035, @function
attest_byte_4035:
    movzx eax, byte ptr [rdi + 4035]
    movzx r10d, byte ptr [rsi + 4035]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4035, .-attest_byte_4035

# ============================================
# Boot Byte Attestation - Position 4036
# Constant-time branchless validation
# of boot_data[4036] against baseline[4036]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4036, @function
attest_byte_4036:
    movzx eax, byte ptr [rdi + 4036]
    movzx r10d, byte ptr [rsi + 4036]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4036, .-attest_byte_4036

# ============================================
# Boot Byte Attestation - Position 4037
# Constant-time branchless validation
# of boot_data[4037] against baseline[4037]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4037, @function
attest_byte_4037:
    movzx eax, byte ptr [rdi + 4037]
    movzx r10d, byte ptr [rsi + 4037]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4037, .-attest_byte_4037

# ============================================
# Boot Byte Attestation - Position 4038
# Constant-time branchless validation
# of boot_data[4038] against baseline[4038]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4038, @function
attest_byte_4038:
    movzx eax, byte ptr [rdi + 4038]
    movzx r10d, byte ptr [rsi + 4038]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4038, .-attest_byte_4038

# ============================================
# Boot Byte Attestation - Position 4039
# Constant-time branchless validation
# of boot_data[4039] against baseline[4039]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4039, @function
attest_byte_4039:
    movzx eax, byte ptr [rdi + 4039]
    movzx r10d, byte ptr [rsi + 4039]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4039, .-attest_byte_4039

# ============================================
# Boot Byte Attestation - Position 4040
# Constant-time branchless validation
# of boot_data[4040] against baseline[4040]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4040, @function
attest_byte_4040:
    movzx eax, byte ptr [rdi + 4040]
    movzx r10d, byte ptr [rsi + 4040]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4040, .-attest_byte_4040

# ============================================
# Boot Byte Attestation - Position 4041
# Constant-time branchless validation
# of boot_data[4041] against baseline[4041]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4041, @function
attest_byte_4041:
    movzx eax, byte ptr [rdi + 4041]
    movzx r10d, byte ptr [rsi + 4041]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4041, .-attest_byte_4041

# ============================================
# Boot Byte Attestation - Position 4042
# Constant-time branchless validation
# of boot_data[4042] against baseline[4042]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4042, @function
attest_byte_4042:
    movzx eax, byte ptr [rdi + 4042]
    movzx r10d, byte ptr [rsi + 4042]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4042, .-attest_byte_4042

# ============================================
# Boot Byte Attestation - Position 4043
# Constant-time branchless validation
# of boot_data[4043] against baseline[4043]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4043, @function
attest_byte_4043:
    movzx eax, byte ptr [rdi + 4043]
    movzx r10d, byte ptr [rsi + 4043]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4043, .-attest_byte_4043

# ============================================
# Boot Byte Attestation - Position 4044
# Constant-time branchless validation
# of boot_data[4044] against baseline[4044]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4044, @function
attest_byte_4044:
    movzx eax, byte ptr [rdi + 4044]
    movzx r10d, byte ptr [rsi + 4044]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4044, .-attest_byte_4044

# ============================================
# Boot Byte Attestation - Position 4045
# Constant-time branchless validation
# of boot_data[4045] against baseline[4045]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4045, @function
attest_byte_4045:
    movzx eax, byte ptr [rdi + 4045]
    movzx r10d, byte ptr [rsi + 4045]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4045, .-attest_byte_4045

# ============================================
# Boot Byte Attestation - Position 4046
# Constant-time branchless validation
# of boot_data[4046] against baseline[4046]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4046, @function
attest_byte_4046:
    movzx eax, byte ptr [rdi + 4046]
    movzx r10d, byte ptr [rsi + 4046]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4046, .-attest_byte_4046

# ============================================
# Boot Byte Attestation - Position 4047
# Constant-time branchless validation
# of boot_data[4047] against baseline[4047]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4047, @function
attest_byte_4047:
    movzx eax, byte ptr [rdi + 4047]
    movzx r10d, byte ptr [rsi + 4047]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4047, .-attest_byte_4047

# ============================================
# Boot Byte Attestation - Position 4048
# Constant-time branchless validation
# of boot_data[4048] against baseline[4048]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4048, @function
attest_byte_4048:
    movzx eax, byte ptr [rdi + 4048]
    movzx r10d, byte ptr [rsi + 4048]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4048, .-attest_byte_4048

# ============================================
# Boot Byte Attestation - Position 4049
# Constant-time branchless validation
# of boot_data[4049] against baseline[4049]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4049, @function
attest_byte_4049:
    movzx eax, byte ptr [rdi + 4049]
    movzx r10d, byte ptr [rsi + 4049]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4049, .-attest_byte_4049

# ============================================
# Boot Byte Attestation - Position 4050
# Constant-time branchless validation
# of boot_data[4050] against baseline[4050]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4050, @function
attest_byte_4050:
    movzx eax, byte ptr [rdi + 4050]
    movzx r10d, byte ptr [rsi + 4050]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4050, .-attest_byte_4050

# ============================================
# Boot Byte Attestation - Position 4051
# Constant-time branchless validation
# of boot_data[4051] against baseline[4051]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4051, @function
attest_byte_4051:
    movzx eax, byte ptr [rdi + 4051]
    movzx r10d, byte ptr [rsi + 4051]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4051, .-attest_byte_4051

# ============================================
# Boot Byte Attestation - Position 4052
# Constant-time branchless validation
# of boot_data[4052] against baseline[4052]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4052, @function
attest_byte_4052:
    movzx eax, byte ptr [rdi + 4052]
    movzx r10d, byte ptr [rsi + 4052]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4052, .-attest_byte_4052

# ============================================
# Boot Byte Attestation - Position 4053
# Constant-time branchless validation
# of boot_data[4053] against baseline[4053]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4053, @function
attest_byte_4053:
    movzx eax, byte ptr [rdi + 4053]
    movzx r10d, byte ptr [rsi + 4053]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4053, .-attest_byte_4053

# ============================================
# Boot Byte Attestation - Position 4054
# Constant-time branchless validation
# of boot_data[4054] against baseline[4054]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4054, @function
attest_byte_4054:
    movzx eax, byte ptr [rdi + 4054]
    movzx r10d, byte ptr [rsi + 4054]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4054, .-attest_byte_4054

# ============================================
# Boot Byte Attestation - Position 4055
# Constant-time branchless validation
# of boot_data[4055] against baseline[4055]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4055, @function
attest_byte_4055:
    movzx eax, byte ptr [rdi + 4055]
    movzx r10d, byte ptr [rsi + 4055]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4055, .-attest_byte_4055

# ============================================
# Boot Byte Attestation - Position 4056
# Constant-time branchless validation
# of boot_data[4056] against baseline[4056]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4056, @function
attest_byte_4056:
    movzx eax, byte ptr [rdi + 4056]
    movzx r10d, byte ptr [rsi + 4056]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4056, .-attest_byte_4056

# ============================================
# Boot Byte Attestation - Position 4057
# Constant-time branchless validation
# of boot_data[4057] against baseline[4057]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4057, @function
attest_byte_4057:
    movzx eax, byte ptr [rdi + 4057]
    movzx r10d, byte ptr [rsi + 4057]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4057, .-attest_byte_4057

# ============================================
# Boot Byte Attestation - Position 4058
# Constant-time branchless validation
# of boot_data[4058] against baseline[4058]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4058, @function
attest_byte_4058:
    movzx eax, byte ptr [rdi + 4058]
    movzx r10d, byte ptr [rsi + 4058]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4058, .-attest_byte_4058

# ============================================
# Boot Byte Attestation - Position 4059
# Constant-time branchless validation
# of boot_data[4059] against baseline[4059]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4059, @function
attest_byte_4059:
    movzx eax, byte ptr [rdi + 4059]
    movzx r10d, byte ptr [rsi + 4059]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4059, .-attest_byte_4059

# ============================================
# Boot Byte Attestation - Position 4060
# Constant-time branchless validation
# of boot_data[4060] against baseline[4060]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4060, @function
attest_byte_4060:
    movzx eax, byte ptr [rdi + 4060]
    movzx r10d, byte ptr [rsi + 4060]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4060, .-attest_byte_4060

# ============================================
# Boot Byte Attestation - Position 4061
# Constant-time branchless validation
# of boot_data[4061] against baseline[4061]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4061, @function
attest_byte_4061:
    movzx eax, byte ptr [rdi + 4061]
    movzx r10d, byte ptr [rsi + 4061]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4061, .-attest_byte_4061

# ============================================
# Boot Byte Attestation - Position 4062
# Constant-time branchless validation
# of boot_data[4062] against baseline[4062]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4062, @function
attest_byte_4062:
    movzx eax, byte ptr [rdi + 4062]
    movzx r10d, byte ptr [rsi + 4062]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4062, .-attest_byte_4062

# ============================================
# Boot Byte Attestation - Position 4063
# Constant-time branchless validation
# of boot_data[4063] against baseline[4063]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4063, @function
attest_byte_4063:
    movzx eax, byte ptr [rdi + 4063]
    movzx r10d, byte ptr [rsi + 4063]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4063, .-attest_byte_4063

# ============================================
# Boot Byte Attestation - Position 4064
# Constant-time branchless validation
# of boot_data[4064] against baseline[4064]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4064, @function
attest_byte_4064:
    movzx eax, byte ptr [rdi + 4064]
    movzx r10d, byte ptr [rsi + 4064]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4064, .-attest_byte_4064

# ============================================
# Boot Byte Attestation - Position 4065
# Constant-time branchless validation
# of boot_data[4065] against baseline[4065]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4065, @function
attest_byte_4065:
    movzx eax, byte ptr [rdi + 4065]
    movzx r10d, byte ptr [rsi + 4065]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4065, .-attest_byte_4065

# ============================================
# Boot Byte Attestation - Position 4066
# Constant-time branchless validation
# of boot_data[4066] against baseline[4066]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4066, @function
attest_byte_4066:
    movzx eax, byte ptr [rdi + 4066]
    movzx r10d, byte ptr [rsi + 4066]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4066, .-attest_byte_4066

# ============================================
# Boot Byte Attestation - Position 4067
# Constant-time branchless validation
# of boot_data[4067] against baseline[4067]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4067, @function
attest_byte_4067:
    movzx eax, byte ptr [rdi + 4067]
    movzx r10d, byte ptr [rsi + 4067]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4067, .-attest_byte_4067

# ============================================
# Boot Byte Attestation - Position 4068
# Constant-time branchless validation
# of boot_data[4068] against baseline[4068]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4068, @function
attest_byte_4068:
    movzx eax, byte ptr [rdi + 4068]
    movzx r10d, byte ptr [rsi + 4068]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4068, .-attest_byte_4068

# ============================================
# Boot Byte Attestation - Position 4069
# Constant-time branchless validation
# of boot_data[4069] against baseline[4069]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4069, @function
attest_byte_4069:
    movzx eax, byte ptr [rdi + 4069]
    movzx r10d, byte ptr [rsi + 4069]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4069, .-attest_byte_4069

# ============================================
# Boot Byte Attestation - Position 4070
# Constant-time branchless validation
# of boot_data[4070] against baseline[4070]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4070, @function
attest_byte_4070:
    movzx eax, byte ptr [rdi + 4070]
    movzx r10d, byte ptr [rsi + 4070]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4070, .-attest_byte_4070

# ============================================
# Boot Byte Attestation - Position 4071
# Constant-time branchless validation
# of boot_data[4071] against baseline[4071]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4071, @function
attest_byte_4071:
    movzx eax, byte ptr [rdi + 4071]
    movzx r10d, byte ptr [rsi + 4071]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4071, .-attest_byte_4071

# ============================================
# Boot Byte Attestation - Position 4072
# Constant-time branchless validation
# of boot_data[4072] against baseline[4072]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4072, @function
attest_byte_4072:
    movzx eax, byte ptr [rdi + 4072]
    movzx r10d, byte ptr [rsi + 4072]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4072, .-attest_byte_4072

# ============================================
# Boot Byte Attestation - Position 4073
# Constant-time branchless validation
# of boot_data[4073] against baseline[4073]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4073, @function
attest_byte_4073:
    movzx eax, byte ptr [rdi + 4073]
    movzx r10d, byte ptr [rsi + 4073]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4073, .-attest_byte_4073

# ============================================
# Boot Byte Attestation - Position 4074
# Constant-time branchless validation
# of boot_data[4074] against baseline[4074]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4074, @function
attest_byte_4074:
    movzx eax, byte ptr [rdi + 4074]
    movzx r10d, byte ptr [rsi + 4074]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4074, .-attest_byte_4074

# ============================================
# Boot Byte Attestation - Position 4075
# Constant-time branchless validation
# of boot_data[4075] against baseline[4075]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4075, @function
attest_byte_4075:
    movzx eax, byte ptr [rdi + 4075]
    movzx r10d, byte ptr [rsi + 4075]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4075, .-attest_byte_4075

# ============================================
# Boot Byte Attestation - Position 4076
# Constant-time branchless validation
# of boot_data[4076] against baseline[4076]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4076, @function
attest_byte_4076:
    movzx eax, byte ptr [rdi + 4076]
    movzx r10d, byte ptr [rsi + 4076]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4076, .-attest_byte_4076

# ============================================
# Boot Byte Attestation - Position 4077
# Constant-time branchless validation
# of boot_data[4077] against baseline[4077]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4077, @function
attest_byte_4077:
    movzx eax, byte ptr [rdi + 4077]
    movzx r10d, byte ptr [rsi + 4077]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4077, .-attest_byte_4077

# ============================================
# Boot Byte Attestation - Position 4078
# Constant-time branchless validation
# of boot_data[4078] against baseline[4078]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4078, @function
attest_byte_4078:
    movzx eax, byte ptr [rdi + 4078]
    movzx r10d, byte ptr [rsi + 4078]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4078, .-attest_byte_4078

# ============================================
# Boot Byte Attestation - Position 4079
# Constant-time branchless validation
# of boot_data[4079] against baseline[4079]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4079, @function
attest_byte_4079:
    movzx eax, byte ptr [rdi + 4079]
    movzx r10d, byte ptr [rsi + 4079]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4079, .-attest_byte_4079

# ============================================
# Boot Byte Attestation - Position 4080
# Constant-time branchless validation
# of boot_data[4080] against baseline[4080]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4080, @function
attest_byte_4080:
    movzx eax, byte ptr [rdi + 4080]
    movzx r10d, byte ptr [rsi + 4080]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4080, .-attest_byte_4080

# ============================================
# Boot Byte Attestation - Position 4081
# Constant-time branchless validation
# of boot_data[4081] against baseline[4081]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4081, @function
attest_byte_4081:
    movzx eax, byte ptr [rdi + 4081]
    movzx r10d, byte ptr [rsi + 4081]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4081, .-attest_byte_4081

# ============================================
# Boot Byte Attestation - Position 4082
# Constant-time branchless validation
# of boot_data[4082] against baseline[4082]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4082, @function
attest_byte_4082:
    movzx eax, byte ptr [rdi + 4082]
    movzx r10d, byte ptr [rsi + 4082]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4082, .-attest_byte_4082

# ============================================
# Boot Byte Attestation - Position 4083
# Constant-time branchless validation
# of boot_data[4083] against baseline[4083]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4083, @function
attest_byte_4083:
    movzx eax, byte ptr [rdi + 4083]
    movzx r10d, byte ptr [rsi + 4083]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 2
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4083, .-attest_byte_4083

# ============================================
# Boot Byte Attestation - Position 4084
# Constant-time branchless validation
# of boot_data[4084] against baseline[4084]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4084, @function
attest_byte_4084:
    movzx eax, byte ptr [rdi + 4084]
    movzx r10d, byte ptr [rsi + 4084]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 3
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4084, .-attest_byte_4084

# ============================================
# Boot Byte Attestation - Position 4085
# Constant-time branchless validation
# of boot_data[4085] against baseline[4085]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4085, @function
attest_byte_4085:
    movzx eax, byte ptr [rdi + 4085]
    movzx r10d, byte ptr [rsi + 4085]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 4
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4085, .-attest_byte_4085

# ============================================
# Boot Byte Attestation - Position 4086
# Constant-time branchless validation
# of boot_data[4086] against baseline[4086]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4086, @function
attest_byte_4086:
    movzx eax, byte ptr [rdi + 4086]
    movzx r10d, byte ptr [rsi + 4086]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 5
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4086, .-attest_byte_4086

# ============================================
# Boot Byte Attestation - Position 4087
# Constant-time branchless validation
# of boot_data[4087] against baseline[4087]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4087, @function
attest_byte_4087:
    movzx eax, byte ptr [rdi + 4087]
    movzx r10d, byte ptr [rsi + 4087]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 6
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4087, .-attest_byte_4087

# ============================================
# Boot Byte Attestation - Position 4088
# Constant-time branchless validation
# of boot_data[4088] against baseline[4088]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4088, @function
attest_byte_4088:
    movzx eax, byte ptr [rdi + 4088]
    movzx r10d, byte ptr [rsi + 4088]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 7
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4088, .-attest_byte_4088

# ============================================
# Boot Byte Attestation - Position 4089
# Constant-time branchless validation
# of boot_data[4089] against baseline[4089]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4089, @function
attest_byte_4089:
    movzx eax, byte ptr [rdi + 4089]
    movzx r10d, byte ptr [rsi + 4089]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 8
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4089, .-attest_byte_4089

# ============================================
# Boot Byte Attestation - Position 4090
# Constant-time branchless validation
# of boot_data[4090] against baseline[4090]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4090, @function
attest_byte_4090:
    movzx eax, byte ptr [rdi + 4090]
    movzx r10d, byte ptr [rsi + 4090]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 9
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4090, .-attest_byte_4090

# ============================================
# Boot Byte Attestation - Position 4091
# Constant-time branchless validation
# of boot_data[4091] against baseline[4091]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4091, @function
attest_byte_4091:
    movzx eax, byte ptr [rdi + 4091]
    movzx r10d, byte ptr [rsi + 4091]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 10
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4091, .-attest_byte_4091

# ============================================
# Boot Byte Attestation - Position 4092
# Constant-time branchless validation
# of boot_data[4092] against baseline[4092]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4092, @function
attest_byte_4092:
    movzx eax, byte ptr [rdi + 4092]
    movzx r10d, byte ptr [rsi + 4092]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 11
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4092, .-attest_byte_4092

# ============================================
# Boot Byte Attestation - Position 4093
# Constant-time branchless validation
# of boot_data[4093] against baseline[4093]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4093, @function
attest_byte_4093:
    movzx eax, byte ptr [rdi + 4093]
    movzx r10d, byte ptr [rsi + 4093]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 12
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4093, .-attest_byte_4093

# ============================================
# Boot Byte Attestation - Position 4094
# Constant-time branchless validation
# of boot_data[4094] against baseline[4094]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4094, @function
attest_byte_4094:
    movzx eax, byte ptr [rdi + 4094]
    movzx r10d, byte ptr [rsi + 4094]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 13
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4094, .-attest_byte_4094

# ============================================
# Boot Byte Attestation - Position 4095
# Constant-time branchless validation
# of boot_data[4095] against baseline[4095]
# ============================================
# RDI = boot_data, RSI = baseline_data
# RDX = hash_accum ptr, RCX = histogram ptr
# Returns: EAX = 1 (match) or 0 (mismatch)
.type attest_byte_4095, @function
attest_byte_4095:
    movzx eax, byte ptr [rdi + 4095]
    movzx r10d, byte ptr [rsi + 4095]
    #
    # Update frequency histogram
    inc dword ptr [rcx + rax*4]
    #
    # Update rolling hash accumulator
    mov r11, qword ptr [rdx]
    xor r11d, eax
    rol r11, 1
    add r11, 0x9E3779B9
    mov qword ptr [rdx], r11
    #
    # Branchless comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
.size attest_byte_4095, .-attest_byte_4095

# ============================================
# Shannon Entropy Bin - Byte Value 0
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_000, @function
entropy_bin_000:
    mov eax, dword ptr [rdi + 0]
    test eax, eax
    jz .Lentropy_bin_000_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_000_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_000, .-entropy_bin_000

# ============================================
# Shannon Entropy Bin - Byte Value 1
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_001, @function
entropy_bin_001:
    mov eax, dword ptr [rdi + 4]
    test eax, eax
    jz .Lentropy_bin_001_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_001_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_001, .-entropy_bin_001

# ============================================
# Shannon Entropy Bin - Byte Value 2
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_002, @function
entropy_bin_002:
    mov eax, dword ptr [rdi + 8]
    test eax, eax
    jz .Lentropy_bin_002_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_002_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_002, .-entropy_bin_002

# ============================================
# Shannon Entropy Bin - Byte Value 3
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_003, @function
entropy_bin_003:
    mov eax, dword ptr [rdi + 12]
    test eax, eax
    jz .Lentropy_bin_003_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_003_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_003, .-entropy_bin_003

# ============================================
# Shannon Entropy Bin - Byte Value 4
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_004, @function
entropy_bin_004:
    mov eax, dword ptr [rdi + 16]
    test eax, eax
    jz .Lentropy_bin_004_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_004_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_004, .-entropy_bin_004

# ============================================
# Shannon Entropy Bin - Byte Value 5
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_005, @function
entropy_bin_005:
    mov eax, dword ptr [rdi + 20]
    test eax, eax
    jz .Lentropy_bin_005_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_005_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_005, .-entropy_bin_005

# ============================================
# Shannon Entropy Bin - Byte Value 6
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_006, @function
entropy_bin_006:
    mov eax, dword ptr [rdi + 24]
    test eax, eax
    jz .Lentropy_bin_006_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_006_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_006, .-entropy_bin_006

# ============================================
# Shannon Entropy Bin - Byte Value 7
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_007, @function
entropy_bin_007:
    mov eax, dword ptr [rdi + 28]
    test eax, eax
    jz .Lentropy_bin_007_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_007_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_007, .-entropy_bin_007

# ============================================
# Shannon Entropy Bin - Byte Value 8
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_008, @function
entropy_bin_008:
    mov eax, dword ptr [rdi + 32]
    test eax, eax
    jz .Lentropy_bin_008_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_008_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_008, .-entropy_bin_008

# ============================================
# Shannon Entropy Bin - Byte Value 9
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_009, @function
entropy_bin_009:
    mov eax, dword ptr [rdi + 36]
    test eax, eax
    jz .Lentropy_bin_009_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_009_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_009, .-entropy_bin_009

# ============================================
# Shannon Entropy Bin - Byte Value 10
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_010, @function
entropy_bin_010:
    mov eax, dword ptr [rdi + 40]
    test eax, eax
    jz .Lentropy_bin_010_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_010_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_010, .-entropy_bin_010

# ============================================
# Shannon Entropy Bin - Byte Value 11
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_011, @function
entropy_bin_011:
    mov eax, dword ptr [rdi + 44]
    test eax, eax
    jz .Lentropy_bin_011_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_011_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_011, .-entropy_bin_011

# ============================================
# Shannon Entropy Bin - Byte Value 12
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_012, @function
entropy_bin_012:
    mov eax, dword ptr [rdi + 48]
    test eax, eax
    jz .Lentropy_bin_012_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_012_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_012, .-entropy_bin_012

# ============================================
# Shannon Entropy Bin - Byte Value 13
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_013, @function
entropy_bin_013:
    mov eax, dword ptr [rdi + 52]
    test eax, eax
    jz .Lentropy_bin_013_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_013_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_013, .-entropy_bin_013

# ============================================
# Shannon Entropy Bin - Byte Value 14
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_014, @function
entropy_bin_014:
    mov eax, dword ptr [rdi + 56]
    test eax, eax
    jz .Lentropy_bin_014_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_014_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_014, .-entropy_bin_014

# ============================================
# Shannon Entropy Bin - Byte Value 15
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_015, @function
entropy_bin_015:
    mov eax, dword ptr [rdi + 60]
    test eax, eax
    jz .Lentropy_bin_015_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_015_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_015, .-entropy_bin_015

# ============================================
# Shannon Entropy Bin - Byte Value 16
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_016, @function
entropy_bin_016:
    mov eax, dword ptr [rdi + 64]
    test eax, eax
    jz .Lentropy_bin_016_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_016_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_016, .-entropy_bin_016

# ============================================
# Shannon Entropy Bin - Byte Value 17
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_017, @function
entropy_bin_017:
    mov eax, dword ptr [rdi + 68]
    test eax, eax
    jz .Lentropy_bin_017_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_017_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_017, .-entropy_bin_017

# ============================================
# Shannon Entropy Bin - Byte Value 18
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_018, @function
entropy_bin_018:
    mov eax, dword ptr [rdi + 72]
    test eax, eax
    jz .Lentropy_bin_018_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_018_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_018, .-entropy_bin_018

# ============================================
# Shannon Entropy Bin - Byte Value 19
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_019, @function
entropy_bin_019:
    mov eax, dword ptr [rdi + 76]
    test eax, eax
    jz .Lentropy_bin_019_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_019_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_019, .-entropy_bin_019

# ============================================
# Shannon Entropy Bin - Byte Value 20
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_020, @function
entropy_bin_020:
    mov eax, dword ptr [rdi + 80]
    test eax, eax
    jz .Lentropy_bin_020_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_020_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_020, .-entropy_bin_020

# ============================================
# Shannon Entropy Bin - Byte Value 21
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_021, @function
entropy_bin_021:
    mov eax, dword ptr [rdi + 84]
    test eax, eax
    jz .Lentropy_bin_021_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_021_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_021, .-entropy_bin_021

# ============================================
# Shannon Entropy Bin - Byte Value 22
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_022, @function
entropy_bin_022:
    mov eax, dword ptr [rdi + 88]
    test eax, eax
    jz .Lentropy_bin_022_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_022_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_022, .-entropy_bin_022

# ============================================
# Shannon Entropy Bin - Byte Value 23
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_023, @function
entropy_bin_023:
    mov eax, dword ptr [rdi + 92]
    test eax, eax
    jz .Lentropy_bin_023_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_023_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_023, .-entropy_bin_023

# ============================================
# Shannon Entropy Bin - Byte Value 24
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_024, @function
entropy_bin_024:
    mov eax, dword ptr [rdi + 96]
    test eax, eax
    jz .Lentropy_bin_024_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_024_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_024, .-entropy_bin_024

# ============================================
# Shannon Entropy Bin - Byte Value 25
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_025, @function
entropy_bin_025:
    mov eax, dword ptr [rdi + 100]
    test eax, eax
    jz .Lentropy_bin_025_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_025_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_025, .-entropy_bin_025

# ============================================
# Shannon Entropy Bin - Byte Value 26
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_026, @function
entropy_bin_026:
    mov eax, dword ptr [rdi + 104]
    test eax, eax
    jz .Lentropy_bin_026_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_026_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_026, .-entropy_bin_026

# ============================================
# Shannon Entropy Bin - Byte Value 27
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_027, @function
entropy_bin_027:
    mov eax, dword ptr [rdi + 108]
    test eax, eax
    jz .Lentropy_bin_027_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_027_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_027, .-entropy_bin_027

# ============================================
# Shannon Entropy Bin - Byte Value 28
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_028, @function
entropy_bin_028:
    mov eax, dword ptr [rdi + 112]
    test eax, eax
    jz .Lentropy_bin_028_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_028_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_028, .-entropy_bin_028

# ============================================
# Shannon Entropy Bin - Byte Value 29
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_029, @function
entropy_bin_029:
    mov eax, dword ptr [rdi + 116]
    test eax, eax
    jz .Lentropy_bin_029_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_029_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_029, .-entropy_bin_029

# ============================================
# Shannon Entropy Bin - Byte Value 30
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_030, @function
entropy_bin_030:
    mov eax, dword ptr [rdi + 120]
    test eax, eax
    jz .Lentropy_bin_030_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_030_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_030, .-entropy_bin_030

# ============================================
# Shannon Entropy Bin - Byte Value 31
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_031, @function
entropy_bin_031:
    mov eax, dword ptr [rdi + 124]
    test eax, eax
    jz .Lentropy_bin_031_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_031_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_031, .-entropy_bin_031

# ============================================
# Shannon Entropy Bin - Byte Value 32
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_032, @function
entropy_bin_032:
    mov eax, dword ptr [rdi + 128]
    test eax, eax
    jz .Lentropy_bin_032_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_032_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_032, .-entropy_bin_032

# ============================================
# Shannon Entropy Bin - Byte Value 33
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_033, @function
entropy_bin_033:
    mov eax, dword ptr [rdi + 132]
    test eax, eax
    jz .Lentropy_bin_033_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_033_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_033, .-entropy_bin_033

# ============================================
# Shannon Entropy Bin - Byte Value 34
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_034, @function
entropy_bin_034:
    mov eax, dword ptr [rdi + 136]
    test eax, eax
    jz .Lentropy_bin_034_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_034_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_034, .-entropy_bin_034

# ============================================
# Shannon Entropy Bin - Byte Value 35
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_035, @function
entropy_bin_035:
    mov eax, dword ptr [rdi + 140]
    test eax, eax
    jz .Lentropy_bin_035_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_035_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_035, .-entropy_bin_035

# ============================================
# Shannon Entropy Bin - Byte Value 36
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_036, @function
entropy_bin_036:
    mov eax, dword ptr [rdi + 144]
    test eax, eax
    jz .Lentropy_bin_036_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_036_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_036, .-entropy_bin_036

# ============================================
# Shannon Entropy Bin - Byte Value 37
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_037, @function
entropy_bin_037:
    mov eax, dword ptr [rdi + 148]
    test eax, eax
    jz .Lentropy_bin_037_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_037_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_037, .-entropy_bin_037

# ============================================
# Shannon Entropy Bin - Byte Value 38
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_038, @function
entropy_bin_038:
    mov eax, dword ptr [rdi + 152]
    test eax, eax
    jz .Lentropy_bin_038_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_038_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_038, .-entropy_bin_038

# ============================================
# Shannon Entropy Bin - Byte Value 39
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_039, @function
entropy_bin_039:
    mov eax, dword ptr [rdi + 156]
    test eax, eax
    jz .Lentropy_bin_039_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_039_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_039, .-entropy_bin_039

# ============================================
# Shannon Entropy Bin - Byte Value 40
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_040, @function
entropy_bin_040:
    mov eax, dword ptr [rdi + 160]
    test eax, eax
    jz .Lentropy_bin_040_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_040_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_040, .-entropy_bin_040

# ============================================
# Shannon Entropy Bin - Byte Value 41
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_041, @function
entropy_bin_041:
    mov eax, dword ptr [rdi + 164]
    test eax, eax
    jz .Lentropy_bin_041_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_041_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_041, .-entropy_bin_041

# ============================================
# Shannon Entropy Bin - Byte Value 42
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_042, @function
entropy_bin_042:
    mov eax, dword ptr [rdi + 168]
    test eax, eax
    jz .Lentropy_bin_042_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_042_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_042, .-entropy_bin_042

# ============================================
# Shannon Entropy Bin - Byte Value 43
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_043, @function
entropy_bin_043:
    mov eax, dword ptr [rdi + 172]
    test eax, eax
    jz .Lentropy_bin_043_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_043_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_043, .-entropy_bin_043

# ============================================
# Shannon Entropy Bin - Byte Value 44
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_044, @function
entropy_bin_044:
    mov eax, dword ptr [rdi + 176]
    test eax, eax
    jz .Lentropy_bin_044_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_044_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_044, .-entropy_bin_044

# ============================================
# Shannon Entropy Bin - Byte Value 45
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_045, @function
entropy_bin_045:
    mov eax, dword ptr [rdi + 180]
    test eax, eax
    jz .Lentropy_bin_045_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_045_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_045, .-entropy_bin_045

# ============================================
# Shannon Entropy Bin - Byte Value 46
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_046, @function
entropy_bin_046:
    mov eax, dword ptr [rdi + 184]
    test eax, eax
    jz .Lentropy_bin_046_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_046_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_046, .-entropy_bin_046

# ============================================
# Shannon Entropy Bin - Byte Value 47
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_047, @function
entropy_bin_047:
    mov eax, dword ptr [rdi + 188]
    test eax, eax
    jz .Lentropy_bin_047_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_047_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_047, .-entropy_bin_047

# ============================================
# Shannon Entropy Bin - Byte Value 48
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_048, @function
entropy_bin_048:
    mov eax, dword ptr [rdi + 192]
    test eax, eax
    jz .Lentropy_bin_048_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_048_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_048, .-entropy_bin_048

# ============================================
# Shannon Entropy Bin - Byte Value 49
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_049, @function
entropy_bin_049:
    mov eax, dword ptr [rdi + 196]
    test eax, eax
    jz .Lentropy_bin_049_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_049_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_049, .-entropy_bin_049

# ============================================
# Shannon Entropy Bin - Byte Value 50
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_050, @function
entropy_bin_050:
    mov eax, dword ptr [rdi + 200]
    test eax, eax
    jz .Lentropy_bin_050_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_050_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_050, .-entropy_bin_050

# ============================================
# Shannon Entropy Bin - Byte Value 51
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_051, @function
entropy_bin_051:
    mov eax, dword ptr [rdi + 204]
    test eax, eax
    jz .Lentropy_bin_051_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_051_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_051, .-entropy_bin_051

# ============================================
# Shannon Entropy Bin - Byte Value 52
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_052, @function
entropy_bin_052:
    mov eax, dword ptr [rdi + 208]
    test eax, eax
    jz .Lentropy_bin_052_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_052_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_052, .-entropy_bin_052

# ============================================
# Shannon Entropy Bin - Byte Value 53
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_053, @function
entropy_bin_053:
    mov eax, dword ptr [rdi + 212]
    test eax, eax
    jz .Lentropy_bin_053_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_053_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_053, .-entropy_bin_053

# ============================================
# Shannon Entropy Bin - Byte Value 54
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_054, @function
entropy_bin_054:
    mov eax, dword ptr [rdi + 216]
    test eax, eax
    jz .Lentropy_bin_054_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_054_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_054, .-entropy_bin_054

# ============================================
# Shannon Entropy Bin - Byte Value 55
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_055, @function
entropy_bin_055:
    mov eax, dword ptr [rdi + 220]
    test eax, eax
    jz .Lentropy_bin_055_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_055_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_055, .-entropy_bin_055

# ============================================
# Shannon Entropy Bin - Byte Value 56
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_056, @function
entropy_bin_056:
    mov eax, dword ptr [rdi + 224]
    test eax, eax
    jz .Lentropy_bin_056_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_056_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_056, .-entropy_bin_056

# ============================================
# Shannon Entropy Bin - Byte Value 57
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_057, @function
entropy_bin_057:
    mov eax, dword ptr [rdi + 228]
    test eax, eax
    jz .Lentropy_bin_057_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_057_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_057, .-entropy_bin_057

# ============================================
# Shannon Entropy Bin - Byte Value 58
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_058, @function
entropy_bin_058:
    mov eax, dword ptr [rdi + 232]
    test eax, eax
    jz .Lentropy_bin_058_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_058_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_058, .-entropy_bin_058

# ============================================
# Shannon Entropy Bin - Byte Value 59
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_059, @function
entropy_bin_059:
    mov eax, dword ptr [rdi + 236]
    test eax, eax
    jz .Lentropy_bin_059_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_059_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_059, .-entropy_bin_059

# ============================================
# Shannon Entropy Bin - Byte Value 60
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_060, @function
entropy_bin_060:
    mov eax, dword ptr [rdi + 240]
    test eax, eax
    jz .Lentropy_bin_060_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_060_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_060, .-entropy_bin_060

# ============================================
# Shannon Entropy Bin - Byte Value 61
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_061, @function
entropy_bin_061:
    mov eax, dword ptr [rdi + 244]
    test eax, eax
    jz .Lentropy_bin_061_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_061_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_061, .-entropy_bin_061

# ============================================
# Shannon Entropy Bin - Byte Value 62
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_062, @function
entropy_bin_062:
    mov eax, dword ptr [rdi + 248]
    test eax, eax
    jz .Lentropy_bin_062_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_062_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_062, .-entropy_bin_062

# ============================================
# Shannon Entropy Bin - Byte Value 63
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_063, @function
entropy_bin_063:
    mov eax, dword ptr [rdi + 252]
    test eax, eax
    jz .Lentropy_bin_063_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_063_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_063, .-entropy_bin_063

# ============================================
# Shannon Entropy Bin - Byte Value 64
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_064, @function
entropy_bin_064:
    mov eax, dword ptr [rdi + 256]
    test eax, eax
    jz .Lentropy_bin_064_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_064_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_064, .-entropy_bin_064

# ============================================
# Shannon Entropy Bin - Byte Value 65
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_065, @function
entropy_bin_065:
    mov eax, dword ptr [rdi + 260]
    test eax, eax
    jz .Lentropy_bin_065_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_065_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_065, .-entropy_bin_065

# ============================================
# Shannon Entropy Bin - Byte Value 66
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_066, @function
entropy_bin_066:
    mov eax, dword ptr [rdi + 264]
    test eax, eax
    jz .Lentropy_bin_066_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_066_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_066, .-entropy_bin_066

# ============================================
# Shannon Entropy Bin - Byte Value 67
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_067, @function
entropy_bin_067:
    mov eax, dword ptr [rdi + 268]
    test eax, eax
    jz .Lentropy_bin_067_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_067_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_067, .-entropy_bin_067

# ============================================
# Shannon Entropy Bin - Byte Value 68
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_068, @function
entropy_bin_068:
    mov eax, dword ptr [rdi + 272]
    test eax, eax
    jz .Lentropy_bin_068_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_068_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_068, .-entropy_bin_068

# ============================================
# Shannon Entropy Bin - Byte Value 69
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_069, @function
entropy_bin_069:
    mov eax, dword ptr [rdi + 276]
    test eax, eax
    jz .Lentropy_bin_069_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_069_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_069, .-entropy_bin_069

# ============================================
# Shannon Entropy Bin - Byte Value 70
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_070, @function
entropy_bin_070:
    mov eax, dword ptr [rdi + 280]
    test eax, eax
    jz .Lentropy_bin_070_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_070_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_070, .-entropy_bin_070

# ============================================
# Shannon Entropy Bin - Byte Value 71
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_071, @function
entropy_bin_071:
    mov eax, dword ptr [rdi + 284]
    test eax, eax
    jz .Lentropy_bin_071_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_071_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_071, .-entropy_bin_071

# ============================================
# Shannon Entropy Bin - Byte Value 72
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_072, @function
entropy_bin_072:
    mov eax, dword ptr [rdi + 288]
    test eax, eax
    jz .Lentropy_bin_072_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_072_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_072, .-entropy_bin_072

# ============================================
# Shannon Entropy Bin - Byte Value 73
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_073, @function
entropy_bin_073:
    mov eax, dword ptr [rdi + 292]
    test eax, eax
    jz .Lentropy_bin_073_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_073_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_073, .-entropy_bin_073

# ============================================
# Shannon Entropy Bin - Byte Value 74
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_074, @function
entropy_bin_074:
    mov eax, dword ptr [rdi + 296]
    test eax, eax
    jz .Lentropy_bin_074_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_074_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_074, .-entropy_bin_074

# ============================================
# Shannon Entropy Bin - Byte Value 75
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_075, @function
entropy_bin_075:
    mov eax, dword ptr [rdi + 300]
    test eax, eax
    jz .Lentropy_bin_075_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_075_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_075, .-entropy_bin_075

# ============================================
# Shannon Entropy Bin - Byte Value 76
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_076, @function
entropy_bin_076:
    mov eax, dword ptr [rdi + 304]
    test eax, eax
    jz .Lentropy_bin_076_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_076_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_076, .-entropy_bin_076

# ============================================
# Shannon Entropy Bin - Byte Value 77
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_077, @function
entropy_bin_077:
    mov eax, dword ptr [rdi + 308]
    test eax, eax
    jz .Lentropy_bin_077_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_077_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_077, .-entropy_bin_077

# ============================================
# Shannon Entropy Bin - Byte Value 78
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_078, @function
entropy_bin_078:
    mov eax, dword ptr [rdi + 312]
    test eax, eax
    jz .Lentropy_bin_078_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_078_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_078, .-entropy_bin_078

# ============================================
# Shannon Entropy Bin - Byte Value 79
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_079, @function
entropy_bin_079:
    mov eax, dword ptr [rdi + 316]
    test eax, eax
    jz .Lentropy_bin_079_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_079_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_079, .-entropy_bin_079

# ============================================
# Shannon Entropy Bin - Byte Value 80
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_080, @function
entropy_bin_080:
    mov eax, dword ptr [rdi + 320]
    test eax, eax
    jz .Lentropy_bin_080_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_080_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_080, .-entropy_bin_080

# ============================================
# Shannon Entropy Bin - Byte Value 81
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_081, @function
entropy_bin_081:
    mov eax, dword ptr [rdi + 324]
    test eax, eax
    jz .Lentropy_bin_081_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_081_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_081, .-entropy_bin_081

# ============================================
# Shannon Entropy Bin - Byte Value 82
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_082, @function
entropy_bin_082:
    mov eax, dword ptr [rdi + 328]
    test eax, eax
    jz .Lentropy_bin_082_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_082_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_082, .-entropy_bin_082

# ============================================
# Shannon Entropy Bin - Byte Value 83
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_083, @function
entropy_bin_083:
    mov eax, dword ptr [rdi + 332]
    test eax, eax
    jz .Lentropy_bin_083_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_083_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_083, .-entropy_bin_083

# ============================================
# Shannon Entropy Bin - Byte Value 84
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_084, @function
entropy_bin_084:
    mov eax, dword ptr [rdi + 336]
    test eax, eax
    jz .Lentropy_bin_084_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_084_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_084, .-entropy_bin_084

# ============================================
# Shannon Entropy Bin - Byte Value 85
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_085, @function
entropy_bin_085:
    mov eax, dword ptr [rdi + 340]
    test eax, eax
    jz .Lentropy_bin_085_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_085_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_085, .-entropy_bin_085

# ============================================
# Shannon Entropy Bin - Byte Value 86
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_086, @function
entropy_bin_086:
    mov eax, dword ptr [rdi + 344]
    test eax, eax
    jz .Lentropy_bin_086_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_086_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_086, .-entropy_bin_086

# ============================================
# Shannon Entropy Bin - Byte Value 87
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_087, @function
entropy_bin_087:
    mov eax, dword ptr [rdi + 348]
    test eax, eax
    jz .Lentropy_bin_087_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_087_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_087, .-entropy_bin_087

# ============================================
# Shannon Entropy Bin - Byte Value 88
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_088, @function
entropy_bin_088:
    mov eax, dword ptr [rdi + 352]
    test eax, eax
    jz .Lentropy_bin_088_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_088_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_088, .-entropy_bin_088

# ============================================
# Shannon Entropy Bin - Byte Value 89
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_089, @function
entropy_bin_089:
    mov eax, dword ptr [rdi + 356]
    test eax, eax
    jz .Lentropy_bin_089_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_089_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_089, .-entropy_bin_089

# ============================================
# Shannon Entropy Bin - Byte Value 90
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_090, @function
entropy_bin_090:
    mov eax, dword ptr [rdi + 360]
    test eax, eax
    jz .Lentropy_bin_090_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_090_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_090, .-entropy_bin_090

# ============================================
# Shannon Entropy Bin - Byte Value 91
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_091, @function
entropy_bin_091:
    mov eax, dword ptr [rdi + 364]
    test eax, eax
    jz .Lentropy_bin_091_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_091_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_091, .-entropy_bin_091

# ============================================
# Shannon Entropy Bin - Byte Value 92
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_092, @function
entropy_bin_092:
    mov eax, dword ptr [rdi + 368]
    test eax, eax
    jz .Lentropy_bin_092_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_092_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_092, .-entropy_bin_092

# ============================================
# Shannon Entropy Bin - Byte Value 93
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_093, @function
entropy_bin_093:
    mov eax, dword ptr [rdi + 372]
    test eax, eax
    jz .Lentropy_bin_093_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_093_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_093, .-entropy_bin_093

# ============================================
# Shannon Entropy Bin - Byte Value 94
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_094, @function
entropy_bin_094:
    mov eax, dword ptr [rdi + 376]
    test eax, eax
    jz .Lentropy_bin_094_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_094_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_094, .-entropy_bin_094

# ============================================
# Shannon Entropy Bin - Byte Value 95
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_095, @function
entropy_bin_095:
    mov eax, dword ptr [rdi + 380]
    test eax, eax
    jz .Lentropy_bin_095_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_095_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_095, .-entropy_bin_095

# ============================================
# Shannon Entropy Bin - Byte Value 96
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_096, @function
entropy_bin_096:
    mov eax, dword ptr [rdi + 384]
    test eax, eax
    jz .Lentropy_bin_096_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_096_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_096, .-entropy_bin_096

# ============================================
# Shannon Entropy Bin - Byte Value 97
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_097, @function
entropy_bin_097:
    mov eax, dword ptr [rdi + 388]
    test eax, eax
    jz .Lentropy_bin_097_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_097_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_097, .-entropy_bin_097

# ============================================
# Shannon Entropy Bin - Byte Value 98
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_098, @function
entropy_bin_098:
    mov eax, dword ptr [rdi + 392]
    test eax, eax
    jz .Lentropy_bin_098_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_098_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_098, .-entropy_bin_098

# ============================================
# Shannon Entropy Bin - Byte Value 99
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_099, @function
entropy_bin_099:
    mov eax, dword ptr [rdi + 396]
    test eax, eax
    jz .Lentropy_bin_099_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_099_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_099, .-entropy_bin_099

# ============================================
# Shannon Entropy Bin - Byte Value 100
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_100, @function
entropy_bin_100:
    mov eax, dword ptr [rdi + 400]
    test eax, eax
    jz .Lentropy_bin_100_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_100_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_100, .-entropy_bin_100

# ============================================
# Shannon Entropy Bin - Byte Value 101
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_101, @function
entropy_bin_101:
    mov eax, dword ptr [rdi + 404]
    test eax, eax
    jz .Lentropy_bin_101_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_101_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_101, .-entropy_bin_101

# ============================================
# Shannon Entropy Bin - Byte Value 102
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_102, @function
entropy_bin_102:
    mov eax, dword ptr [rdi + 408]
    test eax, eax
    jz .Lentropy_bin_102_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_102_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_102, .-entropy_bin_102

# ============================================
# Shannon Entropy Bin - Byte Value 103
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_103, @function
entropy_bin_103:
    mov eax, dword ptr [rdi + 412]
    test eax, eax
    jz .Lentropy_bin_103_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_103_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_103, .-entropy_bin_103

# ============================================
# Shannon Entropy Bin - Byte Value 104
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_104, @function
entropy_bin_104:
    mov eax, dword ptr [rdi + 416]
    test eax, eax
    jz .Lentropy_bin_104_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_104_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_104, .-entropy_bin_104

# ============================================
# Shannon Entropy Bin - Byte Value 105
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_105, @function
entropy_bin_105:
    mov eax, dword ptr [rdi + 420]
    test eax, eax
    jz .Lentropy_bin_105_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_105_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_105, .-entropy_bin_105

# ============================================
# Shannon Entropy Bin - Byte Value 106
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_106, @function
entropy_bin_106:
    mov eax, dword ptr [rdi + 424]
    test eax, eax
    jz .Lentropy_bin_106_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_106_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_106, .-entropy_bin_106

# ============================================
# Shannon Entropy Bin - Byte Value 107
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_107, @function
entropy_bin_107:
    mov eax, dword ptr [rdi + 428]
    test eax, eax
    jz .Lentropy_bin_107_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_107_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_107, .-entropy_bin_107

# ============================================
# Shannon Entropy Bin - Byte Value 108
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_108, @function
entropy_bin_108:
    mov eax, dword ptr [rdi + 432]
    test eax, eax
    jz .Lentropy_bin_108_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_108_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_108, .-entropy_bin_108

# ============================================
# Shannon Entropy Bin - Byte Value 109
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_109, @function
entropy_bin_109:
    mov eax, dword ptr [rdi + 436]
    test eax, eax
    jz .Lentropy_bin_109_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_109_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_109, .-entropy_bin_109

# ============================================
# Shannon Entropy Bin - Byte Value 110
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_110, @function
entropy_bin_110:
    mov eax, dword ptr [rdi + 440]
    test eax, eax
    jz .Lentropy_bin_110_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_110_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_110, .-entropy_bin_110

# ============================================
# Shannon Entropy Bin - Byte Value 111
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_111, @function
entropy_bin_111:
    mov eax, dword ptr [rdi + 444]
    test eax, eax
    jz .Lentropy_bin_111_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_111_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_111, .-entropy_bin_111

# ============================================
# Shannon Entropy Bin - Byte Value 112
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_112, @function
entropy_bin_112:
    mov eax, dword ptr [rdi + 448]
    test eax, eax
    jz .Lentropy_bin_112_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_112_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_112, .-entropy_bin_112

# ============================================
# Shannon Entropy Bin - Byte Value 113
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_113, @function
entropy_bin_113:
    mov eax, dword ptr [rdi + 452]
    test eax, eax
    jz .Lentropy_bin_113_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_113_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_113, .-entropy_bin_113

# ============================================
# Shannon Entropy Bin - Byte Value 114
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_114, @function
entropy_bin_114:
    mov eax, dword ptr [rdi + 456]
    test eax, eax
    jz .Lentropy_bin_114_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_114_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_114, .-entropy_bin_114

# ============================================
# Shannon Entropy Bin - Byte Value 115
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_115, @function
entropy_bin_115:
    mov eax, dword ptr [rdi + 460]
    test eax, eax
    jz .Lentropy_bin_115_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_115_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_115, .-entropy_bin_115

# ============================================
# Shannon Entropy Bin - Byte Value 116
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_116, @function
entropy_bin_116:
    mov eax, dword ptr [rdi + 464]
    test eax, eax
    jz .Lentropy_bin_116_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_116_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_116, .-entropy_bin_116

# ============================================
# Shannon Entropy Bin - Byte Value 117
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_117, @function
entropy_bin_117:
    mov eax, dword ptr [rdi + 468]
    test eax, eax
    jz .Lentropy_bin_117_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_117_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_117, .-entropy_bin_117

# ============================================
# Shannon Entropy Bin - Byte Value 118
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_118, @function
entropy_bin_118:
    mov eax, dword ptr [rdi + 472]
    test eax, eax
    jz .Lentropy_bin_118_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_118_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_118, .-entropy_bin_118

# ============================================
# Shannon Entropy Bin - Byte Value 119
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_119, @function
entropy_bin_119:
    mov eax, dword ptr [rdi + 476]
    test eax, eax
    jz .Lentropy_bin_119_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_119_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_119, .-entropy_bin_119

# ============================================
# Shannon Entropy Bin - Byte Value 120
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_120, @function
entropy_bin_120:
    mov eax, dword ptr [rdi + 480]
    test eax, eax
    jz .Lentropy_bin_120_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_120_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_120, .-entropy_bin_120

# ============================================
# Shannon Entropy Bin - Byte Value 121
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_121, @function
entropy_bin_121:
    mov eax, dword ptr [rdi + 484]
    test eax, eax
    jz .Lentropy_bin_121_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_121_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_121, .-entropy_bin_121

# ============================================
# Shannon Entropy Bin - Byte Value 122
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_122, @function
entropy_bin_122:
    mov eax, dword ptr [rdi + 488]
    test eax, eax
    jz .Lentropy_bin_122_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_122_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_122, .-entropy_bin_122

# ============================================
# Shannon Entropy Bin - Byte Value 123
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_123, @function
entropy_bin_123:
    mov eax, dword ptr [rdi + 492]
    test eax, eax
    jz .Lentropy_bin_123_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_123_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_123, .-entropy_bin_123

# ============================================
# Shannon Entropy Bin - Byte Value 124
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_124, @function
entropy_bin_124:
    mov eax, dword ptr [rdi + 496]
    test eax, eax
    jz .Lentropy_bin_124_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_124_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_124, .-entropy_bin_124

# ============================================
# Shannon Entropy Bin - Byte Value 125
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_125, @function
entropy_bin_125:
    mov eax, dword ptr [rdi + 500]
    test eax, eax
    jz .Lentropy_bin_125_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_125_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_125, .-entropy_bin_125

# ============================================
# Shannon Entropy Bin - Byte Value 126
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_126, @function
entropy_bin_126:
    mov eax, dword ptr [rdi + 504]
    test eax, eax
    jz .Lentropy_bin_126_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_126_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_126, .-entropy_bin_126

# ============================================
# Shannon Entropy Bin - Byte Value 127
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_127, @function
entropy_bin_127:
    mov eax, dword ptr [rdi + 508]
    test eax, eax
    jz .Lentropy_bin_127_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_127_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_127, .-entropy_bin_127

# ============================================
# Shannon Entropy Bin - Byte Value 128
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_128, @function
entropy_bin_128:
    mov eax, dword ptr [rdi + 512]
    test eax, eax
    jz .Lentropy_bin_128_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_128_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_128, .-entropy_bin_128

# ============================================
# Shannon Entropy Bin - Byte Value 129
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_129, @function
entropy_bin_129:
    mov eax, dword ptr [rdi + 516]
    test eax, eax
    jz .Lentropy_bin_129_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_129_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_129, .-entropy_bin_129

# ============================================
# Shannon Entropy Bin - Byte Value 130
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_130, @function
entropy_bin_130:
    mov eax, dword ptr [rdi + 520]
    test eax, eax
    jz .Lentropy_bin_130_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_130_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_130, .-entropy_bin_130

# ============================================
# Shannon Entropy Bin - Byte Value 131
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_131, @function
entropy_bin_131:
    mov eax, dword ptr [rdi + 524]
    test eax, eax
    jz .Lentropy_bin_131_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_131_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_131, .-entropy_bin_131

# ============================================
# Shannon Entropy Bin - Byte Value 132
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_132, @function
entropy_bin_132:
    mov eax, dword ptr [rdi + 528]
    test eax, eax
    jz .Lentropy_bin_132_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_132_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_132, .-entropy_bin_132

# ============================================
# Shannon Entropy Bin - Byte Value 133
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_133, @function
entropy_bin_133:
    mov eax, dword ptr [rdi + 532]
    test eax, eax
    jz .Lentropy_bin_133_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_133_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_133, .-entropy_bin_133

# ============================================
# Shannon Entropy Bin - Byte Value 134
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_134, @function
entropy_bin_134:
    mov eax, dword ptr [rdi + 536]
    test eax, eax
    jz .Lentropy_bin_134_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_134_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_134, .-entropy_bin_134

# ============================================
# Shannon Entropy Bin - Byte Value 135
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_135, @function
entropy_bin_135:
    mov eax, dword ptr [rdi + 540]
    test eax, eax
    jz .Lentropy_bin_135_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_135_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_135, .-entropy_bin_135

# ============================================
# Shannon Entropy Bin - Byte Value 136
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_136, @function
entropy_bin_136:
    mov eax, dword ptr [rdi + 544]
    test eax, eax
    jz .Lentropy_bin_136_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_136_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_136, .-entropy_bin_136

# ============================================
# Shannon Entropy Bin - Byte Value 137
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_137, @function
entropy_bin_137:
    mov eax, dword ptr [rdi + 548]
    test eax, eax
    jz .Lentropy_bin_137_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_137_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_137, .-entropy_bin_137

# ============================================
# Shannon Entropy Bin - Byte Value 138
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_138, @function
entropy_bin_138:
    mov eax, dword ptr [rdi + 552]
    test eax, eax
    jz .Lentropy_bin_138_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_138_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_138, .-entropy_bin_138

# ============================================
# Shannon Entropy Bin - Byte Value 139
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_139, @function
entropy_bin_139:
    mov eax, dword ptr [rdi + 556]
    test eax, eax
    jz .Lentropy_bin_139_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_139_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_139, .-entropy_bin_139

# ============================================
# Shannon Entropy Bin - Byte Value 140
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_140, @function
entropy_bin_140:
    mov eax, dword ptr [rdi + 560]
    test eax, eax
    jz .Lentropy_bin_140_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_140_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_140, .-entropy_bin_140

# ============================================
# Shannon Entropy Bin - Byte Value 141
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_141, @function
entropy_bin_141:
    mov eax, dword ptr [rdi + 564]
    test eax, eax
    jz .Lentropy_bin_141_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_141_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_141, .-entropy_bin_141

# ============================================
# Shannon Entropy Bin - Byte Value 142
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_142, @function
entropy_bin_142:
    mov eax, dword ptr [rdi + 568]
    test eax, eax
    jz .Lentropy_bin_142_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_142_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_142, .-entropy_bin_142

# ============================================
# Shannon Entropy Bin - Byte Value 143
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_143, @function
entropy_bin_143:
    mov eax, dword ptr [rdi + 572]
    test eax, eax
    jz .Lentropy_bin_143_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_143_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_143, .-entropy_bin_143

# ============================================
# Shannon Entropy Bin - Byte Value 144
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_144, @function
entropy_bin_144:
    mov eax, dword ptr [rdi + 576]
    test eax, eax
    jz .Lentropy_bin_144_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_144_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_144, .-entropy_bin_144

# ============================================
# Shannon Entropy Bin - Byte Value 145
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_145, @function
entropy_bin_145:
    mov eax, dword ptr [rdi + 580]
    test eax, eax
    jz .Lentropy_bin_145_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_145_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_145, .-entropy_bin_145

# ============================================
# Shannon Entropy Bin - Byte Value 146
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_146, @function
entropy_bin_146:
    mov eax, dword ptr [rdi + 584]
    test eax, eax
    jz .Lentropy_bin_146_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_146_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_146, .-entropy_bin_146

# ============================================
# Shannon Entropy Bin - Byte Value 147
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_147, @function
entropy_bin_147:
    mov eax, dword ptr [rdi + 588]
    test eax, eax
    jz .Lentropy_bin_147_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_147_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_147, .-entropy_bin_147

# ============================================
# Shannon Entropy Bin - Byte Value 148
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_148, @function
entropy_bin_148:
    mov eax, dword ptr [rdi + 592]
    test eax, eax
    jz .Lentropy_bin_148_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_148_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_148, .-entropy_bin_148

# ============================================
# Shannon Entropy Bin - Byte Value 149
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_149, @function
entropy_bin_149:
    mov eax, dword ptr [rdi + 596]
    test eax, eax
    jz .Lentropy_bin_149_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_149_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_149, .-entropy_bin_149

# ============================================
# Shannon Entropy Bin - Byte Value 150
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_150, @function
entropy_bin_150:
    mov eax, dword ptr [rdi + 600]
    test eax, eax
    jz .Lentropy_bin_150_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_150_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_150, .-entropy_bin_150

# ============================================
# Shannon Entropy Bin - Byte Value 151
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_151, @function
entropy_bin_151:
    mov eax, dword ptr [rdi + 604]
    test eax, eax
    jz .Lentropy_bin_151_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_151_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_151, .-entropy_bin_151

# ============================================
# Shannon Entropy Bin - Byte Value 152
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_152, @function
entropy_bin_152:
    mov eax, dword ptr [rdi + 608]
    test eax, eax
    jz .Lentropy_bin_152_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_152_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_152, .-entropy_bin_152

# ============================================
# Shannon Entropy Bin - Byte Value 153
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_153, @function
entropy_bin_153:
    mov eax, dword ptr [rdi + 612]
    test eax, eax
    jz .Lentropy_bin_153_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_153_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_153, .-entropy_bin_153

# ============================================
# Shannon Entropy Bin - Byte Value 154
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_154, @function
entropy_bin_154:
    mov eax, dword ptr [rdi + 616]
    test eax, eax
    jz .Lentropy_bin_154_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_154_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_154, .-entropy_bin_154

# ============================================
# Shannon Entropy Bin - Byte Value 155
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_155, @function
entropy_bin_155:
    mov eax, dword ptr [rdi + 620]
    test eax, eax
    jz .Lentropy_bin_155_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_155_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_155, .-entropy_bin_155

# ============================================
# Shannon Entropy Bin - Byte Value 156
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_156, @function
entropy_bin_156:
    mov eax, dword ptr [rdi + 624]
    test eax, eax
    jz .Lentropy_bin_156_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_156_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_156, .-entropy_bin_156

# ============================================
# Shannon Entropy Bin - Byte Value 157
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_157, @function
entropy_bin_157:
    mov eax, dword ptr [rdi + 628]
    test eax, eax
    jz .Lentropy_bin_157_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_157_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_157, .-entropy_bin_157

# ============================================
# Shannon Entropy Bin - Byte Value 158
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_158, @function
entropy_bin_158:
    mov eax, dword ptr [rdi + 632]
    test eax, eax
    jz .Lentropy_bin_158_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_158_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_158, .-entropy_bin_158

# ============================================
# Shannon Entropy Bin - Byte Value 159
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_159, @function
entropy_bin_159:
    mov eax, dword ptr [rdi + 636]
    test eax, eax
    jz .Lentropy_bin_159_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_159_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_159, .-entropy_bin_159

# ============================================
# Shannon Entropy Bin - Byte Value 160
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_160, @function
entropy_bin_160:
    mov eax, dword ptr [rdi + 640]
    test eax, eax
    jz .Lentropy_bin_160_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_160_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_160, .-entropy_bin_160

# ============================================
# Shannon Entropy Bin - Byte Value 161
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_161, @function
entropy_bin_161:
    mov eax, dword ptr [rdi + 644]
    test eax, eax
    jz .Lentropy_bin_161_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_161_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_161, .-entropy_bin_161

# ============================================
# Shannon Entropy Bin - Byte Value 162
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_162, @function
entropy_bin_162:
    mov eax, dword ptr [rdi + 648]
    test eax, eax
    jz .Lentropy_bin_162_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_162_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_162, .-entropy_bin_162

# ============================================
# Shannon Entropy Bin - Byte Value 163
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_163, @function
entropy_bin_163:
    mov eax, dword ptr [rdi + 652]
    test eax, eax
    jz .Lentropy_bin_163_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_163_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_163, .-entropy_bin_163

# ============================================
# Shannon Entropy Bin - Byte Value 164
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_164, @function
entropy_bin_164:
    mov eax, dword ptr [rdi + 656]
    test eax, eax
    jz .Lentropy_bin_164_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_164_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_164, .-entropy_bin_164

# ============================================
# Shannon Entropy Bin - Byte Value 165
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_165, @function
entropy_bin_165:
    mov eax, dword ptr [rdi + 660]
    test eax, eax
    jz .Lentropy_bin_165_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_165_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_165, .-entropy_bin_165

# ============================================
# Shannon Entropy Bin - Byte Value 166
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_166, @function
entropy_bin_166:
    mov eax, dword ptr [rdi + 664]
    test eax, eax
    jz .Lentropy_bin_166_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_166_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_166, .-entropy_bin_166

# ============================================
# Shannon Entropy Bin - Byte Value 167
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_167, @function
entropy_bin_167:
    mov eax, dword ptr [rdi + 668]
    test eax, eax
    jz .Lentropy_bin_167_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_167_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_167, .-entropy_bin_167

# ============================================
# Shannon Entropy Bin - Byte Value 168
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_168, @function
entropy_bin_168:
    mov eax, dword ptr [rdi + 672]
    test eax, eax
    jz .Lentropy_bin_168_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_168_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_168, .-entropy_bin_168

# ============================================
# Shannon Entropy Bin - Byte Value 169
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_169, @function
entropy_bin_169:
    mov eax, dword ptr [rdi + 676]
    test eax, eax
    jz .Lentropy_bin_169_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_169_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_169, .-entropy_bin_169

# ============================================
# Shannon Entropy Bin - Byte Value 170
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_170, @function
entropy_bin_170:
    mov eax, dword ptr [rdi + 680]
    test eax, eax
    jz .Lentropy_bin_170_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_170_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_170, .-entropy_bin_170

# ============================================
# Shannon Entropy Bin - Byte Value 171
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_171, @function
entropy_bin_171:
    mov eax, dword ptr [rdi + 684]
    test eax, eax
    jz .Lentropy_bin_171_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_171_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_171, .-entropy_bin_171

# ============================================
# Shannon Entropy Bin - Byte Value 172
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_172, @function
entropy_bin_172:
    mov eax, dword ptr [rdi + 688]
    test eax, eax
    jz .Lentropy_bin_172_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_172_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_172, .-entropy_bin_172

# ============================================
# Shannon Entropy Bin - Byte Value 173
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_173, @function
entropy_bin_173:
    mov eax, dword ptr [rdi + 692]
    test eax, eax
    jz .Lentropy_bin_173_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_173_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_173, .-entropy_bin_173

# ============================================
# Shannon Entropy Bin - Byte Value 174
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_174, @function
entropy_bin_174:
    mov eax, dword ptr [rdi + 696]
    test eax, eax
    jz .Lentropy_bin_174_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_174_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_174, .-entropy_bin_174

# ============================================
# Shannon Entropy Bin - Byte Value 175
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_175, @function
entropy_bin_175:
    mov eax, dword ptr [rdi + 700]
    test eax, eax
    jz .Lentropy_bin_175_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_175_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_175, .-entropy_bin_175

# ============================================
# Shannon Entropy Bin - Byte Value 176
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_176, @function
entropy_bin_176:
    mov eax, dword ptr [rdi + 704]
    test eax, eax
    jz .Lentropy_bin_176_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_176_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_176, .-entropy_bin_176

# ============================================
# Shannon Entropy Bin - Byte Value 177
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_177, @function
entropy_bin_177:
    mov eax, dword ptr [rdi + 708]
    test eax, eax
    jz .Lentropy_bin_177_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_177_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_177, .-entropy_bin_177

# ============================================
# Shannon Entropy Bin - Byte Value 178
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_178, @function
entropy_bin_178:
    mov eax, dword ptr [rdi + 712]
    test eax, eax
    jz .Lentropy_bin_178_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_178_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_178, .-entropy_bin_178

# ============================================
# Shannon Entropy Bin - Byte Value 179
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_179, @function
entropy_bin_179:
    mov eax, dword ptr [rdi + 716]
    test eax, eax
    jz .Lentropy_bin_179_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_179_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_179, .-entropy_bin_179

# ============================================
# Shannon Entropy Bin - Byte Value 180
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_180, @function
entropy_bin_180:
    mov eax, dword ptr [rdi + 720]
    test eax, eax
    jz .Lentropy_bin_180_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_180_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_180, .-entropy_bin_180

# ============================================
# Shannon Entropy Bin - Byte Value 181
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_181, @function
entropy_bin_181:
    mov eax, dword ptr [rdi + 724]
    test eax, eax
    jz .Lentropy_bin_181_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_181_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_181, .-entropy_bin_181

# ============================================
# Shannon Entropy Bin - Byte Value 182
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_182, @function
entropy_bin_182:
    mov eax, dword ptr [rdi + 728]
    test eax, eax
    jz .Lentropy_bin_182_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_182_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_182, .-entropy_bin_182

# ============================================
# Shannon Entropy Bin - Byte Value 183
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_183, @function
entropy_bin_183:
    mov eax, dword ptr [rdi + 732]
    test eax, eax
    jz .Lentropy_bin_183_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_183_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_183, .-entropy_bin_183

# ============================================
# Shannon Entropy Bin - Byte Value 184
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_184, @function
entropy_bin_184:
    mov eax, dword ptr [rdi + 736]
    test eax, eax
    jz .Lentropy_bin_184_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_184_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_184, .-entropy_bin_184

# ============================================
# Shannon Entropy Bin - Byte Value 185
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_185, @function
entropy_bin_185:
    mov eax, dword ptr [rdi + 740]
    test eax, eax
    jz .Lentropy_bin_185_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_185_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_185, .-entropy_bin_185

# ============================================
# Shannon Entropy Bin - Byte Value 186
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_186, @function
entropy_bin_186:
    mov eax, dword ptr [rdi + 744]
    test eax, eax
    jz .Lentropy_bin_186_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_186_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_186, .-entropy_bin_186

# ============================================
# Shannon Entropy Bin - Byte Value 187
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_187, @function
entropy_bin_187:
    mov eax, dword ptr [rdi + 748]
    test eax, eax
    jz .Lentropy_bin_187_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_187_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_187, .-entropy_bin_187

# ============================================
# Shannon Entropy Bin - Byte Value 188
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_188, @function
entropy_bin_188:
    mov eax, dword ptr [rdi + 752]
    test eax, eax
    jz .Lentropy_bin_188_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_188_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_188, .-entropy_bin_188

# ============================================
# Shannon Entropy Bin - Byte Value 189
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_189, @function
entropy_bin_189:
    mov eax, dword ptr [rdi + 756]
    test eax, eax
    jz .Lentropy_bin_189_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_189_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_189, .-entropy_bin_189

# ============================================
# Shannon Entropy Bin - Byte Value 190
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_190, @function
entropy_bin_190:
    mov eax, dword ptr [rdi + 760]
    test eax, eax
    jz .Lentropy_bin_190_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_190_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_190, .-entropy_bin_190

# ============================================
# Shannon Entropy Bin - Byte Value 191
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_191, @function
entropy_bin_191:
    mov eax, dword ptr [rdi + 764]
    test eax, eax
    jz .Lentropy_bin_191_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_191_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_191, .-entropy_bin_191

# ============================================
# Shannon Entropy Bin - Byte Value 192
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_192, @function
entropy_bin_192:
    mov eax, dword ptr [rdi + 768]
    test eax, eax
    jz .Lentropy_bin_192_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_192_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_192, .-entropy_bin_192

# ============================================
# Shannon Entropy Bin - Byte Value 193
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_193, @function
entropy_bin_193:
    mov eax, dword ptr [rdi + 772]
    test eax, eax
    jz .Lentropy_bin_193_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_193_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_193, .-entropy_bin_193

# ============================================
# Shannon Entropy Bin - Byte Value 194
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_194, @function
entropy_bin_194:
    mov eax, dword ptr [rdi + 776]
    test eax, eax
    jz .Lentropy_bin_194_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_194_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_194, .-entropy_bin_194

# ============================================
# Shannon Entropy Bin - Byte Value 195
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_195, @function
entropy_bin_195:
    mov eax, dword ptr [rdi + 780]
    test eax, eax
    jz .Lentropy_bin_195_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_195_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_195, .-entropy_bin_195

# ============================================
# Shannon Entropy Bin - Byte Value 196
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_196, @function
entropy_bin_196:
    mov eax, dword ptr [rdi + 784]
    test eax, eax
    jz .Lentropy_bin_196_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_196_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_196, .-entropy_bin_196

# ============================================
# Shannon Entropy Bin - Byte Value 197
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_197, @function
entropy_bin_197:
    mov eax, dword ptr [rdi + 788]
    test eax, eax
    jz .Lentropy_bin_197_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_197_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_197, .-entropy_bin_197

# ============================================
# Shannon Entropy Bin - Byte Value 198
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_198, @function
entropy_bin_198:
    mov eax, dword ptr [rdi + 792]
    test eax, eax
    jz .Lentropy_bin_198_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_198_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_198, .-entropy_bin_198

# ============================================
# Shannon Entropy Bin - Byte Value 199
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_199, @function
entropy_bin_199:
    mov eax, dword ptr [rdi + 796]
    test eax, eax
    jz .Lentropy_bin_199_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_199_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_199, .-entropy_bin_199

# ============================================
# Shannon Entropy Bin - Byte Value 200
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_200, @function
entropy_bin_200:
    mov eax, dword ptr [rdi + 800]
    test eax, eax
    jz .Lentropy_bin_200_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_200_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_200, .-entropy_bin_200

# ============================================
# Shannon Entropy Bin - Byte Value 201
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_201, @function
entropy_bin_201:
    mov eax, dword ptr [rdi + 804]
    test eax, eax
    jz .Lentropy_bin_201_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_201_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_201, .-entropy_bin_201

# ============================================
# Shannon Entropy Bin - Byte Value 202
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_202, @function
entropy_bin_202:
    mov eax, dword ptr [rdi + 808]
    test eax, eax
    jz .Lentropy_bin_202_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_202_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_202, .-entropy_bin_202

# ============================================
# Shannon Entropy Bin - Byte Value 203
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_203, @function
entropy_bin_203:
    mov eax, dword ptr [rdi + 812]
    test eax, eax
    jz .Lentropy_bin_203_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_203_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_203, .-entropy_bin_203

# ============================================
# Shannon Entropy Bin - Byte Value 204
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_204, @function
entropy_bin_204:
    mov eax, dword ptr [rdi + 816]
    test eax, eax
    jz .Lentropy_bin_204_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_204_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_204, .-entropy_bin_204

# ============================================
# Shannon Entropy Bin - Byte Value 205
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_205, @function
entropy_bin_205:
    mov eax, dword ptr [rdi + 820]
    test eax, eax
    jz .Lentropy_bin_205_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_205_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_205, .-entropy_bin_205

# ============================================
# Shannon Entropy Bin - Byte Value 206
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_206, @function
entropy_bin_206:
    mov eax, dword ptr [rdi + 824]
    test eax, eax
    jz .Lentropy_bin_206_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_206_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_206, .-entropy_bin_206

# ============================================
# Shannon Entropy Bin - Byte Value 207
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_207, @function
entropy_bin_207:
    mov eax, dword ptr [rdi + 828]
    test eax, eax
    jz .Lentropy_bin_207_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_207_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_207, .-entropy_bin_207

# ============================================
# Shannon Entropy Bin - Byte Value 208
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_208, @function
entropy_bin_208:
    mov eax, dword ptr [rdi + 832]
    test eax, eax
    jz .Lentropy_bin_208_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_208_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_208, .-entropy_bin_208

# ============================================
# Shannon Entropy Bin - Byte Value 209
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_209, @function
entropy_bin_209:
    mov eax, dword ptr [rdi + 836]
    test eax, eax
    jz .Lentropy_bin_209_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_209_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_209, .-entropy_bin_209

# ============================================
# Shannon Entropy Bin - Byte Value 210
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_210, @function
entropy_bin_210:
    mov eax, dword ptr [rdi + 840]
    test eax, eax
    jz .Lentropy_bin_210_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_210_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_210, .-entropy_bin_210

# ============================================
# Shannon Entropy Bin - Byte Value 211
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_211, @function
entropy_bin_211:
    mov eax, dword ptr [rdi + 844]
    test eax, eax
    jz .Lentropy_bin_211_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_211_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_211, .-entropy_bin_211

# ============================================
# Shannon Entropy Bin - Byte Value 212
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_212, @function
entropy_bin_212:
    mov eax, dword ptr [rdi + 848]
    test eax, eax
    jz .Lentropy_bin_212_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_212_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_212, .-entropy_bin_212

# ============================================
# Shannon Entropy Bin - Byte Value 213
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_213, @function
entropy_bin_213:
    mov eax, dword ptr [rdi + 852]
    test eax, eax
    jz .Lentropy_bin_213_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_213_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_213, .-entropy_bin_213

# ============================================
# Shannon Entropy Bin - Byte Value 214
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_214, @function
entropy_bin_214:
    mov eax, dword ptr [rdi + 856]
    test eax, eax
    jz .Lentropy_bin_214_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_214_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_214, .-entropy_bin_214

# ============================================
# Shannon Entropy Bin - Byte Value 215
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_215, @function
entropy_bin_215:
    mov eax, dword ptr [rdi + 860]
    test eax, eax
    jz .Lentropy_bin_215_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_215_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_215, .-entropy_bin_215

# ============================================
# Shannon Entropy Bin - Byte Value 216
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_216, @function
entropy_bin_216:
    mov eax, dword ptr [rdi + 864]
    test eax, eax
    jz .Lentropy_bin_216_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_216_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_216, .-entropy_bin_216

# ============================================
# Shannon Entropy Bin - Byte Value 217
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_217, @function
entropy_bin_217:
    mov eax, dword ptr [rdi + 868]
    test eax, eax
    jz .Lentropy_bin_217_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_217_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_217, .-entropy_bin_217

# ============================================
# Shannon Entropy Bin - Byte Value 218
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_218, @function
entropy_bin_218:
    mov eax, dword ptr [rdi + 872]
    test eax, eax
    jz .Lentropy_bin_218_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_218_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_218, .-entropy_bin_218

# ============================================
# Shannon Entropy Bin - Byte Value 219
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_219, @function
entropy_bin_219:
    mov eax, dword ptr [rdi + 876]
    test eax, eax
    jz .Lentropy_bin_219_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_219_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_219, .-entropy_bin_219

# ============================================
# Shannon Entropy Bin - Byte Value 220
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_220, @function
entropy_bin_220:
    mov eax, dword ptr [rdi + 880]
    test eax, eax
    jz .Lentropy_bin_220_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_220_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_220, .-entropy_bin_220

# ============================================
# Shannon Entropy Bin - Byte Value 221
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_221, @function
entropy_bin_221:
    mov eax, dword ptr [rdi + 884]
    test eax, eax
    jz .Lentropy_bin_221_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_221_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_221, .-entropy_bin_221

# ============================================
# Shannon Entropy Bin - Byte Value 222
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_222, @function
entropy_bin_222:
    mov eax, dword ptr [rdi + 888]
    test eax, eax
    jz .Lentropy_bin_222_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_222_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_222, .-entropy_bin_222

# ============================================
# Shannon Entropy Bin - Byte Value 223
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_223, @function
entropy_bin_223:
    mov eax, dword ptr [rdi + 892]
    test eax, eax
    jz .Lentropy_bin_223_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_223_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_223, .-entropy_bin_223

# ============================================
# Shannon Entropy Bin - Byte Value 224
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_224, @function
entropy_bin_224:
    mov eax, dword ptr [rdi + 896]
    test eax, eax
    jz .Lentropy_bin_224_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_224_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_224, .-entropy_bin_224

# ============================================
# Shannon Entropy Bin - Byte Value 225
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_225, @function
entropy_bin_225:
    mov eax, dword ptr [rdi + 900]
    test eax, eax
    jz .Lentropy_bin_225_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_225_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_225, .-entropy_bin_225

# ============================================
# Shannon Entropy Bin - Byte Value 226
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_226, @function
entropy_bin_226:
    mov eax, dword ptr [rdi + 904]
    test eax, eax
    jz .Lentropy_bin_226_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_226_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_226, .-entropy_bin_226

# ============================================
# Shannon Entropy Bin - Byte Value 227
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_227, @function
entropy_bin_227:
    mov eax, dword ptr [rdi + 908]
    test eax, eax
    jz .Lentropy_bin_227_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_227_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_227, .-entropy_bin_227

# ============================================
# Shannon Entropy Bin - Byte Value 228
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_228, @function
entropy_bin_228:
    mov eax, dword ptr [rdi + 912]
    test eax, eax
    jz .Lentropy_bin_228_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_228_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_228, .-entropy_bin_228

# ============================================
# Shannon Entropy Bin - Byte Value 229
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_229, @function
entropy_bin_229:
    mov eax, dword ptr [rdi + 916]
    test eax, eax
    jz .Lentropy_bin_229_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_229_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_229, .-entropy_bin_229

# ============================================
# Shannon Entropy Bin - Byte Value 230
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_230, @function
entropy_bin_230:
    mov eax, dword ptr [rdi + 920]
    test eax, eax
    jz .Lentropy_bin_230_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_230_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_230, .-entropy_bin_230

# ============================================
# Shannon Entropy Bin - Byte Value 231
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_231, @function
entropy_bin_231:
    mov eax, dword ptr [rdi + 924]
    test eax, eax
    jz .Lentropy_bin_231_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_231_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_231, .-entropy_bin_231

# ============================================
# Shannon Entropy Bin - Byte Value 232
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_232, @function
entropy_bin_232:
    mov eax, dword ptr [rdi + 928]
    test eax, eax
    jz .Lentropy_bin_232_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_232_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_232, .-entropy_bin_232

# ============================================
# Shannon Entropy Bin - Byte Value 233
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_233, @function
entropy_bin_233:
    mov eax, dword ptr [rdi + 932]
    test eax, eax
    jz .Lentropy_bin_233_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_233_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_233, .-entropy_bin_233

# ============================================
# Shannon Entropy Bin - Byte Value 234
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_234, @function
entropy_bin_234:
    mov eax, dword ptr [rdi + 936]
    test eax, eax
    jz .Lentropy_bin_234_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_234_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_234, .-entropy_bin_234

# ============================================
# Shannon Entropy Bin - Byte Value 235
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_235, @function
entropy_bin_235:
    mov eax, dword ptr [rdi + 940]
    test eax, eax
    jz .Lentropy_bin_235_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_235_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_235, .-entropy_bin_235

# ============================================
# Shannon Entropy Bin - Byte Value 236
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_236, @function
entropy_bin_236:
    mov eax, dword ptr [rdi + 944]
    test eax, eax
    jz .Lentropy_bin_236_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_236_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_236, .-entropy_bin_236

# ============================================
# Shannon Entropy Bin - Byte Value 237
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_237, @function
entropy_bin_237:
    mov eax, dword ptr [rdi + 948]
    test eax, eax
    jz .Lentropy_bin_237_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_237_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_237, .-entropy_bin_237

# ============================================
# Shannon Entropy Bin - Byte Value 238
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_238, @function
entropy_bin_238:
    mov eax, dword ptr [rdi + 952]
    test eax, eax
    jz .Lentropy_bin_238_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_238_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_238, .-entropy_bin_238

# ============================================
# Shannon Entropy Bin - Byte Value 239
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_239, @function
entropy_bin_239:
    mov eax, dword ptr [rdi + 956]
    test eax, eax
    jz .Lentropy_bin_239_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_239_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_239, .-entropy_bin_239

# ============================================
# Shannon Entropy Bin - Byte Value 240
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_240, @function
entropy_bin_240:
    mov eax, dword ptr [rdi + 960]
    test eax, eax
    jz .Lentropy_bin_240_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_240_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_240, .-entropy_bin_240

# ============================================
# Shannon Entropy Bin - Byte Value 241
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_241, @function
entropy_bin_241:
    mov eax, dword ptr [rdi + 964]
    test eax, eax
    jz .Lentropy_bin_241_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_241_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_241, .-entropy_bin_241

# ============================================
# Shannon Entropy Bin - Byte Value 242
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_242, @function
entropy_bin_242:
    mov eax, dword ptr [rdi + 968]
    test eax, eax
    jz .Lentropy_bin_242_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_242_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_242, .-entropy_bin_242

# ============================================
# Shannon Entropy Bin - Byte Value 243
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_243, @function
entropy_bin_243:
    mov eax, dword ptr [rdi + 972]
    test eax, eax
    jz .Lentropy_bin_243_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_243_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_243, .-entropy_bin_243

# ============================================
# Shannon Entropy Bin - Byte Value 244
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_244, @function
entropy_bin_244:
    mov eax, dword ptr [rdi + 976]
    test eax, eax
    jz .Lentropy_bin_244_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_244_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_244, .-entropy_bin_244

# ============================================
# Shannon Entropy Bin - Byte Value 245
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_245, @function
entropy_bin_245:
    mov eax, dword ptr [rdi + 980]
    test eax, eax
    jz .Lentropy_bin_245_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_245_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_245, .-entropy_bin_245

# ============================================
# Shannon Entropy Bin - Byte Value 246
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_246, @function
entropy_bin_246:
    mov eax, dword ptr [rdi + 984]
    test eax, eax
    jz .Lentropy_bin_246_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_246_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_246, .-entropy_bin_246

# ============================================
# Shannon Entropy Bin - Byte Value 247
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_247, @function
entropy_bin_247:
    mov eax, dword ptr [rdi + 988]
    test eax, eax
    jz .Lentropy_bin_247_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_247_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_247, .-entropy_bin_247

# ============================================
# Shannon Entropy Bin - Byte Value 248
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_248, @function
entropy_bin_248:
    mov eax, dword ptr [rdi + 992]
    test eax, eax
    jz .Lentropy_bin_248_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_248_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_248, .-entropy_bin_248

# ============================================
# Shannon Entropy Bin - Byte Value 249
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_249, @function
entropy_bin_249:
    mov eax, dword ptr [rdi + 996]
    test eax, eax
    jz .Lentropy_bin_249_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_249_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_249, .-entropy_bin_249

# ============================================
# Shannon Entropy Bin - Byte Value 250
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_250, @function
entropy_bin_250:
    mov eax, dword ptr [rdi + 1000]
    test eax, eax
    jz .Lentropy_bin_250_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_250_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_250, .-entropy_bin_250

# ============================================
# Shannon Entropy Bin - Byte Value 251
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_251, @function
entropy_bin_251:
    mov eax, dword ptr [rdi + 1004]
    test eax, eax
    jz .Lentropy_bin_251_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_251_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_251, .-entropy_bin_251

# ============================================
# Shannon Entropy Bin - Byte Value 252
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_252, @function
entropy_bin_252:
    mov eax, dword ptr [rdi + 1008]
    test eax, eax
    jz .Lentropy_bin_252_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_252_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_252, .-entropy_bin_252

# ============================================
# Shannon Entropy Bin - Byte Value 253
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_253, @function
entropy_bin_253:
    mov eax, dword ptr [rdi + 1012]
    test eax, eax
    jz .Lentropy_bin_253_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_253_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_253, .-entropy_bin_253

# ============================================
# Shannon Entropy Bin - Byte Value 254
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_254, @function
entropy_bin_254:
    mov eax, dword ptr [rdi + 1016]
    test eax, eax
    jz .Lentropy_bin_254_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_254_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_254, .-entropy_bin_254

# ============================================
# Shannon Entropy Bin - Byte Value 255
# ============================================
# RDI = histogram ptr, RSI = total count
# Returns: XMM0 = entropy contribution
.type entropy_bin_255, @function
entropy_bin_255:
    mov eax, dword ptr [rdi + 1020]
    test eax, eax
    jz .Lentropy_bin_255_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rsi
    divsd xmm0, xmm1
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
    mov rsp, rbp
    pop rbp
    ret
.Lentropy_bin_255_zero:
    xorpd xmm0, xmm0
    ret
.size entropy_bin_255, .-entropy_bin_255

# ============================================
# Wave Field Seeder - Grid Cell 0
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0000, @function
seed_cell_0000:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x0000000000000000
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
    movss dword ptr [rdi + 0], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0000, .-seed_cell_0000

# ============================================
# Wave Field Seeder - Grid Cell 1
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0001, @function
seed_cell_0001:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x3FF0000000000000
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
    movss dword ptr [rdi + 4], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0001, .-seed_cell_0001

# ============================================
# Wave Field Seeder - Grid Cell 2
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0002, @function
seed_cell_0002:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4000000000000000
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
    movss dword ptr [rdi + 8], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0002, .-seed_cell_0002

# ============================================
# Wave Field Seeder - Grid Cell 3
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0003, @function
seed_cell_0003:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4008000000000000
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
    movss dword ptr [rdi + 12], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0003, .-seed_cell_0003

# ============================================
# Wave Field Seeder - Grid Cell 4
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0004, @function
seed_cell_0004:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4010000000000000
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
    movss dword ptr [rdi + 16], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0004, .-seed_cell_0004

# ============================================
# Wave Field Seeder - Grid Cell 5
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0005, @function
seed_cell_0005:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4014000000000000
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
    movss dword ptr [rdi + 20], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0005, .-seed_cell_0005

# ============================================
# Wave Field Seeder - Grid Cell 6
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0006, @function
seed_cell_0006:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4018000000000000
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
    movss dword ptr [rdi + 24], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0006, .-seed_cell_0006

# ============================================
# Wave Field Seeder - Grid Cell 7
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0007, @function
seed_cell_0007:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x401C000000000000
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
    movss dword ptr [rdi + 28], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0007, .-seed_cell_0007

# ============================================
# Wave Field Seeder - Grid Cell 8
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0008, @function
seed_cell_0008:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4020000000000000
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
    movss dword ptr [rdi + 32], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0008, .-seed_cell_0008

# ============================================
# Wave Field Seeder - Grid Cell 9
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0009, @function
seed_cell_0009:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4022000000000000
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
    movss dword ptr [rdi + 36], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0009, .-seed_cell_0009

# ============================================
# Wave Field Seeder - Grid Cell 10
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0010, @function
seed_cell_0010:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4024000000000000
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
    movss dword ptr [rdi + 40], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0010, .-seed_cell_0010

# ============================================
# Wave Field Seeder - Grid Cell 11
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0011, @function
seed_cell_0011:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4026000000000000
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
    movss dword ptr [rdi + 44], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0011, .-seed_cell_0011

# ============================================
# Wave Field Seeder - Grid Cell 12
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0012, @function
seed_cell_0012:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4028000000000000
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
    movss dword ptr [rdi + 48], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0012, .-seed_cell_0012

# ============================================
# Wave Field Seeder - Grid Cell 13
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0013, @function
seed_cell_0013:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x402A000000000000
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
    movss dword ptr [rdi + 52], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0013, .-seed_cell_0013

# ============================================
# Wave Field Seeder - Grid Cell 14
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0014, @function
seed_cell_0014:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x402C000000000000
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
    movss dword ptr [rdi + 56], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0014, .-seed_cell_0014

# ============================================
# Wave Field Seeder - Grid Cell 15
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0015, @function
seed_cell_0015:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x402E000000000000
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
    movss dword ptr [rdi + 60], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0015, .-seed_cell_0015

# ============================================
# Wave Field Seeder - Grid Cell 16
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0016, @function
seed_cell_0016:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4030000000000000
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
    movss dword ptr [rdi + 64], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0016, .-seed_cell_0016

# ============================================
# Wave Field Seeder - Grid Cell 17
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0017, @function
seed_cell_0017:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4031000000000000
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
    movss dword ptr [rdi + 68], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0017, .-seed_cell_0017

# ============================================
# Wave Field Seeder - Grid Cell 18
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0018, @function
seed_cell_0018:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4032000000000000
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
    movss dword ptr [rdi + 72], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0018, .-seed_cell_0018

# ============================================
# Wave Field Seeder - Grid Cell 19
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0019, @function
seed_cell_0019:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4033000000000000
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
    movss dword ptr [rdi + 76], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0019, .-seed_cell_0019

# ============================================
# Wave Field Seeder - Grid Cell 20
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0020, @function
seed_cell_0020:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4034000000000000
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
    movss dword ptr [rdi + 80], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0020, .-seed_cell_0020

# ============================================
# Wave Field Seeder - Grid Cell 21
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0021, @function
seed_cell_0021:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4035000000000000
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
    movss dword ptr [rdi + 84], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0021, .-seed_cell_0021

# ============================================
# Wave Field Seeder - Grid Cell 22
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0022, @function
seed_cell_0022:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4036000000000000
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
    movss dword ptr [rdi + 88], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0022, .-seed_cell_0022

# ============================================
# Wave Field Seeder - Grid Cell 23
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0023, @function
seed_cell_0023:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4037000000000000
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
    movss dword ptr [rdi + 92], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0023, .-seed_cell_0023

# ============================================
# Wave Field Seeder - Grid Cell 24
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0024, @function
seed_cell_0024:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4038000000000000
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
    movss dword ptr [rdi + 96], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0024, .-seed_cell_0024

# ============================================
# Wave Field Seeder - Grid Cell 25
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0025, @function
seed_cell_0025:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4039000000000000
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
    movss dword ptr [rdi + 100], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0025, .-seed_cell_0025

# ============================================
# Wave Field Seeder - Grid Cell 26
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0026, @function
seed_cell_0026:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x403A000000000000
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
    movss dword ptr [rdi + 104], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0026, .-seed_cell_0026

# ============================================
# Wave Field Seeder - Grid Cell 27
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0027, @function
seed_cell_0027:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x403B000000000000
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
    movss dword ptr [rdi + 108], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0027, .-seed_cell_0027

# ============================================
# Wave Field Seeder - Grid Cell 28
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0028, @function
seed_cell_0028:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x403C000000000000
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
    movss dword ptr [rdi + 112], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0028, .-seed_cell_0028

# ============================================
# Wave Field Seeder - Grid Cell 29
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0029, @function
seed_cell_0029:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x403D000000000000
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
    movss dword ptr [rdi + 116], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0029, .-seed_cell_0029

# ============================================
# Wave Field Seeder - Grid Cell 30
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0030, @function
seed_cell_0030:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x403E000000000000
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
    movss dword ptr [rdi + 120], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0030, .-seed_cell_0030

# ============================================
# Wave Field Seeder - Grid Cell 31
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0031, @function
seed_cell_0031:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x403F000000000000
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
    movss dword ptr [rdi + 124], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0031, .-seed_cell_0031

# ============================================
# Wave Field Seeder - Grid Cell 32
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0032, @function
seed_cell_0032:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4040000000000000
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
    movss dword ptr [rdi + 128], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0032, .-seed_cell_0032

# ============================================
# Wave Field Seeder - Grid Cell 33
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0033, @function
seed_cell_0033:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4040800000000000
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
    movss dword ptr [rdi + 132], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0033, .-seed_cell_0033

# ============================================
# Wave Field Seeder - Grid Cell 34
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0034, @function
seed_cell_0034:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4041000000000000
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
    movss dword ptr [rdi + 136], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0034, .-seed_cell_0034

# ============================================
# Wave Field Seeder - Grid Cell 35
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0035, @function
seed_cell_0035:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4041800000000000
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
    movss dword ptr [rdi + 140], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0035, .-seed_cell_0035

# ============================================
# Wave Field Seeder - Grid Cell 36
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0036, @function
seed_cell_0036:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4042000000000000
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
    movss dword ptr [rdi + 144], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0036, .-seed_cell_0036

# ============================================
# Wave Field Seeder - Grid Cell 37
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0037, @function
seed_cell_0037:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4042800000000000
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
    movss dword ptr [rdi + 148], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0037, .-seed_cell_0037

# ============================================
# Wave Field Seeder - Grid Cell 38
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0038, @function
seed_cell_0038:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4043000000000000
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
    movss dword ptr [rdi + 152], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0038, .-seed_cell_0038

# ============================================
# Wave Field Seeder - Grid Cell 39
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0039, @function
seed_cell_0039:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4043800000000000
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
    movss dword ptr [rdi + 156], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0039, .-seed_cell_0039

# ============================================
# Wave Field Seeder - Grid Cell 40
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0040, @function
seed_cell_0040:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4044000000000000
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
    movss dword ptr [rdi + 160], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0040, .-seed_cell_0040

# ============================================
# Wave Field Seeder - Grid Cell 41
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0041, @function
seed_cell_0041:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4044800000000000
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
    movss dword ptr [rdi + 164], xmm3
    mov rsp, rbp
    pop rbp
    ret
.size seed_cell_0041, .-seed_cell_0041

# ============================================
# Wave Field Seeder - Grid Cell 42
# ============================================
# RDI = phi, XMM0 = factor, XMM1 = inv_denom, XMM2 = center
.type seed_cell_0042, @function
seed_cell_0042:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    mov rax, 0x4045000000000000
    movq xmm3, rax
