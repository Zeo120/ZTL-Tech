# Hardware Orchestration & Physical Routing Architecture

## Overview
The PHASR Orchestrator (`router.js`) is designed to mathematically balance execution across multiple hardware targets based on the **Physical Mass** (size in KB/MB) of the target codebase. By strictly monitoring OS heap limitations (e.g. V8 Memory limits), the Engine dynamically bypasses high-level execution to prevent OS starvation.

## Dynamic Routing Thresholds

1. **Mass < 200KB (Node.js V8 Optimal Zone)**
   - Engine: `analyzer.js`
   - Purpose: Ideal for rapid execution on small codebases where the V8 boot overhead is negligible.
   
2. **Mass > 200KB (C++17 Native Bypass)**
   - Engine: `phasr_native.exe` (Windows) / `phasr_native` (Unix)
   - Purpose: Direct OS-level traversal bypassing V8 Heap Memory limitations.

3. **Mass > 200MB (Raw Assembly Extreme Overload)**
   - Engine: `phasr_asm.exe` (Windows) / `phasr_asm` (Unix)
   - Purpose: Drops directly to bare-metal CPU Instruction Caches, eliminating all OS abstraction overhead.

## Cross-Platform Silicon Traps
The Engine is mathematically mapped to detect the underlying kernel and architecture in real-time:
- **x86_64:** Triggers Intel NASM (`entropy.asm`) or GAS AT&T (`entropy.s`) arrays.
- **ARM64 / AArch64:** Triggers AAPCS64-compliant modules (`entropy_arm64.s`) for Apple Silicon and Raspberry Pi.
- **Z80 (Legacy 8-bit):** Experimental fallback for TI-84 architectures (`entropy_z80.asm`).
- **Android Termux:** Bionic libc bypass for mobile environments.
- **Cloud Shells:** Automatically intercepts AWS, GCP, and Azure cloud execution variables to compute Cloud Financial Costs (Pillar 4).

## Security as an Economic Equation
By dropping execution to the lowest possible hardware abstraction layer (Assembly/C++), PHASR mathematically guarantees that the **Compute Cost** of auditing the payload remains drastically lower than the economic payload value, satisfying the core UNIX security philosophy.
