const fs = require('fs');
const path = require('path');

// Division of Purpose: Malicious Payload Signature Detection
// Math can verify state transitions, but math cannot inherently know that 
// 'eval(Buffer.from(...))' is a malicious reverse shell. 
// For static payloads, we MUST rely on heuristic pattern matching (Signatures).
// This scanner hunts for known malicious vectors, obfuscation, and embedded shellcode.

class PayloadScanner {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.threatsDetected = [];
        
        // The Heuristic Signature Database (YARA-style)
        this.signatures = {
            obfuscation: [
                /eval\s*\(\s*(atob|btoa|Buffer\.from)/i, 
                /String\.fromCharCode\((?:\d+[, ]*){10,}\)/, // Long obfuscated strings
                /0x[a-fA-F0-9]{2}(?:\\x[a-fA-F0-9]{2}){10,}/ // Hex-encoded shellcode payload
            ],
            remoteExecution: [
                /child_process['"]?\s*\]?\s*\.\s*(exec|spawn|execSync)/i,
                /os\.system\s*\(/i, 
                /__import__\(['"]os['"]\)\.popen/i
            ],
            dataExfiltration: [
                /fetch\s*\(\s*['"]https?:\/\/(?!localhost|127\.0\.0\.1)/i, // Catch external blind fetches
                /new\s+WebSocket\s*\(/i
            ]
        };
    }

    async scan() {
        await this._walkDir(this.targetDir);
        return this.threatsDetected;
    }

    async _walkDir(dir) {
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });

        const promises = entries.map(async (entry) => {
            const fullPath = path.join(dir, entry.name);

            if (entry.isDirectory()) {
                if (['node_modules', '.git'].includes(entry.name)) return;
                await this._walkDir(fullPath);
            } else {
                await this._scanFileForPayloads(fullPath, entry.name);
            }
        });

        await Promise.all(promises);
    }

    async _scanFileForPayloads(filePath, fileName) {
        // Skip binary files for regex scanning (handled by ShadowScanner)
        const ext = path.extname(fileName).toLowerCase();
        if (['.dll', '.so', '.exe', '.bin', '.png', '.jpg', '.zip'].includes(ext)) return;

        try {
            const content = await fs.promises.readFile(filePath, 'utf8');
            const lines = content.split('\n');

            lines.forEach((line, index) => {
                // Check Obfuscation
                this.signatures.obfuscation.forEach(regex => {
                    if (regex.test(line)) {
                        this.threatsDetected.push({ file: filePath, line: index + 1, type: 'Obfuscation/Shellcode', snippet: line.trim().substring(0, 50) });
                    }
                });

                // Check Remote Execution
                this.signatures.remoteExecution.forEach(regex => {
                    if (regex.test(line)) {
                        this.threatsDetected.push({ file: filePath, line: index + 1, type: 'Remote Code Execution', snippet: line.trim().substring(0, 50) });
                    }
                });
            });
        } catch (err) {
            // Ignore unreadable files
        }
    }
}

// Manual execution block
if (require.main === module) {
    const targetDir = process.argv[2];
    if (!targetDir) {
        console.error("Usage: node PayloadScanner.js <directory-to-scan>");
        process.exit(1);
    }

    const scanner = new PayloadScanner(targetDir);
    scanner.scan()
        .then(threats => {
            console.log(`\n[PHASR PayloadScanner] Heuristic Signature Scan Complete.`);
            if (threats.length === 0) {
                console.log(`Status: CLEAN. No obvious static payloads detected.`);
            } else {
                console.log(`WARNING: ${threats.length} potential malicious payloads detected!`);
                console.table(threats);
            }
        })
        .catch(err => console.error(`[PHASR PayloadScanner] Error:`, err));
}

module.exports = PayloadScanner;
