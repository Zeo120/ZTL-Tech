; ============================================================
; PHASR TBAIS — Turing-Based Attacker Invalidation System
; Architecture : x86-64  |  OS: Linux  |  Assembler: NASM
;
; Theory: Turing DFA   M = (Q, Σ, δ, q₀, F, R)
;   Q  = 10 session states (q0..q9)
;   Σ  = 10 session signals
;   δ  = transition table (100-entry byte array)
;   q₀ = Q_INITIATED (0)
;   F  = { Q_TRUSTED (5) }          ← accept
;   R  = { Q_ANOMALOUS (9) }        ← reject / Turing HALT
;
; Equations implemented:
;   T_c  = 40·IP + 30·FP + 20·BEH + 10·TIME   (fixed-point /100)
;   E    = Shannon entropy (approximated via signal-count variance)
;   D_K  = |K(session) - K(baseline)| / K(baseline)  (complexity dev.)
;   HALT = TRUE  iff σ_ip∅ received  (Turing halting condition)
;
; Build:
;   nasm -f elf64 tbais_x64.asm -o tbais_x64.o
;   ld tbais_x64.o -o tbais_x64
;
; System V AMD64 ABI — caller-saved: rax,rcx,rdx,rsi,rdi,r8-r11
;                      callee-saved: rbx,rbp,r12-r15
; Linux syscalls: rax=nr, rdi,rsi,rdx,r10,r8,r9 = args
; ============================================================

BITS 64
global _start

; ---- Linux syscall numbers ---------------------------------
SYS_write   equ 1
SYS_exit    equ 60
STDOUT      equ 1

; ---- FSM State constants (Q) --------------------------------
Q_INITIATED         equ 0   ; session started, no signals yet
Q_CREDENTIAL_RECV   equ 1   ; credentials submitted
Q_IP_BOUND          equ 2   ; IP address bound to session
Q_FP_MATCH          equ 3   ; device fingerprint matched
Q_BEHAVIORAL_PASS   equ 4   ; entropy within normal bounds
Q_TRUSTED           equ 5   ; ACCEPT — all signals verified
Q_IP_ABSENT         equ 6   ; IP signal MISSING (Turing HALT path)
Q_FP_MISMATCH       equ 7   ; fingerprint unknown / spoofed
Q_ENTROPY_SPIKE     equ 8   ; entropy > θ_E
Q_ANOMALOUS         equ 9   ; REJECT — machine HALTED

NUM_STATES  equ 10

; ---- Signal index constants (Σ) ----------------------------
SIG_CRED_VALID      equ 0   ; σ_cred   valid credentials
SIG_CRED_INVALID    equ 1   ; σ_cred∅  invalid credentials
SIG_IP_PRESENT      equ 2   ; σ_ip     IP address present & whitelisted
SIG_IP_ABSENT       equ 3   ; σ_ip∅    IP address MISSING / unresolvable
SIG_FP_MATCH        equ 4   ; σ_fp     device fingerprint matches
SIG_FP_MISMATCH     equ 5   ; σ_fp∅    fingerprint unknown
SIG_BEH_NORMAL      equ 6   ; σ_beh    entropy within bounds
SIG_BEH_SPIKE       equ 7   ; σ_beh↑   entropy spike
SIG_TIME_VALID      equ 8   ; σ_time   login within expected window
SIG_TIME_INVALID    equ 9   ; σ_time∅  off-hours access

NUM_SIGNALS equ 10

; ---- Trust score weights (×100 fixed-point) ----------------
W_IP    equ 40              ; IP binding         40%
W_FP    equ 30              ; Device fingerprint 30%
W_BEH   equ 20              ; Behaviour entropy  20%
W_TIME  equ 10              ; Temporal coherence 10%
TC_ACCEPT   equ 80          ; T_c ≥ 0.80 → ACCEPT
TC_WARN     equ 60          ; T_c ∈ [0.60,0.80) → WARNING

; ---- Entropy threshold (×100 fixed-point) ------------------
ENTROPY_THRESH  equ 350     ; θ_E = 3.50 bits

