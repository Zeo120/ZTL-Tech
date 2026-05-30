# TBAIS — Turing-Based Attacker Invalidation System Equations

This document details the complete mathematical formulation, design intent, tradeoffs, assumptions, and philosophical foundations behind the **TBAIS** — PHASR's deterministic session attestation engine built on Turing's Theory of Computation.

---

## 1. Turing Machine Definition — The 6-Tuple

### Formal Specification

$$M = (Q, \; \Sigma, \; \delta, \; q_0, \; F, \; R)$$

Where:
*   $Q = \{q_0, q_1, q_2, q_3, q_4, q_5, q_6, q_7, q_8, q_9\}$ — finite set of 10 states
*   $\Sigma = \{\sigma_0, \sigma_1, \sigma_2, \sigma_3, \sigma_4, \sigma_5, \sigma_6, \sigma_7, \sigma_8, \sigma_9\}$ — finite input alphabet of 10 session signals
*   $\delta : Q \times \Sigma \to Q$ — deterministic transition function (100-entry table)
*   $q_0 = Q\_\text{INITIATED}$ — initial state
*   $F = \{q_5\} = \{Q\_\text{TRUSTED}\}$ — accept state (session admitted)
*   $R = \{q_9\} = \{Q\_\text{ANOMALOUS}\}$ — reject state (Turing HALT — session invalidated)

### Security Intent
Every login session is modeled as a **decision problem**: given a finite tape of session signals, the machine must deterministically reach either $q_5$ (ACCEPT) or $q_9$ (REJECT). There is no ambiguity, no probabilistic branching, no retry. The attacker either satisfies every gate or the machine halts.

### Philosophy — Why Turing?
Turing's original insight was that any decision procedure can be reduced to a machine that reads symbols from a tape and transitions between states. TBAIS applies this directly: the login attempt IS the tape, the signals ARE the symbols, and the authentication verdict IS the halting state. If the tape is incomplete (e.g., no IP address), the machine encounters an **undecidable symbol** — it cannot proceed — and halts in the reject state. This is the computational analogue of the Halting Problem: *we cannot decide the trustworthiness of a session with missing inputs, therefore we must reject.*

### Tradeoffs and Assumptions
*   **Tradeoff**: The DFA is strictly deterministic — no fuzzy logic, no "almost valid" sessions. A session with 4/5 valid signals but one failure is rejected identically to a session with 0/5. This maximizes security at the cost of user friction.
*   **Assumption**: The signal alphabet $\Sigma$ is complete. Every security-relevant dimension of a login attempt is captured by exactly one of the 10 signals. If a new attack vector emerges outside $\Sigma$, the DFA cannot detect it until the alphabet is extended.

---

## 2. State Space — Q

### Enumeration

| State | Symbol | Value | Classification | Description |
|-------|--------|-------|----------------|-------------|
| $q_0$ | `Q_INITIATED` | 0 | Transient | Session created, no signals processed |
| $q_1$ | `Q_CREDENTIAL_RECV` | 1 | Transient | Valid credentials received |
| $q_2$ | `Q_IP_BOUND` | 2 | Transient | IP address bound to session |
| $q_3$ | `Q_FP_MATCH` | 3 | Transient | Device fingerprint verified |
| $q_4$ | `Q_BEHAVIORAL_PASS` | 4 | Transient | Behavioral entropy within bounds |
| $q_5$ | `Q_TRUSTED` | 5 | **Terminal (Accept)** | All signals verified — session admitted |
| $q_6$ | `Q_IP_ABSENT` | 6 | Trap → $q_9$ | IP signal missing — Turing HALT path |
| $q_7$ | `Q_FP_MISMATCH` | 7 | Trap → $q_9$ | Fingerprint unknown or spoofed |
| $q_8$ | `Q_ENTROPY_SPIKE` | 8 | Trap → $q_9$ | Behavioral entropy exceeds $\theta_E$ |
| $q_9$ | `Q_ANOMALOUS` | 9 | **Terminal (Reject)** | Machine HALTED — session invalidated |

