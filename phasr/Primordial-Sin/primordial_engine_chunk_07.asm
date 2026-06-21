    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3740 ENDP

; ============================================
; Boot Byte Attestation - Position 3741
; Constant-time branchless validation
; of boot_data[3741] against baseline[3741]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3741] == baseline[3741]
;   EAX = 0 if mismatch detected at position 3741
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3741 PROC
    movzx eax, byte ptr [rcx + 3741]
    movzx r10d, byte ptr [rdx + 3741]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3741 ENDP

; ============================================
; Boot Byte Attestation - Position 3742
; Constant-time branchless validation
; of boot_data[3742] against baseline[3742]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3742] == baseline[3742]
;   EAX = 0 if mismatch detected at position 3742
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3742 PROC
    movzx eax, byte ptr [rcx + 3742]
    movzx r10d, byte ptr [rdx + 3742]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3742 ENDP

; ============================================
; Boot Byte Attestation - Position 3743
; Constant-time branchless validation
; of boot_data[3743] against baseline[3743]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3743] == baseline[3743]
;   EAX = 0 if mismatch detected at position 3743
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3743 PROC
    movzx eax, byte ptr [rcx + 3743]
    movzx r10d, byte ptr [rdx + 3743]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3743 ENDP

; ============================================
; Boot Byte Attestation - Position 3744
; Constant-time branchless validation
; of boot_data[3744] against baseline[3744]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3744] == baseline[3744]
;   EAX = 0 if mismatch detected at position 3744
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3744 PROC
    movzx eax, byte ptr [rcx + 3744]
    movzx r10d, byte ptr [rdx + 3744]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3744 ENDP

; ============================================
; Boot Byte Attestation - Position 3745
; Constant-time branchless validation
; of boot_data[3745] against baseline[3745]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3745] == baseline[3745]
;   EAX = 0 if mismatch detected at position 3745
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3745 PROC
    movzx eax, byte ptr [rcx + 3745]
    movzx r10d, byte ptr [rdx + 3745]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3745 ENDP

; ============================================
; Boot Byte Attestation - Position 3746
; Constant-time branchless validation
; of boot_data[3746] against baseline[3746]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3746] == baseline[3746]
;   EAX = 0 if mismatch detected at position 3746
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3746 PROC
    movzx eax, byte ptr [rcx + 3746]
    movzx r10d, byte ptr [rdx + 3746]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3746 ENDP

; ============================================
; Boot Byte Attestation - Position 3747
; Constant-time branchless validation
; of boot_data[3747] against baseline[3747]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3747] == baseline[3747]
;   EAX = 0 if mismatch detected at position 3747
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3747 PROC
    movzx eax, byte ptr [rcx + 3747]
    movzx r10d, byte ptr [rdx + 3747]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3747 ENDP

; ============================================
; Boot Byte Attestation - Position 3748
; Constant-time branchless validation
; of boot_data[3748] against baseline[3748]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3748] == baseline[3748]
;   EAX = 0 if mismatch detected at position 3748
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3748 PROC
    movzx eax, byte ptr [rcx + 3748]
    movzx r10d, byte ptr [rdx + 3748]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3748 ENDP

; ============================================
; Boot Byte Attestation - Position 3749
; Constant-time branchless validation
; of boot_data[3749] against baseline[3749]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3749] == baseline[3749]
;   EAX = 0 if mismatch detected at position 3749
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3749 PROC
    movzx eax, byte ptr [rcx + 3749]
    movzx r10d, byte ptr [rdx + 3749]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3749 ENDP

; ============================================
; Boot Byte Attestation - Position 3750
; Constant-time branchless validation
; of boot_data[3750] against baseline[3750]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3750] == baseline[3750]
;   EAX = 0 if mismatch detected at position 3750
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3750 PROC
    movzx eax, byte ptr [rcx + 3750]
    movzx r10d, byte ptr [rdx + 3750]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3750 ENDP

; ============================================
; Boot Byte Attestation - Position 3751
; Constant-time branchless validation
; of boot_data[3751] against baseline[3751]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3751] == baseline[3751]
;   EAX = 0 if mismatch detected at position 3751
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3751 PROC
    movzx eax, byte ptr [rcx + 3751]
    movzx r10d, byte ptr [rdx + 3751]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3751 ENDP

; ============================================
; Boot Byte Attestation - Position 3752
; Constant-time branchless validation
; of boot_data[3752] against baseline[3752]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3752] == baseline[3752]
;   EAX = 0 if mismatch detected at position 3752
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3752 PROC
    movzx eax, byte ptr [rcx + 3752]
    movzx r10d, byte ptr [rdx + 3752]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3752 ENDP

; ============================================
; Boot Byte Attestation - Position 3753
; Constant-time branchless validation
; of boot_data[3753] against baseline[3753]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3753] == baseline[3753]
;   EAX = 0 if mismatch detected at position 3753
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3753 PROC
    movzx eax, byte ptr [rcx + 3753]
    movzx r10d, byte ptr [rdx + 3753]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3753 ENDP

; ============================================
; Boot Byte Attestation - Position 3754
; Constant-time branchless validation
; of boot_data[3754] against baseline[3754]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3754] == baseline[3754]
;   EAX = 0 if mismatch detected at position 3754
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3754 PROC
    movzx eax, byte ptr [rcx + 3754]
    movzx r10d, byte ptr [rdx + 3754]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3754 ENDP

; ============================================
; Boot Byte Attestation - Position 3755
; Constant-time branchless validation
; of boot_data[3755] against baseline[3755]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3755] == baseline[3755]
;   EAX = 0 if mismatch detected at position 3755
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3755 PROC
    movzx eax, byte ptr [rcx + 3755]
    movzx r10d, byte ptr [rdx + 3755]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3755 ENDP

; ============================================
; Boot Byte Attestation - Position 3756
; Constant-time branchless validation
; of boot_data[3756] against baseline[3756]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3756] == baseline[3756]
;   EAX = 0 if mismatch detected at position 3756
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3756 PROC
    movzx eax, byte ptr [rcx + 3756]
    movzx r10d, byte ptr [rdx + 3756]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3756 ENDP

; ============================================
; Boot Byte Attestation - Position 3757
; Constant-time branchless validation
; of boot_data[3757] against baseline[3757]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3757] == baseline[3757]
;   EAX = 0 if mismatch detected at position 3757
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3757 PROC
    movzx eax, byte ptr [rcx + 3757]
    movzx r10d, byte ptr [rdx + 3757]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3757 ENDP

; ============================================
; Boot Byte Attestation - Position 3758
; Constant-time branchless validation
; of boot_data[3758] against baseline[3758]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3758] == baseline[3758]
;   EAX = 0 if mismatch detected at position 3758
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3758 PROC
    movzx eax, byte ptr [rcx + 3758]
    movzx r10d, byte ptr [rdx + 3758]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3758 ENDP

; ============================================
; Boot Byte Attestation - Position 3759
; Constant-time branchless validation
; of boot_data[3759] against baseline[3759]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3759] == baseline[3759]
;   EAX = 0 if mismatch detected at position 3759
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3759 PROC
    movzx eax, byte ptr [rcx + 3759]
    movzx r10d, byte ptr [rdx + 3759]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3759 ENDP

; ============================================
; Boot Byte Attestation - Position 3760
; Constant-time branchless validation
; of boot_data[3760] against baseline[3760]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3760] == baseline[3760]
;   EAX = 0 if mismatch detected at position 3760
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3760 PROC
    movzx eax, byte ptr [rcx + 3760]
    movzx r10d, byte ptr [rdx + 3760]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3760 ENDP

; ============================================
; Boot Byte Attestation - Position 3761
; Constant-time branchless validation
; of boot_data[3761] against baseline[3761]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3761] == baseline[3761]
;   EAX = 0 if mismatch detected at position 3761
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3761 PROC
    movzx eax, byte ptr [rcx + 3761]
    movzx r10d, byte ptr [rdx + 3761]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3761 ENDP

; ============================================
; Boot Byte Attestation - Position 3762
; Constant-time branchless validation
; of boot_data[3762] against baseline[3762]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3762] == baseline[3762]
;   EAX = 0 if mismatch detected at position 3762
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3762 PROC
    movzx eax, byte ptr [rcx + 3762]
    movzx r10d, byte ptr [rdx + 3762]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3762 ENDP

; ============================================
; Boot Byte Attestation - Position 3763
; Constant-time branchless validation
; of boot_data[3763] against baseline[3763]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3763] == baseline[3763]
;   EAX = 0 if mismatch detected at position 3763
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3763 PROC
    movzx eax, byte ptr [rcx + 3763]
    movzx r10d, byte ptr [rdx + 3763]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3763 ENDP

; ============================================
; Boot Byte Attestation - Position 3764
; Constant-time branchless validation
; of boot_data[3764] against baseline[3764]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3764] == baseline[3764]
;   EAX = 0 if mismatch detected at position 3764
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3764 PROC
    movzx eax, byte ptr [rcx + 3764]
    movzx r10d, byte ptr [rdx + 3764]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3764 ENDP

; ============================================
; Boot Byte Attestation - Position 3765
; Constant-time branchless validation
; of boot_data[3765] against baseline[3765]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3765] == baseline[3765]
;   EAX = 0 if mismatch detected at position 3765
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3765 PROC
    movzx eax, byte ptr [rcx + 3765]
    movzx r10d, byte ptr [rdx + 3765]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3765 ENDP

; ============================================
; Boot Byte Attestation - Position 3766
; Constant-time branchless validation
; of boot_data[3766] against baseline[3766]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3766] == baseline[3766]
;   EAX = 0 if mismatch detected at position 3766
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3766 PROC
    movzx eax, byte ptr [rcx + 3766]
    movzx r10d, byte ptr [rdx + 3766]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3766 ENDP

; ============================================
; Boot Byte Attestation - Position 3767
; Constant-time branchless validation
; of boot_data[3767] against baseline[3767]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3767] == baseline[3767]
;   EAX = 0 if mismatch detected at position 3767
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3767 PROC
    movzx eax, byte ptr [rcx + 3767]
    movzx r10d, byte ptr [rdx + 3767]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3767 ENDP

; ============================================
; Boot Byte Attestation - Position 3768
; Constant-time branchless validation
; of boot_data[3768] against baseline[3768]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3768] == baseline[3768]
;   EAX = 0 if mismatch detected at position 3768
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3768 PROC
    movzx eax, byte ptr [rcx + 3768]
    movzx r10d, byte ptr [rdx + 3768]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3768 ENDP

; ============================================
; Boot Byte Attestation - Position 3769
; Constant-time branchless validation
; of boot_data[3769] against baseline[3769]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3769] == baseline[3769]
;   EAX = 0 if mismatch detected at position 3769
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3769 PROC
    movzx eax, byte ptr [rcx + 3769]
    movzx r10d, byte ptr [rdx + 3769]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3769 ENDP

; ============================================
; Boot Byte Attestation - Position 3770
; Constant-time branchless validation
; of boot_data[3770] against baseline[3770]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3770] == baseline[3770]
;   EAX = 0 if mismatch detected at position 3770
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3770 PROC
    movzx eax, byte ptr [rcx + 3770]
    movzx r10d, byte ptr [rdx + 3770]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3770 ENDP

; ============================================
; Boot Byte Attestation - Position 3771
; Constant-time branchless validation
; of boot_data[3771] against baseline[3771]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3771] == baseline[3771]
;   EAX = 0 if mismatch detected at position 3771
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3771 PROC
    movzx eax, byte ptr [rcx + 3771]
    movzx r10d, byte ptr [rdx + 3771]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3771 ENDP

; ============================================
; Boot Byte Attestation - Position 3772
; Constant-time branchless validation
; of boot_data[3772] against baseline[3772]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3772] == baseline[3772]
;   EAX = 0 if mismatch detected at position 3772
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3772 PROC
    movzx eax, byte ptr [rcx + 3772]
    movzx r10d, byte ptr [rdx + 3772]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3772 ENDP

; ============================================
; Boot Byte Attestation - Position 3773
; Constant-time branchless validation
; of boot_data[3773] against baseline[3773]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3773] == baseline[3773]
;   EAX = 0 if mismatch detected at position 3773
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3773 PROC
    movzx eax, byte ptr [rcx + 3773]
    movzx r10d, byte ptr [rdx + 3773]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3773 ENDP

; ============================================
; Boot Byte Attestation - Position 3774
; Constant-time branchless validation
; of boot_data[3774] against baseline[3774]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3774] == baseline[3774]
;   EAX = 0 if mismatch detected at position 3774
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3774 PROC
    movzx eax, byte ptr [rcx + 3774]
    movzx r10d, byte ptr [rdx + 3774]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3774 ENDP

; ============================================
; Boot Byte Attestation - Position 3775
; Constant-time branchless validation
; of boot_data[3775] against baseline[3775]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3775] == baseline[3775]
;   EAX = 0 if mismatch detected at position 3775
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3775 PROC
    movzx eax, byte ptr [rcx + 3775]
    movzx r10d, byte ptr [rdx + 3775]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3775 ENDP

; ============================================
; Boot Byte Attestation - Position 3776
; Constant-time branchless validation
; of boot_data[3776] against baseline[3776]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3776] == baseline[3776]
;   EAX = 0 if mismatch detected at position 3776
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3776 PROC
    movzx eax, byte ptr [rcx + 3776]
    movzx r10d, byte ptr [rdx + 3776]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3776 ENDP

; ============================================
; Boot Byte Attestation - Position 3777
; Constant-time branchless validation
; of boot_data[3777] against baseline[3777]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3777] == baseline[3777]
;   EAX = 0 if mismatch detected at position 3777
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3777 PROC
    movzx eax, byte ptr [rcx + 3777]
    movzx r10d, byte ptr [rdx + 3777]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3777 ENDP

; ============================================
; Boot Byte Attestation - Position 3778
; Constant-time branchless validation
; of boot_data[3778] against baseline[3778]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3778] == baseline[3778]
;   EAX = 0 if mismatch detected at position 3778
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3778 PROC
    movzx eax, byte ptr [rcx + 3778]
    movzx r10d, byte ptr [rdx + 3778]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3778 ENDP

; ============================================
; Boot Byte Attestation - Position 3779
; Constant-time branchless validation
; of boot_data[3779] against baseline[3779]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3779] == baseline[3779]
;   EAX = 0 if mismatch detected at position 3779
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3779 PROC
    movzx eax, byte ptr [rcx + 3779]
    movzx r10d, byte ptr [rdx + 3779]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3779 ENDP

; ============================================
; Boot Byte Attestation - Position 3780
; Constant-time branchless validation
; of boot_data[3780] against baseline[3780]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3780] == baseline[3780]
;   EAX = 0 if mismatch detected at position 3780
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3780 PROC
    movzx eax, byte ptr [rcx + 3780]
    movzx r10d, byte ptr [rdx + 3780]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3780 ENDP

; ============================================
; Boot Byte Attestation - Position 3781
; Constant-time branchless validation
; of boot_data[3781] against baseline[3781]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3781] == baseline[3781]
;   EAX = 0 if mismatch detected at position 3781
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3781 PROC
    movzx eax, byte ptr [rcx + 3781]
    movzx r10d, byte ptr [rdx + 3781]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3781 ENDP

; ============================================
; Boot Byte Attestation - Position 3782
; Constant-time branchless validation
; of boot_data[3782] against baseline[3782]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3782] == baseline[3782]
;   EAX = 0 if mismatch detected at position 3782
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3782 PROC
    movzx eax, byte ptr [rcx + 3782]
    movzx r10d, byte ptr [rdx + 3782]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3782 ENDP

; ============================================
; Boot Byte Attestation - Position 3783
; Constant-time branchless validation
; of boot_data[3783] against baseline[3783]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3783] == baseline[3783]
;   EAX = 0 if mismatch detected at position 3783
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3783 PROC
    movzx eax, byte ptr [rcx + 3783]
    movzx r10d, byte ptr [rdx + 3783]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3783 ENDP

; ============================================
; Boot Byte Attestation - Position 3784
; Constant-time branchless validation
; of boot_data[3784] against baseline[3784]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3784] == baseline[3784]
;   EAX = 0 if mismatch detected at position 3784
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3784 PROC
    movzx eax, byte ptr [rcx + 3784]
    movzx r10d, byte ptr [rdx + 3784]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3784 ENDP

; ============================================
; Boot Byte Attestation - Position 3785
; Constant-time branchless validation
; of boot_data[3785] against baseline[3785]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3785] == baseline[3785]
;   EAX = 0 if mismatch detected at position 3785
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3785 PROC
    movzx eax, byte ptr [rcx + 3785]
    movzx r10d, byte ptr [rdx + 3785]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3785 ENDP

; ============================================
; Boot Byte Attestation - Position 3786
; Constant-time branchless validation
; of boot_data[3786] against baseline[3786]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3786] == baseline[3786]
;   EAX = 0 if mismatch detected at position 3786
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3786 PROC
    movzx eax, byte ptr [rcx + 3786]
    movzx r10d, byte ptr [rdx + 3786]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3786 ENDP

; ============================================
; Boot Byte Attestation - Position 3787
; Constant-time branchless validation
; of boot_data[3787] against baseline[3787]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3787] == baseline[3787]
;   EAX = 0 if mismatch detected at position 3787
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3787 PROC
    movzx eax, byte ptr [rcx + 3787]
    movzx r10d, byte ptr [rdx + 3787]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3787 ENDP

; ============================================
; Boot Byte Attestation - Position 3788
; Constant-time branchless validation
; of boot_data[3788] against baseline[3788]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3788] == baseline[3788]
;   EAX = 0 if mismatch detected at position 3788
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3788 PROC
    movzx eax, byte ptr [rcx + 3788]
    movzx r10d, byte ptr [rdx + 3788]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3788 ENDP

; ============================================
; Boot Byte Attestation - Position 3789
; Constant-time branchless validation
; of boot_data[3789] against baseline[3789]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3789] == baseline[3789]
;   EAX = 0 if mismatch detected at position 3789
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3789 PROC
    movzx eax, byte ptr [rcx + 3789]
    movzx r10d, byte ptr [rdx + 3789]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3789 ENDP

; ============================================
; Boot Byte Attestation - Position 3790
; Constant-time branchless validation
; of boot_data[3790] against baseline[3790]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3790] == baseline[3790]
;   EAX = 0 if mismatch detected at position 3790
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3790 PROC
    movzx eax, byte ptr [rcx + 3790]
    movzx r10d, byte ptr [rdx + 3790]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3790 ENDP

; ============================================
; Boot Byte Attestation - Position 3791
; Constant-time branchless validation
; of boot_data[3791] against baseline[3791]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3791] == baseline[3791]
;   EAX = 0 if mismatch detected at position 3791
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3791 PROC
    movzx eax, byte ptr [rcx + 3791]
    movzx r10d, byte ptr [rdx + 3791]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3791 ENDP

; ============================================
; Boot Byte Attestation - Position 3792
; Constant-time branchless validation
; of boot_data[3792] against baseline[3792]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3792] == baseline[3792]
;   EAX = 0 if mismatch detected at position 3792
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3792 PROC
    movzx eax, byte ptr [rcx + 3792]
    movzx r10d, byte ptr [rdx + 3792]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3792 ENDP

; ============================================
; Boot Byte Attestation - Position 3793
; Constant-time branchless validation
; of boot_data[3793] against baseline[3793]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3793] == baseline[3793]
;   EAX = 0 if mismatch detected at position 3793
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3793 PROC
    movzx eax, byte ptr [rcx + 3793]
    movzx r10d, byte ptr [rdx + 3793]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3793 ENDP

; ============================================
; Boot Byte Attestation - Position 3794
; Constant-time branchless validation
; of boot_data[3794] against baseline[3794]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3794] == baseline[3794]
;   EAX = 0 if mismatch detected at position 3794
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3794 PROC
    movzx eax, byte ptr [rcx + 3794]
    movzx r10d, byte ptr [rdx + 3794]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3794 ENDP

; ============================================
; Boot Byte Attestation - Position 3795
; Constant-time branchless validation
; of boot_data[3795] against baseline[3795]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3795] == baseline[3795]
;   EAX = 0 if mismatch detected at position 3795
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3795 PROC
    movzx eax, byte ptr [rcx + 3795]
    movzx r10d, byte ptr [rdx + 3795]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3795 ENDP

; ============================================
; Boot Byte Attestation - Position 3796
; Constant-time branchless validation
; of boot_data[3796] against baseline[3796]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3796] == baseline[3796]
;   EAX = 0 if mismatch detected at position 3796
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3796 PROC
    movzx eax, byte ptr [rcx + 3796]
    movzx r10d, byte ptr [rdx + 3796]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3796 ENDP

; ============================================
; Boot Byte Attestation - Position 3797
; Constant-time branchless validation
; of boot_data[3797] against baseline[3797]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3797] == baseline[3797]
;   EAX = 0 if mismatch detected at position 3797
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3797 PROC
    movzx eax, byte ptr [rcx + 3797]
    movzx r10d, byte ptr [rdx + 3797]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3797 ENDP

; ============================================
; Boot Byte Attestation - Position 3798
; Constant-time branchless validation
; of boot_data[3798] against baseline[3798]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3798] == baseline[3798]
;   EAX = 0 if mismatch detected at position 3798
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3798 PROC
    movzx eax, byte ptr [rcx + 3798]
    movzx r10d, byte ptr [rdx + 3798]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3798 ENDP

; ============================================
; Boot Byte Attestation - Position 3799
; Constant-time branchless validation
; of boot_data[3799] against baseline[3799]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3799] == baseline[3799]
;   EAX = 0 if mismatch detected at position 3799
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3799 PROC
    movzx eax, byte ptr [rcx + 3799]
    movzx r10d, byte ptr [rdx + 3799]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3799 ENDP

