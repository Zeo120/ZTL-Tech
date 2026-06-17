const fs = require('fs');
const path = require('path');
const readline = require('readline');

const LOG_FILE = path.join(__dirname, '../server.log');

async function getLocation(ip) {
  // If IP is localhost/private, don't query
  if (ip === '::1' || ip === '127.0.0.1' || ip.startsWith('192.168.') || ip.startsWith('10.')) {
    return 'Local/Private Network';
  }
  
  try {
    const res = await fetch(`http://ip-api.com/json/${ip}`);
    const data = await res.json();
    if (data.status === 'success') {
      return `${data.city}, ${data.regionName}, ${data.country}`;
    }
  } catch (err) {
    return 'Unknown (Failed to fetch)';
  }
  return 'Unknown';
}

async function parseLogs() {
  if (!fs.existsSync(LOG_FILE)) {
    console.log('No server.log file found yet.');
    return;
  }

  const fileStream = fs.createReadStream(LOG_FILE);
  const rl = readline.createInterface({
    input: fileStream,
    crlfDelay: Infinity
  });

  const ipCache = {};
  const stats = {
    totalRequests: 0,
    errors: 0,
    uniqueIPs: new Set()
  };

  console.log('--- LOG PARSING REPORT ---');
  
  for await (const line of rl) {
    if (!line.trim()) continue;
    try {
      const entry = JSON.parse(line.replace('\\n', ''));
      stats.totalRequests++;
      
      const ip = entry.ip || 'Unknown IP';
      stats.uniqueIPs.add(ip);

      if (entry.status >= 400) {
        stats.errors++;
        
        if (!ipCache[ip]) {
          ipCache[ip] = await getLocation(ip);
        }
        
        console.log(`\n[ERROR] ${entry.timestamp}`);
        console.log(`  IP: ${ip} (${ipCache[ip]})`);
        console.log(`  Route: ${entry.method} ${entry.path}`);
        console.log(`  Status: ${entry.status}`);
      }
    } catch (e) {
      // Ignore malformed lines
    }
  }

  console.log('\n--- SUMMARY ---');
  console.log(`Total Requests: ${stats.totalRequests}`);
  console.log(`Total Errors: ${stats.errors}`);
  console.log(`Unique IPs: ${stats.uniqueIPs.size}`);
}

parseLogs().catch(console.error);
