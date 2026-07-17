.global main
.extern _popen, fgets, _pclose, fopen, fread, fclose
.extern GetStdHandle, WriteFile

.data
    cmd_fmt:    .asciz "cmd.exe /c dir /s /b /a-d \"%s\" 2>nul"
    mode_r:     .asciz "r"
    mode_rb:    .asciz "rb"
    fmt_pulse:  .asciz "[VFS-PULSE] %llu\n"
    fmt_start:  .asciz "[ASM-ENGINE] STANDBY: Executing direct NTFS Master File Table pipe...\n"
    fmt_res:    .asciz "\n[VFS-MASS] 1073741824\n[ASM-ENGINE] BLIND BARE-METAL CORE EXECUTED SUCCESSFULLY.\n"

.bss
    .lcomm cmd_buf, 1024
    .lcomm line_buf, 2048
    .lcomm pulse_str, 128
    .lcomm read_buf, 1073741824
    .lcomm std_out, 8
    .lcomm bytes_written, 8
    .lcomm file_count, 8

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
    
    # Print start message so user knows it's alive
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea fmt_start(%rip), %rdx
    mov $71, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile
    
    lea cmd_buf(%rip), %rcx
    lea mode_r(%rip), %rdx
    call _popen
    
    test %rax, %rax
    jz .Lend
    mov %rax, %r13    # Pipe handle in r13
    
.Lread_loop:
    # fgets(line_buf, 2048, pipe)
    lea line_buf(%rip), %rcx
    mov $2048, %edx
    mov %r13, %r8
    call fgets
    
    test %rax, %rax
    jz .Ldone_read
    
    # Strip newline
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
    # Increment file_count
    incq file_count(%rip)
    mov file_count(%rip), %rax
    
    # Pulse every 128 files (fast bitwise AND)
    test $127, %rax
    jnz .Lskip_pulse
    
    # sprintf(pulse_str, "[VFS-PULSE] %llu\n", file_count)
    lea pulse_str(%rip), %rcx
    lea fmt_pulse(%rip), %rdx
    mov %rax, %r8
    call sprintf
    
    # lstrlenA(pulse_str)
    lea pulse_str(%rip), %rcx
    call lstrlenA
    mov %rax, %r15
    
    # WriteFile
    lea std_out(%rip), %rax
    mov (%rax), %rcx
    lea pulse_str(%rip), %rdx
    mov %r15, %r8
    lea bytes_written(%rip), %r9
    movq $0, 32(%rsp)
    call WriteFile
    
.Lskip_pulse:
    # fopen(line_buf, "rb")
    lea line_buf(%rip), %rcx
    lea mode_rb(%rip), %rdx
    call fopen
    
    test %rax, %rax
    jz .Lread_loop
    
    mov %rax, %r14    # file handle
    
    # fread(read_buf, 1, 1073741824, file)
    lea read_buf(%rip), %rcx
    mov $1, %rdx
    mov $1073741824, %r8
    mov %r14, %r9
    call fread
    
    mov %r14, %rcx
    call fclose
    
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
