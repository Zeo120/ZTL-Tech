const fs = require('fs');
const path = require('path');

// Division of Purpose: Asynchronous Codebase Profiling.
// Scans the unpacked repository, categorizes programming languages by extension, 
// and calculates raw lines of code (LOC) using buffer parsing for maximum speed.
// Zero dependencies.

const EXTENSION_MAP = {
    '.js': 'JavaScript',
    '.ts': 'TypeScript',
    '.py': 'Python',
    '.c': 'C',
    '.cpp': 'C++',
    '.h': 'C/C++ Header',
    '.hpp': 'C++ Header',
    '.s': 'Assembly',
    '.asm': 'Assembly',
    '.ml': 'OCaml',
    '.mli': 'OCaml Interface',
    '.rs': 'Rust',
    '.go': 'Go',
    '.java': 'Java',
    '.html': 'HTML',
    '.css': 'CSS',
    '.sh': 'Shell',
    '.ps1': 'PowerShell',
    '.json': 'JSON',
    '.md': 'Markdown'
};

class Scanner {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.stats = {}; // { 'Language': { files: 0, loc: 0 } }
    }

    async scan() {
        await this._walkDir(this.targetDir);
        return this.stats;
    }

    async _walkDir(dir) {
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });
        
        const promises = entries.map(async (entry) => {
            const fullPath = path.join(dir, entry.name);
            
            if (entry.isDirectory()) {
                // Ignore standard noisy directories
                if (entry.name !== 'node_modules' && entry.name !== '.git' && entry.name !== 'dist' && entry.name !== 'build') {
                    await this._walkDir(fullPath);
                }
            } else {
                const ext = path.extname(entry.name).toLowerCase();
                const language = EXTENSION_MAP[ext] || 'Unknown/Other';
                
                // Exclude pure binary files or images from LOC counting
                if (['.png', '.jpg', '.jpeg', '.gif', '.zip', '.tar', '.gz', '.pdf', '.exe', '.dll', '.so', '.bin'].includes(ext)) {
                    return;
                }

                if (!this.stats[language]) {
                    this.stats[language] = { files: 0, loc: 0 };
                }

                this.stats[language].files += 1;
                const lines = await this._countLines(fullPath);
                this.stats[language].loc += lines;
            }
        });

        await Promise.all(promises);
    }

    _countLines(filePath) {
        return new Promise((resolve, reject) => {
            let lineCount = 0;
            const stream = fs.createReadStream(filePath);
            
            stream.on('data', (chunk) => {
                // Highly optimized byte-level scanning for newline characters (\n = 10)
                for (let i = 0; i < chunk.length; i++) {
                    if (chunk[i] === 10) lineCount++;
                }
            });
            
            stream.on('end', () => {
                // Add 1 for the final line if the file doesn't end in a newline (and isn't completely empty)
                resolve(lineCount === 0 ? 0 : lineCount + 1);
            });
            
            stream.on('error', reject);
        });
    }
}

// Simple execution block for manual invocation
if (require.main === module) {
    const targetDir = process.argv[2];
    if (!targetDir) {
        console.error("Usage: node Scanner.js <directory-to-scan>");
        process.exit(1);
    }

    const scanner = new Scanner(targetDir);
    scanner.scan()
        .then(stats => {
            console.log(`\n[PHASR Scanner] Language Breakdown for ${targetDir}:`);
            console.table(stats);
        })
        .catch(err => console.error(`[PHASR Scanner] Error:`, err));
}

module.exports = Scanner;