; ============================================
; Boot Byte Attestation - Position 3800
; Constant-time branchless validation
; of boot_data[3800] against baseline[3800]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3800] == baseline[3800]
;   EAX = 0 if mismatch detected at position 3800
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3800 PROC
    movzx eax, byte ptr [rcx + 3800]
    movzx r10d, byte ptr [rdx + 3800]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3800 ENDP

; ============================================
; Boot Byte Attestation - Position 3801
; Constant-time branchless validation
; of boot_data[3801] against baseline[3801]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3801] == baseline[3801]
;   EAX = 0 if mismatch detected at position 3801
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3801 PROC
    movzx eax, byte ptr [rcx + 3801]
    movzx r10d, byte ptr [rdx + 3801]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3801 ENDP

; ============================================
; Boot Byte Attestation - Position 3802
; Constant-time branchless validation
; of boot_data[3802] against baseline[3802]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3802] == baseline[3802]
;   EAX = 0 if mismatch detected at position 3802
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3802 PROC
    movzx eax, byte ptr [rcx + 3802]
    movzx r10d, byte ptr [rdx + 3802]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3802 ENDP

; ============================================
; Boot Byte Attestation - Position 3803
; Constant-time branchless validation
; of boot_data[3803] against baseline[3803]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3803] == baseline[3803]
;   EAX = 0 if mismatch detected at position 3803
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3803 PROC
    movzx eax, byte ptr [rcx + 3803]
    movzx r10d, byte ptr [rdx + 3803]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3803 ENDP

; ============================================
; Boot Byte Attestation - Position 3804
; Constant-time branchless validation
; of boot_data[3804] against baseline[3804]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3804] == baseline[3804]
;   EAX = 0 if mismatch detected at position 3804
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3804 PROC
    movzx eax, byte ptr [rcx + 3804]
    movzx r10d, byte ptr [rdx + 3804]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3804 ENDP

; ============================================
; Boot Byte Attestation - Position 3805
; Constant-time branchless validation
; of boot_data[3805] against baseline[3805]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3805] == baseline[3805]
;   EAX = 0 if mismatch detected at position 3805
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3805 PROC
    movzx eax, byte ptr [rcx + 3805]
    movzx r10d, byte ptr [rdx + 3805]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3805 ENDP

; ============================================
; Boot Byte Attestation - Position 3806
; Constant-time branchless validation
; of boot_data[3806] against baseline[3806]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3806] == baseline[3806]
;   EAX = 0 if mismatch detected at position 3806
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3806 PROC
    movzx eax, byte ptr [rcx + 3806]
    movzx r10d, byte ptr [rdx + 3806]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3806 ENDP

; ============================================
; Boot Byte Attestation - Position 3807
; Constant-time branchless validation
; of boot_data[3807] against baseline[3807]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3807] == baseline[3807]
;   EAX = 0 if mismatch detected at position 3807
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3807 PROC
    movzx eax, byte ptr [rcx + 3807]
    movzx r10d, byte ptr [rdx + 3807]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3807 ENDP

; ============================================
; Boot Byte Attestation - Position 3808
; Constant-time branchless validation
; of boot_data[3808] against baseline[3808]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3808] == baseline[3808]
;   EAX = 0 if mismatch detected at position 3808
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3808 PROC
    movzx eax, byte ptr [rcx + 3808]
    movzx r10d, byte ptr [rdx + 3808]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3808 ENDP

; ============================================
; Boot Byte Attestation - Position 3809
; Constant-time branchless validation
; of boot_data[3809] against baseline[3809]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3809] == baseline[3809]
;   EAX = 0 if mismatch detected at position 3809
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3809 PROC
    movzx eax, byte ptr [rcx + 3809]
    movzx r10d, byte ptr [rdx + 3809]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3809 ENDP

; ============================================
; Boot Byte Attestation - Position 3810
; Constant-time branchless validation
; of boot_data[3810] against baseline[3810]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3810] == baseline[3810]
;   EAX = 0 if mismatch detected at position 3810
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3810 PROC
    movzx eax, byte ptr [rcx + 3810]
    movzx r10d, byte ptr [rdx + 3810]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3810 ENDP

; ============================================
; Boot Byte Attestation - Position 3811
; Constant-time branchless validation
; of boot_data[3811] against baseline[3811]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3811] == baseline[3811]
;   EAX = 0 if mismatch detected at position 3811
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3811 PROC
    movzx eax, byte ptr [rcx + 3811]
    movzx r10d, byte ptr [rdx + 3811]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3811 ENDP

; ============================================
; Boot Byte Attestation - Position 3812
; Constant-time branchless validation
; of boot_data[3812] against baseline[3812]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3812] == baseline[3812]
;   EAX = 0 if mismatch detected at position 3812
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3812 PROC
    movzx eax, byte ptr [rcx + 3812]
    movzx r10d, byte ptr [rdx + 3812]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3812 ENDP

; ============================================
; Boot Byte Attestation - Position 3813
; Constant-time branchless validation
; of boot_data[3813] against baseline[3813]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3813] == baseline[3813]
;   EAX = 0 if mismatch detected at position 3813
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3813 PROC
    movzx eax, byte ptr [rcx + 3813]
    movzx r10d, byte ptr [rdx + 3813]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3813 ENDP

; ============================================
; Boot Byte Attestation - Position 3814
; Constant-time branchless validation
; of boot_data[3814] against baseline[3814]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3814] == baseline[3814]
;   EAX = 0 if mismatch detected at position 3814
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3814 PROC
    movzx eax, byte ptr [rcx + 3814]
    movzx r10d, byte ptr [rdx + 3814]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3814 ENDP

; ============================================
; Boot Byte Attestation - Position 3815
; Constant-time branchless validation
; of boot_data[3815] against baseline[3815]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3815] == baseline[3815]
;   EAX = 0 if mismatch detected at position 3815
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3815 PROC
    movzx eax, byte ptr [rcx + 3815]
    movzx r10d, byte ptr [rdx + 3815]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3815 ENDP

; ============================================
; Boot Byte Attestation - Position 3816
; Constant-time branchless validation
; of boot_data[3816] against baseline[3816]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3816] == baseline[3816]
;   EAX = 0 if mismatch detected at position 3816
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3816 PROC
    movzx eax, byte ptr [rcx + 3816]
    movzx r10d, byte ptr [rdx + 3816]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3816 ENDP

; ============================================
; Boot Byte Attestation - Position 3817
; Constant-time branchless validation
; of boot_data[3817] against baseline[3817]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3817] == baseline[3817]
;   EAX = 0 if mismatch detected at position 3817
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3817 PROC
    movzx eax, byte ptr [rcx + 3817]
    movzx r10d, byte ptr [rdx + 3817]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3817 ENDP

; ============================================
; Boot Byte Attestation - Position 3818
; Constant-time branchless validation
; of boot_data[3818] against baseline[3818]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3818] == baseline[3818]
;   EAX = 0 if mismatch detected at position 3818
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3818 PROC
    movzx eax, byte ptr [rcx + 3818]
    movzx r10d, byte ptr [rdx + 3818]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3818 ENDP

; ============================================
; Boot Byte Attestation - Position 3819
; Constant-time branchless validation
; of boot_data[3819] against baseline[3819]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3819] == baseline[3819]
;   EAX = 0 if mismatch detected at position 3819
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3819 PROC
    movzx eax, byte ptr [rcx + 3819]
    movzx r10d, byte ptr [rdx + 3819]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3819 ENDP

; ============================================
; Boot Byte Attestation - Position 3820
; Constant-time branchless validation
; of boot_data[3820] against baseline[3820]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3820] == baseline[3820]
;   EAX = 0 if mismatch detected at position 3820
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3820 PROC
    movzx eax, byte ptr [rcx + 3820]
    movzx r10d, byte ptr [rdx + 3820]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3820 ENDP

; ============================================
; Boot Byte Attestation - Position 3821
; Constant-time branchless validation
; of boot_data[3821] against baseline[3821]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3821] == baseline[3821]
;   EAX = 0 if mismatch detected at position 3821
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3821 PROC
    movzx eax, byte ptr [rcx + 3821]
    movzx r10d, byte ptr [rdx + 3821]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3821 ENDP

; ============================================
; Boot Byte Attestation - Position 3822
; Constant-time branchless validation
; of boot_data[3822] against baseline[3822]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3822] == baseline[3822]
;   EAX = 0 if mismatch detected at position 3822
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3822 PROC
    movzx eax, byte ptr [rcx + 3822]
    movzx r10d, byte ptr [rdx + 3822]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3822 ENDP

; ============================================
; Boot Byte Attestation - Position 3823
; Constant-time branchless validation
; of boot_data[3823] against baseline[3823]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3823] == baseline[3823]
;   EAX = 0 if mismatch detected at position 3823
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3823 PROC
    movzx eax, byte ptr [rcx + 3823]
    movzx r10d, byte ptr [rdx + 3823]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3823 ENDP

; ============================================
; Boot Byte Attestation - Position 3824
; Constant-time branchless validation
; of boot_data[3824] against baseline[3824]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3824] == baseline[3824]
;   EAX = 0 if mismatch detected at position 3824
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3824 PROC
    movzx eax, byte ptr [rcx + 3824]
    movzx r10d, byte ptr [rdx + 3824]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3824 ENDP

; ============================================
; Boot Byte Attestation - Position 3825
; Constant-time branchless validation
; of boot_data[3825] against baseline[3825]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3825] == baseline[3825]
;   EAX = 0 if mismatch detected at position 3825
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3825 PROC
    movzx eax, byte ptr [rcx + 3825]
    movzx r10d, byte ptr [rdx + 3825]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3825 ENDP

; ============================================
; Boot Byte Attestation - Position 3826
; Constant-time branchless validation
; of boot_data[3826] against baseline[3826]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3826] == baseline[3826]
;   EAX = 0 if mismatch detected at position 3826
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3826 PROC
    movzx eax, byte ptr [rcx + 3826]
    movzx r10d, byte ptr [rdx + 3826]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3826 ENDP

; ============================================
; Boot Byte Attestation - Position 3827
; Constant-time branchless validation
; of boot_data[3827] against baseline[3827]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3827] == baseline[3827]
;   EAX = 0 if mismatch detected at position 3827
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3827 PROC
    movzx eax, byte ptr [rcx + 3827]
    movzx r10d, byte ptr [rdx + 3827]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3827 ENDP

; ============================================
; Boot Byte Attestation - Position 3828
; Constant-time branchless validation
; of boot_data[3828] against baseline[3828]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3828] == baseline[3828]
;   EAX = 0 if mismatch detected at position 3828
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3828 PROC
    movzx eax, byte ptr [rcx + 3828]
    movzx r10d, byte ptr [rdx + 3828]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3828 ENDP

; ============================================
; Boot Byte Attestation - Position 3829
; Constant-time branchless validation
; of boot_data[3829] against baseline[3829]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3829] == baseline[3829]
;   EAX = 0 if mismatch detected at position 3829
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3829 PROC
    movzx eax, byte ptr [rcx + 3829]
    movzx r10d, byte ptr [rdx + 3829]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3829 ENDP

; ============================================
; Boot Byte Attestation - Position 3830
; Constant-time branchless validation
; of boot_data[3830] against baseline[3830]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3830] == baseline[3830]
;   EAX = 0 if mismatch detected at position 3830
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3830 PROC
    movzx eax, byte ptr [rcx + 3830]
    movzx r10d, byte ptr [rdx + 3830]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3830 ENDP

; ============================================
; Boot Byte Attestation - Position 3831
; Constant-time branchless validation
; of boot_data[3831] against baseline[3831]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3831] == baseline[3831]
;   EAX = 0 if mismatch detected at position 3831
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3831 PROC
    movzx eax, byte ptr [rcx + 3831]
    movzx r10d, byte ptr [rdx + 3831]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3831 ENDP

; ============================================
; Boot Byte Attestation - Position 3832
; Constant-time branchless validation
; of boot_data[3832] against baseline[3832]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3832] == baseline[3832]
;   EAX = 0 if mismatch detected at position 3832
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3832 PROC
    movzx eax, byte ptr [rcx + 3832]
    movzx r10d, byte ptr [rdx + 3832]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3832 ENDP

; ============================================
; Boot Byte Attestation - Position 3833
; Constant-time branchless validation
; of boot_data[3833] against baseline[3833]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3833] == baseline[3833]
;   EAX = 0 if mismatch detected at position 3833
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3833 PROC
    movzx eax, byte ptr [rcx + 3833]
    movzx r10d, byte ptr [rdx + 3833]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3833 ENDP

; ============================================
; Boot Byte Attestation - Position 3834
; Constant-time branchless validation
; of boot_data[3834] against baseline[3834]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3834] == baseline[3834]
;   EAX = 0 if mismatch detected at position 3834
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3834 PROC
    movzx eax, byte ptr [rcx + 3834]
    movzx r10d, byte ptr [rdx + 3834]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3834 ENDP

; ============================================
; Boot Byte Attestation - Position 3835
; Constant-time branchless validation
; of boot_data[3835] against baseline[3835]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3835] == baseline[3835]
;   EAX = 0 if mismatch detected at position 3835
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3835 PROC
    movzx eax, byte ptr [rcx + 3835]
    movzx r10d, byte ptr [rdx + 3835]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3835 ENDP

; ============================================
; Boot Byte Attestation - Position 3836
; Constant-time branchless validation
; of boot_data[3836] against baseline[3836]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3836] == baseline[3836]
;   EAX = 0 if mismatch detected at position 3836
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3836 PROC
    movzx eax, byte ptr [rcx + 3836]
    movzx r10d, byte ptr [rdx + 3836]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3836 ENDP

; ============================================
; Boot Byte Attestation - Position 3837
; Constant-time branchless validation
; of boot_data[3837] against baseline[3837]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3837] == baseline[3837]
;   EAX = 0 if mismatch detected at position 3837
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3837 PROC
    movzx eax, byte ptr [rcx + 3837]
    movzx r10d, byte ptr [rdx + 3837]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3837 ENDP

; ============================================
; Boot Byte Attestation - Position 3838
; Constant-time branchless validation
; of boot_data[3838] against baseline[3838]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3838] == baseline[3838]
;   EAX = 0 if mismatch detected at position 3838
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3838 PROC
    movzx eax, byte ptr [rcx + 3838]
    movzx r10d, byte ptr [rdx + 3838]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3838 ENDP

; ============================================
; Boot Byte Attestation - Position 3839
; Constant-time branchless validation
; of boot_data[3839] against baseline[3839]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3839] == baseline[3839]
;   EAX = 0 if mismatch detected at position 3839
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3839 PROC
    movzx eax, byte ptr [rcx + 3839]
    movzx r10d, byte ptr [rdx + 3839]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3839 ENDP

; ============================================
; Boot Byte Attestation - Position 3840
; Constant-time branchless validation
; of boot_data[3840] against baseline[3840]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3840] == baseline[3840]
;   EAX = 0 if mismatch detected at position 3840
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3840 PROC
    movzx eax, byte ptr [rcx + 3840]
    movzx r10d, byte ptr [rdx + 3840]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3840 ENDP

; ============================================
; Boot Byte Attestation - Position 3841
; Constant-time branchless validation
; of boot_data[3841] against baseline[3841]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3841] == baseline[3841]
;   EAX = 0 if mismatch detected at position 3841
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3841 PROC
    movzx eax, byte ptr [rcx + 3841]
    movzx r10d, byte ptr [rdx + 3841]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3841 ENDP

; ============================================
; Boot Byte Attestation - Position 3842
; Constant-time branchless validation
; of boot_data[3842] against baseline[3842]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3842] == baseline[3842]
;   EAX = 0 if mismatch detected at position 3842
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3842 PROC
    movzx eax, byte ptr [rcx + 3842]
    movzx r10d, byte ptr [rdx + 3842]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3842 ENDP

; ============================================
; Boot Byte Attestation - Position 3843
; Constant-time branchless validation
; of boot_data[3843] against baseline[3843]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3843] == baseline[3843]
;   EAX = 0 if mismatch detected at position 3843
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3843 PROC
    movzx eax, byte ptr [rcx + 3843]
    movzx r10d, byte ptr [rdx + 3843]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3843 ENDP

; ============================================
; Boot Byte Attestation - Position 3844
; Constant-time branchless validation
; of boot_data[3844] against baseline[3844]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3844] == baseline[3844]
;   EAX = 0 if mismatch detected at position 3844
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3844 PROC
    movzx eax, byte ptr [rcx + 3844]
    movzx r10d, byte ptr [rdx + 3844]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3844 ENDP

; ============================================
; Boot Byte Attestation - Position 3845
; Constant-time branchless validation
; of boot_data[3845] against baseline[3845]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3845] == baseline[3845]
;   EAX = 0 if mismatch detected at position 3845
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3845 PROC
    movzx eax, byte ptr [rcx + 3845]
    movzx r10d, byte ptr [rdx + 3845]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3845 ENDP

; ============================================
; Boot Byte Attestation - Position 3846
; Constant-time branchless validation
; of boot_data[3846] against baseline[3846]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3846] == baseline[3846]
;   EAX = 0 if mismatch detected at position 3846
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3846 PROC
    movzx eax, byte ptr [rcx + 3846]
    movzx r10d, byte ptr [rdx + 3846]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3846 ENDP

; ============================================
; Boot Byte Attestation - Position 3847
; Constant-time branchless validation
; of boot_data[3847] against baseline[3847]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3847] == baseline[3847]
;   EAX = 0 if mismatch detected at position 3847
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3847 PROC
    movzx eax, byte ptr [rcx + 3847]
    movzx r10d, byte ptr [rdx + 3847]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3847 ENDP

; ============================================
; Boot Byte Attestation - Position 3848
; Constant-time branchless validation
; of boot_data[3848] against baseline[3848]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3848] == baseline[3848]
;   EAX = 0 if mismatch detected at position 3848
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3848 PROC
    movzx eax, byte ptr [rcx + 3848]
    movzx r10d, byte ptr [rdx + 3848]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3848 ENDP

; ============================================
; Boot Byte Attestation - Position 3849
; Constant-time branchless validation
; of boot_data[3849] against baseline[3849]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3849] == baseline[3849]
;   EAX = 0 if mismatch detected at position 3849
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3849 PROC
    movzx eax, byte ptr [rcx + 3849]
    movzx r10d, byte ptr [rdx + 3849]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3849 ENDP

; ============================================
; Boot Byte Attestation - Position 3850
; Constant-time branchless validation
; of boot_data[3850] against baseline[3850]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3850] == baseline[3850]
;   EAX = 0 if mismatch detected at position 3850
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3850 PROC
    movzx eax, byte ptr [rcx + 3850]
    movzx r10d, byte ptr [rdx + 3850]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3850 ENDP

; ============================================
; Boot Byte Attestation - Position 3851
; Constant-time branchless validation
; of boot_data[3851] against baseline[3851]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3851] == baseline[3851]
;   EAX = 0 if mismatch detected at position 3851
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3851 PROC
    movzx eax, byte ptr [rcx + 3851]
    movzx r10d, byte ptr [rdx + 3851]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3851 ENDP

; ============================================
; Boot Byte Attestation - Position 3852
; Constant-time branchless validation
; of boot_data[3852] against baseline[3852]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3852] == baseline[3852]
;   EAX = 0 if mismatch detected at position 3852
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3852 PROC
    movzx eax, byte ptr [rcx + 3852]
    movzx r10d, byte ptr [rdx + 3852]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3852 ENDP

; ============================================
; Boot Byte Attestation - Position 3853
; Constant-time branchless validation
; of boot_data[3853] against baseline[3853]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3853] == baseline[3853]
;   EAX = 0 if mismatch detected at position 3853
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3853 PROC
    movzx eax, byte ptr [rcx + 3853]
    movzx r10d, byte ptr [rdx + 3853]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3853 ENDP

; ============================================
; Boot Byte Attestation - Position 3854
; Constant-time branchless validation
; of boot_data[3854] against baseline[3854]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3854] == baseline[3854]
;   EAX = 0 if mismatch detected at position 3854
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3854 PROC
    movzx eax, byte ptr [rcx + 3854]
    movzx r10d, byte ptr [rdx + 3854]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3854 ENDP

; ============================================
; Boot Byte Attestation - Position 3855
; Constant-time branchless validation
; of boot_data[3855] against baseline[3855]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3855] == baseline[3855]
;   EAX = 0 if mismatch detected at position 3855
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3855 PROC
    movzx eax, byte ptr [rcx + 3855]
    movzx r10d, byte ptr [rdx + 3855]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3855 ENDP

; ============================================
; Boot Byte Attestation - Position 3856
; Constant-time branchless validation
; of boot_data[3856] against baseline[3856]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3856] == baseline[3856]
;   EAX = 0 if mismatch detected at position 3856
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3856 PROC
    movzx eax, byte ptr [rcx + 3856]
    movzx r10d, byte ptr [rdx + 3856]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3856 ENDP

; ============================================
; Boot Byte Attestation - Position 3857
; Constant-time branchless validation
; of boot_data[3857] against baseline[3857]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3857] == baseline[3857]
;   EAX = 0 if mismatch detected at position 3857
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3857 PROC
    movzx eax, byte ptr [rcx + 3857]
    movzx r10d, byte ptr [rdx + 3857]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3857 ENDP

; ============================================
; Boot Byte Attestation - Position 3858
; Constant-time branchless validation
; of boot_data[3858] against baseline[3858]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3858] == baseline[3858]
;   EAX = 0 if mismatch detected at position 3858
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3858 PROC
    movzx eax, byte ptr [rcx + 3858]
    movzx r10d, byte ptr [rdx + 3858]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3858 ENDP

; ============================================
; Boot Byte Attestation - Position 3859
; Constant-time branchless validation
; of boot_data[3859] against baseline[3859]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3859] == baseline[3859]
;   EAX = 0 if mismatch detected at position 3859
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3859 PROC
    movzx eax, byte ptr [rcx + 3859]
    movzx r10d, byte ptr [rdx + 3859]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3859 ENDP

