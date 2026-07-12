const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

// Division of Purpose: Pure Native Extraction.
// Unpacks a .tar.gz archive into raw source files using only native Node.js buffers and zlib.
// Zero third-party dependencies. Zero shell commands. Compute Agnostic.

class TarExtractor {
    constructor(targetDir) {
        this.targetDir = targetDir;
    }

    async extract(tarGzPath) {
        if (!fs.existsSync(this.targetDir)) {
            fs.mkdirSync(this.targetDir, { recursive: true });
        }

        return new Promise((resolve, reject) => {
            const extractStream = fs.createReadStream(tarGzPath).pipe(zlib.createGunzip());
            
            let buffer = Buffer.alloc(0);

            extractStream.on('data', (chunk) => {
                buffer = Buffer.concat([buffer, chunk]);
                
                // A tar header is exactly 512 bytes
                while (buffer.length >= 512) {
                    // Check for end of archive (two consecutive 512-byte blocks of nulls)
                    if (buffer[0] === 0) {
                        buffer = buffer.slice(512);
                        continue;
                    }

                    const fileName = buffer.toString('utf8', 0, 100).replace(/\0/g, '');
                    const fileSizeStr = buffer.toString('utf8', 124, 136).replace(/\0/g, '').trim();
                    const fileSize = parseInt(fileSizeStr, 8); // Tar sizes are octal
                    const typeFlag = buffer.toString('utf8', 156, 157);

                    // A file block is padded to 512 bytes
                    const paddedFileSize = Math.ceil(fileSize / 512) * 512;

                    if (buffer.length < 512 + paddedFileSize) {
                        // Wait for more chunks to process this file
                        break;
                    }

                    const fullPath = path.join(this.targetDir, fileName);
                    
                    if (typeFlag === '5') {
                        // It's a directory
                        if (!fs.existsSync(fullPath)) {
                            fs.mkdirSync(fullPath, { recursive: true });
                        }
                    } else if (typeFlag === '0' || typeFlag === '') {
                        // It's a regular file
                        const fileData = buffer.slice(512, 512 + fileSize);
                        const parentDir = path.dirname(fullPath);
                        if (!fs.existsSync(parentDir)) {
                            fs.mkdirSync(parentDir, { recursive: true });
                        }
                        fs.writeFileSync(fullPath, fileData);
                    }

                    // Advance the buffer past the header and the padded file content
                    buffer = buffer.slice(512 + paddedFileSize);
                }
            });

            extractStream.on('end', () => resolve(true));
            extractStream.on('error', (err) => reject(err));
        });
    }
}

// Simple execution block for manual invocation or require
if (require.main === module) {
    const inputPath = process.argv[2];
    const outputDir = process.argv[3];
    if (!inputPath || !outputDir) {
        console.error("Usage: node Extractor.js <path-to-tar-gz> <output-directory>");
        process.exit(1);
    }
    
    const extractor = new TarExtractor(outputDir);
    extractor.extract(inputPath)
        .then(() => console.log(`[PHASR Extractor] Extraction complete to ${outputDir}`))
        .catch(err => console.error(`[PHASR Extractor] Fatal Error:`, err));
}

module.exports = TarExtractor;
