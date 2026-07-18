#!/usr/bin/env node
const { spawnSync } = require('child_process');
const path = require('path');
const fs = require('fs');

let engineBinary = path.join(__dirname, 'engine');
if (process.platform === 'win32') engineBinary = path.join(__dirname, 'engine.exe');
else if (process.arch === 'arm64' && fs.existsSync(path.join(__dirname, 'phasr_arm64'))) {
    engineBinary = path.join(__dirname, 'phasr_arm64');
}

if (!fs.existsSync(engineBinary)) {
    console.error(`[\x1b[31mFATAL\x1b[0m] Native C++ Engine not found at ${engineBinary}. Please compile it first.`);
    process.exit(1);
}

const args = process.argv.length > 2 ? process.argv.slice(2) : ["C:\\"];

// Pass absolute control directly to the native C++ Engine (stdio: inherit)
const result = spawnSync(engineBinary, args, { stdio: 'inherit' });
process.exit(result.status || 0);