### Security Intent
States $q_6$, $q_7$, $q_8$ are **diagnostic trap states** — they exist to classify the *reason* for rejection before the machine collapses to $q_9$. This allows the audit log to record *why* the machine halted, not merely *that* it halted.

### Tradeoffs and Assumptions
*   **Tradeoff**: States $q_6$–$q_8$ are absorbing (all transitions lead to $q_9$). They cannot recover. A more forgiving system might allow re-verification, but PHASR's philosophy is that any anomaly poisons the entire session.
*   **Assumption**: The state enumeration is ordered by verification priority: credentials → IP → fingerprint → behavior → time. This ordering is hardcoded. If a deployment requires fingerprint verification before IP binding, the entire DFA must be restructured.

---

## 3. Signal Alphabet — Σ

### Enumeration

| Signal | Symbol | Value | Polarity | Description |
|--------|--------|-------|----------|-------------|
| $\sigma_0$ | `SIG_CRED_VALID` | 0 | Positive | Credentials pass argon2 verification |
| $\sigma_1$ | `SIG_CRED_INVALID` | 1 | Negative | Credentials failed |
| $\sigma_2$ | `SIG_IP_PRESENT` | 2 | Positive | IP address present and resolvable |
| $\sigma_3$ | `SIG_IP_ABSENT` | 3 | **Undecidable** | IP address missing — origin unknown |
| $\sigma_4$ | `SIG_FP_MATCH` | 4 | Positive | Device fingerprint matches known profile |
| $\sigma_5$ | `SIG_FP_MISMATCH` | 5 | Negative | Unknown device / headless agent / curl / wget |
| $\sigma_6$ | `SIG_BEH_NORMAL` | 6 | Positive | Behavioral entropy $E < \theta_E$ |
| $\sigma_7$ | `SIG_BEH_SPIKE` | 7 | Negative | Entropy spike detected ($E \geq \theta_E$) |
| $\sigma_8$ | `SIG_TIME_VALID` | 8 | Positive | Login within expected temporal window |
| $\sigma_9$ | `SIG_TIME_INVALID` | 9 | Negative | Off-hours or temporally anomalous access |

### Philosophy — The Undecidable Signal
$\sigma_3$ (`SIG_IP_ABSENT`) is classified as **undecidable**, not merely negative. This is the Turing-theoretic core of TBAIS: a missing IP address means the machine *cannot determine* the origin of the request. It is not that the origin is "bad" — it is that the origin is *unknowable*. In Turing's framework, this is equivalent to a computation that never halts — the machine has no basis for a decision. PHASR resolves this by forcing a halt in the reject state.

### Tradeoffs and Assumptions
*   **Tradeoff**: The alphabet pairs signals into positive/negative duals (e.g., $\sigma_2$/$\sigma_3$). This binary classification loses granularity — a "partially known" IP (e.g., behind a CDN) is treated identically to a completely absent IP.
*   **Assumption**: Exactly one signal from each pair is fed per verification step. The DFA does not handle the case where both $\sigma_2$ AND $\sigma_3$ are fed simultaneously.

---

## 4. Transition Function — δ

### Complete Transition Table

$$\delta : Q \times \Sigma \to Q$$

$$\delta[q_i][\sigma_j] = \begin{cases}
q_1 & \text{if } i=0, \; j=0 \quad (\text{valid credentials received}) \\
q_2 & \text{if } i=1, \; j=2 \quad (\text{IP bound}) \\
q_6 & \text{if } i=1, \; j=3 \quad (\text{IP absent} \to \text{trap}) \\
q_3 & \text{if } i=2, \; j=4 \quad (\text{fingerprint match}) \\
q_7 & \text{if } i=2, \; j=5 \quad (\text{fingerprint mismatch} \to \text{trap}) \\
q_4 & \text{if } i=3, \; j=6 \quad (\text{behavior normal}) \\
q_8 & \text{if } i=3, \; j=7 \quad (\text{entropy spike} \to \text{trap}) \\
q_5 & \text{if } i=4, \; j=8 \quad (\text{time valid} \to \text{ACCEPT}) \\
q_9 & \text{otherwise} \quad (\text{default trap} \to \text{REJECT})
\end{cases}$$

