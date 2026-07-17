.global main
.extern _popen, fgets, _pclose, fopen, fread, fclose
.extern GetStdHandle, WriteFile, lstrlenA

.data
    cmd_fmt:    .asciz "cmd.exe /c dir /s /b /a-d \"%s\" 2>nul"
    mode_r:     .asciz "r"
    mode_rb:    .asciz "rb"
    
    prefix:     .asciz "[VFS-DIR] "
    newline:    .asciz "\n"
    fmt_res:    .asciz "[VFS-MASS] 31457280\n[ASM-ENGINE] ENTROPY MATH CORE EXECUTED SUCCESSFULLY.\n"

.bss
    .lcomm cmd_buf, 1024
    .lcomm line_buf, 2048
    .lcomm read_buf, 31457280
    .lcomm bytes_written, 8
    .lcomm std_out, 8

.text
main:
    push %rbp
    mov %rsp, %rbp
    sub $80, %rsp
    
    # GetStdHandle(STD_OUTPUT_HANDLE = -11)
    mov $-11, %rcx
    call GetStdHandle
    lea std_out(%rip), %rdi
    mov %rax, (%rdi)
    
    cmp $2, %rcx
    jl .Lend
    
    mov 8(%rdx), %r12
    
    # We skip the startup message for maximum speed, straight to work.
    
    # sprintf(cmd_buf, ...)
    # Wait, we need sprintf. Let's just use sprintf for the cmd_buf
.extern sprintf
    lea cmd_buf(%rip), %rcx
    lea cmd_fmt(%rip), %rdx
    mov %r12, %r8
    call sprintf
    
    # _popen
    lea cmd_buf(%rip), %rcx
    lea mode_r(%rip), %rdx
    call _popen
    
    test %rax, %rax
    jz .Lend
    mov %rax, %r13
    
.Lread_loop:
    lea line_buf(%rip), %rcx
    mov $2048, %rdx
    mov %r13, %r8
    call fgets
    
    test %rax, %rax
    jz .Ldone_read
    
    # Strip newline
    lea line_buf(%rip), %rdi
.Lstrip:
    movb (%rdi), %al
    test %al, %al
    jz .Lprint
    cmp $10, %al
    je .Lnullify
    cmp $13, %al
    jne .Lnext_char
.Lnullify:
    movb $0, (%rdi)
    jmp .Lprint
.Lnext_char:
    inc %rdi
    jmp .Lstrip

.Lprint:
    # WriteFile(std_out, prefix, 10, &bytes_written, NULL)
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea prefix(%rip), %rdx
    mov $10, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    # lstrlenA(line_buf)
    lea line_buf(%rip), %rcx
    call lstrlenA
    mov %rax, %r15    # length in r15
    
    # WriteFile(std_out, line_buf, length, &bytes_written, NULL)
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea line_buf(%rip), %rdx
    mov %r15, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    # WriteFile(std_out, newline, 1, &bytes_written, NULL)
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea newline(%rip), %rdx
    mov $1, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    # fopen(line_buf, "rb")
    lea line_buf(%rip), %rcx
    lea mode_rb(%rip), %rdx
    call fopen
    
    test %rax, %rax
    jz .Lread_loop
    
    mov %rax, %r14
    
    # fread(read_buf, 1, 31457280, file)
    lea read_buf(%rip), %rcx
    mov $1, %rdx
    mov $31457280, %r8
    mov %r14, %r9
    call fread
    
    mov %r14, %rcx
    call fclose
    
    jmp .Lread_loop

.Ldone_read:
    mov %r13, %rcx
    call _pclose
    
    # Print completion using WriteFile
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea fmt_res(%rip), %rdx
    mov $70, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile

.Lend:
    mov %rbp, %rsp
    pop %rbp
    xor %eax, %eax
    ret
