const fs = require('fs');
const path = require('path');
const DomainEntry = require('./DomainEntry');
const OfficialEndpoints = require('./OfficialEndpoints');
const UnofficialEndpoints = require('./UnofficialEndpoints');
const DomainAutoDiscovery = require('./DomainAutoDiscovery');

// Division of Purpose: Access Point Matrix Aggregation
// Tech Stack: Node.js
//
// This aggregator combines External Internet boundaries (DomainEntry) with Internal 
// Code boundaries (Official and Unofficial Endpoints) into a single unified Text File.
// This forms the complete absolute footprint for Module 1.

class AccessPointAggregator {
    constructor(targetCodeDir, outputPath) {
        this.targetCodeDir = targetCodeDir;
        this.outputPath = outputPath;
    }

    async aggregateAndExport() {
        console.log(`[DEVM Module 1] Initiating Unified Access Point Matrix Generation...`);
        
        // 0. Auto-Discover Official Domains from Codebase
        const autoDiscover = new DomainAutoDiscovery(this.targetCodeDir);
        const rootDomain = await autoDiscover.extractRootDomain();
        let targetKeyword = rootDomain;
        if (rootDomain !== "UNKNOWN") {
            targetKeyword = rootDomain.split('.')[0]; // e.g. google.com -> google
        }

        let outputBuffer = `===========================================================\n`;
        outputBuffer += `PHASR (DEVM) - MODULE 1: UNIFIED ACCESS POINT MATRIX\n`;
        outputBuffer += `Target Keyword: ${targetKeyword} | Discovered Root Domain: ${rootDomain}\n`;
        outputBuffer += `Timestamp: ${new Date().toISOString()}\n`;
        outputBuffer += `===========================================================\n\n`;
        
        outputBuffer += `[ AUTO-DISCOVERED INTERNAL DOMAIN CONFIDENCE ]\n`;
        outputBuffer += `-----------------------------------------------------------\n`;
        for (const [domain, score] of autoDiscover.discoveredDomains.entries()) {
            outputBuffer += `[CONFIDENCE: ${score}] ${domain}\n`;
        }
        outputBuffer += `\n`;

        // 1. External OSINT (Domains)
        const domainScanner = new DomainEntry(targetKeyword, rootDomain);
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
    const targetCodeDir = process.argv[2] || "../../..";
    const outputPath = process.argv[3] || path.join(__dirname, "AccessPointMatrix.txt");

    const aggregator = new AccessPointAggregator(targetCodeDir, outputPath);
    aggregator.aggregateAndExport().catch(err => console.error(err));
}

module.exports = AccessPointAggregator;
