// ============================================================
// PHASR TBAIS — Turing-Based Attacker Invalidation System
// Architecture : ARM64 (AArch64)  |  OS: Linux  |  Assembler: GAS
//
// Theory: Turing DFA   M = (Q, Σ, δ, q₀, F, R)
//   Q  = 10 session states (q0..q9)
//   Σ  = 10 session signals
//   δ  = transition table (100-entry byte array)
//   q₀ = Q_INITIATED (0)
//   F  = { Q_TRUSTED (5) }           ← accept
//   R  = { Q_ANOMALOUS (9) }         ← reject / Turing HALT
//
// Equations:
//   T_c  = 40·IP + 30·FP + 20·BEH + 10·TIME  (/100 fixed-point)
//   E    = Shannon entropy approx. via dominant signal fraction
//   HALT = TRUE iff σ_ip∅ received  (Turing Halting Condition)
//
// Build:
//   as tbais_arm64.s -o tbais_arm64.o
//   ld tbais_arm64.o -o tbais_arm64
//
// AAPCS64: x0-x7=args/return, x8=syscall nr, x9-x15=scratch
//          x19-x28=callee-saved, x29=frame pointer, x30=lr
// Linux AArch64 syscalls: x8=nr, x0-x5=args, svc #0
// ============================================================

.arch armv8-a
.text

// ---- Linux syscall numbers --------------------------------
.equ SYS_write,  64
.equ SYS_exit,   93
.equ STDOUT,      1

// ---- FSM State constants (Q) ------------------------------
.equ Q_INITIATED,         0
.equ Q_CREDENTIAL_RECV,   1
.equ Q_IP_BOUND,          2
.equ Q_FP_MATCH,          3
.equ Q_BEHAVIORAL_PASS,   4
.equ Q_TRUSTED,           5
.equ Q_IP_ABSENT,         6
.equ Q_FP_MISMATCH,       7
.equ Q_ENTROPY_SPIKE,     8
.equ Q_ANOMALOUS,         9
.equ NUM_STATES,         10

// ---- Signal index constants (Σ) ---------------------------
.equ SIG_CRED_VALID,      0
.equ SIG_CRED_INVALID,    1
.equ SIG_IP_PRESENT,      2
.equ SIG_IP_ABSENT,       3
.equ SIG_FP_MATCH,        4
.equ SIG_FP_MISMATCH,     5
.equ SIG_BEH_NORMAL,      6
.equ SIG_BEH_SPIKE,       7
.equ SIG_TIME_VALID,      8
.equ SIG_TIME_INVALID,    9
.equ NUM_SIGNALS,        10

// ---- Trust score weights ----------------------------------
.equ W_IP,    40
.equ W_FP,    30
.equ W_BEH,   20
.equ W_TIME,  10
.equ TC_ACCEPT, 80
.equ TC_WARN,   60

// ---- Entropy threshold ------------------------------------
.equ ENTROPY_THRESH, 350

// ---- Session struct byte offsets (24 bytes) ---------------
.equ SESSION_state,         0
.equ SESSION_trust,         1
.equ SESSION_ip_ok,         2
.equ SESSION_fp_ok,         3
.equ SESSION_beh_ok,        4
.equ SESSION_time_ok,       5
.equ SESSION_anomaly_flags, 6
.equ SESSION_pad,           7
.equ SESSION_id,            8
.equ SESSION_entropy_x100, 12
.equ SESSION_signal_counts,14
.equ SESSION_SIZE,         24

// ============================================================
.section .rodata

