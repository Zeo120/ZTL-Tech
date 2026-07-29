#include <iostream>
#include <fstream>
#include <filesystem>
#include <regex>
#include <string>
#include <vector>
#include <map>
#include <set>

namespace fs = std::filesystem;

// Division of Purpose: Internal Codebase Scanning (Memory Safe)
// Tech Stack: C++ (Native File I/O & Regex)
//
// This C++ module replaces the Node.js scanners (DomainAutoDiscovery, OfficialEndpoints, UnofficialEndpoints).
// It traverses the target directory and reads files line-by-line (O(1) memory) to prevent 
// the Heap Out Of Memory (OOM) crashes that V8 encounters on massive repositories like node_modules.

void processFile(const fs::path& filePath, 
                 std::map<std::string, int>& discoveredDomains, 
                 std::set<std::string>& officialEndpoints,
                 std::set<std::string>& unofficialEndpoints) {
    
    std::ifstream file(filePath, std::ios::in);
    if (!file.is_open()) return;

    std::string filename = filePath.filename().string();
    std::string ext = filePath.extension().string();

    // Regex Definitions
    std::regex envRegex("https?://([a-zA-Z0-9_\\-\\.]+)");
    std::regex corsRegex("cors\\s*\\(\\s*\\{\\s*origin\\s*:\\s*['\"]https?://([a-zA-Z0-9_\\-\\.]+)['\"]", std::regex_constants::icase);
    
    // Official Endpoint Regex
    std::regex expressRegex("app\\.(get|post|put|delete|patch)\\s*\\(\\s*['\"]([^'\"]+)['\"]", std::regex_constants::icase);
    std::regex springRegex("@(GetMapping|PostMapping|PutMapping|DeleteMapping)\\s*\\(\\s*['\"]([^'\"]+)['\"]", std::regex_constants::icase);
    
    // Unofficial/Shadow Endpoint Regex
    std::regex fetchRegex("(fetch|axios\\.(get|post)|XMLHttpRequest\\.open)\\s*\\(\\s*['\"](/[^'\"]+)['\"]", std::regex_constants::icase);
    std::regex dynamicRouteRegex("app\\.(use|all)\\s*\\(\\s*([a-zA-Z0-9_]+)\\s*,", std::regex_constants::icase);
    std::regex httpRegex("http\\.createServer\\s*\\(", std::regex_constants::icase);

    std::string line;
    while (std::getline(file, line)) {
        std::smatch match;

        // 1. Domain Auto Discovery
        if (filename == "CNAME") {
            if (line.length() > 0 && line.length() < 256) {
                discoveredDomains[line] += 100;
            }
        } else if (filename.find(".env") != std::string::npos) {
            if (std::regex_search(line, match, envRegex)) {
                discoveredDomains[match[1]] += 30;
            }
        }

        if (ext == ".js" || ext == ".ts" || ext == ".py" || ext == ".go" || ext == ".java") {
            if (std::regex_search(line, match, corsRegex)) {
                discoveredDomains[match[1]] += 80;
            }

            // 2. Official Endpoints
            if (std::regex_search(line, match, expressRegex)) {
                officialEndpoints[match[1].str() + ":" + match[2].str()] = true;
            } else if (std::regex_search(line, match, springRegex)) {
                officialEndpoints[match[1].str() + ":" + match[2].str()] = true;
            }

            // 3. Unofficial Endpoints
            if (std::regex_search(line, match, fetchRegex)) {
                unofficialEndpoints["SHADOW_ROUTE:" + match[3].str()] = true;
            } else if (std::regex_search(line, match, dynamicRouteRegex)) {
                unofficialEndpoints["SHADOW_DYNAMIC_ROUTE:VAR_" + match[2].str()] = true;
            } else if (std::regex_search(line, match, httpRegex)) {
                unofficialEndpoints["SHADOW_ROGUE_SERVER_BINDING"] = true;
            }
        }
    }
}

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: CodebaseScanner <target_directory>\n";
        return 1;
    }

    std::string targetDir = argv[1];
    
    std::map<std::string, int> discoveredDomains;
    std::set<std::string> officialEndpoints;
    std::set<std::string> unofficialEndpoints;

    std::cout << "[DEVM C++] Initiating O(1) Memory Codebase Scan...\n";

    try {
        for (const auto& entry : fs::recursive_directory_iterator(targetDir, fs::directory_options::skip_permission_denied)) {
            if (entry.is_regular_file()) {
                std::string pathStr = entry.path().string();
                
                // Skip massive build artifacts, but keep node_modules for shadow detection
                if (pathStr.find(".git") != std::string::npos || 
                    pathStr.find("dist") != std::string::npos || 
                    pathStr.find("build") != std::string::npos) {
                    continue;
                }

                processFile(entry.path(), discoveredDomains, officialEndpoints, unofficialEndpoints);
            }
        }
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem Error: " << e.what() << "\n";
    }

    // Output structured text so the Node.js Aggregator can parse it
    std::cout << "--- DOMAINS ---\n";
    for (const auto& [domain, score] : discoveredDomains) {
        std::cout << domain << "|" << score << "\n";
    }

    std::cout << "--- OFFICIAL ---\n";
    for (const auto& endpoint : officialEndpoints) {
        std::cout << endpoint << "\n";
    }

    std::cout << "--- UNOFFICIAL ---\n";
    for (const auto& endpoint : unofficialEndpoints) {
        std::cout << endpoint << "\n";
    }

    return 0;
}
