# PHASR (Deterministic Engine for Vulnerability Management)

PHASR is a multi-threaded, asynchronous static analysis engine designed to evaluate file contents and binary structures at high throughput. It is implemented in C++ and interfaces with platform-specific APIs (POSIX and Win32) to reduce Virtual File System (VFS) overhead during directory traversal.

**Design Goal:** Achieve maximum sequential read throughput on NVMe SSDs by minimizing heap allocations, utilizing lock-free concurrent queues, and bypassing high-level standard library I/O abstractions where appropriate.

*(Note: Throughput claims are currently based on hot-cache memory traversals. A benchmark in an Android PRoot AArch64 environment utilizing 64 threads achieved a peak hot-loop throughput of ~2,588 files/sec across a 3,123-file codebase (total runtime 2.47s). Cold-cache SSD benchmarks are pending.)*

## Architecture Overview

The orchestration layer is designed around a Single-Producer, Multiple-Consumer (SPMC) concurrency model.

### 1. Directory Traversal
**Status: Prototype / Mocked**
Instead of utilizing standard `opendir`/`readdir` APIs, the engine *intends* to use OS-specific directory enumeration:
- **Windows (MFT):** The documentation claims MFT bypassing via `FSCTL_ENUM_USN_DATA`. In reality, the MFT logic is currently isolated in a benchmark script (`MftParser.cpp`), and the main engine still falls back to standard APIs and simplistic handles.
- **Linux:** Intends to utilize `syscall(SYS_getdents64)`, though fully integrated lock-free inode streaming is not yet realized.

### 2. Thread Synchronization (SPMC Queue)
File paths discovered during enumeration are enqueued into an 8192-capacity SPMC Ring Buffer.
- **Implementation Details:** The queue is managed via `std::atomic<int>` indices utilizing `compare_exchange_weak` (CAS) loops. 
- **Design Goal:** To avoid Mutex contention in the hot path. 
- **Implementation Details:** The CAS loop implements strict acquire-release semantics (`std::memory_order_acquire` on read, `std::memory_order_release` on update) to ensure memory visibility across cores. However, standard ABA prevention (e.g., hazard pointers or tagged indices) is currently lacking, presenting a theoretical data race if indices wrap exactly during a thread stall.

### 3. Memory Management
**Status: Partially Implemented / Synchronous I/O**
The worker thread pool attempts to avoid dynamic heap allocation in the hot path.
- **Implementation Reality:** Threads currently allocate much smaller (12KB) `VirtualAlloc` buffers rather than 30MB blocks. More critically, the engine does *not* currently use memory-mapped files (`mmap` / `CreateFileMapping`); it relies on standard, synchronous `ReadFile` I/O, meaning the "Zero-Allocation Heap Bypass" is merely a planned feature rather than the active data flow.

### 4. Out-of-Band Archive Decompression
**Status: Extreme Bottleneck**
To prevent decompression routines from stalling the primary I/O threads, compressed archives (`.zip`, `.gz`, `.tar`) are routed to a secondary SPMC queue.
- **Current Implementation:** A secondary `ArchiveWorkerThread` pool streams decompressed payloads via POSIX `popen` (`tar -xOf`). Because this spawns an entirely new hidden shell process per archive, it is highly insecure and creates massive OS `fork()`/`exec()` overhead. 
- **Future Work:** This *must* be replaced with statically linked `zlib`/`libarchive` to prevent PID exhaustion under heavy loads.

## Static Analysis Modules
**Status: Hardcoded Prototype**
While the documentation claims modules are loaded dynamically via `phasr.yaml`, they are currently hardcoded directly into the C++ `WorkerThread` loop. The engine executes checks across the worker thread pool. Note that anomaly recording is currently protected by a single Mutex (`printCS`), which breaks the lock-free architecture at scale.

The following checks are conceptually implemented or planned:

1. **Inode Discrepancy Check:** Compares reported sector sizes against logical file sizes.
2. **Entropy Calculation:** Calculates Base-2 Shannon Entropy over byte frequency arrays to identify packed or encrypted payloads.
3. **Static Taint Analysis:** Scans the first 4KB of uncompiled source files for potential execution vectors (e.g., `system()`).
4. **Execution Timing:** Measures CPU cycles spent per file (via `clock_gettime` or `GetTickCount`) to detect analysis-stalling payloads.
5. **Opcode Scanning:** Parses `MZ` and `ELF` headers and scans for contiguous `0x90` byte sequences (NOP sleds).
6. **Heuristic Risk Aggregation:** A final pass that scores anomalies against total codebase size to determine an overall deployment risk.

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
