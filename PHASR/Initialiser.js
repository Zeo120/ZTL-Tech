const http = require('http');
const https = require('https');
const fs = require('fs');
const path = require('path');

const PORT = 3000;

// Division of Purpose: Pure network I/O. 
// No processing, no heuristics. Just stream bits from the network into the staging layer.
const sendJsonResponse = (res, statusCode, data) => {
    res.writeHead(statusCode, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify(data));
};

const server = http.createServer((req, res) => {
    
    // 1. Fetch any public GitHub repository (via Archive Stream to avoid git dependency)
    if (req.method === 'POST' && req.url === '/api/ingest/github') {
        let body = '';
        req.on('data', chunk => { body += chunk.toString(); });
        
        req.on('end', () => {
            try {
                const data = JSON.parse(body);
                const repoUrl = data.url;
                if (!repoUrl || !repoUrl.startsWith('https://github.com/')) {
                    return sendJsonResponse(res, 400, { error: 'Invalid GitHub URL' });
                }
                
                const repoMatch = repoUrl.match(/github\.com\/([^\/]+\/[^\/]+)/);
                if (!repoMatch) return sendJsonResponse(res, 400, { error: 'Malformed GitHub URL' });

                const repoPath = repoMatch[1].replace('.git', '');
                // Fetch the TARBALL archive directly so we can parse it natively without zip dependencies
                const tarUrl = `https://github.com/${repoPath}/archive/refs/heads/main.tar.gz`;

                const stagingPath = path.join(__dirname, '..', 'staging', `${Date.now()}_repo.tar.gz`);
                fs.mkdirSync(path.dirname(stagingPath), { recursive: true });
                
                const fileStream = fs.createWriteStream(stagingPath);
                
                https.get(tarUrl, (response) => {
                    // GitHub sends 302 redirects for archive downloads
                    if (response.statusCode === 301 || response.statusCode === 302) {
                        https.get(response.headers.location, (redirectRes) => {
                            redirectRes.pipe(fileStream);
                            fileStream.on('finish', () => {
                                fileStream.close();
                                sendJsonResponse(res, 200, { success: true, message: 'GitHub repo stream ingested', path: stagingPath });
                            });
                        }).on('error', err => sendJsonResponse(res, 500, { error: err.message }));
                    } else {
                        response.pipe(fileStream);
                        fileStream.on('finish', () => {
                            fileStream.close();
                            sendJsonResponse(res, 200, { success: true, message: 'GitHub repo stream ingested', path: stagingPath });
                        });
                    }
                }).on('error', (err) => {
                    sendJsonResponse(res, 500, { error: 'Failed to fetch repo stream', details: err.message });
                });

            } catch (e) {
                sendJsonResponse(res, 400, { error: 'Invalid JSON body' });
            }
        });
    } 
    
    // 2. Accept a direct Repository Upload (Binary Stream)
    else if (req.method === 'POST' && req.url === '/api/ingest/upload') {
        const stagingPath = path.join(__dirname, '..', 'staging', `${Date.now()}_upload.zip`);
        fs.mkdirSync(path.dirname(stagingPath), { recursive: true });
        
        // Pipe the incoming request stream directly into the file system (Zero memory buffering)
        const fileStream = fs.createWriteStream(stagingPath);
        req.pipe(fileStream);
        
        req.on('end', () => {
            fileStream.close();
            sendJsonResponse(res, 200, { success: true, message: 'Binary upload stream ingested', path: stagingPath });
        });
        
        req.on('error', (err) => {
            sendJsonResponse(res, 500, { error: 'Failed to pipe upload stream', details: err.message });
        });
    } 
    
    // Reject all other traffic immediately
    else {
        sendJsonResponse(res, 404, { error: 'Route not found. Valid routes: POST /api/ingest/github, POST /api/ingest/upload' });
    }
});

server.listen(PORT, '0.0.0.0', () => {
    console.log(`[PHASR Initialiser] Online on port ${PORT}`);
    console.log(`[Purpose] Pure Async Network I/O Ingestion.`);
});