### Assembly Representation
In the x86-64 implementation, $\delta$ is stored as a flat 100-byte array (`db` directives), indexed by:

$$\text{next\_state} = \delta[\text{state} \times 10 + \text{signal}]$$

```
; Row = state, Col = signal
;         cred  cred∅  ip   ip∅   fp   fp∅   beh  beh↑  time  time∅
db         1,    9,    9,    9,    9,    9,    9,    9,    9,    9   ; q0
db         9,    9,    2,    6,    9,    9,    9,    9,    9,    9   ; q1
db         9,    9,    9,    9,    3,    7,    9,    9,    9,    9   ; q2
db         9,    9,    9,    9,    9,    9,    4,    8,    9,    9   ; q3
db         9,    9,    9,    9,    9,    9,    9,    9,    5,    9   ; q4
db         9,    9,    9,    9,    9,    9,    9,    9,    9,    9   ; q5 (ACCEPT)
db         9,    9,    9,    9,    9,    9,    9,    9,    9,    9   ; q6 (trap)
db         9,    9,    9,    9,    9,    9,    9,    9,    9,    9   ; q7 (trap)
db         9,    9,    9,    9,    9,    9,    9,    9,    9,    9   ; q8 (trap)
db         9,    9,    9,    9,    9,    9,    9,    9,    9,    9   ; q9 (REJECT)
```

### Security Intent
The transition table is **maximally restrictive**: of 100 possible transitions, only 8 advance toward acceptance. The remaining 92 all collapse to $q_9$. This is a 92% rejection surface — any input sequence that deviates from the single valid path is immediately destroyed.

### Tradeoffs and Assumptions
*   **Tradeoff**: The valid path is linear ($q_0 \to q_1 \to q_2 \to q_3 \to q_4 \to q_5$). There are no parallel paths, no shortcuts, no alternative verification orderings. This makes the DFA trivially auditable but inflexible.
*   **Assumption**: The transition table is immutable at runtime. It is baked into the assembly binary and the JavaScript service identically. Any desynchronization between the x86-64 `delta` table and the Node.js `delta` object constitutes a **coherence violation**.

---

## 5. Trust Confidence Score — $T_c$

### Mathematical Formulation

$$T_c = w_{\text{ip}} \cdot s_{\text{ip}} + w_{\text{fp}} \cdot s_{\text{fp}} + w_{\text{beh}} \cdot s_{\text{beh}} + w_{\text{time}} \cdot s_{\text{time}}$$

Where each $s_k \in \{0, 1\}$ is a binary indicator and the weights are:

| Weight | Symbol | Value | Contribution |
|--------|--------|-------|--------------|
| $w_{\text{ip}}$ | `W_IP` | 40 | IP binding — 40% |
| $w_{\text{fp}}$ | `W_FP` | 30 | Device fingerprint — 30% |
| $w_{\text{beh}}$ | `W_BEH` | 20 | Behavioral entropy — 20% |
| $w_{\text{time}}$ | `W_TIME` | 10 | Temporal coherence — 10% |

$$T_c \in \{0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100\}$$

### Classification Thresholds

$$\text{verdict}(T_c) = \begin{cases}
\text{ACCEPT} & \text{if } T_c \geq \tau_A = 80 \\
\text{WARNING} & \text{if } \tau_W \leq T_c < \tau_A, \quad \tau_W = 60 \\
\text{REJECT} & \text{if } T_c < \tau_W
\end{cases}$$

### Security Intent
$T_c$ provides a **secondary confidence metric** independent of the DFA verdict. Even if the DFA reaches $q_5$ (ACCEPT), a low $T_c$ triggers an operator warning. This catches edge cases where the DFA path is technically valid but the overall session confidence is weak.

