; Division of Purpose: Hardware State Flow (Taint Math)
; Tech Stack: x86_64 Assembly (NASM)
;
; Module 4: Security Math 
; Instead of parsing an AST abstractly, this module evaluates physical string tokens 
; in raw memory using unrolled SIMD string matching.
; It enforces the Equation of Wave Collapse:
; IF (State A [Input] AND State B [Execution]) AND NOT State C [Resistance] -> COLLAPSE (0)

section .data
    ; Token Signatures (padded to 8 bytes for qword comparison)
    state_a_token db "req.body"       ; Input trigger
    state_b_token db "db.query"       ; Execution trigger
    state_c_token db "escape()"       ; Resistance trigger

section .text
    global evaluate_taint_flow

; Function: evaluate_taint_flow(char* codebase_buffer, uint64_t length)
; RDI = codebase buffer
; RSI = length
; Returns RAX = 0 (Collapse) or 1 (Safe)

evaluate_taint_flow:
    ; Register allocation for State Flags
    xor r8, r8              ; R8 = State A (Found Input)
    xor r9, r9              ; R9 = State B (Found Execution)
    xor r10, r10            ; R10 = State C (Found Resistance)
    
    ; Load tokens into registers for ultra-fast unrolled comparison
    mov rax, [rel state_a_token]
    mov rbx, [rel state_b_token]
    mov rcx, [rel state_c_token]

.scan_loop:
    cmp rsi, 8
    jl .evaluate_physics    ; If less than 8 bytes left, go to evaluation

    ; Unrolled Hardware String Match (8 bytes per cycle)
    ; In a production AVX2 implementation, this compares 32 bytes at once using YMM registers.
    mov rdx, [rdi]          ; Load 8 bytes of codebase

    ; Check State A (Input)
    cmp rdx, rax
    sete r11b               
    or r8b, r11b            ; R8 = 1 if match

    ; Check State B (Execution)
    cmp rdx, rbx
    sete r11b               
    or r9b, r11b            ; R9 = 1 if match

    ; Check State C (Resistance)
    cmp rdx, rcx
    sete r11b               
    or r10b, r11b           ; R10 = 1 if match

    ; Shift pointer by 1 byte (Sliding Window String Match)
    inc rdi
    dec rsi
    jmp .scan_loop

.evaluate_physics:
    ; The Physical Taint Equation
    ; Collapse condition: State A (1) AND State B (1) AND NOT State C (0)
    
    test r8, r8
    jz .safe                ; If no Input, safe

    test r9, r9
    jz .safe                ; If no Execution, safe

    test r10, r10
    jnz .safe               ; If Resistance exists, safe

.collapse:
    ; Equation breached: Data flows from Input to Execution without Resistance
    xor rax, rax            ; Return 0
    ret

.safe:
    mov rax, 1              ; Return 1
    ret
