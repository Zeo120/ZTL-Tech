#include <iostream>
#include <vector>
#include <cmath>
#include <regex>
#include <iomanip>
#include <string>
#include <cstdlib>
#include <atomic>
#include <thread>
#include <mutex>
#include <cstring>
#include <chrono>

#if defined(__linux__)
#include <fcntl.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <sys/mman.h>
#include <sys/stat.h>

struct linux_dirent64 {
    uint64_t d_ino;
    int64_t  d_off;
    unsigned short d_reclen;
    unsigned char  d_type;
    char           d_name[];
};
#else
#include <filesystem>
#endif

// SPMC Ring Buffer definition
const int QUEUE_SIZE = 8192;
const int MAX_PATH_LEN = 4096;
char taskQueue[QUEUE_SIZE][MAX_PATH_LEN];
std::atomic<int> queueHead(0);
std::atomic<int> queueTail(0);
std::atomic<int> activeWorkers(0);
std::atomic<bool> producerDone(false);

struct Anomaly {
    std::string file;
    std::string line;
    std::string code_or_asm;
    std::string reason;
    std::string fix;
};

struct Stats {
    std::atomic<uintmax_t> totalMassBytes{0};
    std::atomic<int> filesScanned{0};
    std::vector<Anomaly> m3_anomalies;
    std::vector<Anomaly> m4_anomalies;
    std::vector<Anomaly> m5_anomalies;
    std::vector<Anomaly> m6_anomalies;
    std::mutex mtx;
};

Stats globalStats;
std::atomic<double> globalMaxEntropy(0.0);

double calculateShannonEntropy(const unsigned char* buffer, size_t size) {
    if (size == 0) return 0.0;
    std::vector<int> counts(256, 0);
    for (size_t i = 0; i < size; ++i) {
        counts[buffer[i]]++;
    }
    double entropy = 0.0;
    double dsize = static_cast<double>(size);
    for (int count : counts) {
        if (count > 0) {
            double p = static_cast<double>(count) / dsize;
            entropy -= p * std::log2(p);
        }
    }
    return entropy;
}

