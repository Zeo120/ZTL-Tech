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
const child = spawnSync(command, args, { stdio: 'inherit' });

if (child.error) {
    console.error(`[\x1b[31mFATAL\x1b[0m] Engine Execution Failed:`, child.error.message);
} else {
    process.exit(child.status);
}
