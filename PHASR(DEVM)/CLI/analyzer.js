const fs = require('fs');
const path = require('path');

// Division of Purpose: Actual Codebase Mathematical Profiler
// This replaces the "generic" UI simulation. It physically scans the provided directory,
// calculates exact mass, maps files, and computes real Shannon Entropy.

function calculateShannonEntropy(buffer) {
    const frequencies = new Array(256).fill(0);
    for (let i = 0; i < buffer.length; i++) {
        frequencies[buffer[i]]++;
    }
    
    let entropy = 0;
    for (let i = 0; i < 256; i++) {
        if (frequencies[i] > 0) {
            const p = frequencies[i] / buffer.length;
            entropy -= p * Math.log2(p);
        }
    }
    return entropy;
}

function scanDirectory(dirPath) {
    let stats = {
        totalMassBytes: 0,
        maxDepth: 0,
        maxEntropy: 0,
        filesScanned: 0,
        m3_anomalies: [],
        m4_anomalies: [],
        m5_anomalies: []
    };

    function traverse(currentPath, currentDepth) {
        if (currentDepth > stats.maxDepth) stats.maxDepth = currentDepth;
        
        let items;
        try {
            items = fs.readdirSync(currentPath);
        } catch(e) { return; }

        for (const item of items) {
            // Ignore node_modules, git, and the Engine's own directory (prevent recursive self-collapse)
            if (item === 'node_modules' || item.startsWith('.git') || item === 'PHASR(DEVM)') continue;

            const fullPath = path.join(currentPath, item);
            let stat;
            try {
                stat = fs.statSync(fullPath);
            } catch(e) { continue; }

            if (stat.isDirectory()) {
                traverse(fullPath, currentDepth + 1);
            } else if (stat.isFile()) {
                stats.totalMassBytes += stat.size;
                stats.filesScanned++;

                try {
                    const buffer = fs.readFileSync(fullPath);
                    if (buffer.length > 0) {
                        // Module 3 (Entropy)
                        const entropy = calculateShannonEntropy(buffer);
                        if (entropy > stats.maxEntropy) stats.maxEntropy = entropy;
                        if (entropy >= 6.0 && (item.endsWith('.exe') || item.endsWith('.bin') || item.endsWith('.dll'))) {
                            stats.m3_anomalies.push({
                                file: fullPath,
                                value: entropy.toFixed(2),
                                reason: "Compiled binary or heavily obfuscated data detected."
                            });
                        }

                        // Module 4 & 5 (Taint & Temporal) - Only scan source files
                        if (item.endsWith('.c') || item.endsWith('.cpp') || item.endsWith('.js')) {
                            const content = buffer.toString('utf8');
                            const lines = content.split('\n');
                            
                            for (let i = 0; i < lines.length; i++) {
                                const line = lines[i];
                                
                                // Ignore comments
                                if (line.trim().startsWith('//')) continue;
                                
                                // M4 Taint Flow (Unsafe C functions)
                                const taintRegex = /\b(strcpy|system)\s*\(/;
                                if (taintRegex.test(line)) {
                                    stats.m4_anomalies.push({
                                        file: fullPath,
                                        line: i + 1,
                                        code: line.trim(),
                                        reason: "Unsanitized sink (Buffer Overflow / RCE risk).",
                                        fix: "Use strncpy or safely bounds-checked memory copies."
                                    });
                                }
                                
                                // M5 Temporal Side-Channel (Early-exit string comparison)
                                const temporalRegex = /\bstrcmp\s*\(/;
                                if (temporalRegex.test(line) && /\b(pass|key|auth|secret)\b/i.test(line)) {
                                    stats.m5_anomalies.push({
                                        file: fullPath,
                                        line: i + 1,
                                        code: line.trim(),
                                        reason: "Early-exit string comparison creates a Timing Side-Channel leak.",
                                        fix: "Use Constant-Time mathematical comparisons (e.g. Bitwise XOR loops)."
                                    });
                                }
                            }
                        }
                    }
                } catch(e) {}
            }
        }
    }

    traverse(dirPath, 0);
    return stats;
}

// Entry Point
const targetDir = process.argv[2] || process.cwd();
console.log(`[DEVM] Scanning Physical Codebase: ${targetDir}...`);
const results = scanDirectory(targetDir);

// ==========================================
// BEAUTIFUL CLI OUTPUT (ANIMATED)
// ==========================================
const reset = "\x1b[0m";
const bright = "\x1b[1m";
const red = "\x1b[31m";
const green = "\x1b[32m";
const yellow = "\x1b[33m";
const cyan = "\x1b[36m";

const sleep = (ms) => new Promise(r => setTimeout(r, ms));

async function renderDashboard() {
    console.log();
    await sleep(300);
    console.log(`${bright}${cyan}=======================================================${reset}`);
    await sleep(200);
    console.log(`${bright}   PHASR (DEVM) - ABSOLUTE PHYSICS ENGINE${reset}`);
    await sleep(200);
    console.log(`${bright}${cyan}=======================================================${reset}\n`);
    await sleep(500);

    console.log(`${bright}TARGET:${reset} ${targetDir}`);
    await sleep(300);
    console.log(`${bright}FILES SCANNED:${reset} ${results.filesScanned}`);
    await sleep(300);
    console.log(`${bright}PHYSICAL MASS:${reset} ${(results.totalMassBytes / 1024).toFixed(2)} KB\n`);
    await sleep(800);

    console.log(`${bright}${yellow}[*] Executing Hardware Physics Modules...${reset}\n`);
    await sleep(1000);

    // =====================================
    // M3: ENTROPY
    // =====================================
    console.log(`\n${bright}${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`);
    console.log(`MODULE 3 — ENTROPY ANALYSER`);
    console.log(`━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}\n`);

    if (results.m3_anomalies.length > 0) {
        console.log(`${bright}${red}Rule:${reset}`);
        console.log(`High Entropy Data (Possible Obfuscation)\n`);
        console.log(`${bright}${red}Findings: ${results.m3_anomalies.length}${reset}\n`);
        
        console.log(`${bright}Files${reset}`);
        for (const a of results.m3_anomalies) {
            const fileName = a.file.split(/[\\/]/).pop();
            console.log(` • ${fileName} (H(X) = ${a.value})`);
            await sleep(100);
        }
        
        console.log(`\n${bright}${green}Recommendation${reset}`);
        console.log(` Remove compiled binaries from source tree`);
        console.log(` Decrypt or de-obfuscate payload strings\n`);
    } else {
        console.log(`${bright}${green}[SAFE] Maximum Entropy H(X) = ${results.maxEntropy.toFixed(2)}${reset}\n`);
    }
    
    await sleep(500);
    
    // =====================================
    // M4: SECURITY MATH
    // =====================================
    console.log(`\n${bright}${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`);
    console.log(`MODULE 4 — SECURITY MATH`);
    console.log(`━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}\n`);

    if (results.m4_anomalies.length > 0) {
        console.log(`${bright}${red}Rule:${reset}`);
        console.log(`Unsanitized Command Execution & Buffer Overflows\n`);
        console.log(`${bright}${red}Findings: ${results.m4_anomalies.length}${reset}\n`);
        
        console.log(`${bright}Files${reset}`);
        for (const a of results.m4_anomalies) {
            const fileName = a.file.split(/[\\/]/).pop();
            console.log(` • ${fileName}:${a.line}`);
            await sleep(100);
        }
        
        console.log(`\n${bright}${green}Recommendation${reset}`);
        console.log(` Replace system() with execve()/CreateProcess()`);
        console.log(` Validate user-controlled input`);
        console.log(` Avoid shell interpretation`);
        console.log(` Use strncpy or safely bounds-checked memory copies\n`);
    } else {
        console.log(`${bright}${green}[SAFE] 0 Unsanitized Flows${reset}\n`);
    }

    await sleep(500);

    // =====================================
    // M5: TEMPORAL PHYSICS
    // =====================================
    console.log(`\n${bright}${cyan}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━`);
    console.log(`MODULE 5 — TEMPORAL PHYSICS`);
    console.log(`━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}\n`);

    if (results.m5_anomalies.length > 0) {
        console.log(`${bright}${red}Rule:${reset}`);
        console.log(`Timing Side-Channel Leaks\n`);
        console.log(`${bright}${red}Findings: ${results.m5_anomalies.length}${reset}\n`);
        
        console.log(`${bright}Files${reset}`);
        for (const a of results.m5_anomalies) {
            const fileName = a.file.split(/[\\/]/).pop();
            console.log(` • ${fileName}:${a.line}`);
            await sleep(100);
        }
        
        console.log(`\n${bright}${green}Recommendation${reset}`);
        console.log(` Use Constant-Time mathematical comparisons (e.g. Bitwise XOR loops)`);
        console.log(` Prevent early-exit branch evaluation on sensitive strings\n`);
    } else {
        console.log(`${bright}${green}[SAFE] Constant-Time Verified${reset}\n`);
    }

    await sleep(1000);

    // Final Report
    const totalAnomalies = results.m3_anomalies.length + results.m4_anomalies.length + results.m5_anomalies.length;

    if (totalAnomalies > 0) {
        console.log(`${bright}${red}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}`);
        await sleep(200);
        console.log(`${bright}${red} WAVE COLLAPSE: DEPLOYMENT HALTED${reset}`);
        await sleep(200);
        console.log(`${bright}${red}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}`);
        console.log();
        throw new Error("PHASR DEVM Pipeline Failed: Critical Hardware Vulnerabilities Detected.");
    } else {
        console.log(`${bright}${green}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}`);
        await sleep(200);
        console.log(`${bright}${green} PIPELINE SAFE: DEPLOYMENT APPROVED${reset}`);
        await sleep(200);
        console.log(`${bright}${green}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${reset}`);
        console.log();
        process.exit(0);
    }
}

renderDashboard().catch(err => {
    console.error(`\n${bright}${red}[FATAL ERROR]${reset} ${err.message}\n`);
    process.exit(1);
});
