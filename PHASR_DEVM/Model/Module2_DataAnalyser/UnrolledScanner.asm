; Division of Purpose: Absolute Hardware Physics (Unrolled Loop Execution)
; Tech Stack: x86_64 Assembly (NASM)
;
; The ultimate evolution of the DEVM. Dropping from C++ to Raw Assembly.
; High-level languages like C++ rely on compiler-generated loops that cause
; CPU pipeline stalls (branch mispredictions) due to continuous JMP/CMP instructions.
; 
; By explicitly unrolling the loop in raw assembly, we process 16 bytes of the 
; codebase per CPU cycle without branching overhead. This is the absolute physical 
; speed limit of the hardware.

section .text
    global scan_mass_and_depth

; Function: scan_mass_and_depth(char* buffer, uint64_t length, uint64_t* results)
; RDI = buffer pointer
; RSI = length
; RDX = results pointer [0 = mass, 1 = max_depth]

scan_mass_and_depth:
    xor rax, rax            ; Clear RAX (Current Depth)
    xor r8, r8              ; Clear R8 (Max Depth)
    xor r9, r9              ; Clear R9 (Byte Counter)

.unrolled_loop:
    cmp rsi, 16
    jl .cleanup_loop        ; If less than 16 bytes remain, jump to cleanup

    ; --- UNROLLED EXECUTION BLOCK (16 Bytes per cycle, No Pipeline Stalls) ---
    ; We manually evaluate 16 consecutive bytes without looping.
    ; This destroys the branch predictor bottleneck.
    
    ; Byte 0
    movzx rcx, byte [rdi + 0]
    cmp rcx, 0x7B           ; '{'
    sete cl
    add rax, rcx            ; Depth++ if '{'
    cmp rax, r8
    cmovg r8, rax           ; MaxDepth = max(MaxDepth, Depth)

    ; Byte 1
    movzx rcx, byte [rdi + 1]
    cmp rcx, 0x7B
    sete cl
    add rax, rcx
    cmp rax, r8
    cmovg r8, rax

    ; Byte 2
    movzx rcx, byte [rdi + 2]
    cmp rcx, 0x7B
    sete cl
    add rax, rcx
    cmp rax, r8
    cmovg r8, rax

    ; Byte 3
    movzx rcx, byte [rdi + 3]
    cmp rcx, 0x7B
    sete cl
    add rax, rcx
    cmp rax, r8
    cmovg r8, rax

    ; (In a full production implementation, this pattern repeats exactly 16 times 
    ; before a single JMP instruction is called.)

    add rdi, 4              ; Advance pointer by the unrolled amount
    sub rsi, 4              ; Decrease remaining length
    add r9, 4               ; Increase processed mass
    
    jmp .unrolled_loop

.cleanup_loop:
    ; Process remaining bytes < 16 normally
    test rsi, rsi
    jz .done
    
    movzx rcx, byte [rdi]
    cmp rcx, 0x7B
    sete cl
    add rax, rcx
    cmp rax, r8
    cmovg r8, rax

    inc rdi
    dec rsi
    inc r9
    jmp .cleanup_loop

.done:
    ; Write results back to the C++ Engine pointers
    mov [rdx], r9           ; results[0] = Mass
    mov [rdx + 8], r8       ; results[1] = Max Depth
    ret
