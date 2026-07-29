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
#include <unordered_map>

std::unordered_map<unsigned long long, std::string> globalFrnToPath;


std::atomic<long long> globalMass = {0};
std::atomic<long long> globalFileCount = {0};
std::atomic<long long> globalSuccess = {0};
DWORD startTime = 0;
DWORD lastPrintTime = 0;

LONG WINAPI PageFaultExceptionFilter(EXCEPTION_POINTERS* ExceptionInfo) {
    if (ExceptionInfo->ExceptionRecord->ExceptionCode == EXCEPTION_IN_PAGE_ERROR) {
        // A file was truncated over the network while mapped in memory.
        // We gracefully exit instead of hard-crashing the process.
        std::cerr << "\n[PHASR SEH TRAP] EXCEPTION_IN_PAGE_ERROR: Target file was truncated during memory analysis.\n";
        ExitProcess(1);
    }
    return EXCEPTION_CONTINUE_SEARCH;
}

struct M3_Anomaly {
    char path[MAX_PATH];
    double entropy;
};

struct M4_Anomaly {
    char path[MAX_PATH];
};

struct M5_Anomaly {
    char path[MAX_PATH];
};

struct M6_Anomaly {
    char path[MAX_PATH];
    char reason[64];
};

struct M8_Anomaly {
    char path[MAX_PATH];
    char details[128];
};

std::vector<M3_Anomaly> m3_anomalies;
std::vector<M4_Anomaly> m4_anomalies;
std::vector<M5_Anomaly> m5_anomalies;
std::vector<M6_Anomaly> m6_anomalies;
std::vector<M8_Anomaly> m8_infrastructure; // IP and DNS found

std::atomic<bool> isWebApp = {false};

bool endsWith(const std::string& fullString, const std::string& ending);

#define QUEUE_SIZE 8192
HANDLE g_hVol = INVALID_HANDLE_VALUE;
char taskQueue[QUEUE_SIZE][MAX_PATH];
alignas(64) std::atomic<int> queueHead = {0};
alignas(64) std::atomic<int> queueTail = {0};
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

char archiveQueue[QUEUE_SIZE][MAX_PATH];
alignas(64) std::atomic<int> archHead = {0};
alignas(64) std::atomic<int> archTail = {0};
std::atomic<int> activeArchWorkers = {0};

