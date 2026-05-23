// reachability_arm64.s
// ARM64 assembly transitive closure sweep (Warshall's algorithm)
// Used in PHASR Phase 2 Hierarchy Access Boundary Verification

.arch aarch64
.text
.globl compute_reachability_arm64
.type compute_reachability_arm64, %function

compute_reachability_arm64:
    // Copy the 16 uint16_t elements (32 bytes total) from adjacency (x0) to reachability (x1)
    ldp  q0, q1, [x0]
    stp  q0, q1, [x1]

    // Step 1: Set self-reachability: reachability[i] |= (1 << i)
    mov  w2, #0              // w2 = i (loop index)
.Ldiag_loop:
    cmp  w2, #16
    b.ge .Lstart_warshall
    
    lsl  w3, w2, #1          // w3 = i * 2 (offset in bytes)
    ldrh w4, [x1, x3]        // w4 = reachability[i]
    
    mov  w5, #1
    lsl  w5, w5, w2          // w5 = 1 << i
    orr  w4, w4, w5          // w4 = reachability[i] | (1 << i)
    strh w4, [x1, x3]        // Store back
    
    add  w2, w2, #1
    b    .Ldiag_loop

.Lstart_warshall:
    // Step 2: Warshall's algorithm transitive closure sweep
    // w2 = k (outer loop index, 0 to 15)
    mov  w2, #0
.Lloop_k:
    cmp  w2, #16
    b.ge .Lend_warshall
    
    lsl  w3, w2, #1          // w3 = k * 2
    ldrh w4, [x1, x3]        // w4 = reachability[k] (row k)
    
    // w5 = i (inner loop index, 0 to 15)
    mov  w5, #0
.Lloop_i:
    cmp  w5, #16
    b.ge .Lnext_k
    
    lsl  w6, w5, #1          // w6 = i * 2
    ldrh w7, [x1, x6]        // w7 = reachability[i] (row i)
    
    // Check if reachability[i] has bit k set (i.e. node i can reach node k)
    // If w7 & (1 << k) is non-zero, then reachability[i] |= reachability[k]
    mov  w8, #1
    lsl  w8, w8, w2          // w8 = 1 << k
    tst  w7, w8              // Test bit k in w7
    b.eq .Lnext_i            // Branch if zero
    
    orr  w7, w7, w4          // w7 = reachability[i] | reachability[k]
    strh w7, [x1, x6]        // Store back row i
    
.Lnext_i:
    add  w5, w5, #1
    b    .Lloop_i

.Lnext_k:
    add  w2, w2, #1
    b    .Lloop_k

.Lend_warshall:
    ret

.size compute_reachability_arm64, .-compute_reachability_arm64