; ---- Session struct offsets (20 bytes total) ---------------
; offset  0  : uint8  state
; offset  1  : uint8  trust_score   (T_c × 100)
; offset  2  : uint8  ip_ok
; offset  3  : uint8  fp_ok
; offset  4  : uint8  beh_ok
; offset  5  : uint8  time_ok
; offset  6  : uint8  anomaly_flags (bitmask: 1=no-ip,2=no-fp,4=entropy,8=time)
; offset  7  : uint8  _pad
; offset  8  : uint32 session_id
; offset 12  : uint16 entropy_x100
; offset 14  : uint8  signal_counts[10]  (freq table for entropy)
; total → 24 bytes
SESSION_state           equ 0
SESSION_trust           equ 1
SESSION_ip_ok           equ 2
SESSION_fp_ok           equ 3
SESSION_beh_ok          equ 4
SESSION_time_ok         equ 5
SESSION_anomaly_flags   equ 6
SESSION_id              equ 8
SESSION_entropy_x100    equ 12
SESSION_signal_counts   equ 14
SESSION_SIZE            equ 24

; ============================================================
section .data
; ---- Transition table δ[state][signal] = next_state --------
; Row = current state (0-9), Col = signal index (0-9)
; Trap / undefined → Q_ANOMALOUS (9)
delta:
;             cred   cred∅  ip     ip∅    fp     fp∅    beh    beh↑   time   time∅
db           1,     9,     9,     9,     9,     9,     9,     9,     9,     9   ; q0 INITIATED
db           9,     9,     2,     6,     9,     9,     9,     9,     9,     9   ; q1 CRED_RECV
db           9,     9,     9,     9,     3,     7,     9,     9,     9,     9   ; q2 IP_BOUND
db           9,     9,     9,     9,     9,     9,     4,     8,     9,     9   ; q3 FP_MATCH
db           9,     9,     9,     9,     9,     9,     9,     9,     5,     9   ; q4 BEHAVIORAL_PASS
db           9,     9,     9,     9,     9,     9,     9,     9,     9,     9   ; q5 TRUSTED (terminal)
db           9,     9,     9,     9,     9,     9,     9,     9,     9,     9   ; q6 IP_ABSENT (→q9)
db           9,     9,     9,     9,     9,     9,     9,     9,     9,     9   ; q7 FP_MISMATCH (→q9)
db           9,     9,     9,     9,     9,     9,     9,     9,     9,     9   ; q8 ENTROPY_SPIKE (→q9)
db           9,     9,     9,     9,     9,     9,     9,     9,     9,     9   ; q9 ANOMALOUS (terminal)

; ---- State name strings ------------------------------------
s_q0   db "[q0] INITIATED        ", 0
s_q1   db "[q1] CREDENTIAL_RECV  ", 0
s_q2   db "[q2] IP_BOUND         ", 0
s_q3   db "[q3] FP_MATCH         ", 0
s_q4   db "[q4] BEHAVIORAL_PASS  ", 0
s_q5   db "[q5] TRUSTED          ", 0
s_q6   db "[q6] IP_ABSENT        ", 0
s_q7   db "[q7] FP_MISMATCH      ", 0
s_q8   db "[q8] ENTROPY_SPIKE    ", 0
s_q9   db "[q9] ANOMALOUS        ", 0

state_names:
dq s_q0, s_q1, s_q2, s_q3, s_q4, s_q5, s_q6, s_q7, s_q8, s_q9

; ---- Signal name strings -----------------------------------
s_sig0 db "sig:CRED_VALID  ", 0
s_sig1 db "sig:CRED_INVALID", 0
s_sig2 db "sig:IP_PRESENT  ", 0
s_sig3 db "sig:IP_ABSENT   ", 0
s_sig4 db "sig:FP_MATCH    ", 0
s_sig5 db "sig:FP_MISMATCH ", 0
s_sig6 db "sig:BEH_NORMAL  ", 0
s_sig7 db "sig:BEH_SPIKE   ", 0
s_sig8 db "sig:TIME_VALID  ", 0
s_sig9 db "sig:TIME_INVALID", 0

signal_names:
dq s_sig0,s_sig1,s_sig2,s_sig3,s_sig4,s_sig5,s_sig6,s_sig7,s_sig8,s_sig9