### Derivation of Weights
The weight hierarchy ($40 > 30 > 20 > 10$) reflects **attack surface area**:
*   **IP (40%)**: The single strongest indicator of origin authenticity. A missing IP renders the session fundamentally undecidable.
*   **Fingerprint (30%)**: Automated agents (curl, wget, headless browsers) are the most common attack tools. Catching them eliminates the largest class of scripted attacks.
*   **Behavior (20%)**: Entropy analysis catches sophisticated attackers who pass IP and fingerprint checks but exhibit non-human interaction patterns.
*   **Time (10%)**: Temporal anomalies are the weakest signal — legitimate operators may work irregular hours.

### Tradeoffs and Assumptions
*   **Tradeoff**: The weights are fixed constants, not learned. A machine learning approach could adapt weights to the specific deployment's threat landscape, but would sacrifice determinism and auditability.
*   **Assumption**: The four dimensions ($\text{ip}, \text{fp}, \text{beh}, \text{time}$) are statistically independent. In practice, a missing IP often correlates with a fingerprint mismatch (both common in proxied/scripted attacks), which means the effective information content of $T_c$ is lower than the theoretical maximum.

---

## 6. Shannon Entropy — Behavioral Signal

### Mathematical Formulation

$$E = -\sum_{i=0}^{|\Sigma|-1} p_i \cdot \log_2(p_i)$$

Where $p_i = \frac{c_i}{N}$ is the relative frequency of signal $\sigma_i$ in the observed signal stream, $c_i$ is the count of signal $\sigma_i$, and $N = \sum c_i$ is the total signal count.

### Anomaly Detection Rule

$$\text{behavioral\_verdict} = \begin{cases}
\sigma_6 \; (\text{SIG\_BEH\_NORMAL}) & \text{if } E < \theta_E \\
\sigma_7 \; (\text{SIG\_BEH\_SPIKE}) & \text{if } E \geq \theta_E
\end{cases}$$

With threshold $\theta_E = 3.50$ bits (stored as `ENTROPY_THRESH = 350` in fixed-point ×100).

### Assembly Implementation
In x86-64, entropy is approximated via signal-count variance since floating-point $\log_2$ is expensive in pure integer arithmetic:

$$E_{\text{approx}} = \frac{1}{N} \sum_{i=0}^{|\Sigma|-1} (c_i - \bar{c})^2, \quad \bar{c} = \frac{N}{|\Sigma|}$$

This variance metric is monotonically related to Shannon entropy for the uniform distribution case and avoids the need for `FPU` or `SSE` log instructions.

### Security Intent
A legitimate human operator produces a **low-entropy** signal stream: predictable, sequential, structured. An automated attacker or brute-force script produces a **high-entropy** stream: rapid, randomized, probing multiple signal combinations. The entropy threshold separates the two populations.

### Tradeoffs and Assumptions
*   **Tradeoff**: The variance approximation loses precision for highly skewed distributions. A session with one dominant signal type may be misclassified.
*   **Assumption**: The entropy threshold $\theta_E = 3.50$ bits assumes the signal alphabet is fully utilized. For the current $|\Sigma| = 10$, maximum entropy is $\log_2(10) \approx 3.32$ bits, meaning $\theta_E$ is actually **above** the theoretical maximum — effectively disabling entropy rejection in the current configuration. This is intentional: behavioral analysis is reserved for future multi-session correlation.

---

## 7. Kolmogorov Complexity Deviation — $D_K$

### Mathematical Formulation

$$D_K = \frac{|K(\text{session}) - K(\text{baseline})|}{K(\text{baseline})}$$

Where $K(x)$ is the Kolmogorov complexity of string $x$ — the length of the shortest program that produces $x$.

### Anomaly Detection Rule

$$D_K > \theta_K \implies \text{ANOMALOUS}$$

### Security Intent
While Shannon entropy measures randomness of the signal *distribution*, Kolmogorov complexity measures the *structural* complexity of the signal *sequence*. A session that produces signals in a highly compressible pattern (e.g., $\sigma_0, \sigma_2, \sigma_4, \sigma_6, \sigma_8$ — all even indices) has low $K$ and is likely legitimate. A session producing an incompressible random sequence has high $K$ and is likely generated by an attacker probing the state space.