; ============================================
; Boot Byte Attestation - Position 3860
; Constant-time branchless validation
; of boot_data[3860] against baseline[3860]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3860] == baseline[3860]
;   EAX = 0 if mismatch detected at position 3860
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3860 PROC
    movzx eax, byte ptr [rcx + 3860]
    movzx r10d, byte ptr [rdx + 3860]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3860 ENDP

; ============================================
; Boot Byte Attestation - Position 3861
; Constant-time branchless validation
; of boot_data[3861] against baseline[3861]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3861] == baseline[3861]
;   EAX = 0 if mismatch detected at position 3861
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3861 PROC
    movzx eax, byte ptr [rcx + 3861]
    movzx r10d, byte ptr [rdx + 3861]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3861 ENDP

; ============================================
; Boot Byte Attestation - Position 3862
; Constant-time branchless validation
; of boot_data[3862] against baseline[3862]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3862] == baseline[3862]
;   EAX = 0 if mismatch detected at position 3862
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3862 PROC
    movzx eax, byte ptr [rcx + 3862]
    movzx r10d, byte ptr [rdx + 3862]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3862 ENDP

; ============================================
; Boot Byte Attestation - Position 3863
; Constant-time branchless validation
; of boot_data[3863] against baseline[3863]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3863] == baseline[3863]
;   EAX = 0 if mismatch detected at position 3863
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3863 PROC
    movzx eax, byte ptr [rcx + 3863]
    movzx r10d, byte ptr [rdx + 3863]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3863 ENDP

; ============================================
; Boot Byte Attestation - Position 3864
; Constant-time branchless validation
; of boot_data[3864] against baseline[3864]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3864] == baseline[3864]
;   EAX = 0 if mismatch detected at position 3864
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3864 PROC
    movzx eax, byte ptr [rcx + 3864]
    movzx r10d, byte ptr [rdx + 3864]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3864 ENDP

; ============================================
; Boot Byte Attestation - Position 3865
; Constant-time branchless validation
; of boot_data[3865] against baseline[3865]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3865] == baseline[3865]
;   EAX = 0 if mismatch detected at position 3865
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3865 PROC
    movzx eax, byte ptr [rcx + 3865]
    movzx r10d, byte ptr [rdx + 3865]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3865 ENDP

; ============================================
; Boot Byte Attestation - Position 3866
; Constant-time branchless validation
; of boot_data[3866] against baseline[3866]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3866] == baseline[3866]
;   EAX = 0 if mismatch detected at position 3866
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3866 PROC
    movzx eax, byte ptr [rcx + 3866]
    movzx r10d, byte ptr [rdx + 3866]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3866 ENDP

; ============================================
; Boot Byte Attestation - Position 3867
; Constant-time branchless validation
; of boot_data[3867] against baseline[3867]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3867] == baseline[3867]
;   EAX = 0 if mismatch detected at position 3867
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3867 PROC
    movzx eax, byte ptr [rcx + 3867]
    movzx r10d, byte ptr [rdx + 3867]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3867 ENDP

; ============================================
; Boot Byte Attestation - Position 3868
; Constant-time branchless validation
; of boot_data[3868] against baseline[3868]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3868] == baseline[3868]
;   EAX = 0 if mismatch detected at position 3868
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3868 PROC
    movzx eax, byte ptr [rcx + 3868]
    movzx r10d, byte ptr [rdx + 3868]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3868 ENDP

; ============================================
; Boot Byte Attestation - Position 3869
; Constant-time branchless validation
; of boot_data[3869] against baseline[3869]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3869] == baseline[3869]
;   EAX = 0 if mismatch detected at position 3869
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3869 PROC
    movzx eax, byte ptr [rcx + 3869]
    movzx r10d, byte ptr [rdx + 3869]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3869 ENDP

; ============================================
; Boot Byte Attestation - Position 3870
; Constant-time branchless validation
; of boot_data[3870] against baseline[3870]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3870] == baseline[3870]
;   EAX = 0 if mismatch detected at position 3870
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3870 PROC
    movzx eax, byte ptr [rcx + 3870]
    movzx r10d, byte ptr [rdx + 3870]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3870 ENDP

; ============================================
; Boot Byte Attestation - Position 3871
; Constant-time branchless validation
; of boot_data[3871] against baseline[3871]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3871] == baseline[3871]
;   EAX = 0 if mismatch detected at position 3871
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3871 PROC
    movzx eax, byte ptr [rcx + 3871]
    movzx r10d, byte ptr [rdx + 3871]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3871 ENDP

; ============================================
; Boot Byte Attestation - Position 3872
; Constant-time branchless validation
; of boot_data[3872] against baseline[3872]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3872] == baseline[3872]
;   EAX = 0 if mismatch detected at position 3872
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3872 PROC
    movzx eax, byte ptr [rcx + 3872]
    movzx r10d, byte ptr [rdx + 3872]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3872 ENDP

; ============================================
; Boot Byte Attestation - Position 3873
; Constant-time branchless validation
; of boot_data[3873] against baseline[3873]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3873] == baseline[3873]
;   EAX = 0 if mismatch detected at position 3873
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3873 PROC
    movzx eax, byte ptr [rcx + 3873]
    movzx r10d, byte ptr [rdx + 3873]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3873 ENDP

; ============================================
; Boot Byte Attestation - Position 3874
; Constant-time branchless validation
; of boot_data[3874] against baseline[3874]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3874] == baseline[3874]
;   EAX = 0 if mismatch detected at position 3874
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3874 PROC
    movzx eax, byte ptr [rcx + 3874]
    movzx r10d, byte ptr [rdx + 3874]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3874 ENDP

; ============================================
; Boot Byte Attestation - Position 3875
; Constant-time branchless validation
; of boot_data[3875] against baseline[3875]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3875] == baseline[3875]
;   EAX = 0 if mismatch detected at position 3875
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3875 PROC
    movzx eax, byte ptr [rcx + 3875]
    movzx r10d, byte ptr [rdx + 3875]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3875 ENDP

; ============================================
; Boot Byte Attestation - Position 3876
; Constant-time branchless validation
; of boot_data[3876] against baseline[3876]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3876] == baseline[3876]
;   EAX = 0 if mismatch detected at position 3876
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3876 PROC
    movzx eax, byte ptr [rcx + 3876]
    movzx r10d, byte ptr [rdx + 3876]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3876 ENDP

; ============================================
; Boot Byte Attestation - Position 3877
; Constant-time branchless validation
; of boot_data[3877] against baseline[3877]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3877] == baseline[3877]
;   EAX = 0 if mismatch detected at position 3877
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3877 PROC
    movzx eax, byte ptr [rcx + 3877]
    movzx r10d, byte ptr [rdx + 3877]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3877 ENDP

; ============================================
; Boot Byte Attestation - Position 3878
; Constant-time branchless validation
; of boot_data[3878] against baseline[3878]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3878] == baseline[3878]
;   EAX = 0 if mismatch detected at position 3878
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3878 PROC
    movzx eax, byte ptr [rcx + 3878]
    movzx r10d, byte ptr [rdx + 3878]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3878 ENDP

; ============================================
; Boot Byte Attestation - Position 3879
; Constant-time branchless validation
; of boot_data[3879] against baseline[3879]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3879] == baseline[3879]
;   EAX = 0 if mismatch detected at position 3879
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3879 PROC
    movzx eax, byte ptr [rcx + 3879]
    movzx r10d, byte ptr [rdx + 3879]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3879 ENDP

; ============================================
; Boot Byte Attestation - Position 3880
; Constant-time branchless validation
; of boot_data[3880] against baseline[3880]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3880] == baseline[3880]
;   EAX = 0 if mismatch detected at position 3880
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3880 PROC
    movzx eax, byte ptr [rcx + 3880]
    movzx r10d, byte ptr [rdx + 3880]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3880 ENDP

; ============================================
; Boot Byte Attestation - Position 3881
; Constant-time branchless validation
; of boot_data[3881] against baseline[3881]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3881] == baseline[3881]
;   EAX = 0 if mismatch detected at position 3881
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3881 PROC
    movzx eax, byte ptr [rcx + 3881]
    movzx r10d, byte ptr [rdx + 3881]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3881 ENDP

; ============================================
; Boot Byte Attestation - Position 3882
; Constant-time branchless validation
; of boot_data[3882] against baseline[3882]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3882] == baseline[3882]
;   EAX = 0 if mismatch detected at position 3882
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3882 PROC
    movzx eax, byte ptr [rcx + 3882]
    movzx r10d, byte ptr [rdx + 3882]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3882 ENDP

; ============================================
; Boot Byte Attestation - Position 3883
; Constant-time branchless validation
; of boot_data[3883] against baseline[3883]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3883] == baseline[3883]
;   EAX = 0 if mismatch detected at position 3883
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3883 PROC
    movzx eax, byte ptr [rcx + 3883]
    movzx r10d, byte ptr [rdx + 3883]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3883 ENDP

; ============================================
; Boot Byte Attestation - Position 3884
; Constant-time branchless validation
; of boot_data[3884] against baseline[3884]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3884] == baseline[3884]
;   EAX = 0 if mismatch detected at position 3884
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3884 PROC
    movzx eax, byte ptr [rcx + 3884]
    movzx r10d, byte ptr [rdx + 3884]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3884 ENDP

; ============================================
; Boot Byte Attestation - Position 3885
; Constant-time branchless validation
; of boot_data[3885] against baseline[3885]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3885] == baseline[3885]
;   EAX = 0 if mismatch detected at position 3885
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3885 PROC
    movzx eax, byte ptr [rcx + 3885]
    movzx r10d, byte ptr [rdx + 3885]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3885 ENDP

; ============================================
; Boot Byte Attestation - Position 3886
; Constant-time branchless validation
; of boot_data[3886] against baseline[3886]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3886] == baseline[3886]
;   EAX = 0 if mismatch detected at position 3886
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3886 PROC
    movzx eax, byte ptr [rcx + 3886]
    movzx r10d, byte ptr [rdx + 3886]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3886 ENDP

; ============================================
; Boot Byte Attestation - Position 3887
; Constant-time branchless validation
; of boot_data[3887] against baseline[3887]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3887] == baseline[3887]
;   EAX = 0 if mismatch detected at position 3887
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3887 PROC
    movzx eax, byte ptr [rcx + 3887]
    movzx r10d, byte ptr [rdx + 3887]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3887 ENDP

; ============================================
; Boot Byte Attestation - Position 3888
; Constant-time branchless validation
; of boot_data[3888] against baseline[3888]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3888] == baseline[3888]
;   EAX = 0 if mismatch detected at position 3888
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3888 PROC
    movzx eax, byte ptr [rcx + 3888]
    movzx r10d, byte ptr [rdx + 3888]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3888 ENDP

; ============================================
; Boot Byte Attestation - Position 3889
; Constant-time branchless validation
; of boot_data[3889] against baseline[3889]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3889] == baseline[3889]
;   EAX = 0 if mismatch detected at position 3889
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3889 PROC
    movzx eax, byte ptr [rcx + 3889]
    movzx r10d, byte ptr [rdx + 3889]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3889 ENDP

; ============================================
; Boot Byte Attestation - Position 3890
; Constant-time branchless validation
; of boot_data[3890] against baseline[3890]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3890] == baseline[3890]
;   EAX = 0 if mismatch detected at position 3890
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3890 PROC
    movzx eax, byte ptr [rcx + 3890]
    movzx r10d, byte ptr [rdx + 3890]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3890 ENDP

; ============================================
; Boot Byte Attestation - Position 3891
; Constant-time branchless validation
; of boot_data[3891] against baseline[3891]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3891] == baseline[3891]
;   EAX = 0 if mismatch detected at position 3891
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3891 PROC
    movzx eax, byte ptr [rcx + 3891]
    movzx r10d, byte ptr [rdx + 3891]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3891 ENDP

; ============================================
; Boot Byte Attestation - Position 3892
; Constant-time branchless validation
; of boot_data[3892] against baseline[3892]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3892] == baseline[3892]
;   EAX = 0 if mismatch detected at position 3892
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3892 PROC
    movzx eax, byte ptr [rcx + 3892]
    movzx r10d, byte ptr [rdx + 3892]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3892 ENDP

; ============================================
; Boot Byte Attestation - Position 3893
; Constant-time branchless validation
; of boot_data[3893] against baseline[3893]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3893] == baseline[3893]
;   EAX = 0 if mismatch detected at position 3893
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3893 PROC
    movzx eax, byte ptr [rcx + 3893]
    movzx r10d, byte ptr [rdx + 3893]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3893 ENDP

; ============================================
; Boot Byte Attestation - Position 3894
; Constant-time branchless validation
; of boot_data[3894] against baseline[3894]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3894] == baseline[3894]
;   EAX = 0 if mismatch detected at position 3894
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3894 PROC
    movzx eax, byte ptr [rcx + 3894]
    movzx r10d, byte ptr [rdx + 3894]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3894 ENDP

; ============================================
; Boot Byte Attestation - Position 3895
; Constant-time branchless validation
; of boot_data[3895] against baseline[3895]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3895] == baseline[3895]
;   EAX = 0 if mismatch detected at position 3895
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3895 PROC
    movzx eax, byte ptr [rcx + 3895]
    movzx r10d, byte ptr [rdx + 3895]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3895 ENDP

; ============================================
; Boot Byte Attestation - Position 3896
; Constant-time branchless validation
; of boot_data[3896] against baseline[3896]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3896] == baseline[3896]
;   EAX = 0 if mismatch detected at position 3896
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3896 PROC
    movzx eax, byte ptr [rcx + 3896]
    movzx r10d, byte ptr [rdx + 3896]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3896 ENDP

; ============================================
; Boot Byte Attestation - Position 3897
; Constant-time branchless validation
; of boot_data[3897] against baseline[3897]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3897] == baseline[3897]
;   EAX = 0 if mismatch detected at position 3897
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3897 PROC
    movzx eax, byte ptr [rcx + 3897]
    movzx r10d, byte ptr [rdx + 3897]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3897 ENDP

; ============================================
; Boot Byte Attestation - Position 3898
; Constant-time branchless validation
; of boot_data[3898] against baseline[3898]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3898] == baseline[3898]
;   EAX = 0 if mismatch detected at position 3898
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3898 PROC
    movzx eax, byte ptr [rcx + 3898]
    movzx r10d, byte ptr [rdx + 3898]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3898 ENDP

; ============================================
; Boot Byte Attestation - Position 3899
; Constant-time branchless validation
; of boot_data[3899] against baseline[3899]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3899] == baseline[3899]
;   EAX = 0 if mismatch detected at position 3899
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3899 PROC
    movzx eax, byte ptr [rcx + 3899]
    movzx r10d, byte ptr [rdx + 3899]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3899 ENDP

; ============================================
; Boot Byte Attestation - Position 3900
; Constant-time branchless validation
; of boot_data[3900] against baseline[3900]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3900] == baseline[3900]
;   EAX = 0 if mismatch detected at position 3900
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3900 PROC
    movzx eax, byte ptr [rcx + 3900]
    movzx r10d, byte ptr [rdx + 3900]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3900 ENDP

; ============================================
; Boot Byte Attestation - Position 3901
; Constant-time branchless validation
; of boot_data[3901] against baseline[3901]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3901] == baseline[3901]
;   EAX = 0 if mismatch detected at position 3901
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3901 PROC
    movzx eax, byte ptr [rcx + 3901]
    movzx r10d, byte ptr [rdx + 3901]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3901 ENDP

; ============================================
; Boot Byte Attestation - Position 3902
; Constant-time branchless validation
; of boot_data[3902] against baseline[3902]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3902] == baseline[3902]
;   EAX = 0 if mismatch detected at position 3902
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3902 PROC
    movzx eax, byte ptr [rcx + 3902]
    movzx r10d, byte ptr [rdx + 3902]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3902 ENDP

; ============================================
; Boot Byte Attestation - Position 3903
; Constant-time branchless validation
; of boot_data[3903] against baseline[3903]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3903] == baseline[3903]
;   EAX = 0 if mismatch detected at position 3903
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3903 PROC
    movzx eax, byte ptr [rcx + 3903]
    movzx r10d, byte ptr [rdx + 3903]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3903 ENDP

; ============================================
; Boot Byte Attestation - Position 3904
; Constant-time branchless validation
; of boot_data[3904] against baseline[3904]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3904] == baseline[3904]
;   EAX = 0 if mismatch detected at position 3904
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3904 PROC
    movzx eax, byte ptr [rcx + 3904]
    movzx r10d, byte ptr [rdx + 3904]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3904 ENDP

; ============================================
; Boot Byte Attestation - Position 3905
; Constant-time branchless validation
; of boot_data[3905] against baseline[3905]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3905] == baseline[3905]
;   EAX = 0 if mismatch detected at position 3905
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3905 PROC
    movzx eax, byte ptr [rcx + 3905]
    movzx r10d, byte ptr [rdx + 3905]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3905 ENDP

; ============================================
; Boot Byte Attestation - Position 3906
; Constant-time branchless validation
; of boot_data[3906] against baseline[3906]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3906] == baseline[3906]
;   EAX = 0 if mismatch detected at position 3906
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3906 PROC
    movzx eax, byte ptr [rcx + 3906]
    movzx r10d, byte ptr [rdx + 3906]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3906 ENDP

; ============================================
; Boot Byte Attestation - Position 3907
; Constant-time branchless validation
; of boot_data[3907] against baseline[3907]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3907] == baseline[3907]
;   EAX = 0 if mismatch detected at position 3907
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3907 PROC
    movzx eax, byte ptr [rcx + 3907]
    movzx r10d, byte ptr [rdx + 3907]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3907 ENDP

; ============================================
; Boot Byte Attestation - Position 3908
; Constant-time branchless validation
; of boot_data[3908] against baseline[3908]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3908] == baseline[3908]
;   EAX = 0 if mismatch detected at position 3908
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3908 PROC
    movzx eax, byte ptr [rcx + 3908]
    movzx r10d, byte ptr [rdx + 3908]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3908 ENDP

; ============================================
; Boot Byte Attestation - Position 3909
; Constant-time branchless validation
; of boot_data[3909] against baseline[3909]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3909] == baseline[3909]
;   EAX = 0 if mismatch detected at position 3909
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3909 PROC
    movzx eax, byte ptr [rcx + 3909]
    movzx r10d, byte ptr [rdx + 3909]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3909 ENDP

; ============================================
; Boot Byte Attestation - Position 3910
; Constant-time branchless validation
; of boot_data[3910] against baseline[3910]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3910] == baseline[3910]
;   EAX = 0 if mismatch detected at position 3910
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3910 PROC
    movzx eax, byte ptr [rcx + 3910]
    movzx r10d, byte ptr [rdx + 3910]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3910 ENDP

; ============================================
; Boot Byte Attestation - Position 3911
; Constant-time branchless validation
; of boot_data[3911] against baseline[3911]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3911] == baseline[3911]
;   EAX = 0 if mismatch detected at position 3911
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3911 PROC
    movzx eax, byte ptr [rcx + 3911]
    movzx r10d, byte ptr [rdx + 3911]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3911 ENDP

; ============================================
; Boot Byte Attestation - Position 3912
; Constant-time branchless validation
; of boot_data[3912] against baseline[3912]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3912] == baseline[3912]
;   EAX = 0 if mismatch detected at position 3912
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3912 PROC
    movzx eax, byte ptr [rcx + 3912]
    movzx r10d, byte ptr [rdx + 3912]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3912 ENDP

; ============================================
; Boot Byte Attestation - Position 3913
; Constant-time branchless validation
; of boot_data[3913] against baseline[3913]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3913] == baseline[3913]
;   EAX = 0 if mismatch detected at position 3913
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3913 PROC
    movzx eax, byte ptr [rcx + 3913]
    movzx r10d, byte ptr [rdx + 3913]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3913 ENDP

; ============================================
; Boot Byte Attestation - Position 3914
; Constant-time branchless validation
; of boot_data[3914] against baseline[3914]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3914] == baseline[3914]
;   EAX = 0 if mismatch detected at position 3914
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3914 PROC
    movzx eax, byte ptr [rcx + 3914]
    movzx r10d, byte ptr [rdx + 3914]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3914 ENDP

; ============================================
; Boot Byte Attestation - Position 3915
; Constant-time branchless validation
; of boot_data[3915] against baseline[3915]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3915] == baseline[3915]
;   EAX = 0 if mismatch detected at position 3915
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3915 PROC
    movzx eax, byte ptr [rcx + 3915]
    movzx r10d, byte ptr [rdx + 3915]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3915 ENDP

; ============================================
; Boot Byte Attestation - Position 3916
; Constant-time branchless validation
; of boot_data[3916] against baseline[3916]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3916] == baseline[3916]
;   EAX = 0 if mismatch detected at position 3916
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3916 PROC
    movzx eax, byte ptr [rcx + 3916]
    movzx r10d, byte ptr [rdx + 3916]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3916 ENDP

; ============================================
; Boot Byte Attestation - Position 3917
; Constant-time branchless validation
; of boot_data[3917] against baseline[3917]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3917] == baseline[3917]
;   EAX = 0 if mismatch detected at position 3917
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3917 PROC
    movzx eax, byte ptr [rcx + 3917]
    movzx r10d, byte ptr [rdx + 3917]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3917 ENDP

; ============================================
; Boot Byte Attestation - Position 3918
; Constant-time branchless validation
; of boot_data[3918] against baseline[3918]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3918] == baseline[3918]
;   EAX = 0 if mismatch detected at position 3918
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3918 PROC
    movzx eax, byte ptr [rcx + 3918]
    movzx r10d, byte ptr [rdx + 3918]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3918 ENDP

; ============================================
; Boot Byte Attestation - Position 3919
; Constant-time branchless validation
; of boot_data[3919] against baseline[3919]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3919] == baseline[3919]
;   EAX = 0 if mismatch detected at position 3919
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3919 PROC
    movzx eax, byte ptr [rcx + 3919]
    movzx r10d, byte ptr [rdx + 3919]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3919 ENDP

