.global calculate_frequencies
.global _calculate_frequencies

.text

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# MODULE 3 — ABSOLUTE ENTROPY (RAW GAS/AT&T)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# GNU Assembler (GAS) implementation for macOS (Monterey) and Linux (Arch)
# Complies with System V AMD64 ABI
#
# void calculate_frequencies(const uint8_t* buffer, size_t length, uint32_t* counts)
# %rdi = buffer pointer
# %rsi = length
# %rdx = counts array pointer (pre-allocated and zeroed out: 256 * 4 bytes)

calculate_frequencies:
_calculate_frequencies:          # macOS C ABI requires the underscore prefix
    testq %rsi, %rsi             # If length == 0
    jz .done                     # Terminate wave collapse

.loop:
    movzbl (%rdi), %eax          # Load exactly 1 byte from physical memory buffer into EAX
    incl (%rdx, %rax, 4)         # Jump to the exact offset in the counts array and increment
    incq %rdi                    # Move pointer to the next byte
    decq %rsi                    # Decrement remaining file length
    jnz .loop                    # If length != 0, physically loop back on the CPU instruction cache

.done:
    ret                          # Return control to Orchestration layer