### Tradeoffs and Assumptions
*   **Tradeoff**: Kolmogorov complexity is **uncomputable** in the general case (this is itself a consequence of the Halting Problem). In practice, $K$ is approximated by the compressed length of the signal sequence using a fixed compressor (e.g., LZ77 or zlib).
*   **Assumption**: The baseline complexity $K(\text{baseline})$ is pre-computed from a corpus of known-good login sessions and stored as a constant. If the legitimate user population changes behavior significantly, the baseline must be recalibrated.
*   **Philosophy**: This is the deepest Turing-theoretic connection in TBAIS. The fact that $K$ is uncomputable means we are using an *approximation* of an *uncomputable function* to detect attackers — fighting undecidability with undecidability.

---

## 8. The Halting Condition — Turing's Core Theorem

### Theorem (Turing, 1936)
There exists no general algorithm $H$ such that for all programs $P$ and inputs $I$:

$$H(P, I) = \begin{cases} 1 & \text{if } P(I) \text{ halts} \\ 0 & \text{if } P(I) \text{ does not halt} \end{cases}$$

### TBAIS Application
In TBAIS, the "program" is the DFA $M$ and the "input" is the signal tape $\sigma_0, \sigma_1, \ldots, \sigma_n$. The Halting Condition is triggered when:

$$\exists \; i \leq n : \sigma_i = \sigma_3 \; (\text{SIG\_IP\_ABSENT})$$

At this point, the machine encounters a signal for which no productive transition exists from the current state. The machine cannot:
1. Accept the session (the IP origin is unknown)
2. Continue processing (no valid transition)
3. Ask for more input (the DFA is one-pass)

Therefore, the only coherent action is to **halt** in $q_9$.

$$\sigma_3 \in \text{tape} \implies \delta^*(q_0, \text{tape}) = q_9$$

Where $\delta^*$ is the extended transition function applied over the full tape.

### Philosophy
This is not a bug or a limitation — it is the **design intent**. Turing proved that some problems are undecidable. PHASR applies this insight defensively: if the authentication problem is undecidable (because the input is incomplete), then the only safe answer is rejection. We do not guess. We do not approximate. We halt.

### Tradeoffs and Assumptions
*   **Tradeoff**: Legitimate users behind corporate proxies, VPNs, or Cloudflare Workers may have their IP stripped. These users will be rejected. PHASR accepts this false-positive cost in exchange for zero false-negatives on IP-absent attacks.
*   **Assumption**: The network infrastructure between client and server preserves IP headers faithfully. If a load balancer strips `X-Forwarded-For` without replacement, all sessions will trigger the Halting Condition.

---

## 9. Accept Path — The Unique Accepting Computation

### Valid Signal Tape

$$\tau_{\text{accept}} = (\sigma_0, \; \sigma_2, \; \sigma_4, \; \sigma_6, \; \sigma_8)$$

### State Trajectory

$$q_0 \xrightarrow{\sigma_0} q_1 \xrightarrow{\sigma_2} q_2 \xrightarrow{\sigma_4} q_3 \xrightarrow{\sigma_6} q_4 \xrightarrow{\sigma_8} q_5 \in F$$

### Trust Score at Accept

$$T_c(\tau_{\text{accept}}) = 40(1) + 30(1) + 20(1) + 10(1) = 100$$

### Security Intent
There is exactly **one** accepting path through the DFA. The probability of an attacker randomly guessing the correct 5-signal sequence is:

$$P(\text{random accept}) = \prod_{k=1}^{5} \frac{1}{|\Sigma|} = \frac{1}{10^5} = 10^{-5}$$

But since signals are not randomly chosen (they are derived from observable session properties), the actual security does not depend on this combinatorial argument — it depends on the attacker's ability to forge each signal individually.

---

## 10. Session Struct — Memory Layout

### C-equivalent Structure (16-byte aligned)

