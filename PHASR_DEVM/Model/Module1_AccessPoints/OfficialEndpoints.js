const fs = require('fs');
const path = require('path');

// Division of Purpose: Internal Route Boundary Definition
// Tech Stack: Node.js (AST / Text Parsing)
//
// Module 2: Define Official Endpoints
// If Module 1 defines the external internet perimeter (Domains), Module 2 defines 
// the internal software perimeter (API Routes, WebSockets, Entry Points).
// It maps what the developers *intended* to expose to the world.
// Any endpoint discovered later that is NOT in this official registry is a 
// mathematically invalid state (Shadow API) and will collapse to 0.

class OfficialEndpoints {
    constructor(targetDir) {
        this.targetDir = targetDir;
        this.officialRegistry = new Set();
        
        // Regex patterns to capture official routing definitions
        this.patterns = [
            /app\.(get|post|put|delete|patch)\s*\(\s*['"]([^'"]+)['"]/ig, // Express.js
            /@(GetMapping|PostMapping|PutMapping|DeleteMapping)\s*\(\s*['"]([^'"]+)['"]/ig, // Spring Boot (Java)
            /router\.(get|post|put|delete)\s*\(\s*['"]([^'"]+)['"]/ig, // Go/Gin or Express router
            /def\s+[a-zA-Z0-9_]+\s*\(.*?\):\s*#\s*@(get|post|put|delete)\s+['"]([^'"]+)['"]/ig // Mock Python FastApi
        ];
    }

    async definePerimeter() {
        console.log(`[DEVM] Initiating Official Endpoint Definition...`);
        await this._walkDir(this.targetDir);
        return Array.from(this.officialRegistry);
    }

    async _walkDir(dir) {
        if (!fs.existsSync(dir)) return;
        
        const entries = await fs.promises.readdir(dir, { withFileTypes: true });

        const promises = entries.map(async (entry) => {
            const fullPath = path.join(dir, entry.name);

            if (entry.isDirectory()) {
                if (['node_modules', '.git', 'dist', 'build'].includes(entry.name)) return;
                await this._walkDir(fullPath);
            } else {
                await this._parseFileForRoutes(fullPath);
            }
        });

        await Promise.all(promises);
    }

    async _parseFileForRoutes(filePath) {
        const ext = path.extname(filePath).toLowerCase();
        if (!['.js', '.ts', '.py', '.java', '.go', '.cs', '.php'].includes(ext)) return;

        try {
            const content = await fs.promises.readFile(filePath, 'utf8');
            
            this.patterns.forEach(regex => {
                let match;
                // Reset regex state
                regex.lastIndex = 0; 
                while ((match = regex.exec(content)) !== null) {
                    const method = match[1].toUpperCase();
                    const route = match[2];
                    
                    // Collapse into a deterministic state definition: "GET:/api/v1/users"
                    const endpointDefinition = `${method}:${route}`;
                    this.officialRegistry.add(endpointDefinition);
                }
            });
        } catch (err) {
            // Ignore unreadable files
        }
    }

    outputRegistry() {
        console.log(`\n[DEVM OfficialEndpoints] Internal Boundary Defined.`);
        console.log(`Total Official Endpoints Declared: ${this.officialRegistry.size}`);
        
        console.log(`\nOfficial Endpoint State Array [1]:`);
        let count = 0;
        for (const endpoint of this.officialRegistry) {
            if (count++ > 15) {
                console.log(`  ... and ${this.officialRegistry.size - 15} more strictly typed boundaries.`);
                break;
            }
            console.log(`  [1] -> ${endpoint}`);
        }
    }
}

// Manual Execution Block
if (require.main === module) {
    const targetDir = process.argv[2] || "../.."; // Default to scan the parent XT repo
    
    const endpoints = new OfficialEndpoints(targetDir);
    endpoints.definePerimeter().then(() => {
        endpoints.outputRegistry();
    });
}

module.exports = OfficialEndpoints;
