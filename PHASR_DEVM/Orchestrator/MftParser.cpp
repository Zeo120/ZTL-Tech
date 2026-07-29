#include <windows.h>
#include <iostream>
#include <string>

int main() {
    std::cout << "[PHASR MFT] Requesting Raw Volume Handle for \\\\.\\C:" << std::endl;
    
    HANDLE hVol = CreateFileA("\\\\.\\C:", GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, NULL);
    if (hVol == INVALID_HANDLE_VALUE) {
        std::cerr << "\x1b[31m[ERROR]\x1b[0m Failed to open raw volume C:. CRITICAL: You MUST run this as Administrator." << std::endl;
        return 1;
    }
    
    USN_JOURNAL_DATA ujd;
    DWORD cb;
    if (!DeviceIoControl(hVol, FSCTL_QUERY_USN_JOURNAL, NULL, 0, &ujd, sizeof(ujd), &cb, NULL)) {
        std::cerr << "\x1b[31m[ERROR]\x1b[0m FSCTL_QUERY_USN_JOURNAL failed. Error: " << GetLastError() << std::endl;
        CloseHandle(hVol);
        return 1;
    }
    
    MFT_ENUM_DATA med;
    med.StartFileReferenceNumber = 0;
    med.LowUsn = 0;
    med.HighUsn = ujd.NextUsn;
    
    char buffer[65536]; // 64KB buffer for extreme throughput
    DWORD bytesReturned = 0;
    long long count = 0;
    
    std::cout << "[PHASR MFT] Access Granted. Enumerating Master File Table (MFT) directly..." << std::endl;
    
    DWORD startTime = GetTickCount();
    
    while (DeviceIoControl(hVol, FSCTL_ENUM_USN_DATA, &med, sizeof(med), buffer, sizeof(buffer), &bytesReturned, NULL)) {
        USN_RECORD* record = (USN_RECORD*)((char*)buffer + sizeof(USN));
        
        while ((char*)record < (char*)buffer + bytesReturned) {
            // In a full implementation, we would extract record->FileReferenceNumber and parent refs to reconstruct the full path,
            // then push it into the SPMC Ring Buffer for the threads to read.
            // For this benchmark, we just count them.
            count++;
            record = (USN_RECORD*)((char*)record + record->RecordLength);
        }
        
        // The first 8 bytes of the buffer contain the next file reference number to query
        med.StartFileReferenceNumber = *(USN*)buffer;
    }
    
    DWORD endTime = GetTickCount();
    
    std::cout << "\x1b[32m[+]\x1b[0m MFT Enum Complete!" << std::endl;
    std::cout << "Files Enumerated: " << count << std::endl;
    std::cout << "Time Elapsed: " << (endTime - startTime) << " ms" << std::endl;
    
    CloseHandle(hVol);
    return 0;
}
