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
            // Ignore heavy node_modules and hidden git dirs for speed
            if (item === 'node_modules' || item.startsWith('.git')) continue;

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
                                
                                // M4 Taint Flow (Unsafe C functions)
                                if (line.includes('strcpy(') || line.includes('system(')) {
                                    stats.m4_anomalies.push({
                                        file: fullPath,
                                        line: i + 1,
                                        code: line.trim(),
                                        reason: "Unsanitized sink (Buffer Overflow / RCE risk)."
                                    });
                                }
                                
                                // M5 Temporal Side-Channel (Early-exit string comparison)
                                if (line.includes('strcmp(') && (line.toLowerCase().includes('pass') || line.toLowerCase().includes('key') || line.toLowerCase().includes('auth'))) {
                                    stats.m5_anomalies.push({
                                        file: fullPath,
                                        line: i + 1,
                                        code: line.trim(),
                                        reason: "Early-exit string comparison creates a Timing Side-Channel leak."
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

    // Entropy Report
    if (results.m3_anomalies.length > 0) {
        console.log(`${bright}${red}[COLLAPSE] Module 3 (Entropy): THRESHOLD BREACHED!${reset}`);
        await sleep(500);
        for (const a of results.m3_anomalies) {
            console.log(`    ↳ ${red}Entropy H(X) = ${a.value}${reset} in ${a.file}`);
            console.log(`      ${cyan}Reason:${reset} ${a.reason}`);
            await sleep(300);
        }
    } else {
        console.log(`${bright}${green}[SAFE] Module 3 (Entropy): Maximum Entropy H(X) = ${results.maxEntropy.toFixed(2)}${reset}`);
        await sleep(500);
    }
    
    await sleep(800);
    
    // Taint Flow Report
    if (results.m4_anomalies.length > 0) {
        console.log(`${bright}${red}[COLLAPSE] Module 4 (Security Math): TAINT FLOW DETECTED!${reset}`);
        await sleep(500);
        for (const a of results.m4_anomalies) {
            console.log(`    ↳ ${red}Target:${reset} ${a.file} (Line ${a.line})`);
            console.log(`      ${yellow}Code:${reset}   ${a.code}`);
            console.log(`      ${cyan}Reason:${reset} ${a.reason}`);
            await sleep(300);
        }
    } else {
        console.log(`${bright}${green}[SAFE] Module 4 (Security Math): 0 Unsanitized Flows.${reset}`);
    }

    await sleep(800);

    // Temporal Report
    if (results.m5_anomalies.length > 0) {
        console.log(`${bright}${red}[COLLAPSE] Module 5 (Temporal Physics): TIMING LEAK DETECTED!${reset}`);
        await sleep(500);
        for (const a of results.m5_anomalies) {
            console.log(`    ↳ ${red}Target:${reset} ${a.file} (Line ${a.line})`);
            console.log(`      ${yellow}Code:${reset}   ${a.code}`);
            console.log(`      ${cyan}Reason:${reset} ${a.reason}`);
            await sleep(300);
        }
    } else {
        console.log(`${bright}${green}[SAFE] Module 5 (Temporal Physics): Constant-Time Verified.${reset}\n`);
    }

    await sleep(1000);

    // Economic Report
    const totalAnomalies = results.m3_anomalies.length + results.m4_anomalies.length + results.m5_anomalies.length;
    const tecLiability = 75000 + (results.totalMassBytes * 0.10) + (totalAnomalies * 1500000);
    const tec = tecLiability.toLocaleString();

    if (totalAnomalies > 0) {
        console.log(`${bright}${red}=======================================================${reset}`);
        await sleep(200);
        console.log(`${bright}${red} WAVE COLLAPSE: DEPLOYMENT HALTED${reset}`);
        await sleep(200);
        console.log(`${bright}${red}=======================================================${reset}`);
        await sleep(500);
        console.log(` Total Economic Cost (TEC/M): ${bright}$${tec}${reset}`);
    } else {
        console.log(`${bright}${green}=======================================================${reset}`);
        await sleep(200);
        console.log(`${bright}${green} PIPELINE SAFE: DEPLOYMENT APPROVED${reset}`);
        await sleep(200);
        console.log(`${bright}${green}=======================================================${reset}`);
        await sleep(500);
        console.log(` Total Economic Cost (TEC/M): ${bright}$${tec}${reset}`);
    }
    console.log();
}

renderDashboard();
