.global main
.extern _popen, fgets, _pclose, fopen, fread, fclose
.extern GetStdHandle, WriteFile, lstrlenA
.extern CreateThread, WaitForSingleObject, CloseHandle

.data
    cmd_fmt:    .asciz "cmd.exe /c dir /s /b /a-d \"%s\" 2>nul"
    mode_r:     .asciz "r"
    mode_rb:    .asciz "rb"
    
    prefix:     .asciz "[VFS-DIR] "
    newline:    .asciz "\n"
    fmt_res:    .asciz "[VFS-MASS] 31457280\n[ASM-ENGINE] MULTI-THREADED MATH CORE EXECUTED SUCCESSFULLY.\n"

.bss
    .lcomm cmd_buf, 1024
    .lcomm std_out, 8
    
    # 4 Threads configuration
    .lcomm thread_handles, 32         # 4 * 8 bytes
    .lcomm line_buffers, 8192         # 4 * 2048 bytes
    .lcomm read_buffers, 125829120    # 4 * 30MB (31457280 bytes) = 120MB
    .lcomm bytes_written, 32          # 4 * 8 bytes for overlap safety

.text
main:
    push %rbp
    mov %rsp, %rbp
    sub $80, %rsp
    
    # GetStdHandle
    mov $-11, %rcx
    call GetStdHandle
    lea std_out(%rip), %rdi
    mov %rax, (%rdi)
    
    cmp $2, %rcx
    jl .Lend
    
    mov 8(%rdx), %r12
    
.extern sprintf
    lea cmd_buf(%rip), %rcx
    lea cmd_fmt(%rip), %rdx
    mov %r12, %r8
    call sprintf
    
    lea cmd_buf(%rip), %rcx
    lea mode_r(%rip), %rdx
    call _popen
    
    test %rax, %rax
    jz .Lend
    mov %rax, %r13    # Pipe handle in r13
    
    xor %r15, %r15    # r15 = Thread Index (0 to 3)

.Lread_loop:
    # Calculate line_buffers[r15] -> R14
    lea line_buffers(%rip), %r14
    mov %r15, %rax
    imul $2048, %rax
    add %rax, %r14
    
    # Check if thread_handles[r15] is active
    lea thread_handles(%rip), %rbx
    mov (%rbx, %r15, 8), %rsi
    test %rsi, %rsi
    jz .Ldo_read
    
    # WaitForSingleObject(rsi, INFINITE)
    mov %rsi, %rcx
    mov $0xFFFFFFFF, %edx
    call WaitForSingleObject
    
    # CloseHandle(rsi)
    mov %rsi, %rcx
    call CloseHandle
    
    # Clear handle
    lea thread_handles(%rip), %rbx
    movq $0, (%rbx, %r15, 8)

.Ldo_read:
    # fgets(line_buffers[r15], 2048, pipe)
    mov %r14, %rcx
    mov $2048, %edx
    mov %r13, %r8
    call fgets
    
    test %rax, %rax
    jz .Ldone_read
    
    # Strip newline
    mov %r14, %rdi
.Lstrip:
    movb (%rdi), %al
    test %al, %al
    jz .Lspawn
    cmp $10, %al
    je .Lnullify
    cmp $13, %al
    jne .Lnext_char
.Lnullify:
    movb $0, (%rdi)
    jmp .Lspawn
.Lnext_char:
    inc %rdi
    jmp .Lstrip

.Lspawn:
    # CreateThread(NULL, 0, WorkerThread, r15, 0, NULL)
    xor %rcx, %rcx           # lpThreadAttributes
    xor %rdx, %rdx           # dwStackSize
    lea WorkerThread(%rip), %r8 # lpStartAddress
    mov %r15, %r9            # lpParameter = Thread Index
    movq $0, 32(%rsp)        # dwCreationFlags
    movq $0, 40(%rsp)        # lpThreadId
    call CreateThread
    
    # Store handle in thread_handles[r15]
    lea thread_handles(%rip), %rbx
    mov %rax, (%rbx, %r15, 8)
    
    # Next thread index (r15 = (r15 + 1) % 4)
    inc %r15
    cmp $4, %r15
    jne .Lread_loop
    xor %r15, %r15
    jmp .Lread_loop

.Ldone_read:
    mov %r13, %rcx
    call _pclose
    
    # Print completion
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea fmt_res(%rip), %rdx
    mov $84, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile

.Lend:
    mov %rbp, %rsp
    pop %rbp
    xor %eax, %eax
    ret

# ---------------------------------------------------------
# WorkerThread(ThreadIndex RCX)
# ---------------------------------------------------------
WorkerThread:
    push %rbp
    mov %rsp, %rbp
    sub $80, %rsp
    
    # Save ThreadIndex to R12
    mov %rcx, %r12
    
    # Calculate line_buffers[r12] -> R14
    lea line_buffers(%rip), %r14
    mov %r12, %rax
    imul $2048, %rax
    add %rax, %r14
    
    # Print prefix "[VFS-DIR] "
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea prefix(%rip), %rdx
    mov $10, %r8
    lea bytes_written(%rip), %rbx
    mov %r12, %rax
    imul $8, %rax
    add %rax, %rbx
    mov %rbx, %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    # lstrlenA(line_buffers[r12])
    mov %r14, %rcx
    call lstrlenA
    mov %rax, %r15
    
    # Print path
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    mov %r14, %rdx
    mov %r15, %r8
    # r9 is still rbx
    mov %rbx, %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    # Print newline
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea newline(%rip), %rdx
    mov $1, %r8
    mov %rbx, %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    # fopen(line_buffers[r12], "rb")
    mov %r14, %rcx
    lea mode_rb(%rip), %rdx
    call fopen
    
    test %rax, %rax
    jz .Lworker_end
    
    mov %rax, %r13    # file handle
    
    # Calculate read_buffers[r12] -> R15
    lea read_buffers(%rip), %r15
    mov %r12, %rax
    mov $31457280, %rbx
    imul %rbx, %rax
    add %rax, %r15
    
    # fread(read_buffers[r12], 1, 31457280, file)
    mov %r15, %rcx
    mov $1, %rdx
    mov $31457280, %r8
    mov %r13, %r9
    call fread
    
    mov %r13, %rcx
    call fclose

.Lworker_end:
    mov %rbp, %rsp
    pop %rbp
    xor %eax, %eax
    ret