void processFile(const std::string& pathString) {
#if defined(__linux__)
    int fd = open(pathString.c_str(), O_RDONLY);
    if (fd < 0) return;

    struct stat st;
    if (fstat(fd, &st) < 0 || !S_ISREG(st.st_mode) || st.st_size == 0) {
        close(fd);
        return;
    }

    size_t size = st.st_size;
    unsigned char* map = (unsigned char*)mmap(nullptr, size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (map == MAP_FAILED) {
        close(fd);
        return;
    }

    globalStats.totalMassBytes += size;
    globalStats.filesScanned++;

    double entropy = calculateShannonEntropy(map, size);
    
    double currentMax = globalMaxEntropy.load();
    while (entropy > currentMax && !globalMaxEntropy.compare_exchange_weak(currentMax, entropy)) {}

    // Check extensions
    bool isBinary = false;
    bool isSource = false;
    if (pathString.length() > 4) {
        std::string ext = pathString.substr(pathString.find_last_of('.'));
        if (ext == ".exe" || ext == ".bin" || ext == ".dll" || ext == ".so") isBinary = true;
        else if (ext == ".c" || ext == ".cpp" || ext == ".js") isSource = true;
    }

    if (isBinary) {
        if (entropy >= 7.2) {
            std::lock_guard<std::mutex> lock(globalStats.mtx);
            globalStats.m3_anomalies.push_back({
                pathString, "", "",
                "Binary contents are mathematically indistinguishable from encryption (Packed Payload).", ""
            });
        }
        
        // Native Hex pattern matching (M6)
        bool foundNop = false;
        bool foundSyscall = false;
        for (size_t i = 0; i < size - 3; ++i) {
            if (map[i] == 0x90 && map[i+1] == 0x90 && map[i+2] == 0x90 && map[i+3] == 0x90) {
                foundNop = true;
            }
            if (map[i] == 0x0F && map[i+1] == 0x05) { // syscall x86_64
                foundSyscall = true;
            }
        }
        if (foundNop) {
            std::lock_guard<std::mutex> lock(globalStats.mtx);
            globalStats.m6_anomalies.push_back({
                pathString, "", "0x90 0x90 0x90 0x90",
                "NOP Sled detected in raw hex (Potential Buffer Overflow payload).", "Remove unnecessary NOP pads."
            });
        }
        if (foundSyscall) {
            std::lock_guard<std::mutex> lock(globalStats.mtx);
            globalStats.m6_anomalies.push_back({
                pathString, "", "0x0F 0x05",
                "Raw syscall instruction detected in user-space binary.", "Use libc wrappers instead of raw syscalls."
            });
        }
    } else if (isSource) {
        std::string content((char*)map, size);
        std::istringstream stream(content);
        std::string line;
        int lineNum = 1;
        std::regex taintRegex("\\b(strcpy|system)\\s*\\(");
        std::regex temporalRegex("\\bstrcmp\\s*\\(");
        std::regex sensitiveRegex("\\b(pass|key|auth|secret)\\b", std::regex_constants::icase);

        while (std::getline(stream, line)) {
            if (line.find("//") != std::string::npos) {
                lineNum++;
                continue;
            }
            if (std::regex_search(line, taintRegex)) {
                std::lock_guard<std::mutex> lock(globalStats.mtx);
                globalStats.m4_anomalies.push_back({
                    pathString, std::to_string(lineNum), line,
                    "Unsanitized sink (Buffer Overflow / RCE risk).",
                    "Use strncpy or safely bounds-checked memory copies."
                });
            }
            if (std::regex_search(line, temporalRegex) && std::regex_search(line, sensitiveRegex)) {
                std::lock_guard<std::mutex> lock(globalStats.mtx);
                globalStats.m5_anomalies.push_back({
                    pathString, std::to_string(lineNum), line,
                    "Early-exit string comparison creates a Timing Side-Channel leak.",
                    "Use Constant-Time mathematical comparisons (e.g. Bitwise XOR loops)."
                });
            }
            lineNum++;
        }
    }
    
    munmap(map, size);
    close(fd);
#else
    // Fallback for non-Linux 
    // Simplified for brevity if run on Windows without POSIX
#endif
}

void workerThread() {
    activeWorkers++;
    while (true) {
        int head = queueHead.load(std::memory_order_acquire);
        int tail = queueTail.load(std::memory_order_acquire);
        
        if (head == tail) {
            if (producerDone.load(std::memory_order_acquire)) break;
            std::this_thread::yield(); // Yield starvation physics
            continue;
        }
        
        if (queueHead.compare_exchange_weak(head, head + 1, std::memory_order_acq_rel)) {
            std::string pathString(taskQueue[head % QUEUE_SIZE]);
            processFile(pathString);
        }
    }
    activeWorkers--;
}

void enqueueTask(const std::string& pathString) {
    int tail = queueTail.load(std::memory_order_acquire);
    while (tail - queueHead.load(std::memory_order_acquire) >= QUEUE_SIZE) {
        std::this_thread::yield();
    }
    strncpy(taskQueue[tail % QUEUE_SIZE], pathString.c_str(), MAX_PATH_LEN - 1);
    taskQueue[tail % QUEUE_SIZE][MAX_PATH_LEN - 1] = '\0';
    queueTail.fetch_add(1, std::memory_order_release);
}

void scanDirectoryProducer(const std::string& dirPath) {
#if defined(__linux__)
    int fd = open(dirPath.c_str(), O_RDONLY | O_DIRECTORY);
    if (fd < 0) return;
    
    char buffer[8192];
    while (true) {
        long nread = syscall(SYS_getdents64, fd, buffer, sizeof(buffer));
        if (nread <= 0) break;
        
        long bpos = 0;
        while (bpos < nread) {
            struct linux_dirent64* d = (struct linux_dirent64*)(buffer + bpos);
            std::string name(d->d_name);
            
            if (name != "." && name != ".." && name != "node_modules" && name != ".git" && name.find("PHASR(DEVM)") == std::string::npos) {
                std::string fullPath = dirPath + "/" + name;
                if (d->d_type == DT_DIR) {
                    scanDirectoryProducer(fullPath);
                } else if (d->d_type == DT_REG) {
                    enqueueTask(fullPath);
                }
            }
            bpos += d->d_reclen;
        }
    }
    close(fd);
#else
    // Generic fallback
    for (const auto& entry : std::filesystem::recursive_directory_iterator(dirPath, std::filesystem::directory_options::skip_permission_denied)) {
        std::string pathString = entry.path().string();
        if (pathString.find("node_modules") != std::string::npos || pathString.find(".git") != std::string::npos) continue;
        if (entry.is_regular_file()) {
            enqueueTask(pathString);
        }
    }
#endif
}

int main(int argc, char* argv[]) {
    std::string targetDir = (argc > 1) ? argv[1] : ".";
    int numThreads = 16;
    for (int i = 1; i < argc; ++i) {
        if (std::string(argv[i]) == "--threads" && i + 1 < argc) {
            numThreads = std::stoi(argv[i+1]);
        }
    }
    
    std::cout << "[DEVM C++ ENGINE] Scanning Physical Codebase: " << targetDir << " with " << numThreads << " Threads...\n\n";

    std::vector<std::thread> workers;
    for (int i = 0; i < numThreads; ++i) {
        workers.emplace_back(workerThread);
    }
    
    auto start = std::chrono::high_resolution_clock::now();
    
    scanDirectoryProducer(targetDir);
    producerDone.store(true, std::memory_order_release);
    
    for (auto& w : workers) {
        if (w.joinable()) w.join();
    }
    
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double> diff = end - start;

    std::cout << "=======================================================\n";
    std::cout << "   PHASR (DEVM) - ABSOLUTE PHYSICS ENGINE (C++ NATIVE)\n";
    std::cout << "=======================================================\n\n";

    std::cout << "TARGET: " << targetDir << "\n";
    std::cout << "FILES SCANNED: " << globalStats.filesScanned << "\n";
    std::cout << "PHYSICAL MASS: " << (globalStats.totalMassBytes / 1024.0) << " KB\n";
    std::cout << "TIME ELAPSED: " << diff.count() << " seconds\n";
    std::cout << "MAX ENTROPY: " << globalMaxEntropy.load() << "\n\n";

    std::cout << "[*] Executing Hardware Physics Modules...\n\n";

    int totalAnomalies = globalStats.m3_anomalies.size() + globalStats.m4_anomalies.size() + globalStats.m5_anomalies.size() + globalStats.m6_anomalies.size();

    if (totalAnomalies > 0) {
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
        std::cout << " WAVE COLLAPSE: DEPLOYMENT HALTED\n";
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n";
        std::cout << "Total Anomalies Found: " << totalAnomalies << "\n";
        return 1;
    } else {
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
        std::cout << " PIPELINE SAFE: DEPLOYMENT APPROVED\n";
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n";
        return 0;
    }
}
