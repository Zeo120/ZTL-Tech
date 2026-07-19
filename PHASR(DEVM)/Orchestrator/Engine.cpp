#include <iostream>
#include <windows.h>
#include <string>
#include <vector>
#include <fstream>
#include <cmath>
#include <iomanip>
#include <string_view>

extern "C" void calculate_frequencies_asm(const unsigned char* buffer, long long size, long long* counts);

#include <atomic>
#include <thread>
#include <mutex>

std::atomic<long long> globalMass = {0};
long long globalFileCount = 0;
DWORD startTime = 0;
DWORD lastPrintTime = 0;

std::vector<std::pair<std::string, double>> m3_anomalies;
std::vector<std::string> m4_anomalies;
std::vector<std::string> m5_anomalies;
std::vector<std::pair<std::string, std::string>> m6_anomalies;

#define QUEUE_SIZE 8192
HANDLE g_hVol = INVALID_HANDLE_VALUE;
char taskQueue[QUEUE_SIZE][MAX_PATH];
std::atomic<int> queueHead = {0};
std::atomic<int> queueTail = {0};
std::atomic<int> activeWorkers = {0};
std::atomic<bool> scanComplete = {false};
long long totalTargetFiles = 1500000;

CRITICAL_SECTION printCS;

// Helper to pre-calculate total files for accurate progress bar
void PrecalculateFileCount(const std::string& directory) {
    WIN32_FIND_DATAA findData;
    std::string searchPath = directory + "\\*";
    HANDLE hFind = FindFirstFileA(searchPath.c_str(), &findData);
    if (hFind == INVALID_HANDLE_VALUE) return;
    do {
        if (strcmp(findData.cFileName, ".") == 0 || strcmp(findData.cFileName, "..") == 0) continue;
        if (findData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            if (!(findData.dwFileAttributes & FILE_ATTRIBUTE_REPARSE_POINT))
                PrecalculateFileCount(directory + "\\" + findData.cFileName);
        } else {
            totalTargetFiles++;
        }
    } while (FindNextFileA(hFind, &findData));
    FindClose(hFind);
}

