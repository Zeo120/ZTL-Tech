#!/usr/bin/env node
const { spawnSync, execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

const sleep = ms => new Promise(r => setTimeout(r, ms));

async function runAnimation() {
    console.clear();
    const logo = `\x1b[36m
    ____  __  _____   _____ ____ 
   / __ \\/ / / /   | / ___// __ \\
  / /_/ / /_/ / /| | \\__ \\/ /_/ /
 / ____/ __  / ___ |___/ / _, _/ 
/_/   /_/ /_/_/  |_/____/_/ |_|  
\x1b[0m`;
    console.log(logo);
    process.stdout.write(`\x1b[1m\x1b[33m[*] Booting Kernel-Bypass Orchestrator\x1b[0m`);
    for(let i = 0; i < 3; i++) {
        await sleep(200);
        process.stdout.write('.');
    }
    console.log('\n');
}

function compileEngine() {
    console.log(`\x1b[33m[PHASR]\x1b[0m First run detected! Compiling Native Engine...\n`);
    const platform = process.platform;
    const isArm = process.arch === 'arm64';
    try {
        if (platform === 'win32') {
            const cppCompileCmd = `cd "${__dirname}" && g++ Engine.cpp phasr_math.o -o engine.exe -static -static-libgcc -static-libstdc++ -std=c++17`;
            execSync(cppCompileCmd, { stdio: 'inherit' });
        } else {
            const asmFile = isArm ? 'entropy_arm64.s' : 'entropy.s';
            const binName = isArm ? 'phasr_arm64' : 'engine';
            const compileCmd = `cd "${__dirname}" && g++ -O3 Engine_Linux.cpp ../Engine/${asmFile} -o ${binName} -lpthread`;
            execSync(compileCmd, { stdio: 'inherit' });
            execSync(`chmod +x "${path.join(__dirname, binName)}"`, { stdio: 'ignore' });
        }
        console.log(`\n\x1b[32m[PHASR]\x1b[0m Compilation successful!\n`);
    } catch (e) {
        console.error(`\x1b[31m[FATAL]\x1b[0m Compilation failed. Ensure g++ is installed on your system.`);
        process.exit(1);
    }
}

async function main() {
    await runAnimation();

    const searchPaths = [__dirname, path.join(__dirname, '..')];
    const binaryNames = process.platform === 'win32' ? ['engine.exe'] : (process.arch === 'arm64' ? ['phasr_arm64'] : ['engine']);
    const sourceNames = process.platform === 'win32' ? ['Engine.cpp'] : ['Engine_Linux.cpp'];

    const findBinary = () => {
        for (const dir of searchPaths) {
            for (const bin of binaryNames) {
                const targetBinary = path.join(dir, bin);
                if (fs.existsSync(targetBinary)) return targetBinary;
            }
        }
        return null;
    };

    let engineBinary = findBinary();
    let needsCompile = !engineBinary;

    let args = process.argv.length > 2 ? process.argv.slice(2) : ["C:\\"];
    
    // 1. Intercept manual rebuild flag
    if (args.includes('--rebuild') || args.includes('--compile')) {
        needsCompile = true;
        args = args.filter(a => a !== '--rebuild' && a !== '--compile'); // Strip flag so C++ doesn't see it
        console.log(`\x1b[33m[PHASR]\x1b[0m Manual rebuild requested...\n`);
    } 
    // 2. Auto-Recompile if source is newer than binary
    else if (engineBinary) {
        const targetSource = path.join(__dirname, sourceNames[0]);
        if (fs.existsSync(targetSource)) {
            const srcStat = fs.statSync(targetSource);
            const binStat = fs.statSync(engineBinary);
            if (srcStat.mtimeMs > binStat.mtimeMs) {
                console.log(`\x1b[33m[PHASR]\x1b[0m Source code changes detected. Recompiling...\n`);
                needsCompile = true;
            }
        }
    }

    if (needsCompile) {
        compileEngine();
        engineBinary = findBinary();
        if (!engineBinary) {
            console.error(`[\x1b[31mFATAL\x1b[0m] Engine binary missing even after compilation.`);
            process.exit(1);
        }
    }

    if (args.length === 0) args = ["C:\\"];

    const result = spawnSync(engineBinary, args, { stdio: 'inherit' });
    process.exit(result.status || 0);
}

main();
