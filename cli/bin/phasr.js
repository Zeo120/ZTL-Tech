#!/usr/bin/env node

import { program } from 'commander';
import inquirer from 'inquirer';
import { spawnSync } from 'child_process';
import path from 'path';
import fs from 'fs';
import os from 'os';

import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Path to the compiled C++ engine
let engineBinary = 'engine.exe'; // default to windows
if (os.platform() !== 'win32') {
    engineBinary = process.arch === 'arm64' ? 'phasr_arm64' : 'phasr_x86';
}
const ENGINE_PATH = path.resolve(__dirname, `../../PHASR(DEVM)/Orchestrator/${engineBinary}`);

program
  .name('phasr')
  .description('PHASR Absolute Physics Engine - Global Command Line Interface')
  .version('1.0.0');

program
  .command('scan')
  .description('Scan a target directory using the native C++ physics engine')
  .argument('<target>', 'Directory or drive to scan (e.g. C:\\)')
  .option('-t, --threads <number>', 'Number of physical threads to allocate (4-256)')
  .option('-a, --archive-threads <number>', 'Number of secondary threads for out-of-band decompression (default: 1)')
  .action(async (target, options) => {
    
    if (!fs.existsSync(ENGINE_PATH)) {
        console.error(`\x1b[31m[ERROR]\x1b[0m Native C++ Engine not found at: ${ENGINE_PATH}`);
        console.error(`Please compile the engine first.`);
        process.exit(1);
    }

    let threadCount = options.threads;
    let archiveThreads = options.archiveThreads || '1';

    if (!threadCount) {
        console.log(`\x1b[36m[PHASR]\x1b[0m Target: ${target}`);
        console.log(`\x1b[36m[PHASR]\x1b[0m Memory Cap: 30MB Per Thread\n`);
        
        const answers = await inquirer.prompt([
            {
                type: 'list',
                name: 'threadSelection',
                message: 'Select physical thread allocation for this scan:',
                choices: [
                    { name: '4 Threads (Safe Mode - 120MB Memory)', value: '4' },
                    { name: '16 Threads (Performance Mode - 480MB Memory)', value: '16' },
                    { name: '32 Threads (Extreme Mode - 960MB Memory)', value: '32' },
                    { name: '64 Threads (Server Mode - 1.9GB Memory)', value: '64' },
                    { name: '128 Threads (Unstable - 3.8GB Memory)', value: '128' },
                    { name: '256 Threads (Absolute Physics Limit - 7.6GB Memory)', value: '256' }
                ],
                default: '4'
            }
        ]);
        threadCount = answers.threadSelection;
    }

    console.log(`\n\x1b[32m[+]\x1b[0m Bootstrapping Native C++ Engine with ${threadCount} Threads and ${archiveThreads} Archive Threads...\n`);

    const result = spawnSync(ENGINE_PATH, [target, '--threads', threadCount, '--archive-threads', archiveThreads], {
        stdio: 'inherit'
    });

    if (result.error) {
        console.error(`\x1b[31m[ERROR]\x1b[0m Failed to spawn C++ Engine:`, result.error);
    }
  });

program.parse(process.argv);
