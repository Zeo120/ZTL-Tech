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
     * @param {Object} rawStats - Format: { 'Language': { files: X, loc: Y } }
     */
    quantise(rawStats) {
        this.totalLines = 0;
        this.totalFiles = 0;
        this.quantities = {};

        // Pass 1: Sum the universe (Total LOC and Files)
        for (const [language, data] of Object.entries(rawStats)) {
            this.totalLines += data.loc;
            this.totalFiles += data.files;
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

            this.quantities[language] = {
                rawLoc: data.loc,
                fileCount: data.files,
                architecturalRatio: parseFloat(locPercentage.toFixed(4)), // 4 decimal precision
                densityImpact: parseFloat(computeWeight.toFixed(4))
            };
        }

        return {
            universe: {
                totalLoc: this.totalLines,
                totalFiles: this.totalFiles
            },
            distribution: this.quantities
        };
    }
}

module.exports = Quantiser;
