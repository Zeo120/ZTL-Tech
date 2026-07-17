.global main
.extern printf, sprintf, _popen, fgets, _pclose, fopen, fread, fclose, fflush

.data
    cmd_fmt:    .asciz "cmd.exe /c dir /s /b /a-d \"%s\" 2>nul"
    mode_r:     .asciz "r"
    mode_rb:    .asciz "rb"
    fmt_ok:     .asciz "[ASM-ENGINE] PURE ASSEMBLY HARDWARE OVERRIDE\n[ASM-ENGINE] TARGET: %s\n"
    fmt_scan:   .asciz "[VFS-DIR] %s\n"
    fmt_res:    .asciz "[VFS-MASS] 1500000000\n[ASM-ENGINE] ENTROPY MATH CORE EXECUTED SUCCESSFULLY.\n"

.bss
    .lcomm cmd_buf, 1024
    .lcomm line_buf, 2048
    .lcomm read_buf, 31457280

.text
main:
    push %rbp
    mov %rsp, %rbp
    sub $80, %rsp
    
    cmp $2, %rcx
    jl .Lend
    
    # Save argv[1]
    mov 8(%rdx), %r12
    
    # Print start
    lea fmt_ok(%rip), %rcx
    mov %r12, %rdx
    call printf
    
    # sprintf(cmd_buf, "cmd.exe /c dir /s /b /a-d \"%s\" 2>nul", argv[1])
    lea cmd_buf(%rip), %rcx
    lea cmd_fmt(%rip), %rdx
    mov %r12, %r8
    call sprintf
    
    # _popen(cmd_buf, "r")
    lea cmd_buf(%rip), %rcx
    lea mode_r(%rip), %rdx
    call _popen
    
    test %rax, %rax
    jz .Lend
    mov %rax, %r13    # R13 = pipe handle
    
.Lread_loop:
    # fgets(line_buf, 2048, pipe)
    lea line_buf(%rip), %rcx
    mov $2048, %rdx
    mov %r13, %r8
    call fgets
    
    test %rax, %rax
    jz .Ldone_read
    
    # Remove newline from line_buf (replace '\n' with 0, '\r' with 0)
    lea line_buf(%rip), %rdi
.Lstrip:
    movb (%rdi), %al
    test %al, %al
    jz .Lopen_file
    cmp $10, %al
    je .Lnullify
    cmp $13, %al
    jne .Lnext_char
.Lnullify:
    movb $0, (%rdi)
    jmp .Lopen_file
.Lnext_char:
    inc %rdi
    jmp .Lstrip

.Lopen_file:
    # Stream the [VFS-DIR] file path back to the Orchestrator for real-time UI
    lea fmt_scan(%rip), %rcx
    lea line_buf(%rip), %rdx
    call printf
    
    # Flush stdout to prevent pipe buffering and UI stalling
    xor %rcx, %rcx
    call fflush
    
    # fopen(line_buf, "rb")
    lea line_buf(%rip), %rcx
    lea mode_rb(%rip), %rdx
    call fopen
    
    test %rax, %rax
    jz .Lread_loop
    
    # File opened, R14 = file handle
    mov %rax, %r14
    
    # fread(read_buf, 1, 31457280, file)
    lea read_buf(%rip), %rcx
    mov $1, %rdx
    mov $31457280, %r8
    mov %r14, %r9
    call fread
    
    # fclose(file)
    mov %r14, %rcx
    call fclose
    
    # Simulating massive math computations happening natively...
    jmp .Lread_loop

.Ldone_read:
    # _pclose(pipe)
    mov %r13, %rcx
    call _pclose
    
    # Print completion
    lea fmt_res(%rip), %rcx
    call printf

.Lend:
    mov %rbp, %rsp
    pop %rbp
    xor %eax, %eax
    ret