; ---- UI strings --------------------------------------------
hdr   db 10, "================================================================", 10
      db "  PHASR TBAIS — Turing-Based Attacker Invalidation System       ", 10
      db "  x86-64 Linux  |  DFA M=(Q,Σ,δ,q0,F,R)  |  ZTL Tech PHASR   ", 10
      db "================================================================", 10, 0
hdr_len  equ $ - hdr

sep   db "----------------------------------------------------------------", 10, 0
sep_len  equ $ - sep

sig_pfx   db "  SIGNAL  : ", 0
sig_pfx_l equ $ - sig_pfx

arrow     db " --> ", 0
arrow_l   equ $ - arrow

tc_pfx    db "  T_c     : ", 0
tc_pfx_l  equ $ - tc_pfx

tc_suf    db "/100", 10, 0
tc_suf_l  equ $ - tc_suf

ent_pfx   db "  E_scaled: ", 0
ent_pfx_l equ $ - ent_pfx

ent_suf   db " (x100 bits)", 10, 0
ent_suf_l equ $ - ent_suf

halt_str  db 10, "  *** TURING HALT: IRREGULAR LOGIN DETECTED ***", 10
          db "      Machine halted in REJECT state q9.", 10
          db "      Alert fired to Super Admin Console.", 10, 10, 0
halt_len  equ $ - halt_str

accept_str db 10, "  *** MACHINE ACCEPTED: session in q5 TRUSTED ***", 10, 10, 0
accept_len equ $ - accept_str

warn_str   db 10, "  !!! WARNING: T_c < 0.80 — operator review required", 10, 10, 0
warn_len   equ $ - warn_str

nl    db 10, 0
pfx   db "  FSM     : ", 0
pfx_l equ $ - pfx

; ---- Test session scenario descriptors ---------------------
; Each scenario = array of signal indices, terminated by 0xFF
; Scenario 0: NORMAL login (all signals pass)
scen0_name db "SESSION-0001  [SCENARIO: NORMAL LOGIN]", 10, 0
scen0      db SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MATCH, SIG_BEH_NORMAL, SIG_TIME_VALID, 0xFF

; Scenario 1: NO IP ADDRESS (Turing HALT — Halting Problem)
scen1_name db "SESSION-0002  [SCENARIO: IP-ABSENT LOGIN — TURING HALT]", 10, 0
scen1      db SIG_CRED_VALID, SIG_IP_ABSENT, 0xFF

; Scenario 2: Fingerprint mismatch
scen2_name db "SESSION-0003  [SCENARIO: FINGERPRINT MISMATCH]", 10, 0
scen2      db SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MISMATCH, 0xFF

; Scenario 3: Entropy spike (bot/scripted attacker)
scen3_name db "SESSION-0004  [SCENARIO: ENTROPY SPIKE — SCRIPTED ATTACKER]", 10, 0
scen3      db SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MATCH, SIG_BEH_SPIKE, 0xFF

; Scenario 4: Off-hours access
scen4_name db "SESSION-0005  [SCENARIO: OFF-HOURS ACCESS]", 10, 0
scen4      db SIG_CRED_VALID, SIG_IP_PRESENT, SIG_FP_MATCH, SIG_BEH_NORMAL, SIG_TIME_INVALID, 0xFF

; Scenario table
scenarios:
dq scen0_name, scen0
dq scen1_name, scen1
dq scen2_name, scen2
dq scen3_name, scen3
dq scen4_name, scen4
dq 0, 0   ; sentinel

; ============================================================
section .bss
session_buf resb SESSION_SIZE    ; current session struct
num_buf     resb 8               ; small ASCII number buffer

; ============================================================
section .text

; --------------------------------------------------------
; write_str(rdi=ptr)  — writes null-terminated string to stdout
; Clobbers: rax, rsi, rdx, rcx
; --------------------------------------------------------
write_str:
    push rbx
    mov  rbx, rdi           ; save base
    xor  rcx, rcx
.len_loop:
    cmp  byte [rbx + rcx], 0
    je   .done_len
    inc  rcx
    jmp  .len_loop
.done_len:
    mov  rax, SYS_write
    mov  rdi, STDOUT
    mov  rsi, rbx
    mov  rdx, rcx
    syscall
    pop  rbx
    ret

