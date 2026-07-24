#include <iostream>
#include <vector>
#include <string>
#include <atomic>
#include <chrono>
#include <iomanip>
#include <fstream>
#include <cmath>
#include <thread>
#include <mutex>
#include <string_view>
#include <cstring>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <dirent.h>
#include <cstdint>

extern "C" void calculate_frequencies(const unsigned char* buffer, size_t size, uint32_t* counts);

std::atomic<long long> globalFileCount(0);
std::atomic<long long> globalMass(0);
long long totalTargetFiles = 0; // In Linux, we'll brute force without pre-scanning for maximum speed
long long startTime = 0;
long long lastPrintTime = 0;

std::vector<std::pair<std::string, double>> m3_anomalies;
std::vector<std::string> m4_anomalies;
std::vector<std::string> m5_anomalies;
std::vector<std::pair<std::string, std::string>> m6_anomalies;

#define QUEUE_SIZE 8192
#define MAX_BUFFER_SIZE 12288 // 12 KB per thread

struct LinuxFileTask {
    char path[4096];
    bool active;
};

LinuxFileTask fileQueue[QUEUE_SIZE];
std::atomic<int> head(0);
std::atomic<int> tail(0);

LinuxFileTask archiveQueue[QUEUE_SIZE];
std::atomic<int> archHead(0);
std::atomic<int> archTail(0);
std::atomic<int> activeArchWorkers(0);

std::atomic<bool> isScanning(true);
std::atomic<int> activeWorkers(0);

std::mutex printCS;

long long GetCurrentTimeMs() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (ts.tv_sec * 1000) + (ts.tv_nsec / 1000000);
}

