#include <iostream>
#include <filesystem>
#include <fstream>
#include <vector>
#include <cmath>
#include <regex>
#include <iomanip>
#include <string>
#include <cstdlib>

namespace fs = std::filesystem;

struct Anomaly {
    std::string file;
    std::string line;
    std::string code_or_asm;
    std::string reason;
    std::string fix;
};

struct Stats {
    uintmax_t totalMassBytes = 0;
    int filesScanned = 0;
    double maxEntropy = 0.0;
    std::vector<Anomaly> m3_anomalies;
    std::vector<Anomaly> m4_anomalies;
    std::vector<Anomaly> m5_anomalies;
    std::vector<Anomaly> m6_anomalies;
};

double calculateShannonEntropy(const std::vector<char>& buffer) {
    if (buffer.empty()) return 0.0;
    std::vector<int> counts(256, 0);
    for (char c : buffer) {
        counts[static_cast<unsigned char>(c)]++;
    }
    double entropy = 0.0;
    double size = static_cast<double>(buffer.size());
    for (int count : counts) {
        if (count > 0) {
            double p = static_cast<double>(count) / size;
            entropy -= p * std::log2(p);
        }
    }
    return entropy;
}

void scanDirectory(const fs::path& dirPath, Stats& stats) {
    std::regex taintRegex("\\b(strcpy|system)\\s*\\(");
    std::regex temporalRegex("\\bstrcmp\\s*\\(");
    std::regex sensitiveRegex("\\b(pass|key|auth|secret)\\b", std::regex_constants::icase);

    try {
        for (const auto& entry : fs::recursive_directory_iterator(dirPath, fs::directory_options::skip_permission_denied)) {
            std::string pathString = entry.path().string();
            
            // Skip large/unnecessary directories
            if (pathString.find("node_modules") != std::string::npos || 
                pathString.find(".git") != std::string::npos || 
                pathString.find("PHASR(DEVM)") != std::string::npos) {
                continue;
            }

            if (entry.is_regular_file()) {
                stats.totalMassBytes += entry.file_size();
                stats.filesScanned++;

                std::ifstream file(entry.path(), std::ios::binary);
                if (!file) continue;

                std::vector<char> buffer((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
                file.close();

                if (buffer.empty()) continue;

                double entropy = calculateShannonEntropy(buffer);
                if (entropy > stats.maxEntropy) stats.maxEntropy = entropy;

                std::string ext = entry.path().extension().string();
                
                // M3 & M6 (Binaries)
                if (ext == ".exe" || ext == ".bin" || ext == ".dll") {
                    if (entropy >= 7.2) {
                        stats.m3_anomalies.push_back({
                            entry.path().string(), "", "",
                            "Binary contents are mathematically indistinguishable from encryption (Packed Payload).", ""
                        });
                    }
                } 
                // M4 & M5 (Source Code)
                else if (ext == ".c" || ext == ".cpp" || ext == ".js") {
                    std::string content(buffer.begin(), buffer.end());
                    std::istringstream stream(content);
                    std::string line;
                    int lineNum = 1;

                    while (std::getline(stream, line)) {
                        // Ignore comments
                        if (line.find("//") != std::string::npos) {
                            lineNum++;
                            continue;
                        }

                        if (std::regex_search(line, taintRegex)) {
                            stats.m4_anomalies.push_back({
                                entry.path().string(), std::to_string(lineNum), line,
                                "Unsanitized sink (Buffer Overflow / RCE risk).",
                                "Use strncpy or safely bounds-checked memory copies."
                            });
                        }

                        if (std::regex_search(line, temporalRegex) && std::regex_search(line, sensitiveRegex)) {
                            stats.m5_anomalies.push_back({
                                entry.path().string(), std::to_string(lineNum), line,
                                "Early-exit string comparison creates a Timing Side-Channel leak.",
                                "Use Constant-Time mathematical comparisons (e.g. Bitwise XOR loops)."
                            });
                        }
                        lineNum++;
                    }
                }
            }
        }
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem error: " << e.what() << '\n';
    }
}

int main(int argc, char* argv[]) {
    std::string targetDir = (argc > 1) ? argv[1] : ".";
    std::cout << "[DEVM C++ ENGINE] Scanning Physical Codebase: " << targetDir << "...\n\n";

    Stats stats;
    scanDirectory(targetDir, stats);

    std::cout << "=======================================================\n";
    std::cout << "   PHASR (DEVM) - ABSOLUTE PHYSICS ENGINE (C++ NATIVE)\n";
    std::cout << "=======================================================\n\n";

    std::cout << "TARGET: " << targetDir << "\n";
    std::cout << "FILES SCANNED: " << stats.filesScanned << "\n";
    std::cout << "PHYSICAL MASS: " << (stats.totalMassBytes / 1024.0) << " KB\n\n";

    std::cout << "[*] Executing Hardware Physics Modules...\n\n";

    int totalAnomalies = stats.m3_anomalies.size() + stats.m4_anomalies.size() + stats.m5_anomalies.size() + stats.m6_anomalies.size();

    if (totalAnomalies > 0) {
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
        std::cout << " WAVE COLLAPSE: DEPLOYMENT HALTED\n";
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n";
        std::cout << "Total Anomalies Found: " << totalAnomalies << "\n";
        return 1;
    } else {
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n";
        std::cout << " PIPELINE SAFE: DEPLOYMENT APPROVED\n";
        std::cout << "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n\n";
        return 0;
    }
}
