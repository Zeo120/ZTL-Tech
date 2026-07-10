const fs = require('fs');
const path = require('path');

// Division of Purpose: Supply Chain Paranoia.
// The DependencyMapper scans for external trust assumptions (third-party libraries).
// In a zero-trust DEMV architecture, every external dependency is a mathematical blind spot.
// This module extracts the exact external dependencies across multiple package managers natively.

class DependencyMapper {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.dependencies = {
            npm: {},
            python: {},
            rust: {},
            go: {},
            totalExternalTrustPoints: 0
        };
    }

    async mapDependencies() {
        await this._walkDir(this.targetDir);
        return this.dependencies;
    }

    async _walkDir(dir) {
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });

        for (const entry of entries) {
            const fullPath = path.join(dir, entry.name);

            if (entry.isDirectory()) {
                // Ignore standard noisy/compiled directories
                if (['node_modules', '.git', 'dist', 'build', 'venv', '__pycache__'].includes(entry.name)) {
                    continue;
                }
                await this._walkDir(fullPath);
            } else {
                await this._parseManifest(fullPath, entry.name);
            }
        }
    }

    async _parseManifest(filePath, fileName) {
        try {
            // NPM (Node.js)
            if (fileName === 'package.json') {
                const content = await fs.promises.readFile(filePath, 'utf8');
                const json = JSON.parse(content);
                if (json.dependencies) {
                    Object.assign(this.dependencies.npm, json.dependencies);
                    this.dependencies.totalExternalTrustPoints += Object.keys(json.dependencies).length;
                }
            }
            // Python (requirements.txt)
            else if (fileName === 'requirements.txt') {
                const content = await fs.promises.readFile(filePath, 'utf8');
                const lines = content.split('\n');
                lines.forEach(line => {
                    line = line.trim();
                    if (line && !line.startsWith('#')) {
                        const pkg = line.split(/[=<>~]/)[0].trim();
                        this.dependencies.python[pkg] = line;
                        this.dependencies.totalExternalTrustPoints++;
                    }
                });
            }
            // Rust (Cargo.toml)
            else if (fileName === 'Cargo.toml') {
                const content = await fs.promises.readFile(filePath, 'utf8');
                const lines = content.split('\n');
                let inDeps = false;
                lines.forEach(line => {
                    line = line.trim();
                    if (line.startsWith('[dependencies]')) inDeps = true;
                    else if (line.startsWith('[')) inDeps = false;
                    else if (inDeps && line && !line.startsWith('#')) {
                        const pkg = line.split('=')[0].trim();
                        this.dependencies.rust[pkg] = line;
                        this.dependencies.totalExternalTrustPoints++;
                    }
                });
            }
            // Go (go.mod)
            else if (fileName === 'go.mod') {
                const content = await fs.promises.readFile(filePath, 'utf8');
                const lines = content.split('\n');
                let inDeps = false;
                lines.forEach(line => {
                    line = line.trim();
                    if (line.startsWith('require (')) inDeps = true;
                    else if (line === ')') inDeps = false;
                    else if (line.startsWith('require ')) {
                        const pkg = line.split(' ')[1];
                        this.dependencies.go[pkg] = line;
                        this.dependencies.totalExternalTrustPoints++;
                    }
                    else if (inDeps && line && !line.startsWith('//')) {
                        const pkg = line.split(' ')[0];
                        this.dependencies.go[pkg] = line;
                        this.dependencies.totalExternalTrustPoints++;
                    }
                });
            }
        } catch (err) {
            console.error(`[PHASR DependencyMapper] Failed to parse manifest ${filePath}:`, err.message);
        }
    }
}

// Manual execution block
if (require.main === module) {
    const targetDir = process.argv[2];
    if (!targetDir) {
        console.error("Usage: node DependencyMapper.js <directory-to-scan>");
        process.exit(1);
    }

    const mapper = new DependencyMapper(targetDir);
    mapper.mapDependencies()
        .then(deps => {
            console.log(`\n[PHASR DependencyMapper] External Trust Assumptions for ${targetDir}:`);
            console.log(JSON.stringify(deps, null, 2));
            console.log(`\nTotal Vulnerability Vectors (Dependencies): ${deps.totalExternalTrustPoints}`);
        })
        .catch(err => console.error(`[PHASR DependencyMapper] Error:`, err));
}

module.exports = DependencyMapper;
