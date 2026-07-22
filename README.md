# PHASR (Deterministic Engine for Vulnerability Management)

PHASR is a multi-threaded, asynchronous static analysis engine designed to evaluate file contents and binary structures at high throughput. It is implemented in C++ and interfaces with platform-specific APIs (POSIX and Win32) to reduce Virtual File System (VFS) overhead during directory traversal.

**Design Goal:** Achieve maximum sequential read throughput on NVMe SSDs by minimizing heap allocations, utilizing lock-free concurrent queues, and bypassing high-level standard library I/O abstractions where appropriate.

*(Note: Throughput claims of "200,000 files/sec" are currently implementation targets based on hot-cache memory traversals of small files. Cold-cache SSD benchmarks are pending.)*

## Architecture Overview

The orchestration layer is designed around a Single-Producer, Multiple-Consumer (SPMC) concurrency model.

### 1. Directory Traversal
Instead of utilizing `std::filesystem::directory_iterator` or standard `opendir`/`readdir` APIs, PHASR implements OS-specific directory enumeration:
- **Windows:** Utilizes `DeviceIoControl` with `FSCTL_ENUM_USN_DATA` to enumerate the NTFS Master File Table (MFT). The USN Journal returns raw MFT record data, including the filename and parent reference numbers. The Orchestrator reconstructs the absolute path by traversing the MFT hierarchy in memory before yielding the fully qualified path to the worker pool for a standard `CreateFileA` call.
- **Linux / Android (ARM64/x86):** Utilizes `syscall(SYS_getdents64)` to extract physical inode data from the kernel block layer directly into a statically sized buffer.

### 2. Thread Synchronization (SPMC Queue)
File paths discovered during enumeration are enqueued into an 8192-capacity SPMC Ring Buffer.
- **Implementation Details:** The queue is managed via `std::atomic<int>` indices utilizing `compare_exchange_weak` (CAS) loops. 
- **Design Goal:** To avoid Mutex contention in the hot path. 
- **Implementation Details:** The CAS loop implements strict acquire-release semantics (`std::memory_order_acquire` on read, `std::memory_order_release` on update) to ensure memory visibility across cores. However, standard ABA prevention (e.g., hazard pointers or tagged indices) is currently lacking, presenting a theoretical data race if indices wrap exactly during a thread stall.

### 3. Memory Management
The worker thread pool avoids dynamic heap allocation (`malloc`/`new`) to prevent allocator locking and heap fragmentation.
- **Implementation Details:** Each worker thread allocates a fixed 30MB memory block. Depending on the target OS, this is pinned via `VirtualAlloc` (Win32) or `mmap` (POSIX). Read operations load data into this buffer, and analysis modules process the data using C++17 `std::string_view`.
- **Implementation Constraints:** Files exceeding the fixed 30MB limit are currently hard-truncated during the mapping phase; the engine relies on the assumption that malicious payloads reside in the leading headers or trailing overlays. Additionally, the engine currently lacks `sigsetjmp` traps, meaning an external truncation event on an actively `mmap`'ed file will trigger an unhandled `SIGBUS` fault.

### 4. Out-of-Band Archive Decompression
To prevent decompression routines from stalling the primary I/O threads, compressed archives (`.zip`, `.gz`, `.tar`) are routed to a secondary SPMC queue.
- **Current Implementation:** A secondary `ArchiveWorkerThread` pool streams decompressed payloads into memory via POSIX `popen` (`gzip -dc` / `tar -xOf`). 
- **Future Work:** Replace `popen` with statically linked `zlib`/`libarchive` to eliminate OS `fork()`/`exec()` overhead and prevent PID exhaustion under heavy archive loads.

## Static Analysis Modules

The engine executes the following checks sequentially across the worker thread pool:

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