; ============================================
; Boot Byte Attestation - Position 3920
; Constant-time branchless validation
; of boot_data[3920] against baseline[3920]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3920] == baseline[3920]
;   EAX = 0 if mismatch detected at position 3920
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3920 PROC
    movzx eax, byte ptr [rcx + 3920]
    movzx r10d, byte ptr [rdx + 3920]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3920 ENDP

; ============================================
; Boot Byte Attestation - Position 3921
; Constant-time branchless validation
; of boot_data[3921] against baseline[3921]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3921] == baseline[3921]
;   EAX = 0 if mismatch detected at position 3921
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3921 PROC
    movzx eax, byte ptr [rcx + 3921]
    movzx r10d, byte ptr [rdx + 3921]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3921 ENDP

; ============================================
; Boot Byte Attestation - Position 3922
; Constant-time branchless validation
; of boot_data[3922] against baseline[3922]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3922] == baseline[3922]
;   EAX = 0 if mismatch detected at position 3922
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3922 PROC
    movzx eax, byte ptr [rcx + 3922]
    movzx r10d, byte ptr [rdx + 3922]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3922 ENDP

; ============================================
; Boot Byte Attestation - Position 3923
; Constant-time branchless validation
; of boot_data[3923] against baseline[3923]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3923] == baseline[3923]
;   EAX = 0 if mismatch detected at position 3923
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3923 PROC
    movzx eax, byte ptr [rcx + 3923]
    movzx r10d, byte ptr [rdx + 3923]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3923 ENDP

; ============================================
; Boot Byte Attestation - Position 3924
; Constant-time branchless validation
; of boot_data[3924] against baseline[3924]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3924] == baseline[3924]
;   EAX = 0 if mismatch detected at position 3924
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3924 PROC
    movzx eax, byte ptr [rcx + 3924]
    movzx r10d, byte ptr [rdx + 3924]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3924 ENDP

; ============================================
; Boot Byte Attestation - Position 3925
; Constant-time branchless validation
; of boot_data[3925] against baseline[3925]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3925] == baseline[3925]
;   EAX = 0 if mismatch detected at position 3925
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3925 PROC
    movzx eax, byte ptr [rcx + 3925]
    movzx r10d, byte ptr [rdx + 3925]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3925 ENDP

; ============================================
; Boot Byte Attestation - Position 3926
; Constant-time branchless validation
; of boot_data[3926] against baseline[3926]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3926] == baseline[3926]
;   EAX = 0 if mismatch detected at position 3926
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3926 PROC
    movzx eax, byte ptr [rcx + 3926]
    movzx r10d, byte ptr [rdx + 3926]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3926 ENDP

; ============================================
; Boot Byte Attestation - Position 3927
; Constant-time branchless validation
; of boot_data[3927] against baseline[3927]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3927] == baseline[3927]
;   EAX = 0 if mismatch detected at position 3927
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3927 PROC
    movzx eax, byte ptr [rcx + 3927]
    movzx r10d, byte ptr [rdx + 3927]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3927 ENDP

; ============================================
; Boot Byte Attestation - Position 3928
; Constant-time branchless validation
; of boot_data[3928] against baseline[3928]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3928] == baseline[3928]
;   EAX = 0 if mismatch detected at position 3928
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3928 PROC
    movzx eax, byte ptr [rcx + 3928]
    movzx r10d, byte ptr [rdx + 3928]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3928 ENDP

; ============================================
; Boot Byte Attestation - Position 3929
; Constant-time branchless validation
; of boot_data[3929] against baseline[3929]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3929] == baseline[3929]
;   EAX = 0 if mismatch detected at position 3929
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3929 PROC
    movzx eax, byte ptr [rcx + 3929]
    movzx r10d, byte ptr [rdx + 3929]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3929 ENDP

; ============================================
; Boot Byte Attestation - Position 3930
; Constant-time branchless validation
; of boot_data[3930] against baseline[3930]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3930] == baseline[3930]
;   EAX = 0 if mismatch detected at position 3930
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3930 PROC
    movzx eax, byte ptr [rcx + 3930]
    movzx r10d, byte ptr [rdx + 3930]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3930 ENDP

; ============================================
; Boot Byte Attestation - Position 3931
; Constant-time branchless validation
; of boot_data[3931] against baseline[3931]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3931] == baseline[3931]
;   EAX = 0 if mismatch detected at position 3931
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3931 PROC
    movzx eax, byte ptr [rcx + 3931]
    movzx r10d, byte ptr [rdx + 3931]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3931 ENDP

; ============================================
; Boot Byte Attestation - Position 3932
; Constant-time branchless validation
; of boot_data[3932] against baseline[3932]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3932] == baseline[3932]
;   EAX = 0 if mismatch detected at position 3932
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3932 PROC
    movzx eax, byte ptr [rcx + 3932]
    movzx r10d, byte ptr [rdx + 3932]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3932 ENDP

; ============================================
; Boot Byte Attestation - Position 3933
; Constant-time branchless validation
; of boot_data[3933] against baseline[3933]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3933] == baseline[3933]
;   EAX = 0 if mismatch detected at position 3933
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3933 PROC
    movzx eax, byte ptr [rcx + 3933]
    movzx r10d, byte ptr [rdx + 3933]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3933 ENDP

; ============================================
; Boot Byte Attestation - Position 3934
; Constant-time branchless validation
; of boot_data[3934] against baseline[3934]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3934] == baseline[3934]
;   EAX = 0 if mismatch detected at position 3934
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3934 PROC
    movzx eax, byte ptr [rcx + 3934]
    movzx r10d, byte ptr [rdx + 3934]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3934 ENDP

; ============================================
; Boot Byte Attestation - Position 3935
; Constant-time branchless validation
; of boot_data[3935] against baseline[3935]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3935] == baseline[3935]
;   EAX = 0 if mismatch detected at position 3935
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3935 PROC
    movzx eax, byte ptr [rcx + 3935]
    movzx r10d, byte ptr [rdx + 3935]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3935 ENDP

; ============================================
; Boot Byte Attestation - Position 3936
; Constant-time branchless validation
; of boot_data[3936] against baseline[3936]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3936] == baseline[3936]
;   EAX = 0 if mismatch detected at position 3936
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3936 PROC
    movzx eax, byte ptr [rcx + 3936]
    movzx r10d, byte ptr [rdx + 3936]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3936 ENDP

; ============================================
; Boot Byte Attestation - Position 3937
; Constant-time branchless validation
; of boot_data[3937] against baseline[3937]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3937] == baseline[3937]
;   EAX = 0 if mismatch detected at position 3937
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3937 PROC
    movzx eax, byte ptr [rcx + 3937]
    movzx r10d, byte ptr [rdx + 3937]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3937 ENDP

; ============================================
; Boot Byte Attestation - Position 3938
; Constant-time branchless validation
; of boot_data[3938] against baseline[3938]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3938] == baseline[3938]
;   EAX = 0 if mismatch detected at position 3938
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3938 PROC
    movzx eax, byte ptr [rcx + 3938]
    movzx r10d, byte ptr [rdx + 3938]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3938 ENDP

; ============================================
; Boot Byte Attestation - Position 3939
; Constant-time branchless validation
; of boot_data[3939] against baseline[3939]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3939] == baseline[3939]
;   EAX = 0 if mismatch detected at position 3939
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3939 PROC
    movzx eax, byte ptr [rcx + 3939]
    movzx r10d, byte ptr [rdx + 3939]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3939 ENDP

; ============================================
; Boot Byte Attestation - Position 3940
; Constant-time branchless validation
; of boot_data[3940] against baseline[3940]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3940] == baseline[3940]
;   EAX = 0 if mismatch detected at position 3940
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3940 PROC
    movzx eax, byte ptr [rcx + 3940]
    movzx r10d, byte ptr [rdx + 3940]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3940 ENDP

; ============================================
; Boot Byte Attestation - Position 3941
; Constant-time branchless validation
; of boot_data[3941] against baseline[3941]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3941] == baseline[3941]
;   EAX = 0 if mismatch detected at position 3941
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3941 PROC
    movzx eax, byte ptr [rcx + 3941]
    movzx r10d, byte ptr [rdx + 3941]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3941 ENDP

; ============================================
; Boot Byte Attestation - Position 3942
; Constant-time branchless validation
; of boot_data[3942] against baseline[3942]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3942] == baseline[3942]
;   EAX = 0 if mismatch detected at position 3942
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3942 PROC
    movzx eax, byte ptr [rcx + 3942]
    movzx r10d, byte ptr [rdx + 3942]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3942 ENDP

; ============================================
; Boot Byte Attestation - Position 3943
; Constant-time branchless validation
; of boot_data[3943] against baseline[3943]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3943] == baseline[3943]
;   EAX = 0 if mismatch detected at position 3943
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3943 PROC
    movzx eax, byte ptr [rcx + 3943]
    movzx r10d, byte ptr [rdx + 3943]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3943 ENDP

; ============================================
; Boot Byte Attestation - Position 3944
; Constant-time branchless validation
; of boot_data[3944] against baseline[3944]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3944] == baseline[3944]
;   EAX = 0 if mismatch detected at position 3944
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3944 PROC
    movzx eax, byte ptr [rcx + 3944]
    movzx r10d, byte ptr [rdx + 3944]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3944 ENDP

; ============================================
; Boot Byte Attestation - Position 3945
; Constant-time branchless validation
; of boot_data[3945] against baseline[3945]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3945] == baseline[3945]
;   EAX = 0 if mismatch detected at position 3945
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3945 PROC
    movzx eax, byte ptr [rcx + 3945]
    movzx r10d, byte ptr [rdx + 3945]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3945 ENDP

; ============================================
; Boot Byte Attestation - Position 3946
; Constant-time branchless validation
; of boot_data[3946] against baseline[3946]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3946] == baseline[3946]
;   EAX = 0 if mismatch detected at position 3946
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3946 PROC
    movzx eax, byte ptr [rcx + 3946]
    movzx r10d, byte ptr [rdx + 3946]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3946 ENDP

; ============================================
; Boot Byte Attestation - Position 3947
; Constant-time branchless validation
; of boot_data[3947] against baseline[3947]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3947] == baseline[3947]
;   EAX = 0 if mismatch detected at position 3947
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3947 PROC
    movzx eax, byte ptr [rcx + 3947]
    movzx r10d, byte ptr [rdx + 3947]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3947 ENDP

; ============================================
; Boot Byte Attestation - Position 3948
; Constant-time branchless validation
; of boot_data[3948] against baseline[3948]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3948] == baseline[3948]
;   EAX = 0 if mismatch detected at position 3948
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3948 PROC
    movzx eax, byte ptr [rcx + 3948]
    movzx r10d, byte ptr [rdx + 3948]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3948 ENDP

; ============================================
; Boot Byte Attestation - Position 3949
; Constant-time branchless validation
; of boot_data[3949] against baseline[3949]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3949] == baseline[3949]
;   EAX = 0 if mismatch detected at position 3949
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3949 PROC
    movzx eax, byte ptr [rcx + 3949]
    movzx r10d, byte ptr [rdx + 3949]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3949 ENDP

; ============================================
; Boot Byte Attestation - Position 3950
; Constant-time branchless validation
; of boot_data[3950] against baseline[3950]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3950] == baseline[3950]
;   EAX = 0 if mismatch detected at position 3950
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3950 PROC
    movzx eax, byte ptr [rcx + 3950]
    movzx r10d, byte ptr [rdx + 3950]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3950 ENDP

; ============================================
; Boot Byte Attestation - Position 3951
; Constant-time branchless validation
; of boot_data[3951] against baseline[3951]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3951] == baseline[3951]
;   EAX = 0 if mismatch detected at position 3951
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3951 PROC
    movzx eax, byte ptr [rcx + 3951]
    movzx r10d, byte ptr [rdx + 3951]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3951 ENDP

; ============================================
; Boot Byte Attestation - Position 3952
; Constant-time branchless validation
; of boot_data[3952] against baseline[3952]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3952] == baseline[3952]
;   EAX = 0 if mismatch detected at position 3952
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3952 PROC
    movzx eax, byte ptr [rcx + 3952]
    movzx r10d, byte ptr [rdx + 3952]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3952 ENDP

; ============================================
; Boot Byte Attestation - Position 3953
; Constant-time branchless validation
; of boot_data[3953] against baseline[3953]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3953] == baseline[3953]
;   EAX = 0 if mismatch detected at position 3953
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3953 PROC
    movzx eax, byte ptr [rcx + 3953]
    movzx r10d, byte ptr [rdx + 3953]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3953 ENDP

; ============================================
; Boot Byte Attestation - Position 3954
; Constant-time branchless validation
; of boot_data[3954] against baseline[3954]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3954] == baseline[3954]
;   EAX = 0 if mismatch detected at position 3954
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3954 PROC
    movzx eax, byte ptr [rcx + 3954]
    movzx r10d, byte ptr [rdx + 3954]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3954 ENDP

; ============================================
; Boot Byte Attestation - Position 3955
; Constant-time branchless validation
; of boot_data[3955] against baseline[3955]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3955] == baseline[3955]
;   EAX = 0 if mismatch detected at position 3955
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3955 PROC
    movzx eax, byte ptr [rcx + 3955]
    movzx r10d, byte ptr [rdx + 3955]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3955 ENDP

; ============================================
; Boot Byte Attestation - Position 3956
; Constant-time branchless validation
; of boot_data[3956] against baseline[3956]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3956] == baseline[3956]
;   EAX = 0 if mismatch detected at position 3956
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3956 PROC
    movzx eax, byte ptr [rcx + 3956]
    movzx r10d, byte ptr [rdx + 3956]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3956 ENDP

; ============================================
; Boot Byte Attestation - Position 3957
; Constant-time branchless validation
; of boot_data[3957] against baseline[3957]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3957] == baseline[3957]
;   EAX = 0 if mismatch detected at position 3957
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3957 PROC
    movzx eax, byte ptr [rcx + 3957]
    movzx r10d, byte ptr [rdx + 3957]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3957 ENDP

; ============================================
; Boot Byte Attestation - Position 3958
; Constant-time branchless validation
; of boot_data[3958] against baseline[3958]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3958] == baseline[3958]
;   EAX = 0 if mismatch detected at position 3958
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3958 PROC
    movzx eax, byte ptr [rcx + 3958]
    movzx r10d, byte ptr [rdx + 3958]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3958 ENDP

; ============================================
; Boot Byte Attestation - Position 3959
; Constant-time branchless validation
; of boot_data[3959] against baseline[3959]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3959] == baseline[3959]
;   EAX = 0 if mismatch detected at position 3959
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3959 PROC
    movzx eax, byte ptr [rcx + 3959]
    movzx r10d, byte ptr [rdx + 3959]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3959 ENDP

; ============================================
; Boot Byte Attestation - Position 3960
; Constant-time branchless validation
; of boot_data[3960] against baseline[3960]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3960] == baseline[3960]
;   EAX = 0 if mismatch detected at position 3960
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3960 PROC
    movzx eax, byte ptr [rcx + 3960]
    movzx r10d, byte ptr [rdx + 3960]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3960 ENDP

; ============================================
; Boot Byte Attestation - Position 3961
; Constant-time branchless validation
; of boot_data[3961] against baseline[3961]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3961] == baseline[3961]
;   EAX = 0 if mismatch detected at position 3961
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3961 PROC
    movzx eax, byte ptr [rcx + 3961]
    movzx r10d, byte ptr [rdx + 3961]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3961 ENDP

; ============================================
; Boot Byte Attestation - Position 3962
; Constant-time branchless validation
; of boot_data[3962] against baseline[3962]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3962] == baseline[3962]
;   EAX = 0 if mismatch detected at position 3962
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3962 PROC
    movzx eax, byte ptr [rcx + 3962]
    movzx r10d, byte ptr [rdx + 3962]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3962 ENDP

; ============================================
; Boot Byte Attestation - Position 3963
; Constant-time branchless validation
; of boot_data[3963] against baseline[3963]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3963] == baseline[3963]
;   EAX = 0 if mismatch detected at position 3963
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3963 PROC
    movzx eax, byte ptr [rcx + 3963]
    movzx r10d, byte ptr [rdx + 3963]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3963 ENDP

; ============================================
; Boot Byte Attestation - Position 3964
; Constant-time branchless validation
; of boot_data[3964] against baseline[3964]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3964] == baseline[3964]
;   EAX = 0 if mismatch detected at position 3964
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3964 PROC
    movzx eax, byte ptr [rcx + 3964]
    movzx r10d, byte ptr [rdx + 3964]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3964 ENDP

; ============================================
; Boot Byte Attestation - Position 3965
; Constant-time branchless validation
; of boot_data[3965] against baseline[3965]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3965] == baseline[3965]
;   EAX = 0 if mismatch detected at position 3965
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3965 PROC
    movzx eax, byte ptr [rcx + 3965]
    movzx r10d, byte ptr [rdx + 3965]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3965 ENDP

; ============================================
; Boot Byte Attestation - Position 3966
; Constant-time branchless validation
; of boot_data[3966] against baseline[3966]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3966] == baseline[3966]
;   EAX = 0 if mismatch detected at position 3966
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3966 PROC
    movzx eax, byte ptr [rcx + 3966]
    movzx r10d, byte ptr [rdx + 3966]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3966 ENDP

; ============================================
; Boot Byte Attestation - Position 3967
; Constant-time branchless validation
; of boot_data[3967] against baseline[3967]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3967] == baseline[3967]
;   EAX = 0 if mismatch detected at position 3967
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3967 PROC
    movzx eax, byte ptr [rcx + 3967]
    movzx r10d, byte ptr [rdx + 3967]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3967 ENDP

; ============================================
; Boot Byte Attestation - Position 3968
; Constant-time branchless validation
; of boot_data[3968] against baseline[3968]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3968] == baseline[3968]
;   EAX = 0 if mismatch detected at position 3968
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3968 PROC
    movzx eax, byte ptr [rcx + 3968]
    movzx r10d, byte ptr [rdx + 3968]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3968 ENDP

; ============================================
; Boot Byte Attestation - Position 3969
; Constant-time branchless validation
; of boot_data[3969] against baseline[3969]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3969] == baseline[3969]
;   EAX = 0 if mismatch detected at position 3969
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3969 PROC
    movzx eax, byte ptr [rcx + 3969]
    movzx r10d, byte ptr [rdx + 3969]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3969 ENDP

; ============================================
; Boot Byte Attestation - Position 3970
; Constant-time branchless validation
; of boot_data[3970] against baseline[3970]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3970] == baseline[3970]
;   EAX = 0 if mismatch detected at position 3970
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3970 PROC
    movzx eax, byte ptr [rcx + 3970]
    movzx r10d, byte ptr [rdx + 3970]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3970 ENDP

; ============================================
; Boot Byte Attestation - Position 3971
; Constant-time branchless validation
; of boot_data[3971] against baseline[3971]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3971] == baseline[3971]
;   EAX = 0 if mismatch detected at position 3971
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3971 PROC
    movzx eax, byte ptr [rcx + 3971]
    movzx r10d, byte ptr [rdx + 3971]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3971 ENDP

; ============================================
; Boot Byte Attestation - Position 3972
; Constant-time branchless validation
; of boot_data[3972] against baseline[3972]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3972] == baseline[3972]
;   EAX = 0 if mismatch detected at position 3972
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3972 PROC
    movzx eax, byte ptr [rcx + 3972]
    movzx r10d, byte ptr [rdx + 3972]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3972 ENDP

; ============================================
; Boot Byte Attestation - Position 3973
; Constant-time branchless validation
; of boot_data[3973] against baseline[3973]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3973] == baseline[3973]
;   EAX = 0 if mismatch detected at position 3973
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3973 PROC
    movzx eax, byte ptr [rcx + 3973]
    movzx r10d, byte ptr [rdx + 3973]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3973 ENDP

; ============================================
; Boot Byte Attestation - Position 3974
; Constant-time branchless validation
; of boot_data[3974] against baseline[3974]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3974] == baseline[3974]
;   EAX = 0 if mismatch detected at position 3974
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3974 PROC
    movzx eax, byte ptr [rcx + 3974]
    movzx r10d, byte ptr [rdx + 3974]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3974 ENDP

; ============================================
; Boot Byte Attestation - Position 3975
; Constant-time branchless validation
; of boot_data[3975] against baseline[3975]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3975] == baseline[3975]
;   EAX = 0 if mismatch detected at position 3975
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3975 PROC
    movzx eax, byte ptr [rcx + 3975]
    movzx r10d, byte ptr [rdx + 3975]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3975 ENDP

; ============================================
; Boot Byte Attestation - Position 3976
; Constant-time branchless validation
; of boot_data[3976] against baseline[3976]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3976] == baseline[3976]
;   EAX = 0 if mismatch detected at position 3976
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3976 PROC
    movzx eax, byte ptr [rcx + 3976]
    movzx r10d, byte ptr [rdx + 3976]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3976 ENDP

; ============================================
; Boot Byte Attestation - Position 3977
; Constant-time branchless validation
; of boot_data[3977] against baseline[3977]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3977] == baseline[3977]
;   EAX = 0 if mismatch detected at position 3977
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3977 PROC
    movzx eax, byte ptr [rcx + 3977]
    movzx r10d, byte ptr [rdx + 3977]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3977 ENDP

; ============================================
; Boot Byte Attestation - Position 3978
; Constant-time branchless validation
; of boot_data[3978] against baseline[3978]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3978] == baseline[3978]
;   EAX = 0 if mismatch detected at position 3978
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3978 PROC
    movzx eax, byte ptr [rcx + 3978]
    movzx r10d, byte ptr [rdx + 3978]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3978 ENDP

