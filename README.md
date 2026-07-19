# PHASR (DEVM) - Absolute Physics Engine
> "Security is an economic equation."

PHASR (Deterministic Engine for Vulnerability Management) is a modular, ultra-low-level Security Hypervisor and codebase scanner inspired by the fundamental architecture of UNIX, eBPF, TCP flow mechanics, and the Halting Problem. 

It does not rely on abstract software layers. Instead, it mathematically calculates the physical mass and entropy of the system at the hardware level, bypassing the operating system's Virtual File System (VFS) to achieve scan speeds exceeding **200,000 files per second**.

## The Native C++ Architecture
The entire orchestration layer has been rewritten into a lock-free, zero-allocation C++ hot loop that interfaces directly with the kernel.

### 1. Windows NT Kernel Bypass (`Engine.cpp`)
For Windows environments, PHASR completely ignores standard directory traversal APIs (like `FindFirstFile`). Instead, it uses `DeviceIoControl` with `FSCTL_ENUM_USN_DATA` to parse the raw NTFS **Master File Table (MFT)** directly from the physical disk, feeding file handles into an 8192-capacity Lock-Free Ring Buffer.

### 2. POSIX / Android Termux Bypass (`Engine_Linux.cpp`)
For Linux and Android (Termux) ARM64 environments, PHASR bypasses the Linux VFS using the raw `syscall(SYS_getdents64)` and utilizes `mmap` to achieve zero-allocation memory alignment, ensuring max throughput on mobile and server silicon.

## The 8-Module Wave Collapse Pipeline

The engine executes the following physics modules simultaneously across up to 256 hardware threads:

- **Module 1 (Kernel Bypass):** Feeds the orchestrator via raw MFT (Windows) or `getdents64` (Linux).
- **Module 2 (VFS Shadow Analysis):** Compares physical disk sector allocation against logical file mass to detect hidden Rootkits.
- **Module 3 (Entropy Analyser):** Traverses the byte stream using raw ASM to calculate Base-2 Shannon Entropy, flagging highly obfuscated or packed payloads (e.g., Encrypted Ransomware).
- **Module 4 (Security Math / Taint Tracker):** Scans the first 4KB of uncompiled files using zero-allocation `std::string_view` to detect unsanitized `system()`, `exec()`, or `eval()` injections.
- **Module 5 (Temporal Physics):** Uses hardware `GetTickCount` / `clock_gettime` to measure CPU cycle times per byte, instantly flagging any file that intentionally stalls the engine via timing side-channels.
- **Module 6 (Binary Dissection):** Dynamically parses executable headers (like `MZ` or `ELF`) and unrolls hexadecimal opcodes to detect malicious NOP sleds (`0x90` sequences) indicating buffer overflows.
- **Module 7 (Tradeoff Analyser):** Evaluates the total systemic risk of Modules 3-6 against the maintenance cost of the system (Physical Mass / GB) and determines if the economic liability of deploying the target architecture exceeds safety limits.
- **Module 8 (Deep Shadow Mapper):** The overarching systemic summary of hidden filesystem anomalies.

## Compilation & Usage

### Windows Setup (MinGW64)
Run the automated cross-platform installer to compile the engine, then install the CLI globally:
```bash
node install.js
npm install -g .
```
Run globally using the CLI wrapper:
```bash
phasr . --threads 64
```

### Linux / Android (Termux) Setup
Run the automated cross-platform installer to compile the POSIX Engine and ARM64 Assembly, then install the CLI globally:
```bash
node install.js
npm install -g .
```
Execute the CLI natively:
```bash
phasr . --threads 16
```

## Remediation
Upon completion, if the Economic Liability exceeds deployment thresholds, the engine triggers a **WAVE COLLAPSE** and halts deployment. It automatically outputs a persistent `phasr_security_report.md` artifact detailing the physical anomalies found.
