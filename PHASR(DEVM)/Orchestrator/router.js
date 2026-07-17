#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const os = require('os');
const { spawnSync, spawn } = require('child_process');

const targetDir = process.argv[2] || process.cwd();

// Physical limits
const MASS_LIMIT_CPP = 200 * 1024; // 200 KB
const MASS_LIMIT_ASM = 1024 * 1024 * 1024; // 1 GB

console.log(`\n[\x1b[35mORCHESTRATOR\x1b[0m] Calculating Physical Mass of Target: ${targetDir}...`);

let totalMass = 0;
let massThresholdReached = false;
let isTargetDirDirectory = true;

try {
    isTargetDirDirectory = fs.statSync(targetDir).isDirectory();
} catch (e) {}

if (isTargetDirDirectory) {
    totalMass = MASS_LIMIT_CPP; // Instantly force C++ Engine for directories
    massThresholdReached = true;
} else {
    try {
        totalMass = fs.statSync(targetDir).size;
    } catch(e) {}
    massThresholdReached = true;
}

console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Measured Mass: ${(totalMass / 1024).toFixed(2)} KB`);

const binDir = path.join(__dirname, '..', '..'); // Project Root
let command = 'node';
let args = [path.join(__dirname, '..', 'CLI', 'analyzer.js'), targetDir];

// OS Platform Detection for Arch/Mac compatibility
const isWin = os.platform() === 'win32';
const binExt = isWin ? '.exe' : '';

if (!isTargetDirDirectory && totalMass >= MASS_LIMIT_ASM) {
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Single File Mass > 1GB. Extreme Compute limits exceeded.`);
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Routing directly to \x1b[31mPURE ASSEMBLY ENGINE\x1b[0m...\n`);
    const asmBinary = path.join(__dirname, `engine_asm${binExt}`);
    if (fs.existsSync(asmBinary)) {
        console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Executing Pure Assembly Hardware Override...`);
        command = asmBinary;
        args = [targetDir];
    } else {
        console.log(`[\x1b[33mWARN\x1b[0m] Pure Assembly Engine not compiled. Falling back to C++ Engine...\n`);
        totalMass = MASS_LIMIT_CPP; // Force C++ fallback
    }
}

if ((isTargetDirDirectory && totalMass >= MASS_LIMIT_CPP) || (!isTargetDirDirectory && totalMass >= MASS_LIMIT_CPP && totalMass < MASS_LIMIT_ASM)) {
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Mass > 200KB. V8 Heap limits exceeded.`);
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Routing directly to \x1b[32mC++ / ASM Hybrid Engine\x1b[0m...\n`);
    const cppBinary = path.join(__dirname, `engine${binExt}`);
    const csBinary = path.join(__dirname, `engine_cs${binExt}`);
    
    if (fs.existsSync(cppBinary)) {
        console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Executing C++17 Master Bypass...`);
        command = cppBinary;
        args = [targetDir];
    } else if (fs.existsSync(csBinary)) {
        console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] C++ Engine missing. Executing C# Zero-Dependency Bypass...`);
        command = csBinary;
        args = [targetDir];
    } else {
        console.log(`[\x1b[33mWARN\x1b[0m] Native Engines not compiled. Falling back to Node.js V8...\n`);
    }
}

if (totalMass < MASS_LIMIT_CPP) {
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Mass < 200KB. Optimal V8 conditions.`);
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Routing to \x1b[36mNode.js Engine\x1b[0m...\n`);
}