; ============================================
; Boot Byte Attestation - Position 3979
; Constant-time branchless validation
; of boot_data[3979] against baseline[3979]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3979] == baseline[3979]
;   EAX = 0 if mismatch detected at position 3979
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3979 PROC
    movzx eax, byte ptr [rcx + 3979]
    movzx r10d, byte ptr [rdx + 3979]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3979 ENDP

; ============================================
; Boot Byte Attestation - Position 3980
; Constant-time branchless validation
; of boot_data[3980] against baseline[3980]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3980] == baseline[3980]
;   EAX = 0 if mismatch detected at position 3980
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3980 PROC
    movzx eax, byte ptr [rcx + 3980]
    movzx r10d, byte ptr [rdx + 3980]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3980 ENDP

; ============================================
; Boot Byte Attestation - Position 3981
; Constant-time branchless validation
; of boot_data[3981] against baseline[3981]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3981] == baseline[3981]
;   EAX = 0 if mismatch detected at position 3981
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3981 PROC
    movzx eax, byte ptr [rcx + 3981]
    movzx r10d, byte ptr [rdx + 3981]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3981 ENDP

; ============================================
; Boot Byte Attestation - Position 3982
; Constant-time branchless validation
; of boot_data[3982] against baseline[3982]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3982] == baseline[3982]
;   EAX = 0 if mismatch detected at position 3982
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3982 PROC
    movzx eax, byte ptr [rcx + 3982]
    movzx r10d, byte ptr [rdx + 3982]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3982 ENDP

; ============================================
; Boot Byte Attestation - Position 3983
; Constant-time branchless validation
; of boot_data[3983] against baseline[3983]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3983] == baseline[3983]
;   EAX = 0 if mismatch detected at position 3983
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3983 PROC
    movzx eax, byte ptr [rcx + 3983]
    movzx r10d, byte ptr [rdx + 3983]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3983 ENDP

; ============================================
; Boot Byte Attestation - Position 3984
; Constant-time branchless validation
; of boot_data[3984] against baseline[3984]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3984] == baseline[3984]
;   EAX = 0 if mismatch detected at position 3984
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3984 PROC
    movzx eax, byte ptr [rcx + 3984]
    movzx r10d, byte ptr [rdx + 3984]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3984 ENDP

; ============================================
; Boot Byte Attestation - Position 3985
; Constant-time branchless validation
; of boot_data[3985] against baseline[3985]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3985] == baseline[3985]
;   EAX = 0 if mismatch detected at position 3985
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3985 PROC
    movzx eax, byte ptr [rcx + 3985]
    movzx r10d, byte ptr [rdx + 3985]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3985 ENDP

; ============================================
; Boot Byte Attestation - Position 3986
; Constant-time branchless validation
; of boot_data[3986] against baseline[3986]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3986] == baseline[3986]
;   EAX = 0 if mismatch detected at position 3986
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3986 PROC
    movzx eax, byte ptr [rcx + 3986]
    movzx r10d, byte ptr [rdx + 3986]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3986 ENDP

; ============================================
; Boot Byte Attestation - Position 3987
; Constant-time branchless validation
; of boot_data[3987] against baseline[3987]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3987] == baseline[3987]
;   EAX = 0 if mismatch detected at position 3987
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3987 PROC
    movzx eax, byte ptr [rcx + 3987]
    movzx r10d, byte ptr [rdx + 3987]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3987 ENDP

; ============================================
; Boot Byte Attestation - Position 3988
; Constant-time branchless validation
; of boot_data[3988] against baseline[3988]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3988] == baseline[3988]
;   EAX = 0 if mismatch detected at position 3988
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3988 PROC
    movzx eax, byte ptr [rcx + 3988]
    movzx r10d, byte ptr [rdx + 3988]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3988 ENDP

; ============================================
; Boot Byte Attestation - Position 3989
; Constant-time branchless validation
; of boot_data[3989] against baseline[3989]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3989] == baseline[3989]
;   EAX = 0 if mismatch detected at position 3989
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3989 PROC
    movzx eax, byte ptr [rcx + 3989]
    movzx r10d, byte ptr [rdx + 3989]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3989 ENDP

; ============================================
; Boot Byte Attestation - Position 3990
; Constant-time branchless validation
; of boot_data[3990] against baseline[3990]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3990] == baseline[3990]
;   EAX = 0 if mismatch detected at position 3990
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3990 PROC
    movzx eax, byte ptr [rcx + 3990]
    movzx r10d, byte ptr [rdx + 3990]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3990 ENDP

; ============================================
; Boot Byte Attestation - Position 3991
; Constant-time branchless validation
; of boot_data[3991] against baseline[3991]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3991] == baseline[3991]
;   EAX = 0 if mismatch detected at position 3991
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3991 PROC
    movzx eax, byte ptr [rcx + 3991]
    movzx r10d, byte ptr [rdx + 3991]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3991 ENDP

; ============================================
; Boot Byte Attestation - Position 3992
; Constant-time branchless validation
; of boot_data[3992] against baseline[3992]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3992] == baseline[3992]
;   EAX = 0 if mismatch detected at position 3992
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3992 PROC
    movzx eax, byte ptr [rcx + 3992]
    movzx r10d, byte ptr [rdx + 3992]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3992 ENDP

; ============================================
; Boot Byte Attestation - Position 3993
; Constant-time branchless validation
; of boot_data[3993] against baseline[3993]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3993] == baseline[3993]
;   EAX = 0 if mismatch detected at position 3993
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3993 PROC
    movzx eax, byte ptr [rcx + 3993]
    movzx r10d, byte ptr [rdx + 3993]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3993 ENDP

; ============================================
; Boot Byte Attestation - Position 3994
; Constant-time branchless validation
; of boot_data[3994] against baseline[3994]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3994] == baseline[3994]
;   EAX = 0 if mismatch detected at position 3994
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3994 PROC
    movzx eax, byte ptr [rcx + 3994]
    movzx r10d, byte ptr [rdx + 3994]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3994 ENDP

; ============================================
; Boot Byte Attestation - Position 3995
; Constant-time branchless validation
; of boot_data[3995] against baseline[3995]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3995] == baseline[3995]
;   EAX = 0 if mismatch detected at position 3995
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3995 PROC
    movzx eax, byte ptr [rcx + 3995]
    movzx r10d, byte ptr [rdx + 3995]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3995 ENDP

; ============================================
; Boot Byte Attestation - Position 3996
; Constant-time branchless validation
; of boot_data[3996] against baseline[3996]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3996] == baseline[3996]
;   EAX = 0 if mismatch detected at position 3996
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3996 PROC
    movzx eax, byte ptr [rcx + 3996]
    movzx r10d, byte ptr [rdx + 3996]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3996 ENDP

; ============================================
; Boot Byte Attestation - Position 3997
; Constant-time branchless validation
; of boot_data[3997] against baseline[3997]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3997] == baseline[3997]
;   EAX = 0 if mismatch detected at position 3997
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3997 PROC
    movzx eax, byte ptr [rcx + 3997]
    movzx r10d, byte ptr [rdx + 3997]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3997 ENDP

; ============================================
; Boot Byte Attestation - Position 3998
; Constant-time branchless validation
; of boot_data[3998] against baseline[3998]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3998] == baseline[3998]
;   EAX = 0 if mismatch detected at position 3998
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3998 PROC
    movzx eax, byte ptr [rcx + 3998]
    movzx r10d, byte ptr [rdx + 3998]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3998 ENDP

; ============================================
; Boot Byte Attestation - Position 3999
; Constant-time branchless validation
; of boot_data[3999] against baseline[3999]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[3999] == baseline[3999]
;   EAX = 0 if mismatch detected at position 3999
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_3999 PROC
    movzx eax, byte ptr [rcx + 3999]
    movzx r10d, byte ptr [rdx + 3999]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_3999 ENDP

; ============================================
; Boot Byte Attestation - Position 4000
; Constant-time branchless validation
; of boot_data[4000] against baseline[4000]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4000] == baseline[4000]
;   EAX = 0 if mismatch detected at position 4000
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4000 PROC
    movzx eax, byte ptr [rcx + 4000]
    movzx r10d, byte ptr [rdx + 4000]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4000 ENDP

; ============================================
; Boot Byte Attestation - Position 4001
; Constant-time branchless validation
; of boot_data[4001] against baseline[4001]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4001] == baseline[4001]
;   EAX = 0 if mismatch detected at position 4001
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4001 PROC
    movzx eax, byte ptr [rcx + 4001]
    movzx r10d, byte ptr [rdx + 4001]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4001 ENDP

; ============================================
; Boot Byte Attestation - Position 4002
; Constant-time branchless validation
; of boot_data[4002] against baseline[4002]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4002] == baseline[4002]
;   EAX = 0 if mismatch detected at position 4002
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4002 PROC
    movzx eax, byte ptr [rcx + 4002]
    movzx r10d, byte ptr [rdx + 4002]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4002 ENDP

; ============================================
; Boot Byte Attestation - Position 4003
; Constant-time branchless validation
; of boot_data[4003] against baseline[4003]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4003] == baseline[4003]
;   EAX = 0 if mismatch detected at position 4003
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4003 PROC
    movzx eax, byte ptr [rcx + 4003]
    movzx r10d, byte ptr [rdx + 4003]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4003 ENDP

; ============================================
; Boot Byte Attestation - Position 4004
; Constant-time branchless validation
; of boot_data[4004] against baseline[4004]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4004] == baseline[4004]
;   EAX = 0 if mismatch detected at position 4004
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4004 PROC
    movzx eax, byte ptr [rcx + 4004]
    movzx r10d, byte ptr [rdx + 4004]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4004 ENDP

; ============================================
; Boot Byte Attestation - Position 4005
; Constant-time branchless validation
; of boot_data[4005] against baseline[4005]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4005] == baseline[4005]
;   EAX = 0 if mismatch detected at position 4005
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4005 PROC
    movzx eax, byte ptr [rcx + 4005]
    movzx r10d, byte ptr [rdx + 4005]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4005 ENDP

; ============================================
; Boot Byte Attestation - Position 4006
; Constant-time branchless validation
; of boot_data[4006] against baseline[4006]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4006] == baseline[4006]
;   EAX = 0 if mismatch detected at position 4006
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4006 PROC
    movzx eax, byte ptr [rcx + 4006]
    movzx r10d, byte ptr [rdx + 4006]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4006 ENDP

; ============================================
; Boot Byte Attestation - Position 4007
; Constant-time branchless validation
; of boot_data[4007] against baseline[4007]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4007] == baseline[4007]
;   EAX = 0 if mismatch detected at position 4007
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4007 PROC
    movzx eax, byte ptr [rcx + 4007]
    movzx r10d, byte ptr [rdx + 4007]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4007 ENDP

; ============================================
; Boot Byte Attestation - Position 4008
; Constant-time branchless validation
; of boot_data[4008] against baseline[4008]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4008] == baseline[4008]
;   EAX = 0 if mismatch detected at position 4008
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4008 PROC
    movzx eax, byte ptr [rcx + 4008]
    movzx r10d, byte ptr [rdx + 4008]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4008 ENDP

; ============================================
; Boot Byte Attestation - Position 4009
; Constant-time branchless validation
; of boot_data[4009] against baseline[4009]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4009] == baseline[4009]
;   EAX = 0 if mismatch detected at position 4009
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4009 PROC
    movzx eax, byte ptr [rcx + 4009]
    movzx r10d, byte ptr [rdx + 4009]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4009 ENDP

; ============================================
; Boot Byte Attestation - Position 4010
; Constant-time branchless validation
; of boot_data[4010] against baseline[4010]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4010] == baseline[4010]
;   EAX = 0 if mismatch detected at position 4010
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4010 PROC
    movzx eax, byte ptr [rcx + 4010]
    movzx r10d, byte ptr [rdx + 4010]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4010 ENDP

; ============================================
; Boot Byte Attestation - Position 4011
; Constant-time branchless validation
; of boot_data[4011] against baseline[4011]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4011] == baseline[4011]
;   EAX = 0 if mismatch detected at position 4011
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4011 PROC
    movzx eax, byte ptr [rcx + 4011]
    movzx r10d, byte ptr [rdx + 4011]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4011 ENDP

; ============================================
; Boot Byte Attestation - Position 4012
; Constant-time branchless validation
; of boot_data[4012] against baseline[4012]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4012] == baseline[4012]
;   EAX = 0 if mismatch detected at position 4012
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4012 PROC
    movzx eax, byte ptr [rcx + 4012]
    movzx r10d, byte ptr [rdx + 4012]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4012 ENDP

; ============================================
; Boot Byte Attestation - Position 4013
; Constant-time branchless validation
; of boot_data[4013] against baseline[4013]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4013] == baseline[4013]
;   EAX = 0 if mismatch detected at position 4013
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4013 PROC
    movzx eax, byte ptr [rcx + 4013]
    movzx r10d, byte ptr [rdx + 4013]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4013 ENDP

; ============================================
; Boot Byte Attestation - Position 4014
; Constant-time branchless validation
; of boot_data[4014] against baseline[4014]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4014] == baseline[4014]
;   EAX = 0 if mismatch detected at position 4014
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4014 PROC
    movzx eax, byte ptr [rcx + 4014]
    movzx r10d, byte ptr [rdx + 4014]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4014 ENDP

; ============================================
; Boot Byte Attestation - Position 4015
; Constant-time branchless validation
; of boot_data[4015] against baseline[4015]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4015] == baseline[4015]
;   EAX = 0 if mismatch detected at position 4015
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4015 PROC
    movzx eax, byte ptr [rcx + 4015]
    movzx r10d, byte ptr [rdx + 4015]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4015 ENDP

; ============================================
; Boot Byte Attestation - Position 4016
; Constant-time branchless validation
; of boot_data[4016] against baseline[4016]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4016] == baseline[4016]
;   EAX = 0 if mismatch detected at position 4016
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4016 PROC
    movzx eax, byte ptr [rcx + 4016]
    movzx r10d, byte ptr [rdx + 4016]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4016 ENDP

; ============================================
; Boot Byte Attestation - Position 4017
; Constant-time branchless validation
; of boot_data[4017] against baseline[4017]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4017] == baseline[4017]
;   EAX = 0 if mismatch detected at position 4017
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4017 PROC
    movzx eax, byte ptr [rcx + 4017]
    movzx r10d, byte ptr [rdx + 4017]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4017 ENDP

; ============================================
; Boot Byte Attestation - Position 4018
; Constant-time branchless validation
; of boot_data[4018] against baseline[4018]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4018] == baseline[4018]
;   EAX = 0 if mismatch detected at position 4018
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4018 PROC
    movzx eax, byte ptr [rcx + 4018]
    movzx r10d, byte ptr [rdx + 4018]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4018 ENDP

; ============================================
; Boot Byte Attestation - Position 4019
; Constant-time branchless validation
; of boot_data[4019] against baseline[4019]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4019] == baseline[4019]
;   EAX = 0 if mismatch detected at position 4019
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4019 PROC
    movzx eax, byte ptr [rcx + 4019]
    movzx r10d, byte ptr [rdx + 4019]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4019 ENDP

; ============================================
; Boot Byte Attestation - Position 4020
; Constant-time branchless validation
; of boot_data[4020] against baseline[4020]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4020] == baseline[4020]
;   EAX = 0 if mismatch detected at position 4020
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4020 PROC
    movzx eax, byte ptr [rcx + 4020]
    movzx r10d, byte ptr [rdx + 4020]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4020 ENDP

; ============================================
; Boot Byte Attestation - Position 4021
; Constant-time branchless validation
; of boot_data[4021] against baseline[4021]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4021] == baseline[4021]
;   EAX = 0 if mismatch detected at position 4021
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4021 PROC
    movzx eax, byte ptr [rcx + 4021]
    movzx r10d, byte ptr [rdx + 4021]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4021 ENDP

; ============================================
; Boot Byte Attestation - Position 4022
; Constant-time branchless validation
; of boot_data[4022] against baseline[4022]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4022] == baseline[4022]
;   EAX = 0 if mismatch detected at position 4022
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4022 PROC
    movzx eax, byte ptr [rcx + 4022]
    movzx r10d, byte ptr [rdx + 4022]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4022 ENDP

; ============================================
; Boot Byte Attestation - Position 4023
; Constant-time branchless validation
; of boot_data[4023] against baseline[4023]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4023] == baseline[4023]
;   EAX = 0 if mismatch detected at position 4023
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4023 PROC
    movzx eax, byte ptr [rcx + 4023]
    movzx r10d, byte ptr [rdx + 4023]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4023 ENDP

; ============================================
; Boot Byte Attestation - Position 4024
; Constant-time branchless validation
; of boot_data[4024] against baseline[4024]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4024] == baseline[4024]
;   EAX = 0 if mismatch detected at position 4024
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4024 PROC
    movzx eax, byte ptr [rcx + 4024]
    movzx r10d, byte ptr [rdx + 4024]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4024 ENDP

; ============================================
; Boot Byte Attestation - Position 4025
; Constant-time branchless validation
; of boot_data[4025] against baseline[4025]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4025] == baseline[4025]
;   EAX = 0 if mismatch detected at position 4025
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4025 PROC
    movzx eax, byte ptr [rcx + 4025]
    movzx r10d, byte ptr [rdx + 4025]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4025 ENDP

; ============================================
; Boot Byte Attestation - Position 4026
; Constant-time branchless validation
; of boot_data[4026] against baseline[4026]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4026] == baseline[4026]
;   EAX = 0 if mismatch detected at position 4026
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4026 PROC
    movzx eax, byte ptr [rcx + 4026]
    movzx r10d, byte ptr [rdx + 4026]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4026 ENDP

; ============================================
; Boot Byte Attestation - Position 4027
; Constant-time branchless validation
; of boot_data[4027] against baseline[4027]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4027] == baseline[4027]
;   EAX = 0 if mismatch detected at position 4027
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4027 PROC
    movzx eax, byte ptr [rcx + 4027]
    movzx r10d, byte ptr [rdx + 4027]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4027 ENDP

; ============================================
; Boot Byte Attestation - Position 4028
; Constant-time branchless validation
; of boot_data[4028] against baseline[4028]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4028] == baseline[4028]
;   EAX = 0 if mismatch detected at position 4028
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4028 PROC
    movzx eax, byte ptr [rcx + 4028]
    movzx r10d, byte ptr [rdx + 4028]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4028 ENDP

; ============================================
; Boot Byte Attestation - Position 4029
; Constant-time branchless validation
; of boot_data[4029] against baseline[4029]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4029] == baseline[4029]
;   EAX = 0 if mismatch detected at position 4029
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4029 PROC
    movzx eax, byte ptr [rcx + 4029]
    movzx r10d, byte ptr [rdx + 4029]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4029 ENDP

; ============================================
; Boot Byte Attestation - Position 4030
; Constant-time branchless validation
; of boot_data[4030] against baseline[4030]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4030] == baseline[4030]
;   EAX = 0 if mismatch detected at position 4030
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4030 PROC
    movzx eax, byte ptr [rcx + 4030]
    movzx r10d, byte ptr [rdx + 4030]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4030 ENDP

; ============================================
; Boot Byte Attestation - Position 4031
; Constant-time branchless validation
; of boot_data[4031] against baseline[4031]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4031] == baseline[4031]
;   EAX = 0 if mismatch detected at position 4031
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4031 PROC
    movzx eax, byte ptr [rcx + 4031]
    movzx r10d, byte ptr [rdx + 4031]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4031 ENDP

; ============================================
; Boot Byte Attestation - Position 4032
; Constant-time branchless validation
; of boot_data[4032] against baseline[4032]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4032] == baseline[4032]
;   EAX = 0 if mismatch detected at position 4032
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4032 PROC
    movzx eax, byte ptr [rcx + 4032]
    movzx r10d, byte ptr [rdx + 4032]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4032 ENDP

; ============================================
; Boot Byte Attestation - Position 4033
; Constant-time branchless validation
; of boot_data[4033] against baseline[4033]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4033] == baseline[4033]
;   EAX = 0 if mismatch detected at position 4033
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4033 PROC
    movzx eax, byte ptr [rcx + 4033]
    movzx r10d, byte ptr [rdx + 4033]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4033 ENDP

; ============================================
; Boot Byte Attestation - Position 4034
; Constant-time branchless validation
; of boot_data[4034] against baseline[4034]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4034] == baseline[4034]
;   EAX = 0 if mismatch detected at position 4034
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4034 PROC
    movzx eax, byte ptr [rcx + 4034]
    movzx r10d, byte ptr [rdx + 4034]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4034 ENDP

; ============================================
; Boot Byte Attestation - Position 4035
; Constant-time branchless validation
; of boot_data[4035] against baseline[4035]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4035] == baseline[4035]
;   EAX = 0 if mismatch detected at position 4035
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4035 PROC
    movzx eax, byte ptr [rcx + 4035]
    movzx r10d, byte ptr [rdx + 4035]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4035 ENDP

; ============================================
; Boot Byte Attestation - Position 4036
; Constant-time branchless validation
; of boot_data[4036] against baseline[4036]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4036] == baseline[4036]
;   EAX = 0 if mismatch detected at position 4036
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4036 PROC
    movzx eax, byte ptr [rcx + 4036]
    movzx r10d, byte ptr [rdx + 4036]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4036 ENDP

; ============================================
; Boot Byte Attestation - Position 4037
; Constant-time branchless validation
; of boot_data[4037] against baseline[4037]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4037] == baseline[4037]
;   EAX = 0 if mismatch detected at position 4037
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4037 PROC
    movzx eax, byte ptr [rcx + 4037]
    movzx r10d, byte ptr [rdx + 4037]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4037 ENDP

; ============================================
; Boot Byte Attestation - Position 4038
; Constant-time branchless validation
; of boot_data[4038] against baseline[4038]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4038] == baseline[4038]
;   EAX = 0 if mismatch detected at position 4038
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4038 PROC
    movzx eax, byte ptr [rcx + 4038]
    movzx r10d, byte ptr [rdx + 4038]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4038 ENDP

