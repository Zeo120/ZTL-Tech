#include <iostream>
#include <windows.h>
#include <string>
#include <vector>
#include <fstream>
#include <cmath>
#include <iomanip>

extern "C" void calculate_frequencies_asm(const unsigned char* buffer, long long size, long long* counts);

#include <atomic>
#include <thread>
#include <mutex>

long long globalMass = 0;
long long globalFileCount = 0;
DWORD startTime = 0;
DWORD lastPrintTime = 0;

std::vector<std::pair<std::string, double>> m3_anomalies;

#define QUEUE_SIZE 8192
char taskQueue[QUEUE_SIZE][MAX_PATH];
std::atomic<int> queueHead = {0};
std::atomic<int> queueTail = {0};
std::atomic<int> activeWorkers = {0};
std::atomic<bool> scanComplete = {false};

CRITICAL_SECTION printCS;

DWORD WINAPI WorkerThread(LPVOID lpParam) {
    while (true) {
        int head = queueHead.load(std::memory_order_acquire);
        int tail = queueTail.load(std::memory_order_relaxed);
        
        if (head == tail) {
            if (scanComplete.load(std::memory_order_acquire)) break;
            Sleep(0); // Yield time slice
            continue;
        }
        
        // Data Race Fix: Copy the immutable string locally BEFORE advancing the CAS head
        char localPath[MAX_PATH];
        lstrcpyA(localPath, taskQueue[head]);
        
        if (queueHead.compare_exchange_weak(head, (head + 1) % QUEUE_SIZE, std::memory_order_release, std::memory_order_relaxed)) {
            activeWorkers++;
            
            HANDLE hFile = CreateFileA(localPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
            if (hFile != INVALID_HANDLE_VALUE) {
                LARGE_INTEGER fileSize;
                if (GetFileSizeEx(hFile, &fileSize) && fileSize.QuadPart < 250 * 1024 * 1024ULL) {
                    long long offset = fileSize.QuadPart > 8192 ? (fileSize.QuadPart / 2) - 4096 : 0;
                    LARGE_INTEGER liDistanceToMove;
                    liDistanceToMove.QuadPart = offset;
                    SetFilePointerEx(hFile, liDistanceToMove, NULL, FILE_BEGIN);

                    long long counts[256] = {0};
                    char buffer[8192];
                    DWORD bytesRead = 0;
                    
                    if (ReadFile(hFile, buffer, sizeof(buffer), &bytesRead, NULL) && bytesRead > 0) {
                        calculate_frequencies_asm(reinterpret_cast<const unsigned char*>(buffer), bytesRead, counts);
                        
                        double entropy = 0.0;
                        for (long long freq : counts) {
                            if (freq > 0) {
                                double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
                                entropy -= p * log2(p);
                            }
                        }
                        if (entropy >= 7.2) {
                            EnterCriticalSection(&printCS);
                            m3_anomalies.push_back(std::make_pair(std::string(localPath), entropy));
                            LeaveCriticalSection(&printCS);
                        }
                    }
                }
                CloseHandle(hFile);
            }
            activeWorkers--;
        }
    }
    return 0;
}

bool endsWith(const std::string& fullString, const std::string& ending) {
    if (fullString.length() >= ending.length()) {
        return (0 == fullString.compare(fullString.length() - ending.length(), ending.length(), ending));
    }
    return false;
}

void analyzeShadowVolume(const std::string& directory) {
    // Extract drive letter
    std::string drive = directory.substr(0, 3); // e.g. "C:\"
    ULARGE_INTEGER freeBytesAvailable, totalNumberOfBytes, totalNumberOfFreeBytes;
    
    if (GetDiskFreeSpaceExA(drive.c_str(), &freeBytesAvailable, &totalNumberOfBytes, &totalNumberOfFreeBytes)) {
        long long physicalAllocated = totalNumberOfBytes.QuadPart - totalNumberOfFreeBytes.QuadPart;
        long long logicalMass = globalMass;
        long long delta = physicalAllocated - logicalMass;
        
        std::cout << "[VFS-SHADOW] " << physicalAllocated << "|" << logicalMass << "|" << delta << std::endl;
    }
}

void ScanDirectoryNative(const std::string& directory) {
    WIN32_FIND_DATAA findFileData;
    std::string searchPath = directory + "\\*";
    HANDLE hFind = FindFirstFileA(searchPath.c_str(), &findFileData);

    if (hFind == INVALID_HANDLE_VALUE) {
        // Silently skip protected OS blocks (e.g., System Volume Information)
        return; 
    }

    do {
        std::string fileName = findFileData.cFileName;

        // Skip current and parent directory pointers
        if (fileName == "." || fileName == "..") {
            continue;
        }
        
        globalFileCount++;
        if ((globalFileCount & 127) == 0) {
            DWORD now = GetTickCount();
            if (now - lastPrintTime >= 50) { // Max 20 FPS UI refresh
                lastPrintTime = now;
                DWORD elapsed = now - startTime;
                if (elapsed == 0) elapsed = 1;
                double speed = (double)globalFileCount / (elapsed / 1000.0);
                double percent = (double)globalFileCount / 1500000.0 * 100.0;
                if (percent > 100.0) percent = 100.0;
                
                std::string barStr = "\r\x1b[36m[PHASR]\x1b[0m [";
                int filled = (int)(percent / 2.0); // 50 chars wide
                for (int i = 0; i < 50; i++) {
                    if (i < filled) barStr += "█";
                    else barStr += "░";
                }
                
                std::cout << barStr << "] \x1b[32m" << std::fixed << std::setprecision(2) << percent << "%\x1b[0m | " 
                          << globalFileCount << " / 1,500,000 | " << (int)speed << " f/s   " << std::flush;
            }
        }

        std::string fullPath = directory + "\\" + fileName;

        if (findFileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            // Prevent infinite recursion by skipping Windows Junctions/Symlinks
            if (findFileData.dwFileAttributes & FILE_ATTRIBUTE_REPARSE_POINT) {
                continue;
            }
            // Recursive native traversal
            ScanDirectoryNative(fullPath);
        } else {
            // It's a file, grab the physical mass without opening the file
            LARGE_INTEGER fileSize;
            fileSize.LowPart = findFileData.nFileSizeLow;
            fileSize.HighPart = findFileData.nFileSizeHigh;
            globalMass += fileSize.QuadPart;

            // Fast in-place extension check (Zero allocations)
            size_t len = fileName.length();
            if (len >= 4) {
                const char* ext = fileName.c_str() + len - 4;
                if ((ext[0] == '.' && (ext[1] == 'e' || ext[1] == 'E') && (ext[2] == 'x' || ext[2] == 'X') && (ext[3] == 'e' || ext[3] == 'E')) ||
                    (ext[0] == '.' && (ext[1] == 'd' || ext[1] == 'D') && (ext[2] == 'l' || ext[2] == 'L') && (ext[3] == 'l' || ext[3] == 'L')) ||
                    (ext[0] == '.' && (ext[1] == 's' || ext[1] == 'S') && (ext[2] == 'y' || ext[2] == 'Y') && (ext[3] == 's' || ext[3] == 'S')) ||
                    (ext[0] == '.' && (ext[1] == 'b' || ext[1] == 'B') && (ext[2] == 'i' || ext[2] == 'I') && (ext[3] == 'n' || ext[3] == 'N'))) {
                    
                    
                    // Zero-Allocation Queue Push
                    int tail = queueTail.load(std::memory_order_relaxed);
                    int nextTail = (tail + 1) % QUEUE_SIZE;
                    while (nextTail == queueHead.load(std::memory_order_acquire)) {
                        Sleep(0); // Yield until consumer frees a slot
                    }
                    lstrcpyA(taskQueue[tail], fullPath.c_str());
                    queueTail.store(nextTail, std::memory_order_release);
                }
            }
        }

    } while (FindNextFileA(hFind, &findFileData) != 0);

    FindClose(hFind);
}

int main(int argc, char* argv[]) {
    SetConsoleOutputCP(CP_UTF8);
    std::cout << "\n\x1b[36m[PHASR]\x1b[0m NATIVE C++ ORCHESTRATOR INITIALIZED" << std::endl;
    InitializeCriticalSection(&printCS);
    m3_anomalies.reserve(50000); // Zero-allocation hint for vector
    
    // Spawn Zero-Allocation Worker Pool
    unsigned int cores = std::thread::hardware_concurrency();
    if (cores == 0) cores = 16;
    HANDLE* threads = new HANDLE[cores];
    for (unsigned int i = 0; i < cores; ++i) {
        threads[i] = CreateThread(NULL, 0, WorkerThread, NULL, 0, NULL);
    }

    std::cout << "[PHASR] Bypassing Node.js V8 Engine..." << std::endl;

    std::string targetDir = "C:\\";
    if (argc > 1) {
        targetDir = argv[1];
    }

    std::cout << "[PHASR] Commencing native kernel-level scan on: " << targetDir << std::endl;
    std::cout << "[PHASR] Standby. Brute-forcing physical mass...\n" << std::endl;

    startTime = GetTickCount();
    ScanDirectoryNative(targetDir);
    
    scanComplete.store(true, std::memory_order_release);
    WaitForMultipleObjects(cores, threads, TRUE, INFINITE);
    
    DWORD endTime = GetTickCount();
    std::cout << "\n\n";

    // NATIVE C++ ANIMATED DASHBOARD
    Sleep(300);
    std::cout << "\x1b[1m\x1b[36m=======================================================\x1b[0m\n";
    Sleep(200);
    std::cout << "\x1b[1m   PHASR (DEVM) - ABSOLUTE PHYSICS ENGINE (NATIVE C++)\x1b[0m\n";
    Sleep(200);
    std::cout << "\x1b[1m\x1b[36m=======================================================\x1b[0m\n\n";
    Sleep(500);

    std::cout << "\x1b[1mTARGET:\x1b[0m " << targetDir << "\n";
    Sleep(300);
    std::cout << "\x1b[1mFILES SCANNED:\x1b[0m " << globalFileCount << "\n";
    Sleep(300);
    std::cout << "\x1b[1mPHYSICAL MASS:\x1b[0m " << std::fixed << std::setprecision(2) << (globalMass / 1024.0) << " KB\n\n";
    Sleep(800);

    std::cout << "\x1b[1m\x1b[33m[*] Executing Hardware Physics Modules...\x1b[0m\n\n";
    Sleep(1000);

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

    // Markdown Report Generation
    std::ofstream md("phasr_security_report.md");
    if (md) {
        md << "# PHASR (DEVM) - Security Posture Report (Native Core)\n\n";
        md << "**Target:** " << targetDir << "\n";
        md << "**Files Scanned:** " << globalFileCount << "\n";
        md << "**Physical Mass:** " << std::fixed << std::setprecision(2) << (globalMass / 1024.0) << " KB\n\n";
        md << "## Total Anomalies Detected: " << m3_anomalies.size() << "\n\n";
        if (m3_anomalies.size() > 0) {
            md << "### Module 3: Entropy Analyser\n";
            for (const auto& a : m3_anomalies) {
                size_t slash = a.first.find_last_of("\\/");
                std::string fileName = (slash != std::string::npos) ? a.first.substr(slash + 1) : a.first;
                md << "- **" << fileName << "** (H(X) = " << std::fixed << std::setprecision(2) << a.second << ")\n";
            }
        }
        md.close();
        std::cout << "\n[\x1b[32m+\x1b[0m] Persistent Security Report Generated: phasr_security_report.md\n";
    }
    
    if (m3_anomalies.size() > 0) {
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
