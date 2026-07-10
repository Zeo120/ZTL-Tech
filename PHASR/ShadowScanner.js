const fs = require('fs');
const path = require('path');

// Division of Purpose: Shadow Dependency Detection.
// Manifest files (package.json, etc.) only tell you what the developer admits to using.
// The ShadowScanner parses the raw text of the codebase to find "Unknown" dependencies:
// 1. Vendor-dropped files (minified JS/CSS, raw C headers).
// 2. Hardcoded external network requests (CDNs, undocumented APIs).
// 3. Embedded binary payloads (.dll, .so, .exe).

class ShadowScanner {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.shadows = {
            hardcodedUrls: new Set(),
            embeddedBinaries: [],
            vendorDroppedFiles: [],
            totalShadowRiskPoints: 0
        };
    }

    async scanShadows() {
        await this._walkDir(this.targetDir);
        
        // Convert sets to arrays for final JSON output
        return {
            hardcodedUrls: Array.from(this.shadows.hardcodedUrls),
            embeddedBinaries: this.shadows.embeddedBinaries,
            vendorDroppedFiles: this.shadows.vendorDroppedFiles,
            totalShadowRiskPoints: this.shadows.totalShadowRiskPoints
        };
    }

    async _walkDir(dir) {
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });

        const promises = entries.map(async (entry) => {
            const fullPath = path.join(dir, entry.name);

            if (entry.isDirectory()) {
                if (['node_modules', '.git', 'venv', '__pycache__'].includes(entry.name)) return;
                await this._walkDir(fullPath);
            } else {
                await this._analyzeFile(fullPath, entry.name);
            }
        });

        await Promise.all(promises);
    }

    async _analyzeFile(filePath, fileName) {
        const ext = path.extname(fileName).toLowerCase();

        // 1. Embedded Binaries (Highest Risk)
        if (['.dll', '.so', '.exe', '.bin', '.pyd', '.node'].includes(ext)) {
            this.shadows.embeddedBinaries.push(filePath);
            this.shadows.totalShadowRiskPoints += 10;
            return; // Don't parse raw binary as text
        }

        // Only parse text-based files for URLs and Vendor Drops
        if (!['.js', '.ts', '.py', '.c', '.cpp', '.h', '.html', '.css', '.java', '.go', '.rs'].includes(ext)) {
            return;
        }

        try {
            const content = await fs.promises.readFile(filePath, 'utf8');

            // 2. Hardcoded External URLs (CDNs, Webhooks, APIs)
            const urlRegex = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)/g;
            const urls = content.match(urlRegex) || [];
            
            urls.forEach(url => {
                // Ignore standard localhost or schema definitions, focus on external servers
                if (!url.includes('localhost') && !url.includes('127.0.0.1') && !url.includes('w3.org')) {
                    this.shadows.hardcodedUrls.add(url);
                    this.shadows.totalShadowRiskPoints += 1;
                }
            });

            // 3. Vendor Dropped Files (Minified code or massive third-party library files)
            // Heuristic: If a JS/CSS file has lines longer than 500 characters, it's likely minified/vendored.
            const lines = content.split('\n');
            let isMinified = false;
            for (let i = 0; i < Math.min(lines.length, 50); i++) {
                if (lines[i].length > 500) {
                    isMinified = true;
                    break;
                }
            }

            if (isMinified || fileName.includes('.min.') || fileName.includes('-vendor')) {
                this.shadows.vendorDroppedFiles.push(filePath);
                this.shadows.totalShadowRiskPoints += 5;
            }

        } catch (err) {
            // Ignore read errors for pseudo-binary files that snuck past the filter
        }
    }
}

// Manual execution block
if (require.main === module) {
    const targetDir = process.argv[2];
    if (!targetDir) {
        console.error("Usage: node ShadowScanner.js <directory-to-scan>");
        process.exit(1);
    }

    const scanner = new ShadowScanner(targetDir);
    scanner.scanShadows()
        .then(shadows => {
            console.log(`\n[PHASR ShadowScanner] Unknown / Unpopular Dependencies for ${targetDir}:`);
            console.log(JSON.stringify(shadows, null, 2));
            console.log(`\nTotal Shadow Risk Points: ${shadows.totalShadowRiskPoints}`);
        })
        .catch(err => console.error(`[PHASR ShadowScanner] Error:`, err));
}

module.exports = ShadowScanner;