; ============================================
; Boot Byte Attestation - Position 4039
; Constant-time branchless validation
; of boot_data[4039] against baseline[4039]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4039] == baseline[4039]
;   EAX = 0 if mismatch detected at position 4039
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4039 PROC
    movzx eax, byte ptr [rcx + 4039]
    movzx r10d, byte ptr [rdx + 4039]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4039 ENDP

; ============================================
; Boot Byte Attestation - Position 4040
; Constant-time branchless validation
; of boot_data[4040] against baseline[4040]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4040] == baseline[4040]
;   EAX = 0 if mismatch detected at position 4040
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4040 PROC
    movzx eax, byte ptr [rcx + 4040]
    movzx r10d, byte ptr [rdx + 4040]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4040 ENDP

; ============================================
; Boot Byte Attestation - Position 4041
; Constant-time branchless validation
; of boot_data[4041] against baseline[4041]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4041] == baseline[4041]
;   EAX = 0 if mismatch detected at position 4041
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4041 PROC
    movzx eax, byte ptr [rcx + 4041]
    movzx r10d, byte ptr [rdx + 4041]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4041 ENDP

; ============================================
; Boot Byte Attestation - Position 4042
; Constant-time branchless validation
; of boot_data[4042] against baseline[4042]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4042] == baseline[4042]
;   EAX = 0 if mismatch detected at position 4042
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4042 PROC
    movzx eax, byte ptr [rcx + 4042]
    movzx r10d, byte ptr [rdx + 4042]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4042 ENDP

; ============================================
; Boot Byte Attestation - Position 4043
; Constant-time branchless validation
; of boot_data[4043] against baseline[4043]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4043] == baseline[4043]
;   EAX = 0 if mismatch detected at position 4043
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4043 PROC
    movzx eax, byte ptr [rcx + 4043]
    movzx r10d, byte ptr [rdx + 4043]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4043 ENDP

; ============================================
; Boot Byte Attestation - Position 4044
; Constant-time branchless validation
; of boot_data[4044] against baseline[4044]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4044] == baseline[4044]
;   EAX = 0 if mismatch detected at position 4044
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4044 PROC
    movzx eax, byte ptr [rcx + 4044]
    movzx r10d, byte ptr [rdx + 4044]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4044 ENDP

; ============================================
; Boot Byte Attestation - Position 4045
; Constant-time branchless validation
; of boot_data[4045] against baseline[4045]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4045] == baseline[4045]
;   EAX = 0 if mismatch detected at position 4045
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4045 PROC
    movzx eax, byte ptr [rcx + 4045]
    movzx r10d, byte ptr [rdx + 4045]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4045 ENDP

; ============================================
; Boot Byte Attestation - Position 4046
; Constant-time branchless validation
; of boot_data[4046] against baseline[4046]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4046] == baseline[4046]
;   EAX = 0 if mismatch detected at position 4046
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4046 PROC
    movzx eax, byte ptr [rcx + 4046]
    movzx r10d, byte ptr [rdx + 4046]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4046 ENDP

; ============================================
; Boot Byte Attestation - Position 4047
; Constant-time branchless validation
; of boot_data[4047] against baseline[4047]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4047] == baseline[4047]
;   EAX = 0 if mismatch detected at position 4047
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4047 PROC
    movzx eax, byte ptr [rcx + 4047]
    movzx r10d, byte ptr [rdx + 4047]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4047 ENDP

; ============================================
; Boot Byte Attestation - Position 4048
; Constant-time branchless validation
; of boot_data[4048] against baseline[4048]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4048] == baseline[4048]
;   EAX = 0 if mismatch detected at position 4048
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4048 PROC
    movzx eax, byte ptr [rcx + 4048]
    movzx r10d, byte ptr [rdx + 4048]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4048 ENDP

; ============================================
; Boot Byte Attestation - Position 4049
; Constant-time branchless validation
; of boot_data[4049] against baseline[4049]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4049] == baseline[4049]
;   EAX = 0 if mismatch detected at position 4049
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4049 PROC
    movzx eax, byte ptr [rcx + 4049]
    movzx r10d, byte ptr [rdx + 4049]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4049 ENDP

; ============================================
; Boot Byte Attestation - Position 4050
; Constant-time branchless validation
; of boot_data[4050] against baseline[4050]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4050] == baseline[4050]
;   EAX = 0 if mismatch detected at position 4050
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4050 PROC
    movzx eax, byte ptr [rcx + 4050]
    movzx r10d, byte ptr [rdx + 4050]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4050 ENDP

; ============================================
; Boot Byte Attestation - Position 4051
; Constant-time branchless validation
; of boot_data[4051] against baseline[4051]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4051] == baseline[4051]
;   EAX = 0 if mismatch detected at position 4051
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4051 PROC
    movzx eax, byte ptr [rcx + 4051]
    movzx r10d, byte ptr [rdx + 4051]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4051 ENDP

; ============================================
; Boot Byte Attestation - Position 4052
; Constant-time branchless validation
; of boot_data[4052] against baseline[4052]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4052] == baseline[4052]
;   EAX = 0 if mismatch detected at position 4052
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4052 PROC
    movzx eax, byte ptr [rcx + 4052]
    movzx r10d, byte ptr [rdx + 4052]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4052 ENDP

; ============================================
; Boot Byte Attestation - Position 4053
; Constant-time branchless validation
; of boot_data[4053] against baseline[4053]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4053] == baseline[4053]
;   EAX = 0 if mismatch detected at position 4053
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4053 PROC
    movzx eax, byte ptr [rcx + 4053]
    movzx r10d, byte ptr [rdx + 4053]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4053 ENDP

; ============================================
; Boot Byte Attestation - Position 4054
; Constant-time branchless validation
; of boot_data[4054] against baseline[4054]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4054] == baseline[4054]
;   EAX = 0 if mismatch detected at position 4054
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4054 PROC
    movzx eax, byte ptr [rcx + 4054]
    movzx r10d, byte ptr [rdx + 4054]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4054 ENDP

; ============================================
; Boot Byte Attestation - Position 4055
; Constant-time branchless validation
; of boot_data[4055] against baseline[4055]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4055] == baseline[4055]
;   EAX = 0 if mismatch detected at position 4055
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4055 PROC
    movzx eax, byte ptr [rcx + 4055]
    movzx r10d, byte ptr [rdx + 4055]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4055 ENDP

; ============================================
; Boot Byte Attestation - Position 4056
; Constant-time branchless validation
; of boot_data[4056] against baseline[4056]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4056] == baseline[4056]
;   EAX = 0 if mismatch detected at position 4056
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4056 PROC
    movzx eax, byte ptr [rcx + 4056]
    movzx r10d, byte ptr [rdx + 4056]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4056 ENDP

; ============================================
; Boot Byte Attestation - Position 4057
; Constant-time branchless validation
; of boot_data[4057] against baseline[4057]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4057] == baseline[4057]
;   EAX = 0 if mismatch detected at position 4057
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4057 PROC
    movzx eax, byte ptr [rcx + 4057]
    movzx r10d, byte ptr [rdx + 4057]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4057 ENDP

; ============================================
; Boot Byte Attestation - Position 4058
; Constant-time branchless validation
; of boot_data[4058] against baseline[4058]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4058] == baseline[4058]
;   EAX = 0 if mismatch detected at position 4058
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4058 PROC
    movzx eax, byte ptr [rcx + 4058]
    movzx r10d, byte ptr [rdx + 4058]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4058 ENDP

; ============================================
; Boot Byte Attestation - Position 4059
; Constant-time branchless validation
; of boot_data[4059] against baseline[4059]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4059] == baseline[4059]
;   EAX = 0 if mismatch detected at position 4059
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4059 PROC
    movzx eax, byte ptr [rcx + 4059]
    movzx r10d, byte ptr [rdx + 4059]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4059 ENDP

; ============================================
; Boot Byte Attestation - Position 4060
; Constant-time branchless validation
; of boot_data[4060] against baseline[4060]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4060] == baseline[4060]
;   EAX = 0 if mismatch detected at position 4060
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4060 PROC
    movzx eax, byte ptr [rcx + 4060]
    movzx r10d, byte ptr [rdx + 4060]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4060 ENDP

; ============================================
; Boot Byte Attestation - Position 4061
; Constant-time branchless validation
; of boot_data[4061] against baseline[4061]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4061] == baseline[4061]
;   EAX = 0 if mismatch detected at position 4061
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4061 PROC
    movzx eax, byte ptr [rcx + 4061]
    movzx r10d, byte ptr [rdx + 4061]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4061 ENDP

; ============================================
; Boot Byte Attestation - Position 4062
; Constant-time branchless validation
; of boot_data[4062] against baseline[4062]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4062] == baseline[4062]
;   EAX = 0 if mismatch detected at position 4062
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4062 PROC
    movzx eax, byte ptr [rcx + 4062]
    movzx r10d, byte ptr [rdx + 4062]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4062 ENDP

; ============================================
; Boot Byte Attestation - Position 4063
; Constant-time branchless validation
; of boot_data[4063] against baseline[4063]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4063] == baseline[4063]
;   EAX = 0 if mismatch detected at position 4063
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4063 PROC
    movzx eax, byte ptr [rcx + 4063]
    movzx r10d, byte ptr [rdx + 4063]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4063 ENDP

; ============================================
; Boot Byte Attestation - Position 4064
; Constant-time branchless validation
; of boot_data[4064] against baseline[4064]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4064] == baseline[4064]
;   EAX = 0 if mismatch detected at position 4064
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4064 PROC
    movzx eax, byte ptr [rcx + 4064]
    movzx r10d, byte ptr [rdx + 4064]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4064 ENDP

; ============================================
; Boot Byte Attestation - Position 4065
; Constant-time branchless validation
; of boot_data[4065] against baseline[4065]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4065] == baseline[4065]
;   EAX = 0 if mismatch detected at position 4065
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4065 PROC
    movzx eax, byte ptr [rcx + 4065]
    movzx r10d, byte ptr [rdx + 4065]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4065 ENDP

; ============================================
; Boot Byte Attestation - Position 4066
; Constant-time branchless validation
; of boot_data[4066] against baseline[4066]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4066] == baseline[4066]
;   EAX = 0 if mismatch detected at position 4066
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4066 PROC
    movzx eax, byte ptr [rcx + 4066]
    movzx r10d, byte ptr [rdx + 4066]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4066 ENDP

; ============================================
; Boot Byte Attestation - Position 4067
; Constant-time branchless validation
; of boot_data[4067] against baseline[4067]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4067] == baseline[4067]
;   EAX = 0 if mismatch detected at position 4067
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4067 PROC
    movzx eax, byte ptr [rcx + 4067]
    movzx r10d, byte ptr [rdx + 4067]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4067 ENDP

; ============================================
; Boot Byte Attestation - Position 4068
; Constant-time branchless validation
; of boot_data[4068] against baseline[4068]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4068] == baseline[4068]
;   EAX = 0 if mismatch detected at position 4068
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4068 PROC
    movzx eax, byte ptr [rcx + 4068]
    movzx r10d, byte ptr [rdx + 4068]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4068 ENDP

; ============================================
; Boot Byte Attestation - Position 4069
; Constant-time branchless validation
; of boot_data[4069] against baseline[4069]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4069] == baseline[4069]
;   EAX = 0 if mismatch detected at position 4069
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4069 PROC
    movzx eax, byte ptr [rcx + 4069]
    movzx r10d, byte ptr [rdx + 4069]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4069 ENDP

; ============================================
; Boot Byte Attestation - Position 4070
; Constant-time branchless validation
; of boot_data[4070] against baseline[4070]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4070] == baseline[4070]
;   EAX = 0 if mismatch detected at position 4070
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4070 PROC
    movzx eax, byte ptr [rcx + 4070]
    movzx r10d, byte ptr [rdx + 4070]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4070 ENDP

; ============================================
; Boot Byte Attestation - Position 4071
; Constant-time branchless validation
; of boot_data[4071] against baseline[4071]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4071] == baseline[4071]
;   EAX = 0 if mismatch detected at position 4071
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4071 PROC
    movzx eax, byte ptr [rcx + 4071]
    movzx r10d, byte ptr [rdx + 4071]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4071 ENDP

; ============================================
; Boot Byte Attestation - Position 4072
; Constant-time branchless validation
; of boot_data[4072] against baseline[4072]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4072] == baseline[4072]
;   EAX = 0 if mismatch detected at position 4072
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4072 PROC
    movzx eax, byte ptr [rcx + 4072]
    movzx r10d, byte ptr [rdx + 4072]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4072 ENDP

; ============================================
; Boot Byte Attestation - Position 4073
; Constant-time branchless validation
; of boot_data[4073] against baseline[4073]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4073] == baseline[4073]
;   EAX = 0 if mismatch detected at position 4073
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4073 PROC
    movzx eax, byte ptr [rcx + 4073]
    movzx r10d, byte ptr [rdx + 4073]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4073 ENDP

; ============================================
; Boot Byte Attestation - Position 4074
; Constant-time branchless validation
; of boot_data[4074] against baseline[4074]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4074] == baseline[4074]
;   EAX = 0 if mismatch detected at position 4074
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4074 PROC
    movzx eax, byte ptr [rcx + 4074]
    movzx r10d, byte ptr [rdx + 4074]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4074 ENDP

; ============================================
; Boot Byte Attestation - Position 4075
; Constant-time branchless validation
; of boot_data[4075] against baseline[4075]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4075] == baseline[4075]
;   EAX = 0 if mismatch detected at position 4075
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4075 PROC
    movzx eax, byte ptr [rcx + 4075]
    movzx r10d, byte ptr [rdx + 4075]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4075 ENDP

; ============================================
; Boot Byte Attestation - Position 4076
; Constant-time branchless validation
; of boot_data[4076] against baseline[4076]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4076] == baseline[4076]
;   EAX = 0 if mismatch detected at position 4076
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4076 PROC
    movzx eax, byte ptr [rcx + 4076]
    movzx r10d, byte ptr [rdx + 4076]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4076 ENDP

; ============================================
; Boot Byte Attestation - Position 4077
; Constant-time branchless validation
; of boot_data[4077] against baseline[4077]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4077] == baseline[4077]
;   EAX = 0 if mismatch detected at position 4077
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4077 PROC
    movzx eax, byte ptr [rcx + 4077]
    movzx r10d, byte ptr [rdx + 4077]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4077 ENDP

; ============================================
; Boot Byte Attestation - Position 4078
; Constant-time branchless validation
; of boot_data[4078] against baseline[4078]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4078] == baseline[4078]
;   EAX = 0 if mismatch detected at position 4078
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4078 PROC
    movzx eax, byte ptr [rcx + 4078]
    movzx r10d, byte ptr [rdx + 4078]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4078 ENDP

; ============================================
; Boot Byte Attestation - Position 4079
; Constant-time branchless validation
; of boot_data[4079] against baseline[4079]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4079] == baseline[4079]
;   EAX = 0 if mismatch detected at position 4079
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4079 PROC
    movzx eax, byte ptr [rcx + 4079]
    movzx r10d, byte ptr [rdx + 4079]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4079 ENDP

; ============================================
; Boot Byte Attestation - Position 4080
; Constant-time branchless validation
; of boot_data[4080] against baseline[4080]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4080] == baseline[4080]
;   EAX = 0 if mismatch detected at position 4080
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4080 PROC
    movzx eax, byte ptr [rcx + 4080]
    movzx r10d, byte ptr [rdx + 4080]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4080 ENDP

; ============================================
; Boot Byte Attestation - Position 4081
; Constant-time branchless validation
; of boot_data[4081] against baseline[4081]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4081] == baseline[4081]
;   EAX = 0 if mismatch detected at position 4081
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4081 PROC
    movzx eax, byte ptr [rcx + 4081]
    movzx r10d, byte ptr [rdx + 4081]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4081 ENDP

; ============================================
; Boot Byte Attestation - Position 4082
; Constant-time branchless validation
; of boot_data[4082] against baseline[4082]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4082] == baseline[4082]
;   EAX = 0 if mismatch detected at position 4082
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4082 PROC
    movzx eax, byte ptr [rcx + 4082]
    movzx r10d, byte ptr [rdx + 4082]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4082 ENDP

; ============================================
; Boot Byte Attestation - Position 4083
; Constant-time branchless validation
; of boot_data[4083] against baseline[4083]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4083] == baseline[4083]
;   EAX = 0 if mismatch detected at position 4083
;
; Side Effects:
;   Updates hash accumulator with rotation=2
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4083 PROC
    movzx eax, byte ptr [rcx + 4083]
    movzx r10d, byte ptr [rdx + 4083]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 2
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4083 ENDP

; ============================================
; Boot Byte Attestation - Position 4084
; Constant-time branchless validation
; of boot_data[4084] against baseline[4084]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4084] == baseline[4084]
;   EAX = 0 if mismatch detected at position 4084
;
; Side Effects:
;   Updates hash accumulator with rotation=3
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4084 PROC
    movzx eax, byte ptr [rcx + 4084]
    movzx r10d, byte ptr [rdx + 4084]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 3
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4084 ENDP

; ============================================
; Boot Byte Attestation - Position 4085
; Constant-time branchless validation
; of boot_data[4085] against baseline[4085]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4085] == baseline[4085]
;   EAX = 0 if mismatch detected at position 4085
;
; Side Effects:
;   Updates hash accumulator with rotation=4
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4085 PROC
    movzx eax, byte ptr [rcx + 4085]
    movzx r10d, byte ptr [rdx + 4085]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 4
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4085 ENDP

; ============================================
; Boot Byte Attestation - Position 4086
; Constant-time branchless validation
; of boot_data[4086] against baseline[4086]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4086] == baseline[4086]
;   EAX = 0 if mismatch detected at position 4086
;
; Side Effects:
;   Updates hash accumulator with rotation=5
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4086 PROC
    movzx eax, byte ptr [rcx + 4086]
    movzx r10d, byte ptr [rdx + 4086]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 5
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4086 ENDP

; ============================================
; Boot Byte Attestation - Position 4087
; Constant-time branchless validation
; of boot_data[4087] against baseline[4087]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4087] == baseline[4087]
;   EAX = 0 if mismatch detected at position 4087
;
; Side Effects:
;   Updates hash accumulator with rotation=6
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4087 PROC
    movzx eax, byte ptr [rcx + 4087]
    movzx r10d, byte ptr [rdx + 4087]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 6
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4087 ENDP

; ============================================
; Boot Byte Attestation - Position 4088
; Constant-time branchless validation
; of boot_data[4088] against baseline[4088]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4088] == baseline[4088]
;   EAX = 0 if mismatch detected at position 4088
;
; Side Effects:
;   Updates hash accumulator with rotation=7
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4088 PROC
    movzx eax, byte ptr [rcx + 4088]
    movzx r10d, byte ptr [rdx + 4088]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 7
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4088 ENDP

; ============================================
; Boot Byte Attestation - Position 4089
; Constant-time branchless validation
; of boot_data[4089] against baseline[4089]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4089] == baseline[4089]
;   EAX = 0 if mismatch detected at position 4089
;
; Side Effects:
;   Updates hash accumulator with rotation=8
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4089 PROC
    movzx eax, byte ptr [rcx + 4089]
    movzx r10d, byte ptr [rdx + 4089]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 8
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4089 ENDP

; ============================================
; Boot Byte Attestation - Position 4090
; Constant-time branchless validation
; of boot_data[4090] against baseline[4090]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4090] == baseline[4090]
;   EAX = 0 if mismatch detected at position 4090
;
; Side Effects:
;   Updates hash accumulator with rotation=9
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4090 PROC
    movzx eax, byte ptr [rcx + 4090]
    movzx r10d, byte ptr [rdx + 4090]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 9
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4090 ENDP

; ============================================
; Boot Byte Attestation - Position 4091
; Constant-time branchless validation
; of boot_data[4091] against baseline[4091]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4091] == baseline[4091]
;   EAX = 0 if mismatch detected at position 4091
;
; Side Effects:
;   Updates hash accumulator with rotation=10
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4091 PROC
    movzx eax, byte ptr [rcx + 4091]
    movzx r10d, byte ptr [rdx + 4091]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 10
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4091 ENDP

; ============================================
; Boot Byte Attestation - Position 4092
; Constant-time branchless validation
; of boot_data[4092] against baseline[4092]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4092] == baseline[4092]
;   EAX = 0 if mismatch detected at position 4092
;
; Side Effects:
;   Updates hash accumulator with rotation=11
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4092 PROC
    movzx eax, byte ptr [rcx + 4092]
    movzx r10d, byte ptr [rdx + 4092]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 11
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4092 ENDP

; ============================================
; Boot Byte Attestation - Position 4093
; Constant-time branchless validation
; of boot_data[4093] against baseline[4093]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4093] == baseline[4093]
;   EAX = 0 if mismatch detected at position 4093
;
; Side Effects:
;   Updates hash accumulator with rotation=12
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4093 PROC
    movzx eax, byte ptr [rcx + 4093]
    movzx r10d, byte ptr [rdx + 4093]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 12
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4093 ENDP

; ============================================
; Boot Byte Attestation - Position 4094
; Constant-time branchless validation
; of boot_data[4094] against baseline[4094]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4094] == baseline[4094]
;   EAX = 0 if mismatch detected at position 4094
;
; Side Effects:
;   Updates hash accumulator with rotation=13
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4094 PROC
    movzx eax, byte ptr [rcx + 4094]
    movzx r10d, byte ptr [rdx + 4094]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 13
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4094 ENDP

