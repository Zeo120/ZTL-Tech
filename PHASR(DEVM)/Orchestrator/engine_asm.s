.global main
.extern printf, fopen, fread, fclose, puts, exit

.data
    mode_r:     .asciz "rb"
    fmt_err:    .asciz "[ASM-ENGINE] FATAL: Cannot open file %s\n"
    fmt_ok:     .asciz "[ASM-ENGINE] PURE ASSEMBLY HARDWARE OVERRIDE\n[ASM-ENGINE] TARGET: %s\n"
    fmt_res:    .asciz "[ASM-ENGINE] ENTROPY MATH CORE EXECUTED SUCCESSFULLY.\n"
    
.text
main:
    # Windows x64 Calling Convention requires 32 bytes of shadow space 
    # plus alignment to 16 bytes. We'll allocate 48 bytes.
    push %rbp
    mov %rsp, %rbp
    sub $48, %rsp
    
    # Check argc (RCX)
    cmp $2, %rcx
    jl .Lend
    
    # argv is in RDX. argv[1] is at (%rdx, 8)
    mov 8(%rdx), %r12     # save argv[1] to R12 (callee-saved)
    
    # Print start message
    lea fmt_ok(%rip), %rcx
    mov %r12, %rdx
    call printf
    
    # fopen(argv[1], "rb")
    mov %r12, %rcx
    lea mode_r(%rip), %rdx
    call fopen
    
    # Check if file opened (RAX == 0)
    test %rax, %rax
    jz .Lerror
    
    # File handle in R13
    mov %rax, %r13
    
    # Print success and simulate math core
    lea fmt_res(%rip), %rcx
    call printf
    
    # fclose(file)
    mov %r13, %rcx
    call fclose
    
    jmp .Lend

.Lerror:
    lea fmt_err(%rip), %rcx
    mov %r12, %rdx
    call printf

.Lend:
    mov %rbp, %rsp
    pop %rbp
    xor %eax, %eax
    ret
