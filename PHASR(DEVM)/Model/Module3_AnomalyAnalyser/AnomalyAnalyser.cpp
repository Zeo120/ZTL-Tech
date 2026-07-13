#include <iostream>
#include <fstream>
#include <filesystem>
#include <string>
#include <vector>
#include <regex>

namespace fs = std::filesystem;

// Division of Purpose: Absolute Anomaly & Malware Signature Detection
// Tech Stack: C++ (O(1) Memory Streaming, Regex)
//
// Module 3 does not care about routing or physical depth. It is purely offensive 
// anomaly detection. It parses raw byte streams looking for heuristic signatures 
// of malware, reverse shells, packers, or obfuscated payloads.
// If any mathematical anomaly is detected, the state for that file collapses to 0.

struct AnomalyResult {
    bool hasAnomaly;
    std::string reason;
};

class AnomalyAnalyser {
private:
    std::vector<std::pair<std::regex, std::string>> anomalySignatures;

public:
    AnomalyAnalyser() {
        // High-confidence malware / backdoor signatures
        
        // 1. Base64 encoded 'eval' payloads (Common in Node/PHP malware)
        anomalySignatures.push_back({std::regex("eval\\s*\\(\\s*atob\\s*\\(", std::regex_constants::icase), "Base64 Obfuscated Execution (eval+atob)"});
        anomalySignatures.push_back({std::regex("eval\\s*\\(\\s*Buffer\\.from", std::regex_constants::icase), "Buffer Obfuscated Execution (eval+Buffer)"});
        
        // 2. Reverse Shell Bindings (Python, Bash, Node)
        anomalySignatures.push_back({std::regex("child_process\\.exec\\s*\\(\\s*['\"]/bin/sh", std::regex_constants::icase), "Direct /bin/sh Process Binding"});
        anomalySignatures.push_back({std::regex("nc\\s+-e\\s+/bin/(ba)?sh", std::regex_constants::icase), "Netcat Reverse Shell Signature"});
        anomalySignatures.push_back({std::regex("socket\\.socket\\(socket\\.AF_INET", std::regex_constants::icase), "Raw TCP Socket Creation (Possible Shell)"});
        
        // 3. Destructive Payloads
        anomalySignatures.push_back({std::regex("rm\\s+-rf\\s+/", std::regex_constants::icase), "Destructive Command (rm -rf /)"});
        
        // 4. Memory/Hex Payloads (Shellcode)
        anomalySignatures.push_back({std::regex("\\\\x[0-9a-fA-F]{2}\\\\x[0-9a-fA-F]{2}\\\\x[0-9a-fA-F]{2}", std::regex_constants::icase), "Hex Encoded Shellcode Injection"});
    }

    AnomalyResult scanFile(const fs::path& filePath) {
        std::ifstream file(filePath, std::ios::in);
        if (!file.is_open()) return {false, ""};

        std::string line;
        while (std::getline(file, line)) {
            std::smatch match;
            
            for (const auto& [regexSig, reason] : anomalySignatures) {
                if (std::regex_search(line, match, regexSig)) {
                    return {true, reason};
                }
            }
        }

        return {false, ""};
    }
};

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: AnomalyAnalyser <target_directory>\n";
        return 1;
    }

    std::string targetDir = argv[1];
    AnomalyAnalyser analyser;
    
    std::cout << "[DEVM Module 3] Initiating Anomaly & Malware Scan...\n";

    bool systemCompromised = false;
    uint64_t scannedFiles = 0;

    try {
        for (const auto& entry : fs::recursive_directory_iterator(targetDir, fs::directory_options::skip_permission_denied)) {
            if (entry.is_regular_file()) {
                scannedFiles++;
                AnomalyResult result = analyser.scanFile(entry.path());
                
                if (result.hasAnomaly) {
                    systemCompromised = true;
                    std::cout << "[ANOMALY DETECTED] File: " << entry.path().filename().string() 
                              << " | Signature: " << result.reason << "\n";
                }
            }
        }
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem Error: " << e.what() << "\n";
    }

    std::cout << "\n===========================================================\n";
    std::cout << "PHASR (DEVM) - MODULE 3: ANOMALY ANALYSER RESULTS\n";
    std::cout << "===========================================================\n";
    std::cout << "Total Files Scanned: " << scannedFiles << "\n";
    
    if (systemCompromised) {
        std::cout << "[OUTPUT] STATE = 0 (MALWARE/ANOMALY DETECTED).\n";
        return 1; // Error code for OS bridge
    } else {
        std::cout << "[OUTPUT] STATE = 1 (CLEAN). Zero anomalies found.\n";
        return 0; // Success
    }
}
