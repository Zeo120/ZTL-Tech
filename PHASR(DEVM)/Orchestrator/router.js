#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const os = require('os');
const { spawnSync, spawn } = require('child_process');

const targetDir = process.argv[2] || process.cwd();

// Physical limits
const MASS_LIMIT_CPP = 200 * 1024; // 200 KB
const MASS_LIMIT_ASM = 200 * 1024 * 1024; // 200 MB

console.log(`\n[\x1b[35mORCHESTRATOR\x1b[0m] Calculating Physical Mass of Target: ${targetDir}...`);

let totalMass = 0;
let massThresholdReached = false;

function calculateMass(dir) {
    if (massThresholdReached) return;
    try {
        const files = fs.readdirSync(dir, { withFileTypes: true });
        for (const file of files) {
            if (massThresholdReached) break;
            
            // Skip massive unneeded folders to speed up calculation
            if (file.name === 'node_modules' || file.name === '.git' || file.name.includes('PHASR(DEVM)')) continue;

            const fullPath = path.join(dir, file.name);
            try {
                if (file.isDirectory()) {
                    calculateMass(fullPath);
                } else {
                    totalMass += fs.statSync(fullPath).size;
                    // If we exceed 200MB, we can stop counting entirely. We know we need Assembly.
                    if (totalMass >= MASS_LIMIT_ASM) {
                        massThresholdReached = true;
                    }
                }
            } catch (e) {
                // Ignore permission denied errors on system files
            }
        }
    } catch (e) {}
}

calculateMass(targetDir);

console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Measured Mass: ${(totalMass / 1024).toFixed(2)} KB`);

const binDir = path.join(__dirname, '..', '..'); // Project Root
let command = 'node';
let args = [path.join(__dirname, '..', 'CLI', 'analyzer.js'), targetDir];

// OS Platform Detection for Arch/Mac compatibility
const isWin = os.platform() === 'win32';
const binExt = isWin ? '.exe' : '';

if (totalMass >= MASS_LIMIT_ASM) {
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Mass > 200MB. Extreme OS overload detected.`);
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Routing directly to \x1b[31mNASM Assembly Engine\x1b[0m...\n`);
    const asmBinary = path.join(binDir, `phasr_asm${binExt}`);
    if (fs.existsSync(asmBinary)) {
        command = asmBinary;
        args = [targetDir];
    } else {
        console.log(`[\x1b[33mWARN\x1b[0m] Assembly Engine binary not compiled. Falling back to C++ Engine...\n`);
        totalMass = MASS_LIMIT_CPP; // Force fallback logic
    }
}

if (totalMass >= MASS_LIMIT_CPP && totalMass < MASS_LIMIT_ASM) {
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Mass > 200KB. V8 Heap limits exceeded.`);
    console.log(`[\x1b[35mORCHESTRATOR\x1b[0m] Routing directly to \x1b[32mNative Hardware Engine\x1b[0m...\n`);
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
    const child = spawn(command, args, { stdio: ['inherit', 'pipe', 'inherit'] });

    let hwMass = 250 * 1024 * 1024;
    let m3_anomalies = [];
    let m8_anomalies = [];
    let leftover = '';

    child.stdout.on('data', (data) => {
        const chunk = data.toString('utf-8');
        process.stdout.write(chunk); // Stream directly to terminal visually

        // Parse chunks carefully across newlines
        const lines = (leftover + chunk).split('\n');
        leftover = lines.pop(); // Keep the last incomplete line for the next chunk

        for (const line of lines) {
            const trimmed = line.trim();
            if (trimmed.startsWith('[VFS-MASS]')) {
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
