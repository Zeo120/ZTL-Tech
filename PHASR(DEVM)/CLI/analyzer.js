const fs = require('fs');
const path = require('path');

// Division of Purpose: Actual Codebase Mathematical Profiler
// This replaces the "generic" UI simulation. It physically scans the provided directory,
// calculates exact mass, maps files, and computes real Shannon Entropy.

function calculateShannonEntropy(buffer) {
    const frequencies = new Array(256).fill(0);
    for (let i = 0; i < buffer.length; i++) {
        frequencies[buffer[i]]++;
    }
    
    let entropy = 0;
    for (let i = 0; i < 256; i++) {
        if (frequencies[i] > 0) {
            const p = frequencies[i] / buffer.length;
            entropy -= p * Math.log2(p);
        }
    }
    return entropy;
}

function scanDirectory(dirPath) {
    let stats = {
        totalMassBytes: 0,
        maxDepth: 0,
        maxEntropy: 0,
        filesScanned: 0,
        anomalies: []
    };

    function traverse(currentPath, currentDepth) {
        if (currentDepth > stats.maxDepth) stats.maxDepth = currentDepth;
        
        let items;
        try {
            items = fs.readdirSync(currentPath);
        } catch(e) { return; }

        for (const item of items) {
            // Ignore heavy node_modules and hidden git dirs for speed
            if (item === 'node_modules' || item.startsWith('.git')) continue;

            const fullPath = path.join(currentPath, item);
            let stat;
            try {
                stat = fs.statSync(fullPath);
            } catch(e) { continue; }

            if (stat.isDirectory()) {
                traverse(fullPath, currentDepth + 1);
            } else if (stat.isFile()) {
                stats.totalMassBytes += stat.size;
                stats.filesScanned++;

                // Entropy Calculation
                try {
                    const buffer = fs.readFileSync(fullPath);
                    if (buffer.length > 0) {
                        const entropy = calculateShannonEntropy(buffer);
                        if (entropy > stats.maxEntropy) stats.maxEntropy = entropy;

                        // Physical Threshold Check
                        if (entropy >= 6.0) {
                            stats.anomalies.push({
                                type: "ENTROPY_BREACH",
                                file: fullPath,
                                value: entropy.toFixed(2),
                                threshold: 6.0
                            });
                        }
                    }
                } catch(e) {}
            }
        }
    }

    traverse(dirPath, 0);
    return stats;
}

// Entry Point
const targetDir = process.argv[2] || process.cwd();
console.log(`[DEVM] Scanning Physical Codebase: ${targetDir}...`);
const results = scanDirectory(targetDir);

// Construct final JSON payload for the Neumorphic Dashboard
const payload = {
    target: targetDir,
    timestamp: new Date().toISOString(),
    metrics: {
        mass: results.totalMassBytes,
        depth: results.maxDepth,
        entropy: results.maxEntropy.toFixed(2),
        files: results.filesScanned
    },
    anomalies: results.anomalies,
    // Calculate a rough TEC/M liability based on mass and anomalies
    tecLiability: 75000 + (results.totalMassBytes * 0.10) + (results.anomalies.length * 1500000)
};

const outPath = path.join(__dirname, '../../Frontend/scan_results.json');
fs.writeFileSync(outPath, JSON.stringify(payload, null, 2));

console.log(`[✓] Analysis Complete. Mass: ${results.totalMassBytes}B | Max Entropy: ${results.maxEntropy.toFixed(2)}`);
console.log(`[✓] Results dumped to ${outPath} for UI render.`);