// ---- Transition table δ[state][signal] = next_state -------
// 10 states × 10 signals = 100 bytes
// Undefined transitions → Q_ANOMALOUS (9)
delta:
//          cred  cred∅  ip    ip∅   fp    fp∅   beh   beh↑  time  time∅
.byte        1,   9,    9,    9,    9,    9,    9,    9,    9,    9    // q0
.byte        9,   9,    2,    6,    9,    9,    9,    9,    9,    9    // q1
.byte        9,   9,    9,    9,    3,    7,    9,    9,    9,    9    // q2
.byte        9,   9,    9,    9,    9,    9,    4,    8,    9,    9    // q3
.byte        9,   9,    9,    9,    9,    9,    9,    9,    5,    9    // q4
.byte        9,   9,    9,    9,    9,    9,    9,    9,    9,    9    // q5 TRUSTED
.byte        9,   9,    9,    9,    9,    9,    9,    9,    9,    9    // q6 IP_ABSENT
.byte        9,   9,    9,    9,    9,    9,    9,    9,    9,    9    // q7 FP_MISMATCH
.byte        9,   9,    9,    9,    9,    9,    9,    9,    9,    9    // q8 ENTROPY_SPIKE
.byte        9,   9,    9,    9,    9,    9,    9,    9,    9,    9    // q9 ANOMALOUS

// ---- State names ------------------------------------------
sq0:  .asciz "[q0] INITIATED        "
sq1:  .asciz "[q1] CREDENTIAL_RECV  "
sq2:  .asciz "[q2] IP_BOUND         "
sq3:  .asciz "[q3] FP_MATCH         "
sq4:  .asciz "[q4] BEHAVIORAL_PASS  "
sq5:  .asciz "[q5] TRUSTED          "
sq6:  .asciz "[q6] IP_ABSENT        "
sq7:  .asciz "[q7] FP_MISMATCH      "
sq8:  .asciz "[q8] ENTROPY_SPIKE    "
sq9:  .asciz "[q9] ANOMALOUS        "

state_names:
.quad sq0, sq1, sq2, sq3, sq4, sq5, sq6, sq7, sq8, sq9

// ---- Signal names -----------------------------------------
ssig0: .asciz "sig:CRED_VALID  "
ssig1: .asciz "sig:CRED_INVALID"
ssig2: .asciz "sig:IP_PRESENT  "
ssig3: .asciz "sig:IP_ABSENT   "
ssig4: .asciz "sig:FP_MATCH    "
ssig5: .asciz "sig:FP_MISMATCH "
ssig6: .asciz "sig:BEH_NORMAL  "
ssig7: .asciz "sig:BEH_SPIKE   "
ssig8: .asciz "sig:TIME_VALID  "
ssig9: .asciz "sig:TIME_INVALID"

signal_names:
.quad ssig0,ssig1,ssig2,ssig3,ssig4,ssig5,ssig6,ssig7,ssig8,ssig9

// ---- UI strings -------------------------------------------
hdr:
.ascii "\n================================================================\n"
.ascii "  PHASR TBAIS — Turing-Based Attacker Invalidation System      \n"
.ascii "  ARM64 Linux  |  DFA M=(Q,\u03a3,\u03b4,q0,F,R)  |  ZTL Tech PHASR    \n"
.ascii "================================================================\n"
.byte 0
hdr_end:

sep:    .asciz "----------------------------------------------------------------\n"
sig_pfx:.asciz "  SIGNAL  : "
arrow:  .asciz " --> "
tc_pfx: .asciz "  T_c     : "
tc_suf: .asciz "/100\n"
ent_pfx:.asciz "  E_scaled: "
ent_suf:.asciz " (x100 bits)\n"
nl:     .asciz "\n"
pfx:    .asciz "  FSM     : "

halt_msg:
.ascii "\n  *** TURING HALT: IRREGULAR LOGIN DETECTED ***\n"
.ascii "      Machine halted in REJECT state q9.\n"
.ascii "      Alert fired to Super Admin Console.\n\n"
.byte 0

accept_msg:
.ascii "\n  *** MACHINE ACCEPTED: session in q5 TRUSTED ***\n\n"
.byte 0

warn_msg:
.ascii "\n  !!! WARNING: T_c < 0.80 — operator review required\n\n"
.byte 0

