const fs = require('fs');
const path = require('path');

// Division of Purpose: Official Domain Auto-Discovery
// Tech Stack: Node.js
//
// If a codebase is ingested blindly, the DEVM cannot guess the official domain.
// This module scans the raw codebase to auto-discover the Root Domain by looking at:
// 1. CORS policies (What domains is the API allowed to talk to?)
// 2. Environment Variables (.env files declaring API_URL or HOST)
// 3. Manifests (package.json homepage/repository fields)
// 4. CNAME files (Common in static frontends)

class DomainAutoDiscovery {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.discoveredDomains = new Map(); // Domain -> Confidence Score
    }

    async extractRootDomain() {
        console.log(`[DEVM AutoDiscovery] Scanning Codebase for Root Domain Signatures...`);
        await this._walkDir(this.targetDir);
        return this._calculateHighestConfidenceDomain();
    }

    async _walkDir(dir) {
        if (!fs.existsSync(dir)) return;
        
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });

        const promises = entries.map(async (entry) => {
            const fullPath = path.join(dir, entry.name);

            if (entry.isDirectory()) {
                if (['node_modules', '.git', 'dist'].includes(entry.name)) return;
                await this._walkDir(fullPath);
            } else {
                await this._parseFileForDomains(fullPath, entry.name);
            }
        });

        await Promise.all(promises);
    }

    async _parseFileForDomains(filePath, fileName) {
        try {
            const content = await fs.promises.readFile(filePath, 'utf8');

            // 1. Check CNAME file (Absolute truth for static sites)
            if (fileName === 'CNAME') {
                this._addDomainScore(content.trim(), 100);
            }

            // 2. Check package.json (Repository or homepage fields)
            if (fileName === 'package.json') {
                const json = JSON.parse(content);
                if (json.homepage) this._extractFromUrl(json.homepage, 50);
                if (json.repository && json.repository.url) this._extractFromUrl(json.repository.url, 40);
            }

            // 3. Check .env files (HOST, API_URL, FRONTEND_URL)
            if (fileName.includes('.env')) {
                const envRegex = /https?:\/\/([a-zA-Z0-9_\-\.]+)/g;
                let match;
                while ((match = envRegex.exec(content)) !== null) {
                    this._addDomainScore(match[1], 30);
                }
            }

            // 4. Check CORS configurations in backend code
            if (['.js', '.ts', '.py', '.go'].includes(path.extname(fileName))) {
                const corsRegex = /cors\s*\(\s*\{\s*origin\s*:\s*['"]https?:\/\/([a-zA-Z0-9_\-\.]+)['"]/ig;
                let match;
                while ((match = corsRegex.exec(content)) !== null) {
                    this._addDomainScore(match[1], 80); // CORS is very high confidence
                }
            }
        } catch (err) {
            // Silent
        }
    }

    _extractFromUrl(urlString, score) {
        try {
            // Handle git+https or raw urls
            const cleanUrl = urlString.replace('git+', '');
            const url = new URL(cleanUrl);
            this._addDomainScore(url.hostname, score);
        } catch (e) {}
    }

    _addDomainScore(domain, score) {
        // Normalize domain (strip www.)
        domain = domain.replace('www.', '').toLowerCase();
        
        // Ignore generic host providers like github.com unless it's a specific repo, 
        // but for this engine math, we just map raw hits.
        const current = this.discoveredDomains.get(domain) || 0;
        this.discoveredDomains.set(domain, current + score);
    }

    _calculateHighestConfidenceDomain() {
        let rootDomain = "UNKNOWN";
        let maxScore = 0;

        for (const [domain, score] of this.discoveredDomains.entries()) {
            if (score > maxScore && domain !== 'localhost' && domain !== '127.0.0.1') {
                maxScore = score;
                rootDomain = domain;
            }
        }

        return rootDomain;
    }
}

// Manual Execution
if (require.main === module) {
    const targetDir = process.argv[2] || "../..";
    const autoDiscover = new DomainAutoDiscovery(targetDir);
    
    autoDiscover.extractRootDomain().then(root => {
        console.log(`\n[DEVM Output] Auto-Discovered Official Root Domain: ${root}`);
    });
}

module.exports = DomainAutoDiscovery;
