#!/usr/bin/env node
const { spawnSync } = require('child_process');
const path = require('path');
const fs = require('fs');

const searchPaths = [__dirname, path.join(__dirname, '..')];
const binaryNames = ['phasr_arm64', 'engine', 'engine.exe'];

let engineBinary = null;

for (const dir of searchPaths) {
    for (const bin of binaryNames) {
        const targetBinary = path.join(dir, bin);
        if (fs.existsSync(targetBinary)) {
            engineBinary = targetBinary;
            break;
        }
    }
    if (engineBinary) break;
}

if (!engineBinary) {
    console.error(`[\x1b[31mFATAL\x1b[0m] Native C++ Engine not found. Please compile it first.`);
    process.exit(1);
}

const args = process.argv.length > 2 ? process.argv.slice(2) : ["C:\\"];

// Pass absolute control directly to the native C++ Engine (stdio: inherit)
const result = spawnSync(engineBinary, args, { stdio: 'inherit' });
process.exit(result.status || 0);
