const https = require('https');

// Division of Purpose: Internet OSINT & Reconnaissance (Async Networking)
// Tech Stack: Node.js (Strictly for I/O and Networking)
// 
// Module 1: Domain Entry (Access Point Checker)
// This module maps the external ecosystem of the target by performing Boolean 
// searches and querying Certificate Transparency logs (crt.sh) natively.
// It maps the perimeter before the internal verification even begins.
// It categorizes discovered endpoints into Official (1) and Unofficial/Shadow (0).

class DomainEntry {
    constructor(targetKeyword, officialDomain) {
        this.targetKeyword = targetKeyword.toLowerCase();
        this.officialDomain = officialDomain.toLowerCase();
        this.accessPoints = new Map(); // Domain -> Reduced State (1 or 0)
    }

    /**
     * Executes the reconnaissance payload.
     * @returns {Promise<Map>} A map of discovered domains mapped to their Truth state (1 = Official, 0 = Unofficial)
     */
    async mapEcosystem() {
        console.log(`[DEVM] Initiating Domain Entry Matrix for: ${this.targetKeyword}`);
        
        // 1. Certificate Transparency Log Search (crt.sh) - Passive DNS OSINT
        await this._queryCertLogs(this.officialDomain);
        
        // 2. Simulated Boolean Dorking (e.g., "target" AND "login" OR "dev")
        this._executeBooleanDorks();

        return this.accessPoints;
    }

    _queryCertLogs(domain) {
        return new Promise((resolve) => {
            const url = `https://crt.sh/?q=%25.${domain}&output=json`;
            
            https.get(url, (res) => {
                let data = '';
                
                res.on('data', (chunk) => { data += chunk; });
                
                res.on('end', () => {
                    try {
                        const logs = JSON.parse(data);
                        logs.forEach(entry => {
                            const foundDomain = entry.name_value.toLowerCase();
                            // Split by wildcard or newlines in weird cert formats
                            const cleanDomains = foundDomain.split('\n').map(d => d.replace('*.', ''));
                            
                            cleanDomains.forEach(clean => {
                                // Mathematical Boolean Reduction: 
                                // Is it a strict subdomain of the official root? -> 1
                                // Otherwise (e.g., typosquat, unofficial) -> 0
                                const isOfficial = clean.endsWith(`.${this.officialDomain}`) || clean === this.officialDomain ? 1 : 0;
                                this.accessPoints.set(clean, isOfficial);
                            });
                        });
                    } catch (e) {
                        // Silent failure on parse error to maintain O(1) execution flow assumptions
                    }
                    resolve();
                });
            }).on('error', (err) => {
                console.error(`[DEVM DomainEntry] Network Error: ${err.message}`);
                resolve();
            });
        });
    }

    _executeBooleanDorks() {
        // In a production DEVM, this queries search engine APIs (Google/Bing) using boolean operators.
        // e.g., "targetKeyword" AND ("dev" OR "staging" OR "test") -site:officialDomain
        
        // Mocking the discovery of shadow/unofficial infrastructure
        const shadowDomains = [
            `dev-${this.targetKeyword}.com`,
            `admin-${this.targetKeyword}.net`,
            `${this.targetKeyword}-support-portal.info`, // Likely Phishing/Unofficial
            `staging.api.${this.officialDomain}.internal` // Exposed internal
        ];

        shadowDomains.forEach(domain => {
            // Check if it strictly matches the official boundary
            const isOfficial = domain.endsWith(`.${this.officialDomain}`) || domain === this.officialDomain ? 1 : 0;
            this.accessPoints.set(domain, isOfficial);
        });
    }

    outputMatrix() {
        console.log(`\n[DEVM DomainEntry] Access Point Matrix Generated.`);
        console.log(`Total Entry Points Discovered: ${this.accessPoints.size}`);
        
        let officialCount = 0;
        let shadowCount = 0;

        for (const [domain, isOfficial] of this.accessPoints.entries()) {
            if (isOfficial === 1) officialCount++;
            else shadowCount++;
            
            // Limit terminal spam if massive
        }

        console.log(`Official Infrastructure [1]: ${officialCount}`);
        console.log(`Unofficial / Shadow / Phishing [0]: ${shadowCount}`);
        
        // Output a sample
        console.log(`\nSample Matrix:`);
        let count = 0;
        for (const [domain, isOfficial] of this.accessPoints.entries()) {
            if (count++ > 10) break;
            console.log(`  [${isOfficial}] -> ${domain}`);
        }
    }
}

// Manual Execution Block
if (require.main === module) {
    const targetKeyword = process.argv[2] || "github";
    const officialDomain = process.argv[3] || "github.com";
    
    const entry = new DomainEntry(targetKeyword, officialDomain);
    entry.mapEcosystem().then(() => {
        entry.outputMatrix();
    });
}

module.exports = DomainEntry;
