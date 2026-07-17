#include <iostream>
#include <windows.h>
#include <string>
#include <vector>
#include <fstream>
#include <cmath>
#include <iomanip>

extern "C" void calculate_frequencies_asm(const unsigned char* buffer, long long size, long long* counts);

// Absolute bare-metal C++ Orchestrator
// Bypasses V8 Node.js completely to natively scan Windows drives

long long globalMass = 0;
long long globalFileCount = 0;

double calculateEntropy(const std::string& filePath, long long fileSize) {
    HANDLE hFile = CreateFileA(filePath.c_str(), GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hFile == INVALID_HANDLE_VALUE) return 0.0;
    
    // O(1) Heuristic: Seek to the middle of the payload to bypass structured PE headers
    long long offset = fileSize > 8192 ? (fileSize / 2) - 4096 : 0;
    LARGE_INTEGER liDistanceToMove;
    liDistanceToMove.QuadPart = offset;
    SetFilePointerEx(hFile, liDistanceToMove, NULL, FILE_BEGIN);

    std::vector<long long> counts(256, 0);
    char buffer[8192];
    DWORD bytesRead = 0;
    
    ReadFile(hFile, buffer, sizeof(buffer), &bytesRead, NULL);
    CloseHandle(hFile);
    
    if (bytesRead == 0) return 0.0;
    
    calculate_frequencies_asm(reinterpret_cast<const unsigned char*>(buffer), bytesRead, counts.data());
    
    double entropy = 0.0;
    for (long long freq : counts) {
        if (freq > 0) {
            double p = static_cast<double>(freq) / static_cast<double>(bytesRead);
            entropy -= p * log2(p);
        }
    }
    return entropy;
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
            std::cout << "[VFS-PULSE] " << globalFileCount << std::endl;
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
                    
                    if (fileSize.QuadPart < 250 * 1024 * 1024ULL) {
                        double entropy = calculateEntropy(fullPath, fileSize.QuadPart);
                        if (entropy >= 7.2) {
                            std::cout << "[VFS-ENTROPY] " << fullPath << "|" << std::fixed << std::setprecision(2) << entropy << std::endl;
                        }
                    }
                }
            }
        }

    } while (FindNextFileA(hFind, &findFileData) != 0);

    FindClose(hFind);
}

int main(int argc, char* argv[]) {
    std::cout << "\n[PHASR] NATIVE C++ ORCHESTRATOR INITIALIZED" << std::endl;
    std::cout << "[PHASR] Bypassing Node.js V8 Engine..." << std::endl;

    std::string targetDir = "C:\\";
    if (argc > 1) {
        targetDir = argv[1];
    }

    std::cout << "[PHASR] Commencing native kernel-level scan on: " << targetDir << std::endl;
    std::cout << "[PHASR] Standby. Brute-forcing physical mass...\n" << std::endl;

    DWORD startTime = GetTickCount();
    ScanDirectoryNative(targetDir);
    DWORD endTime = GetTickCount();

    std::cout << "[VFS-MASS] " << globalMass << std::endl;
    analyzeShadowVolume(targetDir);
    std::cout << "\n[PHASR] SCAN COMPLETE." << std::endl;
    std::cout << "[PHASR] Time Elapsed: " << (endTime - startTime) << " milliseconds." << std::endl;
    return 0;
}
