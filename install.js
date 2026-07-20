const { execSync } = require('child_process');
const os = require('os');
const path = require('path');

const platform = os.platform();
console.log(`\x1b[36m[PHASR Installer]\x1b[0m Detected Platform: ${platform} (${os.arch()})`);

function checkCommand(cmd) {
    try {
        execSync(`${cmd} --version`, { stdio: 'ignore' });
        return true;
    } catch (e) {
        return false;
    }
}

if (platform !== 'win32') {
    const hasGpp = checkCommand('g++');
    const hasClang = checkCommand('clang++');
    if (!hasGpp && !hasClang) {
        console.error(`\x1b[31m[PHASR Installer ERROR]\x1b[0m Missing compiler. Please install g++ or clang++ (e.g. pkg install clang on Termux).`);
        process.exit(1);
    }
}

try {
    if (platform === 'win32') {
        console.log(`\x1b[33m[PHASR Installer]\x1b[0m Compiling C# Engine Fallback...`);
        execSync(`C:\\Windows\\Microsoft.NET\\Framework64\\v4.0.30319\\csc.exe /nologo /out:"PHASR(DEVM)\\Orchestrator\\engine_cs.exe" "PHASR(DEVM)\\Orchestrator\\Engine.cs"`, { stdio: 'inherit' });
        
        console.log(`\x1b[33m[PHASR Installer]\x1b[0m Compiling Native C++ Engine for Windows...`);
        try {
            const cppCompileCmd = `cd "PHASR(DEVM)\\Orchestrator" && g++ Engine.cpp phasr_math.o -o engine.exe -static -static-libgcc -static-libstdc++ -std=c++17`;
            execSync(cppCompileCmd, { stdio: 'inherit' });
        } catch (e) {
            console.log(`\x1b[31m[PHASR Installer]\x1b[0m Warning: g++ not found or failed. Windows C++ Engine compilation skipped.`);
        }
        
        console.log(`\x1b[32m[PHASR Installer]\x1b[0m Windows setup complete.`);
    } else {
        console.log(`\x1b[33m[PHASR Installer]\x1b[0m Compiling POSIX/Linux Engine for ARM64/x86...`);
        // Assume clang or g++ is available
        const compiler = 'g++'; // Force g++ on proot/arm64 as clang++ fails with cc1 error
        const asmFile = process.arch === 'arm64' ? 'entropy_arm64.s' : 'entropy.s';
        
        const compileCmd = `cd "PHASR(DEVM)" && ${compiler} -O3 Orchestrator/Engine_Linux.cpp Engine/${asmFile} -o Orchestrator/phasr_arm64 -lpthread`;
        console.log(`\x1b[90m$ ${compileCmd}\x1b[0m`);
        try {
            execSync(compileCmd, { stdio: 'inherit' });
        } catch (e) {
            console.log(`\x1b[33m[PHASR Installer]\x1b[0m Compilation failed with g++. Ensure build-essential is installed.`);
            process.exit(1);
        }
        
        console.log(`\x1b[32m[PHASR Installer]\x1b[0m POSIX/Linux setup complete.`);
    }

    // Automatically fix permissions to prevent Termux/Linux "Permission denied" errors
    if (platform !== 'win32') {
        console.log(`\x1b[33m[PHASR Installer]\x1b[0m Applying executable permissions...`);
        try { execSync(`chmod +x "PHASR(DEVM)/Orchestrator/router.js"`, { stdio: 'ignore' }); } catch(e){}
        try { execSync(`chmod +x "PHASR(DEVM)/Orchestrator/engine"`, { stdio: 'ignore' }); } catch(e){}
        try { execSync(`chmod +x "PHASR(DEVM)/Orchestrator/phasr_arm64"`, { stdio: 'ignore' }); } catch(e){}
        console.log(`\x1b[32m[PHASR Installer]\x1b[0m Permissions locked and loaded.`);
    }
} catch (error) {
    console.error(`\n\x1b[31m[PHASR Installer ERROR]\x1b[0m Auto-compilation failed. Make sure you have the required compilers installed.`);
    console.error(error.message);
}