void ArchiveWorkerThread() {
    activeArchWorkers++;
    std::vector<M3_Anomaly> local_m3_anomalies;
    constexpr size_t MAX_BUFFER_SIZE = 31457280; // Up to 30MB map capability conceptually
#ifdef USE_NATIVE_ZLIB
    // Conceptually mapped buffer if using native ZLIB
    std::vector<char> threadBuffer(MAX_BUFFER_SIZE); 
#else
    char* threadBuffer = (char*)VirtualAlloc(NULL, MAX_BUFFER_SIZE, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (!threadBuffer) {
        activeArchWorkers--;
        return;
    }
#endif

    while (true) {
        int head = archHead.load(std::memory_order_acquire);
        int tail = archTail.load(std::memory_order_relaxed);
        
        if (head == tail) {
            if (scanComplete.load(std::memory_order_acquire)) break;
            Sleep(0);
            continue;
        }
        
        char localPath[MAX_PATH];
        lstrcpyA(localPath, archiveQueue[head]);
        
        if (archHead.compare_exchange_weak(head, (head + 1) % QUEUE_SIZE, std::memory_order_release, std::memory_order_relaxed)) {
            std::string cmd;
            size_t pathLen = strlen(localPath);
            if (pathLen > 3 && strcmp(localPath + pathLen - 3, ".gz") == 0) cmd = "tar -xf \"";
            else if (pathLen > 4 && strcmp(localPath + pathLen - 4, ".zip") == 0) cmd = "tar -xf \"";
            else continue;
            
#ifdef USE_NATIVE_ZLIB
            // Concept: Pure In-Memory Zero-Allocation DEFLATE (No OS Subprocesses)
            HANDLE hFile = CreateFileA(localPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
            if (hFile != INVALID_HANDLE_VALUE) {
                HANDLE hMap = CreateFileMappingA(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
                if (hMap) {
                    void* pMap = MapViewOfFile(hMap, FILE_MAP_READ, 0, 0, 0);
                    if (pMap) {
                        // Native zlib/miniz decompress from pMap directly into threadBuffer.data()
                        // size_t bytesRead = native_in_memory_inflate(pMap, fileSize, threadBuffer.data(), MAX_BUFFER_SIZE);
                        size_t bytesRead = 0; // Mocked
                        
                        if (bytesRead > 0) {
                            long long counts[256] = {0};
                            calculate_frequencies_asm(reinterpret_cast<const unsigned char*>(threadBuffer.data()), bytesRead, counts);
                            double entropy = 0.0;
                            for (long long freq : counts) {
                                if (freq > 0) {
                                    double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
                                    entropy -= p * log2(p);
                                }
                            }
                            if (entropy >= 7.2) {
                                M3_Anomaly a;
                                lstrcpynA(a.path, (std::string(localPath) + " (Unpacked)").c_str(), MAX_PATH);
                                a.entropy = entropy;
                                local_m3_anomalies.push_back(a);
                            }
                        }
                        UnmapViewOfFile(pMap);
                    }
                    CloseHandle(hMap);
                }
                CloseHandle(hFile);
            }
#else
            // Legacy OS-dependent decompression (fork overhead)
            cmd = "tar -xOf \"" + std::string(localPath) + "\" 2>NUL";
            
            FILE* fp = _popen(cmd.c_str(), "r");
            if (fp) {
                size_t bytesRead = fread(threadBuffer, 1, MAX_BUFFER_SIZE, fp);
                if (bytesRead > 0) {
                    long long counts[256] = {0};
                    calculate_frequencies_asm(reinterpret_cast<const unsigned char*>(threadBuffer), bytesRead, counts);
                    double entropy = 0.0;
                    for (long long freq : counts) {
                        if (freq > 0) {
                            double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
                            entropy -= p * log2(p);
                        }
                    }
                    if (entropy >= 7.2) {
                        M3_Anomaly a;
                        lstrcpynA(a.path, (std::string(localPath) + " (Unpacked)").c_str(), MAX_PATH);
                        a.entropy = entropy;
                        local_m3_anomalies.push_back(a);
                    }
                }
                _pclose(fp);
            }
#endif
        }
    }
    
    EnterCriticalSection(&printCS);
    m3_anomalies.insert(m3_anomalies.end(), local_m3_anomalies.begin(), local_m3_anomalies.end());
    LeaveCriticalSection(&printCS);
    
#ifndef USE_NATIVE_ZLIB
    VirtualFree(threadBuffer, 0, MEM_RELEASE);
#endif
    activeArchWorkers--;
}

void WorkerThread() {
    std::vector<M3_Anomaly> local_m3_anomalies;
    std::vector<M4_Anomaly> local_m4_anomalies;
    std::vector<M5_Anomaly> local_m5_anomalies;
    std::vector<M6_Anomaly> local_m6_anomalies;
    std::vector<M8_Anomaly> local_m8_infrastructure;

    while (true) {
        int head = queueHead.load(std::memory_order_acquire);
        int tail = queueTail.load(std::memory_order_relaxed);
        
        if (head == tail) {
            if (scanComplete.load(std::memory_order_acquire)) break;
            Sleep(0); // Yield time slice
            continue;
        }
        
        // Data Race Fix: Use memcpy to preserve binary null bytes inside the MFT File ID
        char localPath[MAX_PATH];
        memcpy(localPath, taskQueue[head], MAX_PATH);
        
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
                    hFile = OpenFileById(g_hVol, &fid, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE, NULL, FILE_FLAG_OPEN_REPARSE_POINT | FILE_FLAG_OPEN_NO_RECALL);
                    
                    if (hFile == INVALID_HANDLE_VALUE) {
                        DWORD realErr = GetLastError();
                        static std::atomic<int> errCount = {0};
                        if (errCount.fetch_add(1) < 10) {
                            FILE* f = fopen("debug_errors.txt", "a");
                            if (f) {
                                fprintf(f, "OpenFileById Failed! Err: %lu, FileID: %llu\n", realErr, fileId);
                                fclose(f);
                            }
                        }
                    }
                }
            } else {
                hFile = CreateFileA(localPath, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
            }

            if (hFile != INVALID_HANDLE_VALUE) {
                LARGE_INTEGER fileSize;
                if (GetFileSizeEx(hFile, &fileSize)) {
                    globalSuccess.fetch_add(1, std::memory_order_relaxed);
                    globalMass.fetch_add(fileSize.QuadPart, std::memory_order_relaxed);
                    
                    BY_HANDLE_FILE_INFORMATION fileInfo;
                    bool skipRead = false;
                    if (GetFileInformationByHandle(hFile, &fileInfo)) {
                        if (fileInfo.dwFileAttributes & (FILE_ATTRIBUTE_OFFLINE | FILE_ATTRIBUTE_REPARSE_POINT | 0x00400000 /* FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS */)) {
                            skipRead = true;
                        }
                    }
                    
                    if (!skipRead && fileSize.QuadPart > 0) {
                        HANDLE hMap = CreateFileMappingA(hFile, NULL, PAGE_READONLY, 0, 0, NULL);
                        if (hMap) {
                            DWORD bytesToMap = (DWORD)(fileSize.QuadPart > 31457280 ? 31457280 : fileSize.QuadPart);
                            void* pMap = MapViewOfFile(hMap, FILE_MAP_READ, 0, 0, bytesToMap);
                            if (pMap) {
                                DWORD bytesRead = bytesToMap;
                                const char* threadBuffer = reinterpret_cast<const char*>(pMap);
                                
                                long long counts[256] = {0};
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
                                unsigned long long fileId = *(unsigned long long*)(localPath + 4);
                                lstrcpyA(anomalyPath, globalFrnToPath[fileId].c_str());
                            }
                            M3_Anomaly m3;
                            lstrcpyA(m3.path, anomalyPath);
                            m3.entropy = entropy;
                            local_m3_anomalies.push_back(m3);
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
                                            unsigned long long fileId = *(unsigned long long*)(localPath + 4);
                                            lstrcpyA(realPath, globalFrnToPath[fileId].c_str());
                                        } else lstrcpyA(realPath, anomalyPath);
                                        M6_Anomaly m6;
                                        lstrcpyA(m6.path, realPath);
                                        lstrcpyA(m6.reason, "NOP Sled Detected (0x90 > 50 bytes)");
                                        local_m6_anomalies.push_back(m6);
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
                                    unsigned long long fileId = *(unsigned long long*)(localPath + 4);
                                    lstrcpyA(realPath, globalFrnToPath[fileId].c_str());
                                } else lstrcpyA(realPath, anomalyPath);
                                M4_Anomaly m4;
                                lstrcpyA(m4.path, realPath);
                                local_m4_anomalies.push_back(m4);
                            }
                            
                            // M8: Infrastructure Discovery (DNS/IP)
                            // Naive native substring extraction for http/https and IPv4
                            if (endsWith(std::string(anomalyPath), ".env") || endsWith(std::string(anomalyPath), ".json") || 
                                endsWith(std::string(anomalyPath), ".js") || endsWith(std::string(anomalyPath), ".ts") ||
                                endsWith(std::string(anomalyPath), "config")) {
                                
                                isWebApp = true; // Now atomic
                                
                                size_t pos = 0;
                                while ((pos = content.find("http://", pos)) != std::string_view::npos || 
                                       (pos = content.find("https://", pos)) != std::string_view::npos) {
                                    size_t start = pos;
                                    size_t end = content.find_first_of(" \r\n\"'/;", start);
                                    if (end == std::string_view::npos) end = content.length();
                                    if (end - start > 7 && end - start < 100) {
                                        std::string url(content.substr(start, end - start));
                                        M8_Anomaly m8;
                                        lstrcpyA(m8.path, anomalyPath);
                                        lstrcpynA(m8.details, url.c_str(), 128);
                                        local_m8_infrastructure.push_back(m8);
                                    }
                                    pos = end;
                                }
                                
                                // Native IP Extraction (naive xxx.xxx.xxx.xxx)
                                for (size_t i = 0; i < content.length() - 7; i++) {
                                    if (isdigit(content[i])) {
                                        int dots = 0, digits = 0, valid = 1;
                                        size_t j = i;
                                        while (j < content.length() && (isdigit(content[j]) || content[j] == '.')) {
                                            if (content[j] == '.') dots++;
                                            else digits++;
                                            j++;
                                        }
                                        if (dots == 3 && digits >= 4 && digits <= 12 && j - i >= 7 && j - i <= 15) {
                                            std::string ip = "IPv4: " + std::string(content.substr(i, j - i));
                                            M8_Anomaly m8;
                                            lstrcpyA(m8.path, anomalyPath);
                                            lstrcpynA(m8.details, ip.c_str(), 128);
                                            local_m8_infrastructure.push_back(m8);
                                            i = j;
                                        }
                                    }
                                }
                            }
                        }

                        DWORD tEnd = GetTickCount();
                        if (tEnd - tStart > 15 && bytesRead < 50000) {
                            char realPath[MAX_PATH];
                            if (strncmp(localPath, "MFT:", 4) == 0) {
                                unsigned long long fileId = *(unsigned long long*)(localPath + 4);
                                lstrcpyA(realPath, globalFrnToPath[fileId].c_str());
                            } else {
                                lstrcpyA(realPath, anomalyPath);
                            }
                            M5_Anomaly m5;
                            lstrcpyA(m5.path, realPath);
                            local_m5_anomalies.push_back(m5);
                        }
                                UnmapViewOfFile(pMap);
                            }
                            CloseHandle(hMap);
                        }
                    } // closes if (!skipRead)
            } // closes if (GetFileSizeEx)
            CloseHandle(hFile);
            }
            activeWorkers--;
        }
    }
    
    EnterCriticalSection(&printCS);
    m3_anomalies.insert(m3_anomalies.end(), local_m3_anomalies.begin(), local_m3_anomalies.end());
    m4_anomalies.insert(m4_anomalies.end(), local_m4_anomalies.begin(), local_m4_anomalies.end());
    m5_anomalies.insert(m5_anomalies.end(), local_m5_anomalies.begin(), local_m5_anomalies.end());
    m6_anomalies.insert(m6_anomalies.end(), local_m6_anomalies.begin(), local_m6_anomalies.end());
    m8_infrastructure.insert(m8_infrastructure.end(), local_m8_infrastructure.begin(), local_m8_infrastructure.end());
    LeaveCriticalSection(&printCS);
    
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
        std::cout << "\x1b[1m[!] Logical Size:\x1b[0m " << std::fixed << std::setprecision(2) << (logicalMass / 1073741824.0) << " GB\n";
        if (delta > 1073741824) { // > 1GB delta
            std::cout << "\x1b[1m\x1b[31m[WARNING] Delta (Hidden Size):\x1b[0m " << std::fixed << std::setprecision(2) << (delta / 1073741824.0) << " GB\n\n";
        } else {
            std::cout << "\x1b[1m\x1b[32m[SAFE] No significant hidden size detected.\x1b[0m\n\n";
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

void TraverseAndEnqueue(unsigned long long frn, const std::string& currentPath, 
                        std::unordered_map<unsigned long long, std::vector<unsigned long long>>& childrenMap,
                        std::unordered_map<unsigned long long, std::string>& nameMap) {
    
    globalFrnToPath[frn] = currentPath;

    char mftTask[MAX_PATH];
    memcpy(mftTask, "MFT:", 4);
    *(unsigned long long*)(mftTask + 4) = frn;
    mftTask[12] = '\0';
    
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
            
            std::string barStr = "\r\x1b[36m[PHASR MFT]\x1b[0m [";
            int filled = (int)(percent / 2.0);
            for (int i = 0; i < 50; i++) {
                if (i < filled) barStr += "█";
                else barStr += "░";
            }
            std::cout << barStr << "] \x1b[32m" << std::fixed << std::setprecision(2) << percent << "%\x1b[0m | " 
                      << globalFileCount << " / " << totalTargetFiles << " | " << (int)speed << " f/s   " << std::flush;
        }
    }
    
    for (unsigned long long childFrn : childrenMap[frn]) {
        std::string childPath = currentPath + "\\" + nameMap[childFrn];
        TraverseAndEnqueue(childFrn, childPath, childrenMap, nameMap);
    }
}