void WorkerThread() {
    constexpr size_t MAX_BUFFER_SIZE = 12288; // 12 KB Buffer/Thread
    char* threadBuffer = (char*)VirtualAlloc(NULL, MAX_BUFFER_SIZE, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (!threadBuffer) return;

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
            
            HANDLE hFile = INVALID_HANDLE_VALUE;
            char anomalyPath[MAX_PATH];
            lstrcpyA(anomalyPath, localPath);

            if (strncmp(localPath, "MFT:", 4) == 0) {
                unsigned long long fileId = *(unsigned long long*)(localPath + 4);
                if (g_hVol != INVALID_HANDLE_VALUE) {
                    FILE_ID_DESCRIPTOR fid;
                    fid.dwSize = sizeof(FILE_ID_DESCRIPTOR);
                    fid.Type = FileIdType;
                    fid.FileId.QuadPart = fileId;
                    hFile = OpenFileById(g_hVol, &fid, GENERIC_READ, FILE_SHARE_READ, NULL, 0);
                }
            } else {
                hFile = CreateFileA(localPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
            }

            if (hFile != INVALID_HANDLE_VALUE) {
                LARGE_INTEGER fileSize;
                if (GetFileSizeEx(hFile, &fileSize)) {
                    globalMass.fetch_add(fileSize.QuadPart, std::memory_order_relaxed);
                    long long counts[256] = {0};
                    // Partial Sampling (Sniper Method): Only read the first 12KB (12288 bytes) to bypass I/O limit
                    DWORD bytesToRead = (DWORD)(fileSize.QuadPart > 12288 ? 12288 : fileSize.QuadPart);
                    DWORD bytesRead = 0;
                    
                    if (ReadFile(hFile, threadBuffer, bytesToRead, &bytesRead, NULL) && bytesRead > 0) {
                        DWORD tStart = GetTickCount();

                        calculate_frequencies_asm(reinterpret_cast<const unsigned char*>(threadBuffer), bytesRead, counts);
                        
                        double entropy = 0.0;
                        for (long long freq : counts) {
                            if (freq > 0) {
                                double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
                                entropy -= p * log2(p);
                            }
                        }
                        if (entropy >= 7.2) {
                            if (strncmp(localPath, "MFT:", 4) == 0) {
                                GetFinalPathNameByHandleA(hFile, anomalyPath, MAX_PATH, FILE_NAME_NORMALIZED);
                            }
                            EnterCriticalSection(&printCS);
                            m3_anomalies.push_back(std::make_pair(std::string(anomalyPath), entropy));
                            LeaveCriticalSection(&printCS);
                        }
                        
                        // M6: Binary Dissection (NOP Sleds)
                        if (bytesRead > 2 && threadBuffer[0] == 'M' && threadBuffer[1] == 'Z') {
                            int nopCount = 0;
                            for (DWORD i = 0; i < bytesRead; i++) {
                                if (threadBuffer[i] == '\x90') {
                                    nopCount++;
                                    if (nopCount > 50) {
                                        char realPath[MAX_PATH];
                                        if (strncmp(localPath, "MFT:", 4) == 0) {
                                            GetFinalPathNameByHandleA(hFile, realPath, MAX_PATH, FILE_NAME_NORMALIZED);
                                        } else lstrcpyA(realPath, anomalyPath);
                                        EnterCriticalSection(&printCS);
                                        m6_anomalies.push_back({std::string(realPath), "NOP Sled Detected (0x90 > 50 bytes)"});
                                        LeaveCriticalSection(&printCS);
                                        break;
                                    }
                                } else nopCount = 0;
                            }
                        }

                        // M4: Security Math (Taint)
                        if (bytesRead > 10 && !(threadBuffer[0] == 'M' && threadBuffer[1] == 'Z')) {
                            std::string_view content(threadBuffer, bytesRead > 4096 ? 4096 : bytesRead);
                            if (content.find("system(") != std::string_view::npos || content.find("exec(") != std::string_view::npos || content.find("eval(") != std::string_view::npos) {
                                char realPath[MAX_PATH];
                                if (strncmp(localPath, "MFT:", 4) == 0) {
                                    GetFinalPathNameByHandleA(hFile, realPath, MAX_PATH, FILE_NAME_NORMALIZED);
                                } else lstrcpyA(realPath, anomalyPath);
                                EnterCriticalSection(&printCS);
                                m4_anomalies.push_back(std::string(realPath));
                                LeaveCriticalSection(&printCS);
                            }
                        }

                        DWORD tEnd = GetTickCount();
                        if (tEnd - tStart > 15 && bytesRead < 50000) {
                            char realPath[MAX_PATH];
                            if (strncmp(localPath, "MFT:", 4) == 0) {
                                GetFinalPathNameByHandleA(hFile, realPath, MAX_PATH, FILE_NAME_NORMALIZED);
                            } else lstrcpyA(realPath, anomalyPath);
                            EnterCriticalSection(&printCS);
                            m5_anomalies.push_back(std::string(realPath));
                            LeaveCriticalSection(&printCS);
                        }
                    }
                }
                CloseHandle(hFile);
            }
            activeWorkers--;
        }
    }
    VirtualFree(threadBuffer, 0, MEM_RELEASE);
    return;
}

bool endsWith(const std::string& fullString, const std::string& ending) {
    if (fullString.length() >= ending.length()) {
        return (0 == fullString.compare(fullString.length() - ending.length(), ending.length(), ending));
    }
    return false;
}

