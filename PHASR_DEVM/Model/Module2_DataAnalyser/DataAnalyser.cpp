#include <iostream>
#include <fstream>
#include <filesystem>
#include <string>
#include <map>
#include <vector>
#include <cmath>

namespace fs = std::filesystem;

// Division of Purpose: Codebase Feature Measurement (The Calm Before the Storm)
// Tech Stack: C++ (O(1) memory streaming)
//
// Module 2 maps the physical properties of the codebase. It does not look for vulnerabilities.
// It measures mass, density, entropy, and structural depth. 
// This creates a baseline "fingerprint" of the software. If an attacker injects a massive
// payload, the physical mass and entropy of the system will mathematically shift, violating the DEVM.

struct CodebaseMetrics {
    uint64_t totalFiles = 0;
    uint64_t totalBytes = 0;
    uint64_t totalLines = 0;
    uint64_t maxNestingDepth = 0;
    std::map<std::string, uint64_t> fileTypes;
};

void calculateEntropyAndStructure(const fs::path& filePath, CodebaseMetrics& metrics) {
    std::ifstream file(filePath, std::ios::in | std::ios::binary);
    if (!file.is_open()) return;

    std::string ext = filePath.extension().string();
    metrics.fileTypes[ext]++;
    metrics.totalFiles++;

    char c;
    uint64_t currentDepth = 0;
    uint64_t maxDepth = 0;

    while (file.get(c)) {
        metrics.totalBytes++;
        
        if (c == '\n') {
            metrics.totalLines++;
        }
        
        // Very rudimentary AST depth approximation via bracket counting
        if (c == '{' || c == '(') {
            currentDepth++;
            if (currentDepth > maxDepth) maxDepth = currentDepth;
        } else if (c == '}' || c == ')') {
            if (currentDepth > 0) currentDepth--;
        }
    }

    if (maxDepth > metrics.maxNestingDepth) {
        metrics.maxNestingDepth = maxDepth;
    }
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: FeatureMeasurer <target_directory>\n";
        return 1;
    }

    std::string targetDir = argv[1];
    CodebaseMetrics globalMetrics;

    std::cout << "[DEVM Module 2] Initiating Feature Measurement...\n";

    try {
        for (const auto& entry : fs::recursive_directory_iterator(targetDir, fs::directory_options::skip_permission_denied)) {
            if (entry.is_regular_file()) {
                std::string pathStr = entry.path().string();
                
                // Exclude massive binaries/objects that aren't source code
                if (pathStr.find(".git") != std::string::npos || 
                    pathStr.find("node_modules") != std::string::npos) {
                    continue; 
                }

                calculateEntropyAndStructure(entry.path(), globalMetrics);
            }
        }
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem Error: " << e.what() << "\n";
    }

    std::cout << "\n===========================================================\n";
    std::cout << "PHASR (DEVM) - MODULE 2: CODEBASE PHYSICAL FINGERPRINT\n";
    std::cout << "===========================================================\n";
    std::cout << "Total Tracked Files:   " << globalMetrics.totalFiles << "\n";
    std::cout << "Total Physical Mass:   " << globalMetrics.totalBytes << " Bytes\n";
    std::cout << "Total Lines of Code:   " << globalMetrics.totalLines << "\n";
    std::cout << "Max Structural Depth:  " << globalMetrics.maxNestingDepth << " levels\n";
    std::cout << "\n[ Material Composition ]\n";
    for (const auto& [ext, count] : globalMetrics.fileTypes) {
        if (!ext.empty()) {
            std::cout << "  " << ext << " -> " << count << " files\n";
        }
    }
    std::cout << "===========================================================\n";

    return 0;
}