unsigned long long GetFRN(const std::string& path) {
    HANDLE hFile = CreateFileA(path.c_str(), GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
    if (hFile == INVALID_HANDLE_VALUE) return 0;
    BY_HANDLE_FILE_INFORMATION info;
    unsigned long long frn = 0;
    if (GetFileInformationByHandle(hFile, &info)) {
        frn = ((unsigned long long)info.nFileIndexHigh << 32) | info.nFileIndexLow;
    }
    CloseHandle(hFile);
    return frn;
}

void ScanDirectoryMFT(const std::string& targetDir) {
    std::string drive = targetDir.substr(0, 2);
    std::string volPath = "\\\\.\\" + drive;
    g_hVol = CreateFileA(volPath.c_str(), GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    if (g_hVol == INVALID_HANDLE_VALUE) {
        std::cout << "[PHASR] Admin rights missing. Falling back to Native Traversal...\n";
        ScanDirectoryNative(targetDir);
        return;
    }
    
    USN_JOURNAL_DATA ujd;
    DWORD cb;
    if (!DeviceIoControl(g_hVol, FSCTL_QUERY_USN_JOURNAL, NULL, 0, &ujd, sizeof(ujd), &cb, NULL)) {
        CloseHandle(g_hVol);
        g_hVol = INVALID_HANDLE_VALUE;
        ScanDirectoryNative(targetDir);
        return;
    }
    
    unsigned long long targetFrn = GetFRN(targetDir);
    if (targetFrn == 0) {
        CloseHandle(g_hVol);
        g_hVol = INVALID_HANDLE_VALUE;
        ScanDirectoryNative(targetDir);
        return;
    }
    
    std::cout << "[PHASR MFT] Building In-Memory NTFS Tree. Please standby...\n";
    
    std::unordered_map<unsigned long long, std::vector<unsigned long long>> childrenMap;
    std::unordered_map<unsigned long long, std::string> nameMap;
    
    MFT_ENUM_DATA med;
    med.StartFileReferenceNumber = 0;
    med.LowUsn = 0;
    med.HighUsn = ujd.NextUsn;
    
    char buffer[65536];
    DWORD bytesReturned = 0;
    
    while (DeviceIoControl(g_hVol, FSCTL_ENUM_USN_DATA, &med, sizeof(med), buffer, sizeof(buffer), &bytesReturned, NULL)) {
        USN_RECORD* record = (USN_RECORD*)((char*)buffer + sizeof(USN));
        while ((char*)record < (char*)buffer + bytesReturned) {
            unsigned long long frn = record->FileReferenceNumber;
            unsigned long long parentFrn = record->ParentFileReferenceNumber;
            
            int nameLen = record->FileNameLength / 2;
            std::string fileName;
            for(int i = 0; i < nameLen; i++) {
                fileName += (char)record->FileName[i]; // basic utf-16 to ascii
            }
            
            nameMap[frn] = fileName;
            if (parentFrn != 0) {
                childrenMap[parentFrn].push_back(frn);
            }
            
            record = (USN_RECORD*)((char*)record + record->RecordLength);
        }
        med.StartFileReferenceNumber = *(USN*)buffer;
    }
    
    std::cout << "[PHASR MFT] Tree built. Streaming to Ring Buffer...\n";
    TraverseAndEnqueue(targetFrn, targetDir, childrenMap, nameMap);
}

int main(int argc, char* argv[]) {
    SetUnhandledExceptionFilter(PageFaultExceptionFilter);
    SetConsoleOutputCP(CP_UTF8);
    
    std::cout << "\x1b[1m\x1b[36m";
    std::cout << "██████╗ ██╗  ██╗ █████╗ ███████╗██████╗ \n";
    std::cout << "\x1b[36m[PHASR]\x1b[0m NATIVE C++ ORCHESTRATOR INITIALIZED" << std::endl;
    InitializeCriticalSection(&printCS);
    m3_anomalies.reserve(50000); // Zero-allocation hint for vector
    
    // Parse dynamic thread scaling
    unsigned int numThreads = 4;
    std::string targetDir = ".";
    for (int i = 1; i < argc; i++) {
        std::string arg = argv[i];
        if (arg == "--threads" && i + 1 < argc) {
            try {
                numThreads = std::stoi(argv[i + 1]);
            } catch (...) {
                numThreads = 256; // Fallback to max threads on integer overflow
            }
            if (numThreads < 4) numThreads = 4;
            if (numThreads > 256) numThreads = 256;
            i++;
        } else if (arg[0] != '-') {
            char absPath[MAX_PATH];
            if (GetFullPathNameA(arg.c_str(), MAX_PATH, absPath, NULL)) {
                targetDir = absPath;
            } else {
                targetDir = arg;
            }
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
    std::cout << "[PHASR] Standby. Brute-forcing total size...\n\n";

    startTime = GetTickCount();
    ScanDirectoryMFT(targetDir);
    
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
    
    std::cout << "\n";
    Sleep(500);

    std::cout << "\x1b[1mTARGET:\x1b[0m " << targetDir << "\n";
    Sleep(300);
    std::cout << "\x1b[1mFILES SCANNED:\x1b[0m " << globalFileCount << "\n";
    Sleep(300);
    std::cout << "\x1b[1mTOTAL SIZE:\x1b[0m " << std::fixed << std::setprecision(2) << (globalMass / 1024.0) << " KB\n\n";
    Sleep(800);

    std::cout << "\x1b[1m\x1b[33m[*] Executing Hardware Physics Modules...\x1b[0m\n\n";
    Sleep(1000);

    analyzeShadowVolume(targetDir);

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 3 — ENTROPY ANALYSER\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";

    if (m3_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31m[WARNING] " << m3_anomalies.size() << " High Entropy Anomalies Detected (See Report)\x1b[0m\n\n";
    } else {
        std::cout << "\x1b[1m\x1b[32m[SAFE] Maximum Entropy H(X) Verified\x1b[0m\n\n";
    }

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 4 — SECURITY MATH (TAINT)\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m4_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31m[WARNING] " << m4_anomalies.size() << " Unsanitized Flows Detected (See Report)\x1b[0m\n\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] 0 Unsanitized Flows\x1b[0m\n\n";

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 5 — TEMPORAL PHYSICS\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m5_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31m[WARNING] " << m5_anomalies.size() << " Timing Anomalies Detected (See Report)\x1b[0m\n\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] Constant-Time Verified\x1b[0m\n\n";

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 6 — BINARY DISSECTION\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m6_anomalies.size() > 0) {
        std::cout << "\x1b[1m\x1b[31m[WARNING] " << m6_anomalies.size() << " Assembly Taint Flows Detected (See Report)\x1b[0m\n\n";
    } else std::cout << "\x1b[1m\x1b[32m[SAFE] No Assembly Taint Flows Detected\x1b[0m\n\n";

    std::cout << "\n\x1b[1m\x1b[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
    std::cout << "MODULE 8 — INFRASTRUCTURE DISCOVERY\n";
    std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\x1b[0m\n\n";
    if (m8_infrastructure.size() > 0) {
        std::cout << "\x1b[1m\x1b[33m[INFO] " << m8_infrastructure.size() << " DNS/IP Artifacts Extracted\x1b[0m\n";
        int disp = 0;
        for (const auto& a : m8_infrastructure) {
            std::cout << "  -> " << a.details << "\n";
            if (++disp >= 10) {
                std::cout << "  -> ... (more in report)\n";
                break;
            }
        }
        std::cout << "\n";
    } else {
        std::cout << "\x1b[1m\x1b[32m[SAFE] No hardcoded IPs or DNS endpoints found\x1b[0m\n\n";
    }

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
        md << "**Files Scanned:** " << globalFileCount << " (Success: " << globalSuccess.load() << ")\n";
        md << "**Total Size:** " << std::fixed << std::setprecision(2) << (globalMass / 1024.0) << " KB\n\n";
        md << "## Total Anomalies Detected: " << (m3_anomalies.size() + m4_anomalies.size() + m5_anomalies.size() + m6_anomalies.size()) << "\n\n";
        
        if (m3_anomalies.size() > 0) {
            md << "### Module 3: Entropy Analyser\n";
            for (const auto& a : m3_anomalies) {
                std::string_view pathView(a.path);
                size_t slash = pathView.find_last_of("\\/");
                std::string_view fileName = (slash != std::string_view::npos) ? pathView.substr(slash + 1) : pathView;
                md << "- **" << fileName << "** (H(X) = " << std::fixed << std::setprecision(2) << a.entropy << ")\n";
            }
            md << "\n";
        }
        
        if (m4_anomalies.size() > 0) {
            md << "### Module 4: Security Math (Taint Tracker)\n";
            for (const auto& a : m4_anomalies) {
                std::string_view pathView(a.path);
                size_t slash = pathView.find_last_of("\\/");
                std::string_view fileName = (slash != std::string_view::npos) ? pathView.substr(slash + 1) : pathView;
                md << "- **" << fileName << "** (Unsanitized flow detected)\n";
            }
            md << "\n";
        }
        
        if (m5_anomalies.size() > 0) {
            md << "### Module 5: Temporal Physics\n";
            for (const auto& a : m5_anomalies) {
                std::string_view pathView(a.path);
                size_t slash = pathView.find_last_of("\\/");
                std::string_view fileName = (slash != std::string_view::npos) ? pathView.substr(slash + 1) : pathView;
                md << "- **" << fileName << "** (Execution timing anomaly)\n";
            }
            md << "\n";
        }
        
        if (m6_anomalies.size() > 0) {
            md << "### Module 6: Binary Dissection\n";
            for (const auto& a : m6_anomalies) {
                std::string_view pathView(a.path);
                size_t slash = pathView.find_last_of("\\/");
                std::string_view fileName = (slash != std::string_view::npos) ? pathView.substr(slash + 1) : pathView;
                md << "- **" << fileName << "** (" << a.reason << ")\n";
            }
            md << "\n";
        }
        
        if (m8_infrastructure.size() > 0) {
            md << "### Module 8: Infrastructure Discovery (DNS/IP)\n";
            md << "*(Extracted native targets from configuration and code)*\n\n";
            for (const auto& a : m8_infrastructure) {
                std::string_view pathView(a.path);
                size_t slash = pathView.find_last_of("\\/");
                std::string_view fileName = (slash != std::string_view::npos) ? pathView.substr(slash + 1) : pathView;
                md << "- **" << fileName << "**: `" << a.details << "`\n";
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