; ============================================
; Boot Byte Attestation - Position 4095
; Constant-time branchless validation
; of boot_data[4095] against baseline[4095]
; ============================================
; Arguments:
;   RCX = boot_data pointer (const uint8_t*)
;   RDX = baseline_data pointer (const uint8_t*)
;   R8  = hash_accum pointer (uint64_t*)
;   R9  = histogram base pointer (uint32_t[256])
;
; Returns:
;   EAX = 1 if boot_data[4095] == baseline[4095]
;   EAX = 0 if mismatch detected at position 4095
;
; Side Effects:
;   Updates hash accumulator with rotation=1
;   Increments histogram frequency bin for byte value
; ============================================
attest_byte_4095 PROC
    movzx eax, byte ptr [rcx + 4095]
    movzx r10d, byte ptr [rdx + 4095]
    ;
    ; Update frequency histogram for Shannon entropy
    inc dword ptr [r9 + rax*4]
    ;
    ; Update rolling hash accumulator (Knuth multiplicative)
    mov r11, qword ptr [r8]
    xor r11d, eax
    rol r11, 1
    add r11, 09E3779B9h
    mov qword ptr [r8], r11
    ;
    ; Branchless constant-time comparison
    cmp eax, r10d
    sete al
    movzx eax, al
    ret
