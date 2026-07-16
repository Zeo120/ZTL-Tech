#!/usr/bin/env node
const fs = require('fs');
const path = require('path');
const os = require('os');
const { spawnSync } = require('child_process');

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
const child = spawnSync(command, args, { 
    stdio: ['inherit', 'pipe', 'inherit'], 
    encoding: 'utf-8',
    maxBuffer: 1024 * 1024 * 1024 // 1GB Buffer to prevent ENOBUFS on massive C:\ traversals
});

if (child.error) {
    console.error(`[\x1b[31mFATAL\x1b[0m] Engine Execution Failed:`, child.error.message);
} else {
    // Pipe hardware stdout to terminal so the user sees it running, but also capture it
    const output = child.stdout;
    console.log(output);

    // If we used a hardware bypass, we still need to render the CLI dashboard
    if (command !== 'node') {
        let hwMass = 250 * 1024 * 1024;
        let m3_anomalies = [];

        // Parse intercepted stdout from C++/C# Engine
        const lines = output.split('\n');
        for (const line of lines) {
            if (line.startsWith('[VFS-MASS]')) {
                hwMass = parseInt(line.split(' ')[1]) || hwMass;
            } else if (line.startsWith('[VFS-ENTROPY]')) {
                const parts = line.replace('[VFS-ENTROPY] ', '').split('|');
                if (parts.length === 2) {
                    m3_anomalies.push({
                        file: parts[0],
                        value: parts[1],
                        reason: "Binary contents are mathematically indistinguishable from encryption (Packed Payload)."
                    });
                }
            }
        }

        // Write the hardware payload cache
        const cacheData = {
            totalMassBytes: hwMass,
            maxDepth: 0,
            maxEntropy: m3_anomalies.length > 0 ? parseFloat(m3_anomalies[0].value) : 0,
            filesScanned: 0,
            m3_anomalies: m3_anomalies,
            m4_anomalies: [],
            m5_anomalies: [],
            m6_anomalies: []
        };
        fs.writeFileSync(path.join(__dirname, '.phasr_cache.json'), JSON.stringify(cacheData));

        const analyzerArgs = [path.join(__dirname, '..', 'CLI', 'analyzer.js'), targetDir, '--hardware-bypass'];
        spawnSync('node', analyzerArgs, { stdio: 'inherit' });
    }
    process.exit(child.status);
}