; --------------------------------------------------------
; write_uint(rdi=value)  — prints unsigned decimal to stdout
; Clobbers: rax, rbx, rcx, rdx, rsi
; --------------------------------------------------------
write_uint:
    push rbp
    mov  rbp, rsp
    sub  rsp, 24            ; local buffer on stack
    lea  rbx, [rsp + 22]
    mov  byte [rbx], 0      ; null terminator
    dec  rbx
    mov  rax, rdi
    mov  rcx, 10
.div_loop:
    xor  rdx, rdx
    div  rcx
    add  dl, '0'
    mov  [rbx], dl
    dec  rbx
    test rax, rax
    jnz  .div_loop
    inc  rbx
    mov  rdi, rbx
    call write_str
    add  rsp, 24
    pop  rbp
    ret

; --------------------------------------------------------
; tbais_init_session(rdi=session_ptr, rsi=session_id)
; Zeroes the struct and sets state to Q_INITIATED
; --------------------------------------------------------
tbais_init_session:
    push rbx
    mov  rbx, rdi
    ; zero SESSION_SIZE bytes
    xor  rax, rax
    mov  rcx, SESSION_SIZE
.zero_loop:
    mov  byte [rbx + rcx - 1], al
    loop .zero_loop
    ; set initial state
    mov  byte  [rbx + SESSION_state], Q_INITIATED
    ; set session id
    mov  dword [rbx + SESSION_id], esi
    pop  rbx
    ret

; --------------------------------------------------------
; tbais_feed_signal(rdi=session_ptr, rsi=signal_index) → rax=new_state
;
; Implements: δ(current_state, signal) → next_state
; Special Turing HALT: SIG_IP_ABSENT always → Q_ANOMALOUS
; Also increments signal_counts for entropy calculation.
; --------------------------------------------------------
tbais_feed_signal:
    push rbx
    push r12
    mov  rbx, rdi           ; session ptr
    mov  r12, rsi           ; signal index

    ; bounds check signal
    cmp  r12, NUM_SIGNALS
    jge  .set_anomalous

    ; Turing HALT condition: IP absent signal = undecidable origin → immediate reject
    cmp  r12, SIG_IP_ABSENT
    je   .turing_halt

    ; get current state
    movzx rax, byte [rbx + SESSION_state]
    cmp  rax, Q_ANOMALOUS
    je   .already_terminal
    cmp  rax, Q_TRUSTED
    je   .already_terminal

    ; bounds check state
    cmp  rax, NUM_STATES
    jge  .set_anomalous

    ; compute delta table index: state * NUM_SIGNALS + signal
    imul rax, NUM_SIGNALS
    add  rax, r12
    lea  rcx, [rel delta]
    movzx rax, byte [rcx + rax]   ; next state

    ; store new state
    mov  byte [rbx + SESSION_state], al

    ; update signal_count[signal_index] for entropy
    movzx rcx, byte [rbx + SESSION_signal_counts + r12]
    cmp  rcx, 255
    je   .skip_count
    inc  rcx
    mov  byte [rbx + SESSION_signal_counts + r12], cl
.skip_count:

    ; update signal validity flags based on signal
    cmp  r12, SIG_IP_PRESENT
    jne  .chk_fp
    mov  byte [rbx + SESSION_ip_ok], 1
    jmp  .done
.chk_fp:
    cmp  r12, SIG_FP_MATCH
    jne  .chk_beh
    mov  byte [rbx + SESSION_fp_ok], 1
    jmp  .done
.chk_beh:
    cmp  r12, SIG_BEH_NORMAL
    jne  .chk_time
    mov  byte [rbx + SESSION_beh_ok], 1
    jmp  .done
.chk_time:
    cmp  r12, SIG_TIME_VALID
    jne  .done
    mov  byte [rbx + SESSION_time_ok], 1
.done:
    movzx rax, byte [rbx + SESSION_state]
    jmp  .ret

.turing_halt:
    ; Alan Turing's Halting Condition:
    ; A session without an IP address is computationally UNDECIDABLE.
    ; The machine cannot resolve its origin → HALT in REJECT state.
    mov  byte [rbx + SESSION_state], Q_ANOMALOUS
    ; set anomaly flag bit 0 = NO_IP
    or   byte [rbx + SESSION_anomaly_flags], 0x01
    mov  rax, Q_ANOMALOUS
    jmp  .ret

