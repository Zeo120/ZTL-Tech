; Division of Purpose: Absolute Temporal Measurement (Side-Channel Physics)
; Tech Stack: x86_64 Assembly (NASM)
;
; Module 5: Temporal Physics Analyser
; This module executes at Ring 3 but interfaces with the hardware Time-Stamp Counter.
; It measures the exact CPU clock cycles taken to execute a target code block.
; If Delta_T (Variance) between a valid state and invalid state exceeds the threshold,
; the system leaks state through time. State collapses to 0.

section .data
    threshold dq 5000       ; Cycle variance threshold (epsilon)

section .text
    global measure_temporal_variance

; Function: measure_temporal_variance(void* target_function, void* valid_payload, void* invalid_payload)
; RDI = Pointer to the function to execute (e.g. Auth Route)
; RSI = Pointer to Valid Payload
; RDX = Pointer to Invalid Payload
; Returns RAX = 0 (Collapse) or 1 (Safe)

measure_temporal_variance:
    ; Prologue
    push rbp
    mov rbp, rsp
    push rbx
    push r12
    push r13
    push r14
    push r15

    ; Save arguments
    mov r12, rdi            ; R12 = Target Function
    mov r13, rsi            ; R13 = Valid Payload
    mov r14, rdx            ; R14 = Invalid Payload

    ; -----------------------------------------------------
    ; PHASE 1: Measure Valid Payload (μ_valid)
    ; -----------------------------------------------------
    ; Serialize pipeline to prevent out-of-order execution before reading time
    cpuid                   
    rdtsc                   
    shl rdx, 32
    or rax, rdx
    mov r15, rax            ; R15 = Start Time (Valid)

    ; Execute Target Function with Valid Payload
    mov rdi, r13
    call r12

    ; Serialize and read end time
    rdtscp                  
    shl rdx, 32
    or rax, rdx
    sub rax, r15            
    mov rbx, rax            ; RBX = T_valid (Delta Cycles)

    ; -----------------------------------------------------
    ; PHASE 2: Measure Invalid Payload (μ_invalid)
    ; -----------------------------------------------------
    cpuid                   
    rdtsc                   
    shl rdx, 32
    or rax, rdx
    mov r15, rax            ; R15 = Start Time (Invalid)

    ; Execute Target Function with Invalid Payload
    mov rdi, r14
    call r12

    ; Serialize and read end time
    rdtscp                  
    shl rdx, 32
    or rax, rdx
    sub rax, r15            ; RAX = T_invalid (Delta Cycles)

    ; -----------------------------------------------------
    ; PHASE 3: Mathematical Variance (Delta T = |T_valid - T_invalid|)
    ; -----------------------------------------------------
    sub rbx, rax            ; RBX = T_valid - T_invalid
    
    ; Absolute value of RBX
    mov rcx, rbx
    sar rcx, 63             ; Copy sign bit to all bits
    xor rbx, rcx            ; 2's complement if negative
    sub rbx, rcx            ; RBX = |Delta T|

    ; -----------------------------------------------------
    ; PHASE 4: Threshold Evaluation
    ; -----------------------------------------------------
    mov rax, [rel threshold]
    cmp rbx, rax
    jg .collapse            ; If |Delta T| > Threshold, trigger Wave Collapse

.safe:
    mov rax, 1              ; State = 1 (Safe)
    jmp .cleanup

.collapse:
    xor rax, rax            ; State = 0 (Collapse)

.cleanup:
    ; Epilogue
    pop r15
    pop r14
    pop r13
    pop r12
    pop rbx
    pop rbp
    ret
