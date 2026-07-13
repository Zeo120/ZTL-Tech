const fs = require('fs');
const path = require('path');
const DomainEntry = require('./DomainEntry');
const OfficialEndpoints = require('./OfficialEndpoints');
const UnofficialEndpoints = require('./UnofficialEndpoints');

// Division of Purpose: Access Point Matrix Aggregation
// Tech Stack: Node.js
//
// This aggregator combines External Internet boundaries (DomainEntry) with Internal 
// Code boundaries (Official and Unofficial Endpoints) into a single unified Text File.
// This forms the complete absolute footprint for Module 1.

class AccessPointAggregator {
    constructor(targetKeyword, officialDomain, targetCodeDir, outputPath) {
        this.targetKeyword = targetKeyword;
        this.officialDomain = officialDomain;
        this.targetCodeDir = targetCodeDir;
        this.outputPath = outputPath;
    }

    async aggregateAndExport() {
        console.log(`[DEVM Module 1] Initiating Unified Access Point Matrix Generation...`);
        
        let outputBuffer = `===========================================================\n`;
        outputBuffer += `PHASR (DEVM) - MODULE 1: UNIFIED ACCESS POINT MATRIX\n`;
        outputBuffer += `Target: ${this.targetKeyword} | Root Domain: ${this.officialDomain}\n`;
        outputBuffer += `Timestamp: ${new Date().toISOString()}\n`;
        outputBuffer += `===========================================================\n\n`;

        // 1. External OSINT (Domains)
        const domainScanner = new DomainEntry(this.targetKeyword, this.officialDomain);
        const domainMatrix = await domainScanner.mapEcosystem();
        
        outputBuffer += `[ EXTERNAL DOMAIN PERIMETER ]\n`;
        outputBuffer += `-----------------------------------------------------------\n`;
        for (const [domain, isOfficial] of domainMatrix.entries()) {
            outputBuffer += `[${isOfficial}] DOMAIN: ${domain}\n`;
        }
        outputBuffer += `\n`;

        // 2. Internal Official Endpoints
        const officialScanner = new OfficialEndpoints(this.targetCodeDir);
        const officialMatrix = await officialScanner.definePerimeter();
        
        outputBuffer += `[ INTERNAL OFFICIAL ENDPOINTS (KNOWN) ]\n`;
        outputBuffer += `-----------------------------------------------------------\n`;
        for (const endpoint of officialMatrix) {
            outputBuffer += `[1] ROUTE:  ${endpoint}\n`;
        }
        outputBuffer += `\n`;

        // 3. Internal Unofficial / Shadow Endpoints
        const shadowScanner = new UnofficialEndpoints(this.targetCodeDir);
        const shadowMatrix = await shadowScanner.scanShadowBoundaries();
        
        outputBuffer += `[ INTERNAL UNOFFICIAL / SHADOW ENDPOINTS (UNKNOWN) ]\n`;
        outputBuffer += `-----------------------------------------------------------\n`;
        for (const endpoint of shadowMatrix) {
            outputBuffer += `[0] SHADOW: ${endpoint}\n`;
        }
        outputBuffer += `\n`;
        outputBuffer += `===========================================================\n`;
        outputBuffer += `END OF MATRIX\n`;

        // Write to text file
        await fs.promises.writeFile(this.outputPath, outputBuffer);
        console.log(`\n[DEVM Module 1] Aggregation Complete. Matrix saved to: ${this.outputPath}`);
    }
}

// Manual Execution Block
if (require.main === module) {
    const targetKeyword = process.argv[2] || "github";
    const officialDomain = process.argv[3] || "github.com";
    const targetCodeDir = process.argv[4] || "../../..";
    const outputPath = process.argv[5] || path.join(__dirname, "AccessPointMatrix.txt");

    const aggregator = new AccessPointAggregator(targetKeyword, officialDomain, targetCodeDir, outputPath);
    aggregator.aggregateAndExport().catch(err => console.error(err));
}

module.exports = AccessPointAggregator;