// ---- Test scenarios ----------------------------------------
scen0_name: .asciz "SESSION-0001  [SCENARIO: NORMAL LOGIN]\n"
scen0:      .byte SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MATCH, SIG_BEH_NORMAL, SIG_TIME_VALID, 0xFF

scen1_name: .asciz "SESSION-0002  [SCENARIO: IP-ABSENT LOGIN — TURING HALT]\n"
scen1:      .byte SIG_CRED_VALID, SIG_IP_ABSENT, 0xFF

scen2_name: .asciz "SESSION-0003  [SCENARIO: FINGERPRINT MISMATCH]\n"
scen2:      .byte SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MISMATCH, 0xFF

scen3_name: .asciz "SESSION-0004  [SCENARIO: ENTROPY SPIKE — SCRIPTED ATTACKER]\n"
scen3:      .byte SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MATCH, SIG_BEH_SPIKE, 0xFF

scen4_name: .asciz "SESSION-0005  [SCENARIO: OFF-HOURS ACCESS]\n"
scen4:      .byte SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MATCH, SIG_BEH_NORMAL, SIG_TIME_INVALID, 0xFF

scenarios:
.quad scen0_name, scen0
.quad scen1_name, scen1
.quad scen2_name, scen2
.quad scen3_name, scen3
.quad scen4_name, scen4
.quad 0, 0   // sentinel

// ============================================================
.section .bss
.align 4
session_buf: .skip SESSION_SIZE
.align 1
num_buf:     .skip 24

// ============================================================
.text
.global _start

