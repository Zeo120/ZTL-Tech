#include <iostream>
#include <fstream>
#include <filesystem>
#include <string>
#include <vector>
#include <cmath>
#include <map>

namespace fs = std::filesystem;

// Division of Purpose: Absolute Anomaly Detection via Shannon Entropy
// Tech Stack: C++ (O(1) Memory Streaming, Sliding Window)
//
// Module 3 drops heuristic guessing. It calculates the absolute randomness (entropy)
// of code using a sliding window. Packed malware, obfuscated scripts, and encrypted
// shellcode have an entropy H(X) approaching 6.0 to 8.0. Normal code is ~4.0 to 5.0.
// If any window breaches the hard limit of 5.8, the file state collapses to 0.

struct AnomalyResult {
    bool hasAnomaly;
    double maxEntropy;
    uint64_t byteOffset;
};

class AnomalyAnalyser {
private:
    const size_t WINDOW_SIZE = 128;
    const double ENTROPY_THRESHOLD = 5.8;

    // Shannon Entropy Formula: H(X) = -Sum(P(x) * log2(P(x)))
    double calculateEntropy(const std::vector<char>& window) {
        std::map<char, int> frequencies;
        for (char c : window) {
            frequencies[c]++;
        }

        double entropy = 0.0;
        double windowSize = static_cast<double>(window.size());

        for (const auto& [c, count] : frequencies) {
            double p_x = static_cast<double>(count) / windowSize;
            if (p_x > 0) {
                entropy -= p_x * std::log2(p_x);
            }
        }
        return entropy;
    }

public:
    AnomalyResult scanFile(const fs::path& filePath) {
        std::ifstream file(filePath, std::ios::in | std::ios::binary);
        if (!file.is_open()) return {false, 0.0, 0};

        std::vector<char> window;
        char c;
        uint64_t offset = 0;
        uint64_t maxOffset = 0;
        double highestEntropy = 0.0;

        while (file.get(c)) {
            window.push_back(c);
            if (window.size() > WINDOW_SIZE) {
                window.erase(window.begin());
            }

            if (window.size() == WINDOW_SIZE) {
                double currentEntropy = calculateEntropy(window);
                if (currentEntropy > highestEntropy) {
                    highestEntropy = currentEntropy;
                    maxOffset = offset;
                }

                if (currentEntropy >= ENTROPY_THRESHOLD) {
                    // Absolute constraint breached
                    return {true, currentEntropy, offset};
                }
            }
            offset++;
        }

        return {false, highestEntropy, maxOffset};
    }
};

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: AnomalyAnalyser <target_directory>\n";
        return 1;
    }

    std::string targetDir = argv[1];
    AnomalyAnalyser analyser;
    
    std::cout << "[DEVM Module 3] Initiating Shannon Entropy Sliding Window Scan...\n";

    bool systemCompromised = false;
    uint64_t scannedFiles = 0;

    try {
        for (const auto& entry : fs::recursive_directory_iterator(targetDir, fs::directory_options::skip_permission_denied)) {
            if (entry.is_regular_file()) {
                std::string pathStr = entry.path().string();
                
                // Exclude known high-entropy assets like images or certificates for accurate code scanning
                if (pathStr.find(".png") != std::string::npos || pathStr.find(".jpg") != std::string::npos || pathStr.find(".crt") != std::string::npos) {
                    continue;
                }

                scannedFiles++;
                AnomalyResult result = analyser.scanFile(entry.path());
                
                if (result.hasAnomaly) {
                    systemCompromised = true;
                    std::cout << "[ANOMALY DETECTED] File: " << entry.path().filename().string() 
                              << " | Max Entropy: " << result.maxEntropy 
                              << " | Trigger Offset: " << result.byteOffset << " bytes\n";
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
        std::cout << "[OUTPUT] STATE = 0 (MALWARE/OBFUSCATION DETECTED). Entropy threshold breached.\n";
        return 1; // Error code for OS bridge
    } else {
        std::cout << "[OUTPUT] STATE = 1 (CLEAN). Codebase physics are predictable.\n";
        return 0; // Success
    }
}
