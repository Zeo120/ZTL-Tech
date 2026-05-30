# Legions Consensus (Phase 5) — Redundancy & Consensus

This document details the mathematical equations, intent, tradeoffs, and assumptions behind the replication auditor in **Legions Consensus** (formerly Phase 5).

---

## 1. Penalised Replication-Lag Resilience Score

### Mathematical Formulation
Let:
*   $\text{PSync} \in \{0, 1\}$ be the primary sync state flag.
*   $L$ be the replication lag (in ms).
*   $T$ be the maximum allowed synchronization threshold (in ms).

$$D_R = \text{PSync} \cdot \left(1 - \frac{L}{T}\right)$$

### Security Intent
Monitors high-availability cluster health. If the primary node goes offline ($\text{PSync} = 0$) or the replication lag exceeds the limit ($L \geq T$), $D_R \leq 0$, which triggers standby promotion.

### Tradeoffs and Assumptions
*   **Tradeoff**: Rapid promotion can lead to split-brain scenarios if the original primary was briefly partitioned rather than dead.
*   **Assumption**: Nodes share a synchronized clock (via PTP/NTP) to calculate exact lag.

---

## 2. Incentives & Game-Theoretic Modeling of Admin Privileges

### Payoff Matrix
The expected payoff matrix for the Administrator and Protocol:

| Admin \ Protocol | Attest & Audit |
|:---|:---:|
| **Honest ($H$)** | $(R_A - C_C, \ V_S - C_{\text{Audit}})$ |
| **Malicious ($M$)** | $((1 - D_{\text{Total}})G_E - D_{\text{Total}}P_M, \ -V_{\text{Loss}})$ |

### Critical Attestation Threshold
$$D_{\text{critical}} = \frac{G_E - R_A + C_C}{G_E + P_M}$$

Nash Equilibrium guarantees honest behavior ($H$) only when:

$$D_{\text{Total}} \geq D_{\text{critical}}$$

### Security Intent
Aligns economic incentives of node operators and system admins. By linking the attestation score directly to the detection probability, we derive the critical threshold at which honest administration is utility-maximizing.

### Tradeoffs and Assumptions
*   **Tradeoff**: Depends on accurate estimates of abstract values (e.g. "exploitation gain" $G_E$).
*   **Assumption**: Admins are rational, utility-maximizing economic agents.
