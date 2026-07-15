# PHASR (DEVM) - Absolute Physics Engine
> "Security is an economic equation."

PHASR (Deterministic Engine for Vulnerability Management) is a modular, ultra-low-level Security Hypervisor and codebase scanner inspired by the fundamental architecture of UNIX, eBPF, TCP flow mechanics, and the Halting Problem. It doesn't just lint code—it mathematically calculates the physical mass and entropy of the system at the hardware level.

## 🏛️ The 4 Core Pillars

1. **Model:** A 6-module hardware physics engine capable of deep binary dissection, taint tracking, and mathematical entropy calculation.
2. **Orchestration:** A dynamic routing layer that load-balances execution between V8 (Node.js), C++17, and raw Assembly based on the physical mass of the target codebase.
3. **Inference:** A hyper-aesthetic, box-drawn terminal dashboard and persistent Markdown Security Report Generator.
4. **Economical Analysis:** Dynamic Cloud Shell (AWS/GCP/Azure) environment detection that simulates the physical compute cost of the security scan.

## ⚙️ Supported Hardware Architectures
PHASR is designed to execute on absolute bare metal. The Orchestrator automatically detects your physical OS and routes to the lowest-level execution context possible:

- **Windows:** Native C++17 (`phasr_native.exe`) & Intel NASM x86_64 (`entropy.asm`)
- **macOS / Linux (Arch/BlackArch):** C++17 ELF/Mach-O & GNU Assembler GAS AT&T (`entropy.s`)
- **Apple Silicon (M-Series) / Raspberry Pi / Linux Mobile:** AArch64 AAPCS64 ARM Assembly (`entropy_arm64.s`)
- **Inferno OS (Plan 9):** Limbo Dis Virtual Machine Bytecode (`entropy.b`)
- **Texas Instruments (TI-84):** 8-bit Zilog Z80 Assembly (`entropy_z80.asm`)
- **Android Termux:** Bionic libc bypass execution
- **Universal:** Node.js V8 Engine (Fallback)

## 📦 Installation & Usage

1. Clone the repository and install the Engine globally to your OS PATH:
```bash
npm install -g .
```

2. Point the PHASR weapon at any directory:
```bash
phasr .
```

The Orchestrator will instantly calculate the physical mass of the directory. If the mass exceeds safe OS heap limits (>200KB), it bypasses Node.js and routes directly to the Native C++ or raw Hardware Assembly modules to prevent system starvation. 

## ☢️ Active Physics Modules
- **Module 3 (Entropy Analyser):** Traverses the physical byte stream using raw L1 cache loads to calculate Base-2 Shannon Entropy, flagging highly obfuscated or packed payloads.
- **Module 4 (Security Math):** Semantic Regex Taint Flow tracking to catch unsanitized OS command injections.
- **Module 5 (Temporal Physics):** Analyzes crypto subroutines to mathematically verify constant-time execution, mitigating side-channel packet jitter.
- **Module 6 (Binary Dissection):** Dynamically disassembles compiled `.exe`/`.elf` payloads via `objdump` and parses the hexadecimal opcodes for malicious register injections.

## 🛡️ Remediation
Upon completion, the Inference Pillar automatically aggregates the mathematical anomalies and outputs a persistent `phasr_security_report.md` artifact in the current working directory.
