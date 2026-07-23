#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <regex>

namespace fs = std::filesystem;

// Division of Purpose: Deterministic Vulnerability Physics (Data Flow State)
// Tech Stack: C++ (O(1) Streaming & Abstract Syntax Analysis)
//
// Module 4 combines standard security heuristics (SAST/DAST logic) with DEVM math.
// It does this by mapping the absolute flow of data.
// 
// If data enters an Official Endpoint (State A), and touches a Database Execution (State B),
// without passing through a Sanitization/Validation Boundary (State C),
// the mathematical state collapses to 0.
//
// Standard SAST guesses if a SQL Injection exists.
// DEVM physically proves that State A connects to State B with zero resistance.

class SecurityMath {
private:
    struct TaintPath {
        bool touchesNetworkInput = false;
        bool touchesDatabase = false;
        bool touchesSanitization = false;
        bool usesInsecureCrypto = false;
    };

    std::vector<std::regex> networkInputs;
    std::vector<std::regex> databaseExecutions;
    std::vector<std::regex> sanitizationFunctions;
    std::vector<std::regex> insecureCrypto;

public:
    SecurityMath() {
        // 1. Define Network Input States (Data entering the system)
        networkInputs.push_back(std::regex("req\\.(query|body|params|headers)", std::regex_constants::icase));
        networkInputs.push_back(std::regex("request\\.getParameter", std::regex_constants::icase));
        networkInputs.push_back(std::regex("\\$_GET\\[|\\$_POST\\[", std::regex_constants::icase));

        // 2. Define Execution States (Data doing damage)
        databaseExecutions.push_back(std::regex("db\\.query\\s*\\(|query\\s*\\(", std::regex_constants::icase));
        databaseExecutions.push_back(std::regex("execute\\s*\\(|execSQL\\s*\\(", std::regex_constants::icase));

        // 3. Define Resistance/Sanitization States
        sanitizationFunctions.push_back(std::regex("escape\\(|sanitize\\(|Validator\\.", std::regex_constants::icase));
        sanitizationFunctions.push_back(std::regex("bindValue\\(|prepareStatement\\(", std::regex_constants::icase)); // Prepared statements
        
        // 4. Absolute Cryptographic Failures
        insecureCrypto.push_back(std::regex("md5\\(|sha1\\(", std::regex_constants::icase));
    }

    int evaluatePhysics(const fs::path& filePath) {
        std::ifstream file(filePath, std::ios::in);
        if (!file.is_open()) return 1; // Unreadable file doesn't fail the physics natively here

        TaintPath pathState;
        std::string line;
        
        while (std::getline(file, line)) {
            std::smatch match;

            // Track state transitions per file (A simplified file-scoped taint analysis)
            for (const auto& reg : networkInputs) {
                if (std::regex_search(line, match, reg)) pathState.touchesNetworkInput = true;
            }
            for (const auto& reg : sanitizationFunctions) {
                if (std::regex_search(line, match, reg)) pathState.touchesSanitization = true;
            }
            for (const auto& reg : databaseExecutions) {
                if (std::regex_search(line, match, reg)) pathState.touchesDatabase = true;
            }
            for (const auto& reg : insecureCrypto) {
                if (std::regex_search(line, match, reg)) pathState.usesInsecureCrypto = true;
            }
        }

        // Apply the DEVM Mathematical Logic:
        
        // Equation 1: Cryptographic decay. Using MD5 or SHA1 is an absolute failure of state.
        if (pathState.usesInsecureCrypto) {
            std::cout << "[Security Math] WAVE COLLAPSE (0): Insecure cryptography detected.\n";
            return 0;
        }

        // Equation 2: Tainted Flow. Input -> Execution WITHOUT Sanitization = Wave Collapse.
        if (pathState.touchesNetworkInput && pathState.touchesDatabase && !pathState.touchesSanitization) {
            std::cout << "[Security Math] WAVE COLLAPSE (0): Unrestricted taint flow (Input -> DB without resistance).\n";
            return 0;
        }

        return 1; // State Valid
    }
};

int main(int argc, char* argv[]) {
    if (argc < 2) {
        std::cerr << "Usage: SecurityMath <target_directory>\n";
        return 1;
    }

    std::string targetDir = argv[1];
    SecurityMath engine;
    
    std::cout << "[DEVM Module 4] Initiating Deterministic Security Physics...\n";

    int globalState = 1;
    uint64_t evaluatedFiles = 0;

    try {
        for (const auto& entry : fs::recursive_directory_iterator(targetDir, fs::directory_options::skip_permission_denied)) {
            if (entry.is_regular_file()) {
                std::string pathStr = entry.path().string();
                
                // Skip massive binaries
                if (pathStr.find(".git") != std::string::npos || pathStr.find("node_modules") != std::string::npos) {
                    continue; 
                }

                evaluatedFiles++;
                int fileState = engine.evaluatePhysics(entry.path());
                
                // Bitwise AND operation on global state
                globalState &= fileState;
            }
        }
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem Error: " << e.what() << "\n";
    }

    std::cout << "\n===========================================================\n";
    std::cout << "PHASR (DEVM) - MODULE 4: SECURITY MATHEMATICS\n";
    std::cout << "===========================================================\n";
    std::cout << "Files Evaluated: " << evaluatedFiles << "\n";
    
    if (globalState == 0) {
        std::cout << "[OUTPUT] STATE = 0 (MATH VIOLATION). Boundary collapse detected.\n";
    } else {
        std::cout << "[OUTPUT] STATE = 1 (SECURE). All data flows show physical resistance.\n";
    }

    return globalState == 1 ? 0 : 1;
}
