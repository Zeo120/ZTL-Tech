const fs = require('fs');
const path = require('path');

// Division of Purpose: Computational Chunking.
// A mathematical verification engine operating in O(1) branchless assembly 
// cannot process a 50MB codebase in a single 7ms cycle. 
// The Fracturer breaks the target software into deterministic, bite-sized chunks 
// (e.g., exactly 64KB to fit perfectly into L1/L2 CPU caches). 
// This enables parallel, extreme-low-latency verification across isolated threads.

class Fracturer {
    constructor(chunkSizeBytes = 65536) { // Default: 64KB chunks to optimize for CPU cache
        this.chunkSizeBytes = chunkSizeBytes;
        this.manifest = [];
    }

    /**
     * Fractures a single file into multiple deterministic byte-chunks.
     * @param {string} filePath 
     * @param {string} outputDir 
     */
    async fractureFile(filePath, outputDir) {
        if (!fs.existsSync(outputDir)) {
            fs.mkdirSync(outputDir, { recursive: true });
        }

        const stat = await fs.promises.stat(filePath);
        const fileName = path.basename(filePath);
        
        // If file is smaller than chunk size, it remains a single chunk
        if (stat.size <= this.chunkSizeBytes) {
            const chunkPath = path.join(outputDir, `${fileName}.chunk_0`);
            await fs.promises.copyFile(filePath, chunkPath);
            this.manifest.push({ original: filePath, chunk: chunkPath, size: stat.size });
            return;
        }

        // Otherwise, split it into exact byte boundaries
        const buffer = await fs.promises.readFile(filePath);
        let offset = 0;
        let chunkIndex = 0;

        while (offset < buffer.length) {
            const end = Math.min(offset + this.chunkSizeBytes, buffer.length);
            const chunkBuffer = buffer.slice(offset, end);
            const chunkPath = path.join(outputDir, `${fileName}.chunk_${chunkIndex}`);
            
            await fs.promises.writeFile(chunkPath, chunkBuffer);
            this.manifest.push({ original: filePath, chunk: chunkPath, size: chunkBuffer.length, index: chunkIndex });
            
            offset = end;
            chunkIndex++;
        }
    }

    /**
     * Recursively fractures an entire directory into the target output directory
     */
    async fractureDirectory(inputDir, outputDir) {
        const entries = await fs.promises.readdir(inputDir, { withFileTypes: true });

        const promises = entries.map(async (entry) => {
            const fullPath = path.join(inputDir, entry.name);
            
            if (entry.isDirectory()) {
                if (['node_modules', '.git'].includes(entry.name)) return;
                
                // Mirror the directory structure in the fractured output
                const newOutputDir = path.join(outputDir, entry.name);
                await this.fractureDirectory(fullPath, newOutputDir);
            } else {
                await this.fractureFile(fullPath, outputDir);
            }
        });

        await Promise.all(promises);
        return this.manifest;
    }
}

// Manual execution block
if (require.main === module) {
    const inputDir = process.argv[2];
    const outputDir = process.argv[3];
    if (!inputDir || !outputDir) {
        console.error("Usage: node Fracturer.js <input-dir> <output-chunk-dir>");
        process.exit(1);
    }

    const fracturer = new Fracturer(); // 64KB cache-aligned chunks
    fracturer.fractureDirectory(inputDir, outputDir)
        .then(manifest => {
            console.log(`\n[PHASR Fracturer] Software shattered into ${manifest.length} discrete computational chunks.`);
            console.log(`Optimized for L1/L2 Cache. Ready for 7ms parallel evaluation.`);
        })
        .catch(err => console.error(`[PHASR Fracturer] Error:`, err));
}

module.exports = Fracturer;