```c
typedef struct __attribute__((packed)) {
    uint8_t  state;            // offset 0   — current DFA state
    uint8_t  trust_score;      // offset 1   — T_c × 100
    uint8_t  ip_ok;            // offset 2   — 1 if IP present
    uint8_t  fp_ok;            // offset 3   — 1 if FP matched
    uint8_t  beh_ok;           // offset 4   — 1 if E < θ_E
    uint8_t  time_ok;          // offset 5   — 1 if temporal check passes
    uint8_t  anomaly_flags;    // offset 6   — bitmask: 1=no-ip, 2=no-fp, 4=entropy, 8=time
    uint8_t  _pad;             // offset 7   — alignment padding
    uint32_t session_id;       // offset 8   — unique session identifier
    uint16_t entropy_x100;     // offset 12  — E × 100 (fixed-point)
    uint8_t  signal_counts[10]; // offset 14 — frequency table for entropy
} session_t;                   // total: 24 bytes
```

### Anomaly Flags Bitmask

$$\text{anomaly\_flags} = \sum_{k \in \mathcal{A}} 2^k$$

| Bit | Value | Flag | Meaning |
|-----|-------|------|---------|
| 0 | `0x01` | `AF_NO_IP` | IP address absent |
| 1 | `0x02` | `AF_NO_FP` | Fingerprint mismatch |
| 2 | `0x04` | `AF_ENTROPY` | Entropy spike ($E \geq \theta_E$) |
| 3 | `0x08` | `AF_TIME` | Temporal anomaly |

### Security Intent
The anomaly flags bitmask encodes multiple simultaneous failure reasons into a single byte, enabling bitwise AND operations in assembly for fast multi-condition checks without branching.

---

## 11. Coherence Invariant — Assembly ↔ JavaScript

### Constraint
For all signal tapes $\tau$:

$$\delta^*_{\text{asm}}(q_0, \tau) = \delta^*_{\text{js}}(q_0, \tau)$$

The x86-64 assembly implementation (`tbais_x64.asm`), the ARM64 implementation (`tbais_arm64.s`), and the Node.js service (`tbais.service.js`) must produce **identical** state trajectories and trust scores for identical inputs. Any divergence constitutes a coherence violation and invalidates both implementations.

### Verification Method
Test scenarios are hardcoded identically across all three implementations:
1. **NORMAL LOGIN**: $(\sigma_0, \sigma_2, \sigma_4, \sigma_6, \sigma_8) \to q_5, \; T_c = 100$
2. **IP ABSENT**: $(\sigma_0, \sigma_3) \to q_9, \; T_c = 30$
3. **FP MISMATCH**: $(\sigma_0, \sigma_2, \sigma_5) \to q_9, \; T_c = 40$
4. **ENTROPY SPIKE**: $(\sigma_0, \sigma_2, \sigma_4, \sigma_7) \to q_9, \; T_c = 70$
5. **OFF-HOURS**: $(\sigma_0, \sigma_2, \sigma_4, \sigma_6, \sigma_9) \to q_9, \; T_c = 90$

---

## Constants Reference

| Constant | Symbol | Value | Source File |
|----------|--------|-------|-------------|
| Number of states | $|Q|$ | 10 | `tbais_x64.asm:48` |
| Number of signals | $|\Sigma|$ | 10 | `tbais_x64.asm:62` |
| IP weight | $w_{\text{ip}}$ | 40 | `tbais_x64.asm:65` |
| FP weight | $w_{\text{fp}}$ | 30 | `tbais_x64.asm:66` |
| Behavior weight | $w_{\text{beh}}$ | 20 | `tbais_x64.asm:67` |
| Time weight | $w_{\text{time}}$ | 10 | `tbais_x64.asm:68` |
| Accept threshold | $\tau_A$ | 80 | `tbais_x64.asm:69` |
| Warning threshold | $\tau_W$ | 60 | `tbais_x64.asm:70` |
| Entropy threshold | $\theta_E$ | 3.50 bits | `tbais_x64.asm:73` |
| Session struct size | — | 24 bytes | `tbais_x64.asm:98` |
| Transition table size | $|Q| \times |\Sigma|$ | 100 bytes | `tbais_x64.asm:105` |