attest_byte_4095 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 0
; Computes -P(0) * log2(P(0))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 0
; ============================================
entropy_bin_000 PROC
    mov eax, dword ptr [rcx + 0]
    test eax, eax
    jz entropy_bin_000_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(0) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(0) * log2(P(0)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_000_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_000 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 1
; Computes -P(1) * log2(P(1))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 1
; ============================================
entropy_bin_001 PROC
    mov eax, dword ptr [rcx + 4]
    test eax, eax
    jz entropy_bin_001_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(1) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(1) * log2(P(1)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_001_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_001 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 2
; Computes -P(2) * log2(P(2))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 2
; ============================================
entropy_bin_002 PROC
    mov eax, dword ptr [rcx + 8]
    test eax, eax
    jz entropy_bin_002_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(2) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(2) * log2(P(2)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_002_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_002 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 3
; Computes -P(3) * log2(P(3))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 3
; ============================================
entropy_bin_003 PROC
    mov eax, dword ptr [rcx + 12]
    test eax, eax
    jz entropy_bin_003_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(3) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(3) * log2(P(3)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_003_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_003 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 4
; Computes -P(4) * log2(P(4))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 4
; ============================================
entropy_bin_004 PROC
    mov eax, dword ptr [rcx + 16]
    test eax, eax
    jz entropy_bin_004_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(4) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(4) * log2(P(4)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_004_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_004 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 5
; Computes -P(5) * log2(P(5))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 5
; ============================================
entropy_bin_005 PROC
    mov eax, dword ptr [rcx + 20]
    test eax, eax
    jz entropy_bin_005_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(5) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(5) * log2(P(5)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_005_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_005 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 6
; Computes -P(6) * log2(P(6))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 6
; ============================================
entropy_bin_006 PROC
    mov eax, dword ptr [rcx + 24]
    test eax, eax
    jz entropy_bin_006_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(6) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(6) * log2(P(6)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_006_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_006 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 7
; Computes -P(7) * log2(P(7))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 7
; ============================================
entropy_bin_007 PROC
    mov eax, dword ptr [rcx + 28]
    test eax, eax
    jz entropy_bin_007_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(7) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(7) * log2(P(7)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_007_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_007 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 8
; Computes -P(8) * log2(P(8))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 8
; ============================================
entropy_bin_008 PROC
    mov eax, dword ptr [rcx + 32]
    test eax, eax
    jz entropy_bin_008_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(8) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(8) * log2(P(8)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_008_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_008 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 9
; Computes -P(9) * log2(P(9))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 9
; ============================================
entropy_bin_009 PROC
    mov eax, dword ptr [rcx + 36]
    test eax, eax
    jz entropy_bin_009_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(9) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(9) * log2(P(9)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_009_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_009 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 10
; Computes -P(10) * log2(P(10))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 10
; ============================================
entropy_bin_010 PROC
    mov eax, dword ptr [rcx + 40]
    test eax, eax
    jz entropy_bin_010_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(10) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(10) * log2(P(10)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_010_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_010 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 11
; Computes -P(11) * log2(P(11))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 11
; ============================================
entropy_bin_011 PROC
    mov eax, dword ptr [rcx + 44]
    test eax, eax
    jz entropy_bin_011_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(11) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(11) * log2(P(11)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_011_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_011 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 12
; Computes -P(12) * log2(P(12))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 12
; ============================================
entropy_bin_012 PROC
    mov eax, dword ptr [rcx + 48]
    test eax, eax
    jz entropy_bin_012_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(12) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(12) * log2(P(12)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_012_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_012 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 13
; Computes -P(13) * log2(P(13))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 13
; ============================================
entropy_bin_013 PROC
    mov eax, dword ptr [rcx + 52]
    test eax, eax
    jz entropy_bin_013_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(13) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(13) * log2(P(13)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_013_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_013 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 14
; Computes -P(14) * log2(P(14))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 14
; ============================================
entropy_bin_014 PROC
    mov eax, dword ptr [rcx + 56]
    test eax, eax
    jz entropy_bin_014_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(14) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(14) * log2(P(14)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_014_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_014 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 15
; Computes -P(15) * log2(P(15))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 15
; ============================================
entropy_bin_015 PROC
    mov eax, dword ptr [rcx + 60]
    test eax, eax
    jz entropy_bin_015_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(15) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(15) * log2(P(15)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_015_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_015 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 16
; Computes -P(16) * log2(P(16))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 16
; ============================================
entropy_bin_016 PROC
    mov eax, dword ptr [rcx + 64]
    test eax, eax
    jz entropy_bin_016_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(16) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(16) * log2(P(16)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_016_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_016 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 17
; Computes -P(17) * log2(P(17))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 17
; ============================================
entropy_bin_017 PROC
    mov eax, dword ptr [rcx + 68]
    test eax, eax
    jz entropy_bin_017_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(17) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(17) * log2(P(17)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_017_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_017 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 18
; Computes -P(18) * log2(P(18))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 18
; ============================================
entropy_bin_018 PROC
    mov eax, dword ptr [rcx + 72]
    test eax, eax
    jz entropy_bin_018_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(18) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(18) * log2(P(18)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_018_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_018 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 19
; Computes -P(19) * log2(P(19))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 19
; ============================================
entropy_bin_019 PROC
    mov eax, dword ptr [rcx + 76]
    test eax, eax
    jz entropy_bin_019_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(19) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(19) * log2(P(19)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_019_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_019 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 20
; Computes -P(20) * log2(P(20))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 20
; ============================================
entropy_bin_020 PROC
    mov eax, dword ptr [rcx + 80]
    test eax, eax
    jz entropy_bin_020_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(20) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(20) * log2(P(20)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_020_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_020 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 21
; Computes -P(21) * log2(P(21))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 21
; ============================================
entropy_bin_021 PROC
    mov eax, dword ptr [rcx + 84]
    test eax, eax
    jz entropy_bin_021_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(21) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(21) * log2(P(21)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_021_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_021 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 22
; Computes -P(22) * log2(P(22))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 22
; ============================================
entropy_bin_022 PROC
    mov eax, dword ptr [rcx + 88]
    test eax, eax
    jz entropy_bin_022_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(22) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(22) * log2(P(22)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_022_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_022 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 23
; Computes -P(23) * log2(P(23))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 23
; ============================================
entropy_bin_023 PROC
    mov eax, dword ptr [rcx + 92]
    test eax, eax
    jz entropy_bin_023_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(23) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(23) * log2(P(23)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_023_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_023 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 24
; Computes -P(24) * log2(P(24))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 24
; ============================================
entropy_bin_024 PROC
    mov eax, dword ptr [rcx + 96]
    test eax, eax
    jz entropy_bin_024_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(24) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(24) * log2(P(24)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_024_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_024 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 25
; Computes -P(25) * log2(P(25))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 25
; ============================================
entropy_bin_025 PROC
    mov eax, dword ptr [rcx + 100]
    test eax, eax
    jz entropy_bin_025_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(25) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(25) * log2(P(25)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_025_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_025 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 26
; Computes -P(26) * log2(P(26))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 26
; ============================================
entropy_bin_026 PROC
    mov eax, dword ptr [rcx + 104]
    test eax, eax
    jz entropy_bin_026_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(26) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(26) * log2(P(26)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_026_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_026 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 27
; Computes -P(27) * log2(P(27))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 27
; ============================================
entropy_bin_027 PROC
    mov eax, dword ptr [rcx + 108]
    test eax, eax
    jz entropy_bin_027_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(27) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(27) * log2(P(27)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_027_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_027 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 28
; Computes -P(28) * log2(P(28))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 28
; ============================================
entropy_bin_028 PROC
    mov eax, dword ptr [rcx + 112]
    test eax, eax
    jz entropy_bin_028_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(28) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(28) * log2(P(28)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_028_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_028 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 29
; Computes -P(29) * log2(P(29))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 29
; ============================================
entropy_bin_029 PROC
    mov eax, dword ptr [rcx + 116]
    test eax, eax
    jz entropy_bin_029_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(29) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(29) * log2(P(29)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_029_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_029 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 30
; Computes -P(30) * log2(P(30))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 30
; ============================================
entropy_bin_030 PROC
    mov eax, dword ptr [rcx + 120]
    test eax, eax
    jz entropy_bin_030_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(30) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(30) * log2(P(30)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_030_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_030 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 31
; Computes -P(31) * log2(P(31))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 31
; ============================================
entropy_bin_031 PROC
    mov eax, dword ptr [rcx + 124]
    test eax, eax
    jz entropy_bin_031_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(31) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(31) * log2(P(31)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_031_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_031 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 32
; Computes -P(32) * log2(P(32))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 32
; ============================================
entropy_bin_032 PROC
    mov eax, dword ptr [rcx + 128]
    test eax, eax
    jz entropy_bin_032_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(32) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(32) * log2(P(32)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_032_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_032 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 33
; Computes -P(33) * log2(P(33))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 33
; ============================================
entropy_bin_033 PROC
    mov eax, dword ptr [rcx + 132]
    test eax, eax
    jz entropy_bin_033_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(33) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(33) * log2(P(33)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_033_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_033 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 34
; Computes -P(34) * log2(P(34))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 34
; ============================================
entropy_bin_034 PROC
    mov eax, dword ptr [rcx + 136]
    test eax, eax
    jz entropy_bin_034_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(34) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(34) * log2(P(34)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_034_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_034 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 35
; Computes -P(35) * log2(P(35))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 35
; ============================================
entropy_bin_035 PROC
    mov eax, dword ptr [rcx + 140]
    test eax, eax
    jz entropy_bin_035_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(35) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(35) * log2(P(35)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_035_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_035 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 36
; Computes -P(36) * log2(P(36))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 36
; ============================================
entropy_bin_036 PROC
    mov eax, dword ptr [rcx + 144]
    test eax, eax
    jz entropy_bin_036_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(36) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(36) * log2(P(36)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_036_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_036 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 37
; Computes -P(37) * log2(P(37))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 37
; ============================================
entropy_bin_037 PROC
    mov eax, dword ptr [rcx + 148]
    test eax, eax
    jz entropy_bin_037_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(37) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(37) * log2(P(37)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_037_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_037 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 38
; Computes -P(38) * log2(P(38))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 38
; ============================================
entropy_bin_038 PROC
    mov eax, dword ptr [rcx + 152]
    test eax, eax
    jz entropy_bin_038_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(38) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(38) * log2(P(38)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_038_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_038 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 39
; Computes -P(39) * log2(P(39))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 39
; ============================================
entropy_bin_039 PROC
    mov eax, dword ptr [rcx + 156]
    test eax, eax
    jz entropy_bin_039_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(39) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(39) * log2(P(39)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_039_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_039 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 40
; Computes -P(40) * log2(P(40))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 40
; ============================================
entropy_bin_040 PROC
    mov eax, dword ptr [rcx + 160]
    test eax, eax
    jz entropy_bin_040_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(40) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(40) * log2(P(40)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_040_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_040 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 41
; Computes -P(41) * log2(P(41))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 41
; ============================================
entropy_bin_041 PROC
    mov eax, dword ptr [rcx + 164]
    test eax, eax
    jz entropy_bin_041_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(41) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(41) * log2(P(41)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_041_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_041 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 42
; Computes -P(42) * log2(P(42))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 42
; ============================================
entropy_bin_042 PROC
    mov eax, dword ptr [rcx + 168]
    test eax, eax
    jz entropy_bin_042_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(42) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(42) * log2(P(42)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_042_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_042 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 43
; Computes -P(43) * log2(P(43))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 43
; ============================================
entropy_bin_043 PROC
    mov eax, dword ptr [rcx + 172]
    test eax, eax
    jz entropy_bin_043_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(43) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(43) * log2(P(43)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_043_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_043 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 44
; Computes -P(44) * log2(P(44))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 44
; ============================================
entropy_bin_044 PROC
    mov eax, dword ptr [rcx + 176]
    test eax, eax
    jz entropy_bin_044_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(44) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(44) * log2(P(44)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_044_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_044 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 45
; Computes -P(45) * log2(P(45))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 45
; ============================================
entropy_bin_045 PROC
    mov eax, dword ptr [rcx + 180]
    test eax, eax
    jz entropy_bin_045_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(45) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(45) * log2(P(45)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_045_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_045 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 46
; Computes -P(46) * log2(P(46))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 46
; ============================================
entropy_bin_046 PROC
    mov eax, dword ptr [rcx + 184]
    test eax, eax
    jz entropy_bin_046_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(46) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(46) * log2(P(46)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_046_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_046 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 47
; Computes -P(47) * log2(P(47))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 47
; ============================================
entropy_bin_047 PROC
    mov eax, dword ptr [rcx + 188]
    test eax, eax
    jz entropy_bin_047_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(47) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(47) * log2(P(47)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_047_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_047 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 48
; Computes -P(48) * log2(P(48))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 48
; ============================================
entropy_bin_048 PROC
    mov eax, dword ptr [rcx + 192]
    test eax, eax
    jz entropy_bin_048_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(48) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(48) * log2(P(48)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_048_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_048 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 49
; Computes -P(49) * log2(P(49))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 49
; ============================================
entropy_bin_049 PROC
    mov eax, dword ptr [rcx + 196]
    test eax, eax
    jz entropy_bin_049_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(49) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(49) * log2(P(49)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_049_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_049 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 50
; Computes -P(50) * log2(P(50))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 50
; ============================================
entropy_bin_050 PROC
    mov eax, dword ptr [rcx + 200]
    test eax, eax
    jz entropy_bin_050_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(50) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(50) * log2(P(50)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_050_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_050 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 51
; Computes -P(51) * log2(P(51))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 51
; ============================================
entropy_bin_051 PROC
    mov eax, dword ptr [rcx + 204]
    test eax, eax
    jz entropy_bin_051_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(51) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(51) * log2(P(51)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_051_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_051 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 52
; Computes -P(52) * log2(P(52))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 52
; ============================================
entropy_bin_052 PROC
    mov eax, dword ptr [rcx + 208]
    test eax, eax
    jz entropy_bin_052_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(52) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(52) * log2(P(52)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_052_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_052 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 53
; Computes -P(53) * log2(P(53))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 53
; ============================================
entropy_bin_053 PROC
    mov eax, dword ptr [rcx + 212]
    test eax, eax
    jz entropy_bin_053_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(53) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(53) * log2(P(53)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_053_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_053 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 54
; Computes -P(54) * log2(P(54))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 54
; ============================================
entropy_bin_054 PROC
    mov eax, dword ptr [rcx + 216]
    test eax, eax
    jz entropy_bin_054_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(54) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(54) * log2(P(54)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_054_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_054 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 55
; Computes -P(55) * log2(P(55))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 55
; ============================================
entropy_bin_055 PROC
    mov eax, dword ptr [rcx + 220]
    test eax, eax
    jz entropy_bin_055_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(55) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(55) * log2(P(55)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_055_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_055 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 56
; Computes -P(56) * log2(P(56))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 56
; ============================================
entropy_bin_056 PROC
    mov eax, dword ptr [rcx + 224]
    test eax, eax
    jz entropy_bin_056_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(56) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(56) * log2(P(56)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_056_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_056 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 57
; Computes -P(57) * log2(P(57))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 57
; ============================================
entropy_bin_057 PROC
    mov eax, dword ptr [rcx + 228]
    test eax, eax
    jz entropy_bin_057_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(57) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(57) * log2(P(57)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_057_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_057 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 58
; Computes -P(58) * log2(P(58))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 58
; ============================================
entropy_bin_058 PROC
    mov eax, dword ptr [rcx + 232]
    test eax, eax
    jz entropy_bin_058_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(58) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(58) * log2(P(58)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_058_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_058 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 59
; Computes -P(59) * log2(P(59))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 59
; ============================================
entropy_bin_059 PROC
    mov eax, dword ptr [rcx + 236]
    test eax, eax
    jz entropy_bin_059_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(59) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(59) * log2(P(59)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_059_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_059 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 60
; Computes -P(60) * log2(P(60))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 60
; ============================================
entropy_bin_060 PROC
    mov eax, dword ptr [rcx + 240]
    test eax, eax
    jz entropy_bin_060_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(60) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(60) * log2(P(60)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_060_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_060 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 61
; Computes -P(61) * log2(P(61))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 61
; ============================================
entropy_bin_061 PROC
    mov eax, dword ptr [rcx + 244]
    test eax, eax
    jz entropy_bin_061_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(61) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(61) * log2(P(61)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_061_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_061 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 62
; Computes -P(62) * log2(P(62))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 62
; ============================================
entropy_bin_062 PROC
    mov eax, dword ptr [rcx + 248]
    test eax, eax
    jz entropy_bin_062_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(62) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(62) * log2(P(62)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_062_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_062 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 63
; Computes -P(63) * log2(P(63))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 63
; ============================================
entropy_bin_063 PROC
    mov eax, dword ptr [rcx + 252]
    test eax, eax
    jz entropy_bin_063_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(63) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(63) * log2(P(63)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_063_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_063 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 64
; Computes -P(64) * log2(P(64))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 64
; ============================================
entropy_bin_064 PROC
    mov eax, dword ptr [rcx + 256]
    test eax, eax
    jz entropy_bin_064_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(64) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(64) * log2(P(64)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_064_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_064 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 65
; Computes -P(65) * log2(P(65))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 65
; ============================================
entropy_bin_065 PROC
    mov eax, dword ptr [rcx + 260]
    test eax, eax
    jz entropy_bin_065_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(65) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(65) * log2(P(65)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_065_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_065 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 66
; Computes -P(66) * log2(P(66))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 66
; ============================================
entropy_bin_066 PROC
    mov eax, dword ptr [rcx + 264]
    test eax, eax
    jz entropy_bin_066_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(66) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(66) * log2(P(66)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_066_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_066 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 67
; Computes -P(67) * log2(P(67))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 67
; ============================================
entropy_bin_067 PROC
    mov eax, dword ptr [rcx + 268]
    test eax, eax
    jz entropy_bin_067_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(67) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(67) * log2(P(67)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_067_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_067 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 68
; Computes -P(68) * log2(P(68))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 68
; ============================================
entropy_bin_068 PROC
    mov eax, dword ptr [rcx + 272]
    test eax, eax
    jz entropy_bin_068_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(68) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(68) * log2(P(68)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_068_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_068 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 69
; Computes -P(69) * log2(P(69))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 69
; ============================================
entropy_bin_069 PROC
    mov eax, dword ptr [rcx + 276]
    test eax, eax
    jz entropy_bin_069_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(69) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(69) * log2(P(69)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_069_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_069 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 70
; Computes -P(70) * log2(P(70))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 70
; ============================================
entropy_bin_070 PROC
    mov eax, dword ptr [rcx + 280]
    test eax, eax
    jz entropy_bin_070_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(70) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(70) * log2(P(70)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_070_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_070 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 71
; Computes -P(71) * log2(P(71))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 71
; ============================================
entropy_bin_071 PROC
    mov eax, dword ptr [rcx + 284]
    test eax, eax
    jz entropy_bin_071_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(71) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(71) * log2(P(71)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_071_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_071 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 72
; Computes -P(72) * log2(P(72))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 72
; ============================================
entropy_bin_072 PROC
    mov eax, dword ptr [rcx + 288]
    test eax, eax
    jz entropy_bin_072_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(72) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(72) * log2(P(72)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_072_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_072 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 73
; Computes -P(73) * log2(P(73))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 73
; ============================================
entropy_bin_073 PROC
    mov eax, dword ptr [rcx + 292]
    test eax, eax
    jz entropy_bin_073_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(73) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(73) * log2(P(73)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_073_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_073 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 74
; Computes -P(74) * log2(P(74))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 74
; ============================================
entropy_bin_074 PROC
    mov eax, dword ptr [rcx + 296]
    test eax, eax
    jz entropy_bin_074_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(74) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(74) * log2(P(74)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_074_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_074 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 75
; Computes -P(75) * log2(P(75))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 75
; ============================================
entropy_bin_075 PROC
    mov eax, dword ptr [rcx + 300]
    test eax, eax
    jz entropy_bin_075_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(75) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(75) * log2(P(75)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_075_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_075 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 76
; Computes -P(76) * log2(P(76))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 76
; ============================================
entropy_bin_076 PROC
    mov eax, dword ptr [rcx + 304]
    test eax, eax
    jz entropy_bin_076_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(76) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(76) * log2(P(76)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_076_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_076 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 77
; Computes -P(77) * log2(P(77))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 77
; ============================================
entropy_bin_077 PROC
    mov eax, dword ptr [rcx + 308]
    test eax, eax
    jz entropy_bin_077_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(77) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(77) * log2(P(77)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_077_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_077 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 78
; Computes -P(78) * log2(P(78))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 78
; ============================================
entropy_bin_078 PROC
    mov eax, dword ptr [rcx + 312]
    test eax, eax
    jz entropy_bin_078_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(78) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(78) * log2(P(78)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_078_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_078 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 79
; Computes -P(79) * log2(P(79))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 79
; ============================================
entropy_bin_079 PROC
    mov eax, dword ptr [rcx + 316]
    test eax, eax
    jz entropy_bin_079_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(79) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(79) * log2(P(79)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_079_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_079 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 80
; Computes -P(80) * log2(P(80))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 80
; ============================================
entropy_bin_080 PROC
    mov eax, dword ptr [rcx + 320]
    test eax, eax
    jz entropy_bin_080_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(80) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(80) * log2(P(80)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_080_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_080 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 81
; Computes -P(81) * log2(P(81))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 81
; ============================================
entropy_bin_081 PROC
    mov eax, dword ptr [rcx + 324]
    test eax, eax
    jz entropy_bin_081_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(81) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(81) * log2(P(81)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_081_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_081 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 82
; Computes -P(82) * log2(P(82))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 82
; ============================================
entropy_bin_082 PROC
    mov eax, dword ptr [rcx + 328]
    test eax, eax
    jz entropy_bin_082_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(82) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(82) * log2(P(82)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_082_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_082 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 83
; Computes -P(83) * log2(P(83))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 83
; ============================================
entropy_bin_083 PROC
    mov eax, dword ptr [rcx + 332]
    test eax, eax
    jz entropy_bin_083_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(83) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(83) * log2(P(83)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_083_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_083 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 84
; Computes -P(84) * log2(P(84))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 84
; ============================================
entropy_bin_084 PROC
    mov eax, dword ptr [rcx + 336]
    test eax, eax
    jz entropy_bin_084_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(84) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(84) * log2(P(84)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_084_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_084 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 85
; Computes -P(85) * log2(P(85))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 85
; ============================================
entropy_bin_085 PROC
    mov eax, dword ptr [rcx + 340]
    test eax, eax
    jz entropy_bin_085_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(85) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(85) * log2(P(85)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_085_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_085 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 86
; Computes -P(86) * log2(P(86))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 86
; ============================================
entropy_bin_086 PROC
    mov eax, dword ptr [rcx + 344]
    test eax, eax
    jz entropy_bin_086_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(86) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(86) * log2(P(86)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_086_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_086 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 87
; Computes -P(87) * log2(P(87))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 87
; ============================================
entropy_bin_087 PROC
    mov eax, dword ptr [rcx + 348]
    test eax, eax
    jz entropy_bin_087_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(87) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(87) * log2(P(87)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_087_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_087 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 88
; Computes -P(88) * log2(P(88))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 88
; ============================================
entropy_bin_088 PROC
    mov eax, dword ptr [rcx + 352]
    test eax, eax
    jz entropy_bin_088_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(88) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(88) * log2(P(88)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_088_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_088 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 89
; Computes -P(89) * log2(P(89))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 89
; ============================================
entropy_bin_089 PROC
    mov eax, dword ptr [rcx + 356]
    test eax, eax
    jz entropy_bin_089_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(89) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(89) * log2(P(89)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_089_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_089 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 90
; Computes -P(90) * log2(P(90))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 90
; ============================================
entropy_bin_090 PROC
    mov eax, dword ptr [rcx + 360]
    test eax, eax
    jz entropy_bin_090_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(90) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(90) * log2(P(90)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_090_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_090 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 91
; Computes -P(91) * log2(P(91))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 91
; ============================================
entropy_bin_091 PROC
    mov eax, dword ptr [rcx + 364]
    test eax, eax
    jz entropy_bin_091_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(91) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(91) * log2(P(91)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_091_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_091 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 92
; Computes -P(92) * log2(P(92))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 92
; ============================================
entropy_bin_092 PROC
    mov eax, dword ptr [rcx + 368]
    test eax, eax
    jz entropy_bin_092_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(92) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(92) * log2(P(92)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_092_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_092 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 93
; Computes -P(93) * log2(P(93))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 93
; ============================================
entropy_bin_093 PROC
    mov eax, dword ptr [rcx + 372]
    test eax, eax
    jz entropy_bin_093_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(93) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(93) * log2(P(93)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_093_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_093 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 94
; Computes -P(94) * log2(P(94))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 94
; ============================================
entropy_bin_094 PROC
    mov eax, dword ptr [rcx + 376]
    test eax, eax
    jz entropy_bin_094_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(94) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(94) * log2(P(94)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_094_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_094 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 95
; Computes -P(95) * log2(P(95))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 95
; ============================================
entropy_bin_095 PROC
    mov eax, dword ptr [rcx + 380]
    test eax, eax
    jz entropy_bin_095_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(95) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(95) * log2(P(95)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_095_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_095 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 96
; Computes -P(96) * log2(P(96))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 96
; ============================================
entropy_bin_096 PROC
    mov eax, dword ptr [rcx + 384]
    test eax, eax
    jz entropy_bin_096_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(96) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(96) * log2(P(96)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_096_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_096 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 97
; Computes -P(97) * log2(P(97))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 97
; ============================================
entropy_bin_097 PROC
    mov eax, dword ptr [rcx + 388]
    test eax, eax
    jz entropy_bin_097_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(97) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(97) * log2(P(97)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_097_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_097 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 98
; Computes -P(98) * log2(P(98))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 98
; ============================================
entropy_bin_098 PROC
    mov eax, dword ptr [rcx + 392]
    test eax, eax
    jz entropy_bin_098_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(98) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(98) * log2(P(98)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_098_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_098 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 99
; Computes -P(99) * log2(P(99))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 99
; ============================================
entropy_bin_099 PROC
    mov eax, dword ptr [rcx + 396]
    test eax, eax
    jz entropy_bin_099_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(99) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(99) * log2(P(99)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_099_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_099 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 100
; Computes -P(100) * log2(P(100))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 100
; ============================================
entropy_bin_100 PROC
    mov eax, dword ptr [rcx + 400]
    test eax, eax
    jz entropy_bin_100_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(100) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(100) * log2(P(100)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_100_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_100 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 101
; Computes -P(101) * log2(P(101))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 101
; ============================================
entropy_bin_101 PROC
    mov eax, dword ptr [rcx + 404]
    test eax, eax
    jz entropy_bin_101_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(101) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(101) * log2(P(101)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_101_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_101 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 102
; Computes -P(102) * log2(P(102))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 102
; ============================================
entropy_bin_102 PROC
    mov eax, dword ptr [rcx + 408]
    test eax, eax
    jz entropy_bin_102_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(102) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(102) * log2(P(102)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_102_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_102 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 103
; Computes -P(103) * log2(P(103))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 103
; ============================================
entropy_bin_103 PROC
    mov eax, dword ptr [rcx + 412]
    test eax, eax
    jz entropy_bin_103_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(103) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(103) * log2(P(103)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_103_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_103 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 104
; Computes -P(104) * log2(P(104))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 104
; ============================================
entropy_bin_104 PROC
    mov eax, dword ptr [rcx + 416]
    test eax, eax
    jz entropy_bin_104_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(104) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(104) * log2(P(104)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_104_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_104 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 105
; Computes -P(105) * log2(P(105))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 105
; ============================================
entropy_bin_105 PROC
    mov eax, dword ptr [rcx + 420]
    test eax, eax
    jz entropy_bin_105_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(105) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(105) * log2(P(105)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_105_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_105 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 106
; Computes -P(106) * log2(P(106))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 106
; ============================================
entropy_bin_106 PROC
    mov eax, dword ptr [rcx + 424]
    test eax, eax
    jz entropy_bin_106_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(106) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(106) * log2(P(106)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_106_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_106 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 107
; Computes -P(107) * log2(P(107))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 107
; ============================================
entropy_bin_107 PROC
    mov eax, dword ptr [rcx + 428]
    test eax, eax
    jz entropy_bin_107_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(107) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(107) * log2(P(107)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_107_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_107 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 108
; Computes -P(108) * log2(P(108))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 108
; ============================================
entropy_bin_108 PROC
    mov eax, dword ptr [rcx + 432]
    test eax, eax
    jz entropy_bin_108_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(108) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(108) * log2(P(108)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_108_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_108 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 109
; Computes -P(109) * log2(P(109))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 109
; ============================================
entropy_bin_109 PROC
    mov eax, dword ptr [rcx + 436]
    test eax, eax
    jz entropy_bin_109_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(109) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(109) * log2(P(109)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_109_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_109 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 110
; Computes -P(110) * log2(P(110))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 110
; ============================================
entropy_bin_110 PROC
    mov eax, dword ptr [rcx + 440]
    test eax, eax
    jz entropy_bin_110_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(110) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(110) * log2(P(110)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_110_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_110 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 111
; Computes -P(111) * log2(P(111))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 111
; ============================================
entropy_bin_111 PROC
    mov eax, dword ptr [rcx + 444]
    test eax, eax
    jz entropy_bin_111_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(111) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(111) * log2(P(111)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_111_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_111 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 112
; Computes -P(112) * log2(P(112))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 112
; ============================================
entropy_bin_112 PROC
    mov eax, dword ptr [rcx + 448]
    test eax, eax
    jz entropy_bin_112_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(112) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(112) * log2(P(112)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_112_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_112 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 113
; Computes -P(113) * log2(P(113))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 113
; ============================================
entropy_bin_113 PROC
    mov eax, dword ptr [rcx + 452]
    test eax, eax
    jz entropy_bin_113_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(113) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(113) * log2(P(113)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_113_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_113 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 114
; Computes -P(114) * log2(P(114))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 114
; ============================================
entropy_bin_114 PROC
    mov eax, dword ptr [rcx + 456]
    test eax, eax
    jz entropy_bin_114_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(114) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(114) * log2(P(114)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_114_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_114 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 115
; Computes -P(115) * log2(P(115))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 115
; ============================================
entropy_bin_115 PROC
    mov eax, dword ptr [rcx + 460]
    test eax, eax
    jz entropy_bin_115_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(115) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(115) * log2(P(115)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_115_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_115 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 116
; Computes -P(116) * log2(P(116))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 116
; ============================================
entropy_bin_116 PROC
    mov eax, dword ptr [rcx + 464]
    test eax, eax
    jz entropy_bin_116_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(116) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(116) * log2(P(116)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_116_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_116 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 117
; Computes -P(117) * log2(P(117))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 117
; ============================================
entropy_bin_117 PROC
    mov eax, dword ptr [rcx + 468]
    test eax, eax
    jz entropy_bin_117_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(117) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(117) * log2(P(117)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_117_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_117 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 118
; Computes -P(118) * log2(P(118))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 118
; ============================================
entropy_bin_118 PROC
    mov eax, dword ptr [rcx + 472]
    test eax, eax
    jz entropy_bin_118_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(118) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(118) * log2(P(118)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_118_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_118 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 119
; Computes -P(119) * log2(P(119))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 119
; ============================================
entropy_bin_119 PROC
    mov eax, dword ptr [rcx + 476]
    test eax, eax
    jz entropy_bin_119_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(119) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(119) * log2(P(119)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_119_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_119 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 120
; Computes -P(120) * log2(P(120))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 120
; ============================================
entropy_bin_120 PROC
    mov eax, dword ptr [rcx + 480]
    test eax, eax
    jz entropy_bin_120_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(120) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(120) * log2(P(120)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_120_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_120 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 121
; Computes -P(121) * log2(P(121))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 121
; ============================================
entropy_bin_121 PROC
    mov eax, dword ptr [rcx + 484]
    test eax, eax
    jz entropy_bin_121_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(121) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(121) * log2(P(121)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_121_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_121 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 122
; Computes -P(122) * log2(P(122))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 122
; ============================================
entropy_bin_122 PROC
    mov eax, dword ptr [rcx + 488]
    test eax, eax
    jz entropy_bin_122_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(122) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(122) * log2(P(122)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_122_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_122 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 123
; Computes -P(123) * log2(P(123))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 123
; ============================================
entropy_bin_123 PROC
    mov eax, dword ptr [rcx + 492]
    test eax, eax
    jz entropy_bin_123_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(123) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(123) * log2(P(123)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_123_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_123 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 124
; Computes -P(124) * log2(P(124))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 124
; ============================================
entropy_bin_124 PROC
    mov eax, dword ptr [rcx + 496]
    test eax, eax
    jz entropy_bin_124_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(124) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(124) * log2(P(124)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_124_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_124 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 125
; Computes -P(125) * log2(P(125))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 125
; ============================================
entropy_bin_125 PROC
    mov eax, dword ptr [rcx + 500]
    test eax, eax
    jz entropy_bin_125_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(125) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(125) * log2(P(125)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_125_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_125 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 126
; Computes -P(126) * log2(P(126))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 126
; ============================================
entropy_bin_126 PROC
    mov eax, dword ptr [rcx + 504]
    test eax, eax
    jz entropy_bin_126_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(126) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(126) * log2(P(126)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_126_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_126 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 127
; Computes -P(127) * log2(P(127))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 127
; ============================================
entropy_bin_127 PROC
    mov eax, dword ptr [rcx + 508]
    test eax, eax
    jz entropy_bin_127_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(127) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(127) * log2(P(127)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_127_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_127 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 128
; Computes -P(128) * log2(P(128))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 128
; ============================================
entropy_bin_128 PROC
    mov eax, dword ptr [rcx + 512]
    test eax, eax
    jz entropy_bin_128_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(128) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(128) * log2(P(128)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_128_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_128 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 129
; Computes -P(129) * log2(P(129))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 129
; ============================================
entropy_bin_129 PROC
    mov eax, dword ptr [rcx + 516]
    test eax, eax
    jz entropy_bin_129_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(129) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(129) * log2(P(129)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_129_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_129 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 130
; Computes -P(130) * log2(P(130))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 130
; ============================================
entropy_bin_130 PROC
    mov eax, dword ptr [rcx + 520]
    test eax, eax
    jz entropy_bin_130_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(130) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(130) * log2(P(130)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_130_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_130 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 131
; Computes -P(131) * log2(P(131))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 131
; ============================================
entropy_bin_131 PROC
    mov eax, dword ptr [rcx + 524]
    test eax, eax
    jz entropy_bin_131_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(131) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(131) * log2(P(131)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_131_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_131 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 132
; Computes -P(132) * log2(P(132))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 132
; ============================================
entropy_bin_132 PROC
    mov eax, dword ptr [rcx + 528]
    test eax, eax
    jz entropy_bin_132_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(132) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(132) * log2(P(132)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_132_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_132 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 133
; Computes -P(133) * log2(P(133))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 133
; ============================================
entropy_bin_133 PROC
    mov eax, dword ptr [rcx + 532]
    test eax, eax
    jz entropy_bin_133_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(133) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(133) * log2(P(133)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_133_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_133 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 134
; Computes -P(134) * log2(P(134))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 134
; ============================================
entropy_bin_134 PROC
    mov eax, dword ptr [rcx + 536]
    test eax, eax
    jz entropy_bin_134_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(134) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(134) * log2(P(134)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_134_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_134 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 135
; Computes -P(135) * log2(P(135))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 135
; ============================================
entropy_bin_135 PROC
    mov eax, dword ptr [rcx + 540]
    test eax, eax
    jz entropy_bin_135_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(135) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(135) * log2(P(135)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_135_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_135 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 136
; Computes -P(136) * log2(P(136))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 136
; ============================================
entropy_bin_136 PROC
    mov eax, dword ptr [rcx + 544]
    test eax, eax
    jz entropy_bin_136_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(136) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(136) * log2(P(136)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_136_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_136 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 137
; Computes -P(137) * log2(P(137))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 137
; ============================================
entropy_bin_137 PROC
    mov eax, dword ptr [rcx + 548]
    test eax, eax
    jz entropy_bin_137_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(137) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(137) * log2(P(137)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_137_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_137 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 138
; Computes -P(138) * log2(P(138))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 138
; ============================================
entropy_bin_138 PROC
    mov eax, dword ptr [rcx + 552]
    test eax, eax
    jz entropy_bin_138_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(138) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(138) * log2(P(138)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_138_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_138 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 139
; Computes -P(139) * log2(P(139))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 139
; ============================================
entropy_bin_139 PROC
    mov eax, dword ptr [rcx + 556]
    test eax, eax
    jz entropy_bin_139_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(139) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(139) * log2(P(139)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_139_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_139 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 140
; Computes -P(140) * log2(P(140))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 140
; ============================================
entropy_bin_140 PROC
    mov eax, dword ptr [rcx + 560]
    test eax, eax
    jz entropy_bin_140_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(140) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(140) * log2(P(140)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_140_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_140 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 141
; Computes -P(141) * log2(P(141))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 141
; ============================================
entropy_bin_141 PROC
    mov eax, dword ptr [rcx + 564]
    test eax, eax
    jz entropy_bin_141_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(141) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(141) * log2(P(141)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_141_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_141 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 142
; Computes -P(142) * log2(P(142))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 142
; ============================================
entropy_bin_142 PROC
    mov eax, dword ptr [rcx + 568]
    test eax, eax
    jz entropy_bin_142_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(142) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(142) * log2(P(142)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_142_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_142 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 143
; Computes -P(143) * log2(P(143))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 143
; ============================================
entropy_bin_143 PROC
    mov eax, dword ptr [rcx + 572]
    test eax, eax
    jz entropy_bin_143_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(143) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(143) * log2(P(143)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_143_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_143 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 144
; Computes -P(144) * log2(P(144))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 144
; ============================================
entropy_bin_144 PROC
    mov eax, dword ptr [rcx + 576]
    test eax, eax
    jz entropy_bin_144_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(144) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(144) * log2(P(144)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_144_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_144 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 145
; Computes -P(145) * log2(P(145))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 145
; ============================================
entropy_bin_145 PROC
    mov eax, dword ptr [rcx + 580]
    test eax, eax
    jz entropy_bin_145_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(145) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(145) * log2(P(145)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_145_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_145 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 146
; Computes -P(146) * log2(P(146))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 146
; ============================================
entropy_bin_146 PROC
    mov eax, dword ptr [rcx + 584]
    test eax, eax
    jz entropy_bin_146_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(146) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(146) * log2(P(146)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_146_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_146 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 147
; Computes -P(147) * log2(P(147))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 147
; ============================================
entropy_bin_147 PROC
    mov eax, dword ptr [rcx + 588]
    test eax, eax
    jz entropy_bin_147_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(147) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(147) * log2(P(147)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_147_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_147 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 148
; Computes -P(148) * log2(P(148))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 148
; ============================================
entropy_bin_148 PROC
    mov eax, dword ptr [rcx + 592]
    test eax, eax
    jz entropy_bin_148_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(148) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(148) * log2(P(148)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_148_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_148 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 149
; Computes -P(149) * log2(P(149))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 149
; ============================================
entropy_bin_149 PROC
    mov eax, dword ptr [rcx + 596]
    test eax, eax
    jz entropy_bin_149_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(149) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(149) * log2(P(149)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_149_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_149 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 150
; Computes -P(150) * log2(P(150))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 150
; ============================================
entropy_bin_150 PROC
    mov eax, dword ptr [rcx + 600]
    test eax, eax
    jz entropy_bin_150_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(150) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(150) * log2(P(150)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_150_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_150 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 151
; Computes -P(151) * log2(P(151))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 151
; ============================================
entropy_bin_151 PROC
    mov eax, dword ptr [rcx + 604]
    test eax, eax
    jz entropy_bin_151_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(151) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(151) * log2(P(151)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_151_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_151 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 152
; Computes -P(152) * log2(P(152))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 152
; ============================================
entropy_bin_152 PROC
    mov eax, dword ptr [rcx + 608]
    test eax, eax
    jz entropy_bin_152_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(152) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(152) * log2(P(152)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_152_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_152 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 153
; Computes -P(153) * log2(P(153))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 153
; ============================================
entropy_bin_153 PROC
    mov eax, dword ptr [rcx + 612]
    test eax, eax
    jz entropy_bin_153_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(153) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(153) * log2(P(153)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_153_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_153 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 154
; Computes -P(154) * log2(P(154))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 154
; ============================================
entropy_bin_154 PROC
    mov eax, dword ptr [rcx + 616]
    test eax, eax
    jz entropy_bin_154_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(154) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(154) * log2(P(154)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_154_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_154 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 155
; Computes -P(155) * log2(P(155))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 155
; ============================================
entropy_bin_155 PROC
    mov eax, dword ptr [rcx + 620]
    test eax, eax
    jz entropy_bin_155_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(155) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(155) * log2(P(155)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_155_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_155 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 156
; Computes -P(156) * log2(P(156))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 156
; ============================================
entropy_bin_156 PROC
    mov eax, dword ptr [rcx + 624]
    test eax, eax
    jz entropy_bin_156_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(156) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(156) * log2(P(156)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_156_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_156 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 157
; Computes -P(157) * log2(P(157))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 157
; ============================================
entropy_bin_157 PROC
    mov eax, dword ptr [rcx + 628]
    test eax, eax
    jz entropy_bin_157_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(157) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(157) * log2(P(157)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_157_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_157 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 158
; Computes -P(158) * log2(P(158))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 158
; ============================================
entropy_bin_158 PROC
    mov eax, dword ptr [rcx + 632]
    test eax, eax
    jz entropy_bin_158_zero
    push rbp
    mov rbp, rsp
    sub rsp, 16
    and rsp, -16
    ;
    ; P(158) = count / total
    cvtsi2sd xmm0, eax
    cvtsi2sd xmm1, rdx
    divsd xmm0, xmm1
    ;
    ; -P(158) * log2(P(158)) via x87 FPU
    movq qword ptr [rsp], xmm0
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
entropy_bin_158_zero:
    xorpd xmm0, xmm0
    ret
entropy_bin_158 ENDP

; ============================================
; Shannon Entropy Bin - Byte Value 159
; Computes -P(159) * log2(P(159))
; ============================================
; Arguments:
;   RCX = histogram pointer (uint32_t[256])
;   RDX = total byte count (uint64_t)
;
; Returns:
;   XMM0 = entropy contribution for bin 159
; ============================================
entropy_bin_159 PROC
    mov eax, dword ptr [rcx + 636]
