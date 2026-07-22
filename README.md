# PHASR (Deterministic Engine for Vulnerability Management)

PHASR is a high-performance, modular security hypervisor and codebase scanner designed for extreme throughput. Built on native C++, POSIX, and Win32 APIs, it bypasses high-level Operating System Virtual File System (VFS) abstractions to achieve sustained parallel scanning speeds exceeding 200,000 files per second.

## Native C++ Architecture
The orchestration layer utilizes a lock-free, zero-allocation C++ hot loop that interfaces directly with kernel-level APIs.

### 1. Windows NT Kernel Bypass (`Engine.cpp`)
In Windows environments, PHASR bypasses standard directory traversal APIs (e.g., `FindFirstFile`). Instead, it leverages `DeviceIoControl` with `FSCTL_ENUM_USN_DATA` to parse the raw NTFS Master File Table (MFT) directly from the physical disk, enqueuing file handles into an 8192-capacity Lock-Free Single-Producer Multiple-Consumer (SPMC) Ring Buffer.

### 2. POSIX / Android ARM64 Bypass (`Engine_Linux.cpp`)
In Linux and Android environments, PHASR bypasses the Linux VFS using the raw `syscall(SYS_getdents64)` and utilizes `mmap` for zero-allocation memory alignment, ensuring maximum throughput on both ARM64 mobile and x86 server silicon.

### 3. Out-of-Band Decompression 
To prevent dynamic heap allocations from blocking the primary hot loop, compressed archives (`.zip`, `.gz`, `.tar`) are routed to a secondary SPMC queue. A dedicated `ArchiveWorkerThread` pool streams the decompressed payloads via POSIX `popen` directly into memory for analysis.

## Detection Pipeline

The engine executes the following analysis modules concurrently across up to 256 hardware threads:

- **Module 1 (Kernel Bypass):** Asynchronous file traversal via MFT (Windows) or `getdents64` (Linux).
- **Module 2 (VFS Shadow Analysis):** Compares physical disk sector allocation against logical file sizes to detect discrepancies indicative of hidden storage or Rootkits.
- **Module 3 (Entropy Analysis):** Traverses byte streams using hardware-specific Assembly to calculate Base-2 Shannon Entropy, identifying highly obfuscated, compressed, or packed payloads.
- **Module 4 (Static Taint Analysis):** Scans the first 4KB of uncompiled files using zero-allocation `std::string_view` to detect unsanitized `system()`, `exec()`, or `eval()` execution vectors.
- **Module 5 (Temporal Profiling):** Utilizes `GetTickCount` / `clock_gettime` to measure CPU cycle times per byte, identifying files attempting to stall the engine via timing side-channels.
- **Module 6 (Binary Dissection):** Dynamically parses executable headers (`MZ` or `ELF`) and scans raw opcodes to detect buffer overflow vectors, such as `0x90` NOP sleds.
- **Module 7 (Risk Assessment):** Evaluates the total systemic risk of detected anomalies against the physical size of the codebase to output a final deployment liability score.

## Compilation & Usage

PHASR includes an automated Node.js installation script (`install.js`) that performs pre-flight architecture checks and compiles the appropriate native binary (`engine.exe`, `phasr_x86`, or `phasr_arm64`).

### Installation
```bash
node install.js
npm install -g .
```

### Global Execution
Run the orchestrator using the CLI wrapper. You can explicitly allocate primary scanning threads and secondary decompression threads:
```bash
phasr . --threads 64 --archive-threads 4
```

## Reporting
Upon completion, the engine generates a persistent `phasr_security_report.md` artifact detailing the identified vulnerabilities and the final risk assessment state.
