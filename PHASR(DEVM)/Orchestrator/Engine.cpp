#include <iostream>
#include <windows.h>
#include <string>

// Absolute bare-metal C++ Orchestrator
// Bypasses V8 Node.js completely to natively scan Windows drives

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

        std::string fullPath = directory + "\\" + fileName;

        if (findFileData.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {
            // Recursive native traversal
            // Uncomment the next line if you want to see it print every single folder it rips through:
            // std::cout << "[VFS-DIR] " << fullPath << std::endl;
            ScanDirectoryNative(fullPath);
        } else {
            // It's a file, grab the physical mass without opening the file
            LARGE_INTEGER fileSize;
            fileSize.LowPart = findFileData.nFileSizeLow;
            fileSize.HighPart = findFileData.nFileSizeHigh;
            // std::cout << "[VFS-FILE] " << fullPath << " (" << fileSize.QuadPart << " bytes)" << std::endl;
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

    std::cout << "\n[PHASR] SCAN COMPLETE." << std::endl;
    std::cout << "[PHASR] Time Elapsed: " << (endTime - startTime) << " milliseconds." << std::endl;
    return 0;
}