.set_anomalous:
    mov  byte [rbx + SESSION_state], Q_ANOMALOUS
    mov  rax, Q_ANOMALOUS
    jmp  .ret

.already_terminal:
    movzx rax, byte [rbx + SESSION_state]

.ret:
    pop  r12
    pop  rbx
    ret

; --------------------------------------------------------
; tbais_compute_trust(rdi=session_ptr) → rax=T_c (0-100)
;
; T_c = 40·ip_ok + 30·fp_ok + 20·beh_ok + 10·time_ok
; Stores result in session.trust_score
; --------------------------------------------------------
tbais_compute_trust:
    push rbx
    mov  rbx, rdi
    xor  rax, rax

    movzx rcx, byte [rbx + SESSION_ip_ok]
    imul rcx, W_IP
    add  rax, rcx

    movzx rcx, byte [rbx + SESSION_fp_ok]
    imul rcx, W_FP
    add  rax, rcx

    movzx rcx, byte [rbx + SESSION_beh_ok]
    imul rcx, W_BEH
    add  rax, rcx

    movzx rcx, byte [rbx + SESSION_time_ok]
    imul rcx, W_TIME
    add  rax, rcx

    ; clamp to [0, 100]
    cmp  rax, 100
    jle  .store
    mov  rax, 100
.store:
    mov  byte [rbx + SESSION_trust], al
    pop  rbx
    ret

; --------------------------------------------------------
; tbais_compute_entropy(rdi=session_ptr) → rax=E×100 (approx)
;
; Shannon entropy approximation:
; Counts total signals, computes dominant fraction.
; If max_signal_count/total > 0.85 → low entropy (normal)
; Otherwise → high entropy → possible anomaly
;
; Returns E×100 stored in session.entropy_x100
; Crude but constant-time approximation without FPU.
; --------------------------------------------------------
tbais_compute_entropy:
    push rbx
    push r12
    push r13
    push r14
    mov  rbx, rdi

    ; sum all signal counts → total in r12
    xor  r12, r12
    ; max count → r13
    xor  r13, r13
    xor  r14, r14          ; loop counter
.sum_loop:
    cmp  r14, NUM_SIGNALS
    je   .sum_done
    movzx rax, byte [rbx + SESSION_signal_counts + r14]
    add  r12, rax
    cmp  rax, r13
    jle  .no_update_max
    mov  r13, rax
.no_update_max:
    inc  r14
    jmp  .sum_loop
.sum_done:
    ; if total == 0, entropy = 0
    test r12, r12
    jz   .zero_entropy

    ; P_max = r13 / r12  (scaled ×100 = 100*r13/r12)
    ; If P_max*100 >= 85 → low entropy (≈ 0.5 bits) → E×100 = 50
    ; Else              → high entropy               → E×100 = 400 (above threshold)
    mov  rax, r13
    imul rax, 100
    xor  rdx, rdx
    div  r12             ; rax = P_max×100

    cmp  rax, 85
    jge  .low_entropy
    ; high entropy: approximate to above ENTROPY_THRESH
    mov  rax, 400
    jmp  .store_e

.low_entropy:
    ; normal entropy range
    ; linear scale: E×100 ≈ 350 * (1 - P_max/100)
    ; simplified: 100 - rax (inverted probability as entropy proxy)
    mov  rcx, 100
    sub  rcx, rax
    imul rcx, 350
    xor  rdx, rdx
    mov  rax, rcx
    mov  rcx, 100
    div  rcx             ; rax = scaled entropy
    jmp  .store_e

.zero_entropy:
    xor  rax, rax

.store_e:
    mov  word [rbx + SESSION_entropy_x100], ax
    pop  r14
    pop  r13
    pop  r12
    pop  rbx
    ret

; --------------------------------------------------------
; tbais_print_session_state(rdi=session_ptr)
; Prints current FSM state name and trust score
; --------------------------------------------------------
tbais_print_session_state:
    push rbx
    mov  rbx, rdi

    ; print "  FSM     : "
    lea  rdi, [rel pfx]
    call write_str

    ; print state name
    movzx rax, byte [rbx + SESSION_state]
    cmp  rax, NUM_STATES
    jge  .clamp_state
    jmp  .print_name