// ----------------------------------------------------------
// write_str(x0=ptr)  — write null-terminated string to stdout
// clobbers: x0,x1,x2,x8,x9,x10
// ----------------------------------------------------------
write_str:
    stp  x29, x30, [sp, #-16]!
    mov  x29, sp
    mov  x9,  x0            // save base
    mov  x10, #0            // counter
0:
    ldrb w11, [x9, x10]
    cbz  w11, 1f
    add  x10, x10, #1
    b    0b
1:
    // syscall write(STDOUT, ptr, len)
    mov  x8,  #SYS_write
    mov  x0,  #STDOUT
    mov  x1,  x9
    mov  x2,  x10
    svc  #0
    ldp  x29, x30, [sp], #16
    ret

// ----------------------------------------------------------
// write_uint(x0=value)  — write unsigned decimal to stdout
// clobbers: x0-x5, x8-x12
// ----------------------------------------------------------
write_uint:
    stp  x29, x30, [sp, #-48]!
    mov  x29, sp
    // build string right-to-left in stack buffer
    add  x1,  sp,  #46         // end of buffer
    mov  x5,  x1
    strb wzr, [x5]             // null terminator
    sub  x5,  x5,  #1
    mov  x9,  x0               // value
    mov  x10, #10
0:
    udiv x11, x9,  x10         // quotient
    msub x12, x11, x10, x9    // remainder = x9 - x11*10
    add  w12, w12, #'0'
    strb w12, [x5]
    sub  x5,  x5,  #1
    mov  x9,  x11
    cbnz x9,  0b
    add  x5,  x5,  #1         // first digit
    mov  x0,  x5
    bl   write_str
    ldp  x29, x30, [sp], #48
    ret

// ----------------------------------------------------------
// tbais_init_session(x0=session_ptr, x1=session_id)
// ----------------------------------------------------------
tbais_init_session:
    stp  x29, x30, [sp, #-16]!
    mov  x29, sp
    mov  x9,  x0               // session ptr
    mov  x10, #SESSION_SIZE
    // zero fill
0:
    sub  x10, x10, #1
    strb wzr, [x9, x10]
    cbnz x10, 0b
    // set initial state = Q_INITIATED (=0, already zeroed)
    // store session id at offset 8
    str  w1,  [x9, #SESSION_id]
    ldp  x29, x30, [sp], #16
    ret

// ----------------------------------------------------------
// tbais_feed_signal(x0=session_ptr, x1=signal_index) → x0=new_state
//
// δ(current_state, signal) → next_state
// Turing HALT: SIG_IP_ABSENT → immediate Q_ANOMALOUS
// ----------------------------------------------------------
tbais_feed_signal:
    stp  x29, x30, [sp, #-32]!
    stp  x19, x20, [sp, #16]
    mov  x29, sp
    mov  x19, x0               // session ptr
    mov  x20, x1               // signal index

    // bounds check signal
    cmp  x20, #NUM_SIGNALS
    bge  .Lset_anomalous

    // Turing HALT: IP absent signal
    cmp  x20, #SIG_IP_ABSENT
    beq  .Lturing_halt

    // read current state
    ldrb w9,  [x19, #SESSION_state]
    cmp  w9,  #Q_ANOMALOUS
    beq  .Lalready_terminal
    cmp  w9,  #Q_TRUSTED
    beq  .Lalready_terminal
    cmp  w9,  #NUM_STATES
    bge  .Lset_anomalous

    // delta index = state * NUM_SIGNALS + signal
    mov  x10, #NUM_SIGNALS
    mul  x11, x9,  x10
    add  x11, x11, x20
    adr  x12, delta
    ldrb w9,  [x12, x11]       // next state

    // store new state
    strb w9,  [x19, #SESSION_state]

    // increment signal_counts[signal_index]
    add  x12, x19, #SESSION_signal_counts
    ldrb w10, [x12, x20]
    cmp  w10, #255
    beq  .Lskip_count
    add  w10, w10, #1
    strb w10, [x12, x20]
.Lskip_count:

    // update validity flags
    cmp  x20, #SIG_IP_PRESENT
    bne  1f
    mov  w10, #1
    strb w10, [x19, #SESSION_ip_ok]
    b    .Ldone_flags
1:  cmp  x20, #SIG_FP_MATCH
    bne  2f
    mov  w10, #1
    strb w10, [x19, #SESSION_fp_ok]
    b    .Ldone_flags
2:  cmp  x20, #SIG_BEH_NORMAL
    bne  3f
    mov  w10, #1
    strb w10, [x19, #SESSION_beh_ok]
    b    .Ldone_flags
3:  cmp  x20, #SIG_TIME_VALID
    bne  .Ldone_flags
    mov  w10, #1
    strb w10, [x19, #SESSION_time_ok]
.Ldone_flags:
    ldrb w0,  [x19, #SESSION_state]
    b    .Lret

.Lturing_halt:
    // Alan Turing Halting Condition:
    // Origin of session is UNDECIDABLE without IP → machine HALTS in q9
    mov  w10, #Q_ANOMALOUS
    strb w10, [x19, #SESSION_state]
    ldrb w10, [x19, #SESSION_anomaly_flags]
    orr  w10, w10, #0x01       // bit 0 = NO_IP
    strb w10, [x19, #SESSION_anomaly_flags]
    mov  x0,  #Q_ANOMALOUS
    b    .Lret

.Lset_anomalous:
    mov  w10, #Q_ANOMALOUS
    strb w10, [x19, #SESSION_state]
    mov  x0,  #Q_ANOMALOUS
    b    .Lret

.Lalready_terminal:
    ldrb w0,  [x19, #SESSION_state]

.Lret:
    ldp  x19, x20, [sp, #16]
    ldp  x29, x30, [sp], #32
    ret

// ----------------------------------------------------------
// tbais_compute_trust(x0=session_ptr) → x0=T_c (0-100)
//
// T_c = 40·ip_ok + 30·fp_ok + 20·beh_ok + 10·time_ok
// ----------------------------------------------------------
tbais_compute_trust:
    stp  x29, x30, [sp, #-16]!
    mov  x29, sp
    mov  x9,  x0               // session ptr
    mov  x0,  #0

    ldrb w10, [x9, #SESSION_ip_ok]
    mov  x11, #W_IP
    mul  x10, x10, x11
    add  x0,  x0,  x10

    ldrb w10, [x9, #SESSION_fp_ok]
    mov  x11, #W_FP
    mul  x10, x10, x11
    add  x0,  x0,  x10

    ldrb w10, [x9, #SESSION_beh_ok]
    mov  x11, #W_BEH
    mul  x10, x10, x11
    add  x0,  x0,  x10

    ldrb w10, [x9, #SESSION_time_ok]
    mov  x11, #W_TIME
    mul  x10, x10, x11
    add  x0,  x0,  x10

    // clamp to 100
    cmp  x0,  #100
    ble  1f
    mov  x0,  #100
1:
    strb w0,  [x9, #SESSION_trust]
    ldp  x29, x30, [sp], #16
    ret

// ----------------------------------------------------------
// tbais_compute_entropy(x0=session_ptr) → x0=E×100 (approx)
//
// Dominant-fraction Shannon entropy approximation:
// P_max = max_count / total_count
// P_max >= 85%  → low entropy (≈normal)   → E×100 ≈ 50
// P_max <  85%  → high entropy (anomalous)→ E×100 = 400 (> threshold 350)
// ----------------------------------------------------------
tbais_compute_entropy:
    stp  x29, x30, [sp, #-16]!
    mov  x29, sp
    mov  x9,  x0               // session ptr

    // sum counts, track max
    mov  x10, #0               // total
    mov  x11, #0               // max_count
    mov  x12, #0               // loop idx
0:
    cmp  x12, #NUM_SIGNALS
    beq  1f
    add  x13, x9,  #SESSION_signal_counts
    ldrb w14, [x13, x12]
    add  x10, x10, x14         // total += count
    cmp  x14, x11
    ble  2f
    mov  x11, x14              // update max
2:
    add  x12, x12, #1
    b    0b
1:
    // if total == 0, entropy = 0
    cbz  x10, .Lzero_ent

    // P_max * 100 = (max * 100) / total
    mov  x14, #100
    mul  x11, x11, x14
    udiv x11, x11, x10         // x11 = P_max*100

    cmp  x11, #85
    bge  .Llow_ent

    // high entropy → E×100 = 400 (above ENTROPY_THRESH=350)
    mov  x0,  #400
    b    .Lstore_ent

.Llow_ent:
    // E×100 ≈ 350 * (100 - P_max*100) / 100
    mov  x14, #100
    sub  x13, x14, x11         // 100 - P_max*100
    mov  x14, #350
    mul  x13, x13, x14
    mov  x14, #100
    udiv x0,  x13, x14
    b    .Lstore_ent

.Lzero_ent:
    mov  x0,  #0

.Lstore_ent:
    strh w0,  [x9, #SESSION_entropy_x100]
    ldp  x29, x30, [sp], #16
    ret

// ----------------------------------------------------------
// tbais_print_state(x0=session_ptr)
// ----------------------------------------------------------
tbais_print_state:
    stp  x29, x30, [sp, #-32]!
    stp  x19, x20, [sp, #16]
    mov  x29, sp
    mov  x19, x0

    // "  FSM     : "
    adr  x0,  pfx
    bl   write_str

    // state name
    ldrb w9,  [x19, #SESSION_state]
    cmp  w9,  #NUM_STATES
    bge  1f
    b    2f
1:  mov  w9,  #Q_ANOMALOUS
2:
    adr  x10, state_names
    ldr  x0,  [x10, x9, lsl #3]
    bl   write_str

    adr  x0,  nl
    bl   write_str

    // T_c
    adr  x0,  tc_pfx
    bl   write_str
    ldrb w0,  [x19, #SESSION_trust]
    bl   write_uint
    adr  x0,  tc_suf
    bl   write_str

    // E
    adr  x0,  ent_pfx
    bl   write_str
    ldrh w0,  [x19, #SESSION_entropy_x100]
    bl   write_uint
    adr  x0,  ent_suf
    bl   write_str

    ldp  x19, x20, [sp, #16]
    ldp  x29, x30, [sp], #32
    ret

// ----------------------------------------------------------
// tbais_run_scenario(x0=name, x1=signals, x2=session_id)
// ----------------------------------------------------------
tbais_run_scenario:
    stp  x29, x30, [sp, #-48]!
    stp  x19, x20, [sp, #16]
    stp  x21, x22, [sp, #32]
    mov  x29, sp

    mov  x19, x0               // name str
    mov  x20, x1               // signals ptr
    mov  x21, x2               // session id

    // separator
    adr  x0,  sep
    bl   write_str

    // scenario name
    mov  x0,  x19
    bl   write_str

    // init session
    adr  x0,  session_buf
    mov  x1,  x21
    bl   tbais_init_session

.Lsig_loop:
    ldrb w9,  [x20]
    cmp  w9,  #0xFF
    beq  .Lsigs_done

    // print signal name
    adr  x0,  sig_pfx
    bl   write_str
    adr  x10, signal_names
    ldr  x0,  [x10, x9, lsl #3]
    bl   write_str
    adr  x0,  arrow
    bl   write_str

    // feed signal
    adr  x0,  session_buf
    uxtb x1,  w9
    bl   tbais_feed_signal
    mov  x22, x0               // save returned state

    // print new state name
    cmp  x22, #NUM_STATES
    bge  .Lskip_sname
    adr  x10, state_names
    ldr  x0,  [x10, x22, lsl #3]
    bl   write_str
.Lskip_sname:
    adr  x0,  nl
    bl   write_str

    add  x20, x20, #1
    b    .Lsig_loop

.Lsigs_done:
    // compute trust & entropy
    adr  x0,  session_buf
    bl   tbais_compute_trust
    adr  x0,  session_buf
    bl   tbais_compute_entropy

    // print state summary
    adr  x0,  session_buf
    bl   tbais_print_state

    // verdict
    ldrb w9,  [session_buf + SESSION_state - session_buf + 0] // inline
    adr  x10, session_buf
    ldrb w9,  [x10, #SESSION_state]
    cmp  w9,  #Q_TRUSTED
    beq  .Laccepted
    cmp  w9,  #Q_ANOMALOUS
    beq  .Lhalted

    // intermediate: check trust score
    ldrb w9,  [x10, #SESSION_trust]
    cmp  w9,  #TC_ACCEPT
    bge  .Ldone_verdict
    adr  x0,  warn_msg
    bl   write_str
    b    .Ldone_verdict

.Lhalted:
    adr  x0,  halt_msg
    bl   write_str
    b    .Ldone_verdict

.Laccepted:
    adr  x0,  accept_msg
    bl   write_str

.Ldone_verdict:
    ldp  x21, x22, [sp, #32]
    ldp  x19, x20, [sp, #16]
    ldp  x29, x30, [sp], #48
    ret

// ============================================================
// _start — entry point
// ============================================================
.global _start
_start:
    // print header
    adr  x0,  hdr
    bl   write_str

    // iterate scenarios
    adr  x19, scenarios
    mov  x20, #1               // session id counter

.Lscenario_loop:
    ldr  x21, [x19]            // name ptr
    cbz  x21, .Ldone

    ldr  x22, [x19, #8]        // signals ptr
    mov  x0,  x21
    mov  x1,  x22
    mov  x2,  x20
    bl   tbais_run_scenario

    add  x19, x19, #16         // advance scenario table
    add  x20, x20, #1
    b    .Lscenario_loop

.Ldone:
    // exit(0)
    mov  x8,  #SYS_exit
    mov  x0,  #0
    svc  #0
