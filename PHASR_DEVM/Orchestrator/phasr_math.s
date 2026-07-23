.global calculate_frequencies_asm

# Pure Bare-Metal Assembly Math Core
# void calculate_frequencies_asm(const unsigned char* buffer, long long size, long long* counts)
# Windows x64 Calling Convention:
# RCX = buffer
# RDX = size
# R8  = counts array (256 * 8 bytes)

.text
calculate_frequencies_asm:
    # Check if size == 0 to prevent segfaults
    test %rdx, %rdx
    jz .done

    xor %r9, %r9 # Clear R9 to use as our byte index

.loop_start:
    # Read 1 byte from the buffer into R9 and zero-extend to 64-bit
    movzbq (%rcx), %r9
    
    # Increment the specific byte frequency counter
    # The counts array contains 64-bit integers (8 bytes each)
    incq (%r8, %r9, 8)
    
    # Advance the buffer pointer to the next byte
    inc %rcx
    
    # Decrement the size counter and loop if not zero
    dec %rdx
    jnz .loop_start

.done:
    ret
