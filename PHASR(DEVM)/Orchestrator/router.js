#!/usr/bin/env node
const { spawnSync } = require('child_process');
const path = require('path');
const fs = require('fs');

const engineBinary = path.join(__dirname, process.platform === 'win32' ? 'engine.exe' : 'engine');

if (!fs.existsSync(engineBinary)) {
    console.error("[\x1b[31mFATAL\x1b[0m] Native C++ Engine not found. Please compile engine.exe first.");
    process.exit(1);
}

const args = process.argv.length > 2 ? process.argv.slice(2) : ["C:\\"];

// Pass absolute control directly to the native C++ Engine (stdio: inherit)
const result = spawnSync(engineBinary, args, { stdio: 'inherit' });
process.exit(result.status || 0);
