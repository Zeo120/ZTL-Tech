// Division of Purpose: Architectural Mathematics.
// The Quantiser takes raw scan data (LOC and file counts) and applies mathematical 
// weighting to determine the precise architectural ratio of the codebase.
// It converts raw numbers into a deterministic evaluation profile.

class Quantiser {
    constructor() {
        this.totalLines = 0;
        this.totalFiles = 0;
        this.quantities = {};
    }

    /**
     * Ingests the raw stats object from the Scanner
     * @param {Object} rawStats - Format: { 'Language': { files: X, loc: Y, bytes: Z } }
     */
    quantise(rawStats) {
        this.totalLines = 0;
        this.totalFiles = 0;
        this.totalBytes = 0;
        this.quantities = {};

        // Pass 1: Sum the universe (Total LOC, Files, and Bytes)
        for (const [language, data] of Object.entries(rawStats)) {
            this.totalLines += data.loc;
            this.totalFiles += data.files;
            this.totalBytes += data.bytes;
        }

        if (this.totalLines === 0) return this.quantities; // Prevent division by zero

        // Pass 2: Calculate the absolute architectural weighting
        for (const [language, data] of Object.entries(rawStats)) {
            const locPercentage = (data.loc / this.totalLines) * 100;
            const filePercentage = (data.files / this.totalFiles) * 100;
            
            // Weight the impact: Assembly/C code is mathematically denser than HTML
            // We define a base density ratio to accurately model the compute impact
            let densityMultiplier = 1.0;
            if (['Assembly', 'C', 'C++'].includes(language)) densityMultiplier = 1.8;
            if (['HTML', 'CSS', 'Markdown'].includes(language)) densityMultiplier = 0.4;
            
            const computeWeight = (data.loc * densityMultiplier);
            
            // Calculate Physical Machine footprint
            const HARDWARE_SECTOR_SIZE = 512; // Standard drive sector
            const VM_PAGE_SIZE = 4096; // Standard memory page
            
            const diskSectors = Math.ceil(data.bytes / HARDWARE_SECTOR_SIZE);
            const memoryPages = Math.ceil(data.bytes / VM_PAGE_SIZE);

            this.quantities[language] = {
                rawLoc: data.loc,
                fileCount: data.files,
                rawBytes: data.bytes,
                humanSize: this._formatBytes(data.bytes),
                machineSectors: diskSectors,
                memoryPages: memoryPages,
                architecturalRatio: parseFloat(locPercentage.toFixed(4)), // 4 decimal precision
                densityImpact: parseFloat(computeWeight.toFixed(4))
            };
        }

        return {
            universe: {
                totalLoc: this.totalLines,
                totalFiles: this.totalFiles,
                totalBytes: this.totalBytes,
                humanTotal: this._formatBytes(this.totalBytes)
            },
            distribution: this.quantities
        };
    }

    _formatBytes(bytes) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(2)) + ' ' + sizes[i];
    }
}

module.exports = Quantiser;
