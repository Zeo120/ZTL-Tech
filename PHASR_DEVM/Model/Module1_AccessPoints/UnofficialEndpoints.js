const fs = require('fs');
const path = require('path');

// Division of Purpose: Shadow/Unofficial Internal Boundary Detection
// Tech Stack: Node.js (AST / Text Parsing)
//
// Module 3: Unofficial Endpoints (Shadow Routes)
// While Official Endpoints map what the developer intended to expose, 
// Unofficial Endpoints map the hidden backdoors. 
// This module hunts for hardcoded string paths, dynamic route evaluations,
// and rogue network bindings that do not use the framework's official router.
// If an endpoint exists here but not in the Official Registry, it is an absolute 0.

class UnofficialEndpoints {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.shadowRegistry = new Set();
        
        // Patterns to detect unofficial, dynamic, or rogue routing
        this.patterns = [
            // Hardcoded absolute or relative paths inside fetch/axios/XMLHttpRequest
            /(fetch|axios\.(get|post)|XMLHttpRequest\.open)\s*\(\s*['"](\/[a-zA-Z0-9_\-\/]+)['"]/ig,
            
            // Dynamic route creation (e.g., app.use(variable)) - extremely dangerous
            /app\.(use|all)\s*\(\s*([a-zA-Z0-9_]+)\s*,/ig,
            
            // Raw HTTP server bindings bypassing the framework
            /http\.createServer\s*\(/ig,
            
            // Hardcoded URL strings that look like API routes but aren't in a router definition
            /(?:const|let|var)\s+[a-zA-Z0-9_]+\s*=\s*['"](\/api\/[a-zA-Z0-9_\-\/]+)['"]/ig
        ];
    }

    async scanShadowBoundaries() {
        console.log(`[DEVM] Initiating Unofficial Endpoint / Shadow Route Scan...`);
        await this._walkDir(this.targetDir);
        return Array.from(this.shadowRegistry);
    }

    async _walkDir(dir) {
        if (!fs.existsSync(dir)) return;
        
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });

        const promises = entries.map(async (entry) => {
            const fullPath = path.join(dir, entry.name);

            if (entry.isDirectory()) {
                // We DO scan node_modules here because shadow dependencies might open rogue endpoints
                if (['.git', 'dist', 'build'].includes(entry.name)) return;
                await this._walkDir(fullPath);
            } else {
                await this._parseFileForShadows(fullPath);
            }
        });

        await Promise.all(promises);
    }

    async _parseFileForShadows(filePath) {
        const ext = path.extname(filePath).toLowerCase();
        if (!['.js', '.ts', '.py', '.java', '.go', '.cs', '.php'].includes(ext)) return;

        try {
            const content = await fs.promises.readFile(filePath, 'utf8');
            
            this.patterns.forEach(regex => {
                let match;
                regex.lastIndex = 0; 
                while ((match = regex.exec(content)) !== null) {
                    // Extract the matched path or variable
                    const shadowRoute = match[match.length - 1]; 
                    
                    // Collapse into a deterministic state definition
                    const shadowDefinition = `SHADOW_ROUTE:${shadowRoute}`;
                    this.shadowRegistry.add(shadowDefinition);
                }
            });
        } catch (err) {
            // Ignore unreadable files
        }
    }

    outputRegistry() {
        console.log(`\n[DEVM UnofficialEndpoints] Shadow Boundaries Detected.`);
        console.log(`Total Unofficial/Dynamic Endpoints Discovered: ${this.shadowRegistry.size}`);
        
        console.log(`\nUnofficial Endpoint State Array [0]:`);
        let count = 0;
        for (const endpoint of this.shadowRegistry) {
            if (count++ > 15) {
                console.log(`  ... and ${this.shadowRegistry.size - 15} more shadow routes.`);
                break;
            }
            console.log(`  [0] -> ${endpoint}`);
        }
    }
}

// Manual Execution Block
if (require.main === module) {
    const targetDir = process.argv[2] || "../.."; // Default to scan the parent XT repo
    
    const shadows = new UnofficialEndpoints(targetDir);
    shadows.scanShadowBoundaries().then(() => {
        shadows.outputRegistry();
    });
}

module.exports = UnofficialEndpoints;