// Execute the dynamically selected engine
if (command === 'node') {
    const child = spawnSync(command, args, { stdio: 'inherit' });
    if (child.error) {
        console.error(`[\x1b[31mFATAL\x1b[0m] Node.js Engine Execution Failed:`, child.error.message);
    }
    process.exit(child.status);
} else {
    // Asynchronous Execution for Hardware Engines (Real-time Streaming)
    
    // Pre-calculate total file count for the Progress Bar
    let totalFiles = 1500000;
    if (targetDir.toUpperCase() === 'C:\\' || targetDir.toUpperCase() === 'C:') {
        console.log(`[\x1b[36mPHASR\x1b[0m] Target is Root Drive. Bypassing 25s pre-scan lock...`);
    } else {
        console.log(`[\x1b[36mPHASR\x1b[0m] Pre-allocating NTFS File Count...`);
        const countProc = spawnSync('cmd.exe', ['/c', `dir /s /b /a-d "${targetDir}" 2>nul | find /c /v ""`]);
        totalFiles = parseInt(countProc.stdout ? countProc.stdout.toString().trim() : '0') || 1500000;
    }
    console.log(`[\x1b[36mPHASR\x1b[0m] Recognized \x1b[32m${totalFiles.toLocaleString()}\x1b[0m base files. Initiating Hardware Core...`);

    const child = spawn(command, args, { stdio: ['inherit', 'pipe', 'inherit'] });

    let hwMass = 250 * 1024 * 1024;
    let m3_anomalies = [];
    let m8_anomalies = [];
    let leftover = '';
    const startTime = Date.now();

    child.stdout.on('data', (data) => {
        const chunk = data.toString('utf-8');

        // Parse chunks carefully across newlines
        const lines = (leftover + chunk).split('\n');
        leftover = lines.pop(); // Keep the last incomplete line for the next chunk

        for (const line of lines) {
            const trimmed = line.trim();
            if (trimmed.startsWith('[VFS-PULSE]')) {
                const count = parseInt(trimmed.split(' ')[1]) || 0;
                const elapsedSec = (Date.now() - startTime) / 1000;
                const speed = (count / (elapsedSec || 1)).toFixed(0);
                
                // Calculate percentage and Green Progress Bar
                const percent = Math.min((count / totalFiles) * 100, 100);
                const filled = Math.floor(percent / 2); // 50 chars wide
                const bar = '\x1b[32m' + '█'.repeat(filled) + '\x1b[90m' + '░'.repeat(50 - filled) + '\x1b[0m';
                
                process.stdout.write(`\r[\x1b[36mPHASR\x1b[0m] [${bar}] \x1b[32m${percent.toFixed(2)}%\x1b[0m | ${count.toLocaleString()} / ${totalFiles.toLocaleString()} | ${speed} f/s   `);
            } else if (trimmed.startsWith('[VFS-MASS]')) {
                hwMass = parseInt(trimmed.split(' ')[1]) || hwMass;
            } else if (trimmed.startsWith('[VFS-ENTROPY]')) {
                const parts = trimmed.replace('[VFS-ENTROPY] ', '').split('|');
                if (parts.length === 2) {
                    m3_anomalies.push({
                        file: parts[0].trim(),
                        value: parts[1].trim(),
                        reason: "Binary contents are mathematically indistinguishable from encryption (Packed Payload)."
                    });
                }
            } else if (trimmed.startsWith('[VFS-SHADOW]')) {
                const parts = trimmed.replace('[VFS-SHADOW] ', '').split('|');
                if (parts.length === 3) {
                    const delta = parseInt(parts[2]);
                    if (delta > 500 * 1024 * 1024) { // 500MB leeway for MFT and metadata
                        m8_anomalies.push({
                            file: "PhysicalSector0",
                            value: `${(delta / (1024 * 1024 * 1024)).toFixed(2)} GB Hidden`,
                            reason: "Massive Sector Discrepancy. Files exist physically but are hidden from Windows logical APIs."
                        });
                    }
                }
            }
        }
    });

    child.on('error', (err) => {
        console.error(`[\x1b[31mFATAL\x1b[0m] Hardware Engine Execution Failed:`, err.message);
        process.exit(1);
    });

    child.on('close', (code) => {
        // Write the hardware payload cache
        const cacheData = {
            totalMassBytes: hwMass,
            maxDepth: 0,
            maxEntropy: m3_anomalies.length > 0 ? parseFloat(m3_anomalies[0].value) : 0,
            filesScanned: 0,
            m3_anomalies: m3_anomalies,
            m4_anomalies: [],
            m5_anomalies: [],
            m6_anomalies: [],
            m8_anomalies: m8_anomalies
        };
        fs.writeFileSync(path.join(__dirname, '.phasr_cache.json'), JSON.stringify(cacheData));

        // Seamlessly route into the UI Dashboard
        const analyzerArgs = [path.join(__dirname, '..', 'CLI', 'analyzer.js'), targetDir, '--hardware-bypass'];
        spawnSync('node', analyzerArgs, { stdio: 'inherit' });
        
        process.exit(code);
    });
}
