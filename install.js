const { execSync } = require('child_process');
const os = require('os');
const path = require('path');

const platform = os.platform();
console.log(`\x1b[36m[PHASR Installer]\x1b[0m Detected Platform: ${platform} (${os.arch()})`);

try {
    if (platform === 'win32') {
        console.log(`\x1b[33m[PHASR Installer]\x1b[0m Compiling C# Engine Fallback...`);
        execSync(`C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\csc.exe /nologo /out:"PHASR(DEVM)\\Orchestrator\\engine_cs.exe" "PHASR(DEVM)\\Orchestrator\\Engine.cs"`, { stdio: 'inherit' });
        
        console.log(`\x1b[32m[PHASR Installer]\x1b[0m Windows setup complete.`);
    } else {
        console.log(`\x1b[33m[PHASR Installer]\x1b[0m Compiling POSIX/Linux Engine for ARM64/x86...`);
        // Assume clang or g++ is available
        const compiler = process.arch === 'arm64' ? 'clang++' : 'g++';
        const asmFile = process.arch === 'arm64' ? 'entropy_arm64.s' : 'entropy.s';
        
        const compileCmd = `cd "PHASR(DEVM)" && ${compiler} -O3 Orchestrator/Engine_Linux.cpp Engine/${asmFile} -o Orchestrator/phasr_arm64 -lpthread`;
        console.log(`\x1b[90m$ ${compileCmd}\x1b[0m`);
        execSync(compileCmd, { stdio: 'inherit' });
        
        console.log(`\x1b[32m[PHASR Installer]\x1b[0m POSIX/Linux setup complete.`);
    }
} catch (error) {
    console.error(`\n\x1b[31m[PHASR Installer ERROR]\x1b[0m Auto-compilation failed. Make sure you have the required compilers installed.`);
    console.error(error.message);
}
