# Module 3: Shannon Entropy Physics

## Overview
Module 3 is the foundational security heuristic of the PHASR engine. It operates on the physical properties of data rather than signature matching. By analyzing the randomness of byte distributions in `.exe` and `.dll` payloads, PHASR can instantly identify packed, obfuscated, or encrypted malicious code at a hardware level.

## The Mathematical Foundation

The engine relies on **Shannon Entropy**, derived from information theory. For a given file $X$, the entropy $H(X)$ represents the minimum average number of bits required to encode each byte of the file.

The theoretical equation is defined as:

$$ H(X) = - \sum_{i=0}^{255} P(x_i) \log_2 P(x_i) $$

Where:
- $x_i$ represents each possible byte value ($0$ to $255$).
- $P(x_i)$ is the probability of byte $i$ occurring in the file.
- The result $H(X)$ is bounded between **0.0** (perfectly uniform, e.g., a file of all zeroes) and **8.0** (perfectly random/compressed data).

### In-Silicon Optimization

To calculate $H(X)$ at 60,000 files per second without stalling the L1 Cache, the floating-point logarithms are heavily optimized. 
Instead of calculating $P(x_i)$ dynamically and running the expensive `log2()` function for every iteration, PHASR builds a frequency array `counts[256]` in a single contiguous memory scan.

The equation transforms to:

$$ H(X) = \log_2(N) - \frac{1}{N} \sum_{i=0}^{255} C_i \log_2(C_i) $$

Where:
- $N$ is the total file size in bytes.
- $C_i$ is the exact frequency count of byte $i$.

### Security Thresholds

Based on physical analysis of Windows binaries:
- **Normal PE Executables**: $H(X) \approx 4.0 - 6.5$ (Lots of structural padding and zero bytes).
- **Packed / Obfuscated Malware**: $H(X) > 7.2$. (High density, randomized bits).

PHASR triggers a kernel anomaly flag anytime it measures an entropy curve exceeding **7.2**.