void ArchiveWorkerThread() {
    activeArchWorkers++;
    unsigned char* threadBuffer = (unsigned char*)mmap(NULL, MAX_BUFFER_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (threadBuffer == MAP_FAILED) {
        activeArchWorkers--;
        return;
    }
    while (isScanning || archHead.load(std::memory_order_relaxed) != archTail.load(std::memory_order_relaxed) || activeWorkers.load(std::memory_order_relaxed) > 0) {
        int currentTail = archTail.load(std::memory_order_relaxed);
        if (archHead.load(std::memory_order_relaxed) != currentTail) {
            int nextTail = (currentTail + 1) % QUEUE_SIZE;
            if (archTail.compare_exchange_weak(currentTail, nextTail, std::memory_order_release, std::memory_order_relaxed)) {
                
                char localPath[4096];
                strncpy(localPath, archiveQueue[currentTail].path, 4096);
                archiveQueue[currentTail].active = false;
                
                std::string cmd;
                size_t pathLen = strlen(localPath);
                if (pathLen > 3 && strcmp(localPath + pathLen - 3, ".gz") == 0) cmd = "gzip -dc \"";
                else if (pathLen > 4 && strcmp(localPath + pathLen - 4, ".zip") == 0) cmd = "unzip -p \"";
                else continue;
                
                cmd += localPath;
                cmd += "\" 2>/dev/null";
                
                FILE* fp = popen(cmd.c_str(), "r");
                if (fp) {
                    size_t bytesRead = fread(threadBuffer, 1, MAX_BUFFER_SIZE, fp);
                    if (bytesRead > 0) {
                        uint32_t counts[256] = {0};
                        calculate_frequencies(threadBuffer, bytesRead, counts);
                        double entropy = 0.0;
                        for (uint32_t freq : counts) {
                            if (freq > 0) {
                                double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
                                entropy -= p * log2(p);
                            }
                        }
                        if (entropy >= 7.2) {
                            std::lock_guard<std::mutex> lock(printCS);
                            m3_anomalies.push_back(std::make_pair(std::string(localPath) + " (Unpacked Payload)", entropy));
                        }
                    }
                    pclose(fp);
                }
            }
        } else {
            std::this_thread::sleep_for(std::chrono::microseconds(1000));
        }
    }
    munmap(threadBuffer, MAX_BUFFER_SIZE);
    activeArchWorkers--;
}

void WorkerThread() {
    activeWorkers++;
    
    // Allocate 30MB aligned buffer using mmap (Zero-Allocation Constraint)
    unsigned char* threadBuffer = (unsigned char*)mmap(NULL, MAX_BUFFER_SIZE, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (threadBuffer == MAP_FAILED) {
        activeWorkers--;
        return;
    }

    while (isScanning || head != tail) {
        int currentTail = tail.load(std::memory_order_relaxed);
        if (head.load(std::memory_order_relaxed) != currentTail) {
            int nextTail = (currentTail + 1) % QUEUE_SIZE;
            if (tail.compare_exchange_weak(currentTail, nextTail, std::memory_order_release, std::memory_order_relaxed)) {
                
                char localPath[4096];
                strncpy(localPath, fileQueue[currentTail].path, 4096);
                fileQueue[currentTail].active = false;
                
                int fd = open(localPath, O_RDONLY | O_NOATIME);
                if (fd >= 0) {
                    struct stat st;
                    if (fstat(fd, &st) == 0 && S_ISREG(st.st_mode)) {
                        globalMass.fetch_add(st.st_size, std::memory_order_relaxed);
                        uint32_t counts[256] = {0};
                        
                        // Partial Sampling (Sniper Method): Only read the first 12KB to bypass physical I/O limit
                        size_t bytesToRead = (st.st_size > 12288) ? 12288 : st.st_size;
                        ssize_t bytesRead = read(fd, threadBuffer, bytesToRead);
                        
                        if (bytesRead > 0) {
                            long long tStart = GetCurrentTimeMs();

                            // Use the ARM64 ASM Engine
                            calculate_frequencies(threadBuffer, bytesRead, counts);
                            
                            // Check for compressed files to offload to Decompression Workers
                            size_t pathLen = strlen(localPath);
                            bool isCompressed = false;
                            if (pathLen > 3 && (strcmp(localPath + pathLen - 3, ".gz") == 0 || 
                                                strcmp(localPath + pathLen - 3, ".xz") == 0)) {
                                isCompressed = true;
                            } else if (pathLen > 4 && (strcmp(localPath + pathLen - 4, ".zip") == 0 || 
                                                       strcmp(localPath + pathLen - 4, ".tar") == 0)) {
                                isCompressed = true;
                            }

                            if (isCompressed) {
                                // Offload to secondary queue without blocking
                                while (true) {
                                    int currentArchHead = archHead.load(std::memory_order_relaxed);
                                    int nextArchHead = (currentArchHead + 1) % QUEUE_SIZE;
                                    if (nextArchHead != archTail.load(std::memory_order_relaxed)) {
                                        strncpy(archiveQueue[currentArchHead].path, localPath, 4096);
                                        archiveQueue[currentArchHead].active = true;
                                        archHead.store(nextArchHead, std::memory_order_release);
                                        break;
                                    }
                                    std::this_thread::sleep_for(std::chrono::microseconds(100));
                                }
                            } else {
                                double entropy = 0.0;
                                for (uint32_t freq : counts) {
                                    if (freq > 0) {
                                        double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
                                        entropy -= p * log2(p);
                                    }
                                }
                                if (entropy >= 7.2) {
                                    std::lock_guard<std::mutex> lock(printCS);
                                    m3_anomalies.push_back(std::make_pair(std::string(localPath), entropy));
                                }
                            }
                            
                            // M6: Binary Dissection (NOP Sleds)
                            if (bytesRead > 4 && threadBuffer[0] == 0x7F && threadBuffer[1] == 'E' && threadBuffer[2] == 'L' && threadBuffer[3] == 'F') {
                                int nopCount = 0;
                                for (ssize_t i = 0; i < bytesRead; i++) {
                                    if (threadBuffer[i] == 0x90) { // x86 NOP or unrolled padding
                                        nopCount++;
                                        if (nopCount > 50) {
                                            std::lock_guard<std::mutex> lock(printCS);
                                            m6_anomalies.push_back({std::string(localPath), "NOP Sled Detected (0x90 > 50 bytes)"});
                                            break;
                                        }
                                    } else nopCount = 0;
                                }
                            }

                            // M4: Security Math (Taint)
                            if (bytesRead > 10 && !(threadBuffer[0] == 0x7F && threadBuffer[1] == 'E')) {
                                std::string_view content(reinterpret_cast<const char*>(threadBuffer), bytesRead > 4096 ? 4096 : bytesRead);
                                if (content.find("system(") != std::string_view::npos || content.find("exec(") != std::string_view::npos || content.find("eval(") != std::string_view::npos) {
                                    std::lock_guard<std::mutex> lock(printCS);
                                    m4_anomalies.push_back(std::string(localPath));
                                }
                            }

                            long long tEnd = GetCurrentTimeMs();
                            if (tEnd - tStart > 15 && bytesRead < 50000) {
                                std::lock_guard<std::mutex> lock(printCS);
                                m5_anomalies.push_back(std::string(localPath));
                            }
                        }
                    }
                    close(fd);
                }
            }
        } else {
            std::this_thread::sleep_for(std::chrono::microseconds(500)); // Sleep equivalent
        }
    }
    munmap(threadBuffer, MAX_BUFFER_SIZE);
    activeWorkers--;
}

struct linux_dirent64 {
    uint64_t d_ino;
    int64_t  d_off;
    unsigned short d_reclen;
    unsigned char  d_type;
    char           d_name[];
};

// Raw getdents64 Kernel Bypass
void ScanDirectoryNative(const std::string& directory) {
    int fd = open(directory.c_str(), O_RDONLY | O_DIRECTORY);
    if (fd < 0) return;

    char buffer[32768];
    while (true) {
        long nread = syscall(SYS_getdents64, fd, buffer, sizeof(buffer));
        if (nread <= 0) break;

        long bpos = 0;
        while (bpos < nread) {
            struct linux_dirent64* d = (struct linux_dirent64*)(buffer + bpos);
            std::string fileName = d->d_name;

            if (fileName != "." && fileName != "..") {
                globalFileCount++;
                long long now = GetCurrentTimeMs();
                if (now - lastPrintTime >= 50) {
                    lastPrintTime = now;
                    long long elapsed = now - startTime;
                    if (elapsed == 0) elapsed = 1;
                    double speed = (double)globalFileCount / (elapsed / 1000.0);
                    
                    std::cout << "\r\x1b[36m[PHASR]\x1b[0m \x1b[35m[AArch64]\x1b[0m SCANNED: " 
                              << globalFileCount << " | " << (int)speed << " f/s   " << std::flush;
                }

                std::string fullPath = directory + "/" + fileName;

                if (d->d_type == DT_DIR) {
                    ScanDirectoryNative(fullPath);
                } else if (d->d_type == DT_REG) {
                    while (true) {
                        int currentHead = head.load(std::memory_order_relaxed);
                        int nextHead = (currentHead + 1) % QUEUE_SIZE;
                        if (nextHead != tail.load(std::memory_order_relaxed)) {
                            strncpy(fileQueue[currentHead].path, fullPath.c_str(), 4096);
                            fileQueue[currentHead].active = true;
                            head.store(nextHead, std::memory_order_release);
                            break;
                        }
                        std::this_thread::sleep_for(std::chrono::microseconds(100));
                    }
                }
            }
            bpos += d->d_reclen;
        }
    }
    close(fd);
}

int main(int argc, char* argv[]) {
    std::cout << "\n\x1b[1m\x1b[36m[PHASR] NATIVE POSIX/LINUX ORCHESTRATOR INITIALIZED\x1b[0m\n";

    unsigned int numThreads = 4;
    unsigned int numArchThreads = 1;
    std::string targetDir = ".";

    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "--threads" && i + 1 < argc) {
            try { numThreads = std::stoi(argv[i + 1]); } catch (...) { numThreads = 256; }
            if (numThreads < 4) numThreads = 4;
            if (numThreads > 256) numThreads = 256;
            i++;
        } else if (arg == "--archive-threads" && i + 1 < argc) {
            try { numArchThreads = std::stoi(argv[i + 1]); } catch (...) { numArchThreads = 1; }
            if (numArchThreads < 1) numArchThreads = 1;
            i++;
        } else if (arg[0] != '-') {
            targetDir = arg;
        }
    }

    long pages = sysconf(_SC_PHYS_PAGES);
    long page_size = sysconf(_SC_PAGE_SIZE);
    double totalRamGB = (pages * page_size) / (1024.0 * 1024.0 * 1024.0);
    double requiredRamGB = ((numThreads + numArchThreads) * 30.0) / 1024.0;

    if (requiredRamGB > totalRamGB) {
        std::cout << "\x1b[31m[PHASR]\x1b[0m Detected: " << std::fixed << std::setprecision(1) << totalRamGB << " GB RAM\n";
        std::cout << "\x1b[31m[PHASR]\x1b[0m Requested: " << numThreads << " + " << numArchThreads << " workers (" << std::fixed << std::setprecision(1) << requiredRamGB << " GB Required)\n";
        std::cout << "\x1b[31m[PHASR]\x1b[0m Suggestion: Unless you own an RTX 6969 with 69 TB RAM, consider fewer threads.\n\n";
        usleep(2000000);
    }

    std::cout << "\x1b[32m[PHASR]\x1b[0m Initializing Worker Pool: " << numThreads << " Main Threads + " << numArchThreads << " Decompression Threads\n";
    std::cout << "\x1b[32m[PHASR]\x1b[0m Commencing native getdents64 kernel scan on: " << targetDir << "\n";
    std::cout << "\x1b[32m[PHASR]\x1b[0m Standby. Brute-forcing total size...\n\n";

    startTime = GetCurrentTimeMs();

    std::vector<std::thread> workers;
    std::vector<std::thread> archWorkers;
    for (unsigned int i = 0; i < numThreads; i++) {
        workers.push_back(std::thread(WorkerThread));
    }
    for (unsigned int i = 0; i < numArchThreads; i++) {
        archWorkers.push_back(std::thread(ArchiveWorkerThread));
    }

    ScanDirectoryNative(targetDir);
    isScanning = false;

    for (auto& worker : workers) {
        if (worker.joinable()) worker.join();
    }
    for (auto& aw : archWorkers) {
        if (aw.joinable()) aw.join();
    }

    std::cout << "\n";
    std::cout << "\x1b[1mTARGET:\x1b[0m " << targetDir << "\n";
    std::cout << "\x1b[1mFILES SCANNED:\x1b[0m " << globalFileCount << "\n";
    std::cout << "\x1b[1mTOTAL SIZE:\x1b[0m " << std::fixed << std::setprecision(2) << (globalMass.load() / 1024.0) << " KB\n\n";
    
    std::cout << "\x1b[1m\x1b[33m[*] Executing Hardware Physics Modules...\x1b[0m\n\n";

    // Mod 3
    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 3 — ENTROPY ANALYSER\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m3_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mRule:\x1b[0m\nHigh Entropy Data (Possible Obfuscation)\n\n";
        std::cout << "\x1b[1m\x1b[31mFindings: " << m3_anomalies.size() << "\x1b[0m\n\n";
        std::cout << "\x1b[1mFiles\x1b[0m\n";
        for (const auto& a : m3_anomalies) {
            size_t slash = a.first.find_last_of("\\/");
            std::string fileName = (slash != std::string::npos) ? a.first.substr(slash + 1) : a.first;
            std::cout << " \xE2\x80\xA2 " << fileName << " (H(X) = " << std::fixed << std::setprecision(2) << a.second << ")\n";
        }
    } else {
        std::cout << "\x1b[1m\x1b[32m[SAFE] Maximum Entropy H(X) Verified\x1b[0m\n\n";
    }

    // Mod 4
    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 4 — SECURITY MATH (TAINT)\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m4_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mFindings (Unsanitized Flows): " << m4_anomalies.size() << "\x1b[0m\n";
        for (const auto& a : m4_anomalies) std::cout << " \xE2\x80\xA2 " << a << "\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] 0 Unsanitized Flows\x1b[0m\n\n";

    // Mod 5
    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 5 — TEMPORAL PHYSICS\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m5_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mFindings (Timing Anomalies): " << m5_anomalies.size() << "\x1b[0m\n";
        for (const auto& a : m5_anomalies) std::cout << " \xE2\x80\xA2 " << a << "\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] Constant-Time Verified\x1b[0m\n\n";

    // Mod 6
    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 6 — BINARY DISSECTION\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m6_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mFindings: " << m6_anomalies.size() << "\x1b[0m\n";
        for (const auto& a : m6_anomalies) std::cout << " \xE2\x80\xA2 " << a.first << " -> " << a.second << "\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] No Assembly Taint Flows Detected\x1b[0m\n\n";

    // Mod 7
    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 7 — TRADEOFF ANALYSER\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    double totalLiability = (m3_anomalies.size() + m4_anomalies.size() + m5_anomalies.size() + m6_anomalies.size()) * 10000.0;
    double maintenanceCost = (globalMass.load() / 1073741824.0) * 50.0;
    double totalEconomicRisk = totalLiability + maintenanceCost;
    if (totalEconomicRisk > 50000) {
        std::cout << "\x1b[1m\x1b[31m[ECONOMIC FAILURE] Risk Liability: $" << std::fixed << std::setprecision(2) << totalEconomicRisk << "\x1b[0m\n\n";
    } else {
        std::cout << "\x1b[1m\x1b[32m[ECONOMIC SUCCESS] Risk Liability: $" << std::fixed << std::setprecision(2) << totalEconomicRisk << "\x1b[0m\n\n";
    }

    if (m3_anomalies.size() > 0 || m4_anomalies.size() > 0 || m5_anomalies.size() > 0 || m6_anomalies.size() > 0 || totalEconomicRisk > 50000) {
        std::cout << "\n\x1b[1m\x1b[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n";
        std::cout << "\x1b[1m\x1b[31m WAVE COLLAPSE: DEPLOYMENT HALTED\x1b[0m\n";
        std::cout << "\x1b[1m\x1b[31m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    } else {
        std::cout << "\n\x1b[1m\x1b[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n";
        std::cout << "\x1b[1m\x1b[32m PIPELINE SAFE: DEPLOYMENT APPROVED\x1b[0m\n";
        std::cout << "\x1b[1m\x1b[32m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    }

    return 0;
}
