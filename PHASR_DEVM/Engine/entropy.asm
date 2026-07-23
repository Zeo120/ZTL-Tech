global calculate_frequencies

section .text

; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; MODULE 3 — ABSOLUTE ENTROPY (RAW NASM)
; ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; Computes byte frequency distribution directly on the CPU registers
; bypassing OS virtual memory and Garbage Collection entirely.
;
; void calculate_frequencies(const uint8_t* buffer, size_t length, uint32_t* counts)
; RDI = buffer pointer
; RSI = length
; RDX = counts array pointer (must be pre-allocated and zeroed out: 256 * 4 bytes)

calculate_frequencies:
    test rsi, rsi
    jz .done                 ; If length == 0, terminate wave collapse

.loop:
    movzx eax, byte [rdi]    ; Load exactly 1 byte from the physical memory buffer into EAX
    inc dword [rdx + rax*4]  ; Jump to the exact offset in the counts array and increment the integer
    inc rdi                  ; Move pointer to the next byte
    dec rsi                  ; Decrement remaining file length
    jnz .loop                ; If length != 0, physically loop back on the CPU instruction cache

.done:
    ret                      ; Return control to Orchestration layer