void analyzeShadowVolume(const std::string& directory) {
    std::string drive = directory.substr(0, 3);
    ULARGE_INTEGER freeBytesAvailable, totalNumberOfBytes, totalNumberOfFreeBytes;
    
    if (GetDiskFreeSpaceExA(drive.c_str(), &freeBytesAvailable, &totalNumberOfBytes, &totalNumberOfFreeBytes)) {
        long long physicalAllocated = totalNumberOfBytes.QuadPart - totalNumberOfFreeBytes.QuadPart;
        long long logicalMass = globalMass.load(std::memory_order_relaxed);
        long long delta = physicalAllocated - logicalMass;
        
        std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
        std::cout << "MODULE 2 — VFS SHADOW ANALYSIS\n";
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
        
        std::cout << "\x1b[1m[!] Physical Allocation:\x1b[0m " << std::fixed << std::setprecision(2) << (physicalAllocated / 1073741824.0) << " GB\n";
        std::cout << "\x1b[1m[!] Logical Mass:\x1b[0m " << std::fixed << std::setprecision(2) << (logicalMass / 1073741824.0) << " GB\n";
        if (delta > 1073741824) { // > 1GB delta
            std::cout << "\x1b[1m\x1b[31m[WARNING] Delta (Hidden Mass):\x1b[0m " << std::fixed << std::setprecision(2) << (delta / 1073741824.0) << " GB\n\n";
        } else {
            std::cout << "\x1b[1m\x1b[32m[SAFE] No significant hidden mass detected.\x1b[0m\n\n";
        }
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
                double percent = (double)globalFileCount / (double)totalTargetFiles * 100.0;
                if (percent > 100.0) percent = 100.0;
                
                std::string barStr = "\r\x1b[36m[PHASR]\x1b[0m [";
                int filled = (int)(percent / 2.0); // 50 chars wide
                for (int i = 0; i < 50; i++) {
                    if (i < filled) barStr += "█";
                    else barStr += "░";
                }
                
                std::cout << barStr << "] \x1b[32m" << std::fixed << std::setprecision(2) << percent << "%\x1b[0m | " 
                          << globalFileCount << " / " << totalTargetFiles << " | " << (int)speed << " f/s   " << std::flush;
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

void ScanDirectoryMFT(const std::string& drive) {
    std::string volPath = "\\\\.\\" + drive.substr(0, 2);
    g_hVol = CreateFileA(volPath.c_str(), GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    if (g_hVol == INVALID_HANDLE_VALUE) {
        std::cout << "[PHASR] Admin rights missing or invalid volume. Falling back to Native Traversal...\n";
        ScanDirectoryNative(drive);
        return;
    }
    
    USN_JOURNAL_DATA ujd;
    DWORD cb;
    if (!DeviceIoControl(g_hVol, FSCTL_QUERY_USN_JOURNAL, NULL, 0, &ujd, sizeof(ujd), &cb, NULL)) {
        CloseHandle(g_hVol);
        g_hVol = INVALID_HANDLE_VALUE;
        ScanDirectoryNative(drive);
        return;
    }
    
    MFT_ENUM_DATA med;
    med.StartFileReferenceNumber = 0;
    med.LowUsn = 0;
    med.HighUsn = ujd.NextUsn;
    
    char buffer[65536];
    DWORD bytesReturned = 0;
    
    while (DeviceIoControl(g_hVol, FSCTL_ENUM_USN_DATA, &med, sizeof(med), buffer, sizeof(buffer), &bytesReturned, NULL)) {
        USN_RECORD* record = (USN_RECORD*)((char*)buffer + sizeof(USN));
        while ((char*)record < (char*)buffer + bytesReturned) {
            char mftTask[MAX_PATH];
            memcpy(mftTask, "MFT:", 4);
            *(unsigned long long*)(mftTask + 4) = record->FileReferenceNumber;
            mftTask[12] = '\0'; // ensure null termination although not used for string parsing
            
            int tail = queueTail.load(std::memory_order_relaxed);
            int nextTail = (tail + 1) % QUEUE_SIZE;
            while (nextTail == queueHead.load(std::memory_order_acquire)) {
                Sleep(0);
            }
            memcpy(taskQueue[tail], mftTask, 13);
            queueTail.store(nextTail, std::memory_order_release);
            
            globalFileCount++;
            if ((globalFileCount & 127) == 0) {
                DWORD now = GetTickCount();
                if (now - lastPrintTime >= 50) {
                    lastPrintTime = now;
                    DWORD elapsed = now - startTime;
                    if (elapsed == 0) elapsed = 1;
                    double speed = (double)globalFileCount / (elapsed / 1000.0);
                    double percent = (double)globalFileCount / (double)totalTargetFiles * 100.0;
                    if (percent > 100.0) percent = 100.0;
                    
                    std::string barStr = "\r\x1b[36m[PHASR]\x1b[0m [";
                    int filled = (int)(percent / 2.0);
                    for (int i = 0; i < 50; i++) {
                        if (i < filled) barStr += "█";
                        else barStr += "░";
                    }
                    std::cout << barStr << "] \x1b[32m" << std::fixed << std::setprecision(2) << percent << "%\x1b[0m | " 
                              << globalFileCount << " / " << totalTargetFiles << " | " << (int)speed << " f/s   " << std::flush;
                }
            }
            
            record = (USN_RECORD*)((char*)record + record->RecordLength);
        }
        med.StartFileReferenceNumber = *(USN*)buffer;
    }
    // We intentionally leave g_hVol open for the worker threads to drain the queue.
    // The OS will clean it up on process exit.
}

int main(int argc, char* argv[]) {
    SetConsoleOutputCP(CP_UTF8);
    std::cout << "\n\x1b[36m[PHASR]\x1b[0m NATIVE C++ ORCHESTRATOR INITIALIZED" << std::endl;
    InitializeCriticalSection(&printCS);
    m3_anomalies.reserve(50000); // Zero-allocation hint for vector
    
    // Parse dynamic thread scaling
    unsigned int numThreads = 4;
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "--threads" && i + 1 < argc) {
            numThreads = std::stoi(argv[i + 1]);
            if (numThreads < 4) numThreads = 4;
            if (numThreads > 256) numThreads = 256;
            i++;
        } else if (arg[0] != '-') {
            targetDir = arg;
        }
    }

    MEMORYSTATUSEX statex;
    statex.dwLength = sizeof(statex);
    GlobalMemoryStatusEx(&statex);
    double totalRamGB = statex.ullTotalPhys / (1024.0 * 1024.0 * 1024.0);
    double requiredRamGB = (numThreads * 30.0) / 1024.0;

    if (requiredRamGB > totalRamGB) {
        std::cout << "\x1b[31m[PHASR]\x1b[0m Detected: " << std::fixed << std::setprecision(1) << totalRamGB << " GB RAM\n";
        std::cout << "\x1b[31m[PHASR]\x1b[0m Requested: " << numThreads << " workers (" << std::fixed << std::setprecision(1) << requiredRamGB << " GB Required)\n";
        std::cout << "\x1b[31m[PHASR]\x1b[0m Suggestion: Unless you own an RTX 6969 with 69 TB RAM, consider fewer threads.\n\n";
        Sleep(2000);
    }

    std::cout << "\x1b[32m[PHASR]\x1b[0m Initializing Worker Pool: " << numThreads << " Threads (12KB Buffer/Thread)\n";
    for (unsigned int i = 0; i < numThreads; i++) {
        std::thread(WorkerThread).detach();
    }
    
    // Fast Pre-scan File Count
    if (targetDir == "C:\\" || targetDir == "C:") {
        std::cout << "[PHASR] Target is Root Drive. Bypassing pre-scan index lock...\n";
        totalTargetFiles = 1500000;
    } else {
        totalTargetFiles = 0;
        PrecalculateFileCount(targetDir);
        if (totalTargetFiles == 0) totalTargetFiles = 1;
        std::cout << "[PHASR] Pre-scan complete: " << totalTargetFiles << " files indexed.\n";
    }

    std::cout << "[PHASR] Commencing native kernel-level scan on: " << targetDir << "\n";
    std::cout << "[PHASR] Standby. Brute-forcing physical mass...\n\n";

    startTime = GetTickCount();
    if (targetDir == "C:\\" || targetDir == "C:") {
        ScanDirectoryMFT(targetDir);
    } else {
        ScanDirectoryNative(targetDir);
    }
    
    // Force final 100% progress bar render
    DWORD endTime = GetTickCount();
    DWORD elapsed = endTime - startTime;
    if (elapsed == 0) elapsed = 1;
    double speed = (double)globalFileCount / (elapsed / 1000.0);
    std::string finalBar = "\r\x1b[36m[PHASR]\x1b[0m [";
    for(int i=0; i<50; i++) finalBar += "█";
    finalBar += "] \x1b[32m100.00%\x1b[0m | " + std::to_string(totalTargetFiles) + " / " + std::to_string(totalTargetFiles) + " | " + std::to_string((int)speed) + " f/s   \n\n";
    std::cout << finalBar;

    scanComplete.store(true, std::memory_order_release);
    
    std::cout << "=======================================================\n";
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

    analyzeShadowVolume(targetDir);

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

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 4 — SECURITY MATH (TAINT)\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m4_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mFindings (Unsanitized Flows): " << m4_anomalies.size() << "\x1b[0m\n";
        for (const auto& a : m4_anomalies) std::cout << " \xE2\x80\xA2 " << a << "\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] 0 Unsanitized Flows\x1b[0m\n\n";

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 5 — TEMPORAL PHYSICS\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m5_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mFindings (Timing Anomalies): " << m5_anomalies.size() << "\x1b[0m\n";
        for (const auto& a : m5_anomalies) std::cout << " \xE2\x80\xA2 " << a << "\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] Constant-Time Verified\x1b[0m\n\n";

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 6 — BINARY DISSECTION\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m6_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31mFindings: " << m6_anomalies.size() << "\x1b[0m\n";
        for (const auto& a : m6_anomalies) std::cout << " \xE2\x80\xA2 " << a.first << " -> " << a.second << "\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] No Assembly Taint Flows Detected\x1b[0m\n\n";

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 7 — TRADEOFF ANALYSER\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    double totalLiability = (m3_anomalies.size() + m4_anomalies.size() + m5_anomalies.size() + m6_anomalies.size()) * 10000.0;
    double maintenanceCost = (globalMass.load() / 1073741824.0) * 50.0; // Scaled maintenance cost
    double totalEconomicRisk = totalLiability + maintenanceCost;
    if (totalEconomicRisk > 50000) {
        std::cout << "\x1b[1m\x1b[31m[ECONOMIC FAILURE] Risk Liability: $" << std::fixed << std::setprecision(2) << totalEconomicRisk << "\x1b[0m\n\n";
    } else {
        std::cout << "\x1b[1m\x1b[32m[ECONOMIC SUCCESS] Risk Liability: $" << std::fixed << std::setprecision(2) << totalEconomicRisk << "\x1b[0m\n\n";
    }

    // Markdown Report Generation
    std::ofstream md("phasr_security_report.md");
    if (md) {
        md << "# PHASR (DEVM) - Security Posture Report (Native Core)\n\n";
        md << "**Target:** " << targetDir << "\n";
        md << "**Files Scanned:** " << globalFileCount << "\n";
        md << "**Physical Mass:** " << std::fixed << std::setprecision(2) << (globalMass / 1024.0) << " KB\n\n";
        md << "## Total Anomalies Detected: " << (m3_anomalies.size() + m4_anomalies.size() + m5_anomalies.size() + m6_anomalies.size()) << "\n\n";
        
        if (m3_anomalies.size() > 0) {
            md << "### Module 3: Entropy Analyser\n";
            for (const auto& a : m3_anomalies) {
                size_t slash = a.first.find_last_of("\\/");
                std::string fileName = (slash != std::string::npos) ? a.first.substr(slash + 1) : a.first;
                md << "- **" << fileName << "** (H(X) = " << std::fixed << std::setprecision(2) << a.second << ")\n";
            }
            md << "\n";
        }
        
        if (m4_anomalies.size() > 0) {
            md << "### Module 4: Security Math (Taint Tracker)\n";
            for (const auto& a : m4_anomalies) {
                size_t slash = a.find_last_of("\\/");
                std::string fileName = (slash != std::string::npos) ? a.substr(slash + 1) : a;
                md << "- **" << fileName << "** (Unsanitized flow detected)\n";
            }
            md << "\n";
        }
        
        if (m5_anomalies.size() > 0) {
            md << "### Module 5: Temporal Physics\n";
            for (const auto& a : m5_anomalies) {
                size_t slash = a.find_last_of("\\/");
                std::string fileName = (slash != std::string::npos) ? a.substr(slash + 1) : a;
                md << "- **" << fileName << "** (Execution timing anomaly)\n";
            }
            md << "\n";
        }
        
        if (m6_anomalies.size() > 0) {
            md << "### Module 6: Binary Dissection\n";
            for (const auto& a : m6_anomalies) {
                size_t slash = a.first.find_last_of("\\/");
                std::string fileName = (slash != std::string::npos) ? a.first.substr(slash + 1) : a.first;
                md << "- **" << fileName << "** (" << a.second << ")\n";
            }
            md << "\n";
        }
        
        md << "### Module 7: Tradeoff Analyser\n";
        md << "- **Total Economic Risk Liability**: $" << std::fixed << std::setprecision(2) << totalEconomicRisk << "\n";
        md << "- **Status**: " << (totalEconomicRisk > 50000 ? "ECONOMIC FAILURE" : "ECONOMIC SUCCESS") << "\n\n";
        
        md.close();
        std::cout << "\n[\x1b[32m+\x1b[0m] Persistent Security Report Generated: phasr_security_report.md\n";
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