.clamp_state:
    mov  rax, Q_ANOMALOUS
.print_name:
    lea  rcx, [rel state_names]
    mov  rdi, [rcx + rax*8]
    call write_str

    lea  rdi, [rel nl]
    call write_str

    ; print T_c
    lea  rdi, [rel tc_pfx]
    call write_str
    movzx rdi, byte [rbx + SESSION_trust]
    call write_uint
    lea  rdi, [rel tc_suf]
    call write_str

    ; print entropy
    lea  rdi, [rel ent_pfx]
    call write_str
    movzx rdi, word [rbx + SESSION_entropy_x100]
    call write_uint
    lea  rdi, [rel ent_suf]
    call write_str

    pop  rbx
    ret

; --------------------------------------------------------
; tbais_run_scenario(rdi=name_str, rsi=signals_ptr, rdx=sid)
; Feeds a sequence of signals through the DFA and prints
; each transition, then prints verdict.
; --------------------------------------------------------
tbais_run_scenario:
    push rbx
    push r12
    push r13
    push r14
    push r15

    mov  r12, rsi           ; signals array ptr
    mov  r13, rdx           ; session id
    mov  r15, rdi           ; name string

    ; separator
    lea  rdi, [rel sep]
    call write_str

    ; print scenario name
    mov  rdi, r15
    call write_str

    ; init session
    lea  rdi, [rel session_buf]
    mov  rsi, r13
    call tbais_init_session

    ; signal feed loop
.sig_loop:
    movzx r14, byte [r12]   ; read next signal
    cmp  r14, 0xFF
    je   .signals_done

    ; print signal name
    lea  rdi, [rel sig_pfx]
    call write_str
    lea  rcx, [rel signal_names]
    mov  rdi, [rcx + r14*8]
    call write_str
    lea  rdi, [rel arrow]
    call write_str

    ; feed signal to FSM
    lea  rdi, [rel session_buf]
    mov  rsi, r14
    call tbais_feed_signal

    ; print new state
    movzx rdi, byte [session_buf + SESSION_state]
    cmp  rdi, NUM_STATES
    jge  .skip_name
    lea  rcx, [rel state_names]
    mov  rdi, [rcx + rdi*8]
    call write_str
.skip_name:
    lea  rdi, [rel nl]
    call write_str

    inc  r12
    jmp  .sig_loop

.signals_done:
    ; compute trust and entropy after all signals
    lea  rdi, [rel session_buf]
    call tbais_compute_trust

    lea  rdi, [rel session_buf]
    call tbais_compute_entropy

    ; print final state summary
    lea  rdi, [rel session_buf]
    call tbais_print_session_state

    ; verdict
    movzx rax, byte [session_buf + SESSION_state]
    cmp  rax, Q_TRUSTED
    je   .accepted
    cmp  rax, Q_ANOMALOUS
    je   .halted

    ; intermediate warning
    movzx rax, byte [session_buf + SESSION_trust]
    cmp  rax, TC_ACCEPT
    jge  .no_warn
    lea  rdi, [rel warn_str]
    call write_str
.no_warn:
    jmp  .done

.halted:
    lea  rdi, [rel halt_str]
    call write_str
    jmp  .done

.accepted:
    lea  rdi, [rel accept_str]
    call write_str

.done:
    pop  r15
    pop  r14
    pop  r13
    pop  r12
    pop  rbx
    ret

; ============================================================
; _start — entry point
; ============================================================
_start:
    ; print header
    mov  rax, SYS_write
    mov  rdi, STDOUT
    lea  rsi, [rel hdr]
    mov  rdx, hdr_len - 1
    syscall

    ; iterate scenarios table
    lea  rbx, [rel scenarios]
    xor  r15, r15           ; scenario counter / session id
.scenario_loop:
    mov  rdi, [rbx]         ; name ptr
    test rdi, rdi
    jz   .done

    mov  rsi, [rbx + 8]     ; signals ptr
    mov  rdx, r15
    inc  rdx                ; 1-based session id

    call tbais_run_scenario

    add  rbx, 16            ; next scenario entry (2×qwords)
    inc  r15
    jmp  .scenario_loop

.done:
    ; exit(0)
    mov  rax, SYS_exit
    xor  rdi, rdi
    syscall
