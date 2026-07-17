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

double calculateEntropy(const std::string& filePath) {
    std::ifstream file(filePath, std::ios::binary);
    if (!file) return 0.0;
    
    std::vector<long long> counts(256, 0);
    long long totalBytes = 0;
    char buffer[8192];
    
    while (file.read(buffer, sizeof(buffer)) || file.gcount() > 0) {
        std::streamsize bytes = file.gcount();
        calculate_frequencies_asm(reinterpret_cast<const unsigned char*>(buffer), bytes, counts.data());
        totalBytes += bytes;
    }
    
    if (totalBytes == 0) return 0.0;
    
    double entropy = 0.0;
    for (long long freq : counts) {
        if (freq > 0) {
            double p = static_cast<double>(freq) / totalBytes;
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

            // Convert filename to lowercase for extension check
            std::string lowerName = fileName;
            for (char &c : lowerName) c = tolower(c);

            if (endsWith(lowerName, ".exe") || endsWith(lowerName, ".dll") || endsWith(lowerName, ".sys") || endsWith(lowerName, ".bin")) {
                if (fileSize.QuadPart < 250 * 1024 * 1024ULL) { // Skip entropy math on files > 250MB to prevent I/O blocking
                    double entropy = calculateEntropy(fullPath);
                    if (entropy >= 7.2) {
                        std::cout << "[VFS-ENTROPY] " << fullPath << "|" << std::fixed << std::setprecision(2) << entropy << std::endl;
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
