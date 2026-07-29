.global calculate_frequencies
.global _calculate_frequencies
.align 2

.text

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# MODULE 3 — ABSOLUTE ENTROPY (AArch64 / ARM64)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# ARM64 implementation for Apple Silicon (M1/M2/M3) and Linux ARM servers
# Complies with AAPCS64 (ARM Architecture Procedure Call Standard)
#
# void calculate_frequencies(const uint8_t* buffer, size_t length, uint32_t* counts)
# X0 = buffer pointer
# X1 = length
# X2 = counts array pointer (pre-allocated and zeroed out: 256 * 4 bytes)

calculate_frequencies:
_calculate_frequencies:          // macOS Apple Silicon C ABI requires the underscore prefix
    cbz x1, .done                // Compare and Branch on Zero: If length == 0, terminate

.loop:
    ldrb w3, [x0], #1            // Load 1 byte from buffer into W3, post-increment X0 by 1
    ldr w4, [x2, w3, uxtw #2]    // Load current count into W4: counts + (w3 zero-extended to 64-bit << 2)
    add w4, w4, #1               // Increment the count value
    str w4, [x2, w3, uxtw #2]    // Store the updated count back into physical memory
    subs x1, x1, #1              // Subtract 1 from length, update condition flags (S)
    b.ne .loop                   // Branch if Not Equal (length != 0) back to the loop

.done:
    ret                          // Return to Orchestration layer
