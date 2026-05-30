# Primordial Sin — Boot-Time Attestation

This document details the mathematical equations, intent, tradeoffs, and assumptions behind the boot-time root of trust in **Primordial Sin**.

---

## 1. Boot-Time Attestation & Knuth Rolling Hash

### Memory Scanning
$$\text{Match}_i = \mathbf{1}\!\left[b_i = r_i\right] \quad \Rightarrow \quad \text{TotalMatches} = \sum_{i=0}^{4095} \text{Match}_i$$
$$H_i = \left((H_{i-1} \oplus b_i) \lll rot_i\right) + \text{0x9E3779B9ULL} \quad \text{where} \quad rot_i = (i \bmod 13) + 1$$

---

## 2. Shannon Entropy of Boot Memory

### Mathematical Formulation
$$H(X) = -\sum_{j=0}^{255} P(j) \log_2 P(j) \quad \text{where} \quad P(j) = \frac{c_j}{N}$$
$$D_{\text{Entropy}} = \mathbf{1}\!\left[H_{\text{min}} \leq H(X) \leq H_{\text{max}}\right]$$

---

## 3. Bayesian Boot-Trust Belief Propagation

### Posterior Probability
$$P(\text{Trust} \mid \mathbf{E}) = \frac{\pi_0 \prod_{k=1}^{n} t_k}{\pi_0 \prod_{k=1}^{n} t_k + (1 - \pi_0) \prod_{k=1}^{n} c_k}$$
$$D_{\text{Bayes}} = \mathbf{1}\!\left[P(\text{Trust} \mid \mathbf{E}) \geq P_{\text{threshold}}\right]$$

### Initial Wave Seed
$$\Phi_i^0 = \Phi_i^{-1} = A_0 \cdot \exp\left( - \frac{(i - x_c)^2}{2\sigma^2} \right) \cdot (1 - D_{\text{Initial}})$$

### Security Intent
Establishes the boot-time Root of Trust (RoT). Failure to verify the boot signature seeds a localized "primordial taint" wave packet into the FDTD simulation grid, propagating anomalies immediately upon startup.

### Tradeoffs and Assumptions
*   **Tradeoff**: Assumes a pre-calculated baseline signature exists and is correct. Any mismatch (even a safe configuration update) triggers a boot taint.
*   **Assumption**: The bootloader is protected by physical/hardware root-of-trust locks.
