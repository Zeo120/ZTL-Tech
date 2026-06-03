const tls = require('tls');
const { logger } = require('./logger');
const env = require('../config/env');

async function sendNativeEmail({ to, subject, html }) {
    const host = env.smtpHost;
    const port = parseInt(env.smtpPort || '465', 10);
    const user = env.smtpUser;
    const pass = env.smtpPass;
    const from = env.smtpFrom || user || 'noreply@paradigm.com';

    if (!host || !user || !pass) {
        logger.info('mock_email_sent', { to, subject });
        console.log('\n--- MOCK NATIVE EMAIL DISPATCH ---');
        console.log(`TO: ${to}`);
        console.log(`SUBJECT: ${subject}`);
        console.log(`MAGIC LINK: ${html.match(/href="([^"]+)"/)?.[1] || 'No Link'}`);
        console.log('----------------------------------\n');
        return true;
    }

    return new Promise((resolve, reject) => {
        let step = 0;
        const commands = [
            `EHLO paradigm`,
            `AUTH LOGIN`,
            Buffer.from(user).toString('base64'),
            Buffer.from(pass).toString('base64'),
            `MAIL FROM:<${from}>`,
            `RCPT TO:<${to}>`,
            `DATA`,
            `From: Paradigm <${from}>\r\nTo: ${to}\r\nSubject: ${subject}\r\nContent-Type: text/html; charset=UTF-8\r\n\r\n${html}\r\n.`,
            `QUIT`
        ];

        let hasError = false;

        const socket = tls.connect(port, host, { rejectUnauthorized: false }, () => {
            // Connected, wait for initial 220
        });

        socket.on('data', (data) => {
            if (hasError) return;
            const str = data.toString('utf8');
            // Check if server returned an error (4xx or 5xx), except during AUTH LOGIN (334 is normal)
            const code = parseInt(str.substring(0, 3), 10);
            if (code >= 400 && code !== 334) {
                hasError = true;
                socket.end();
                return reject(new Error(`SMTP Error: ${str.trim()}`));
            }

            // Wait until the server finishes sending multi-line responses
            // The last line of a response has a space after the status code, e.g. "250 OK" instead of "250-..."
            if (str.includes('\\r\\n') && str.match(/^\d{3}-/m)) {
               const lines = str.split('\\r\\n');
               if (lines[lines.length - 2] && lines[lines.length - 2].match(/^\d{3}-/)) {
                   return; // Wait for more data
               }
            }

            if (step < commands.length) {
                socket.write(commands[step] + '\\r\\n');
                step++;
            } else {
                socket.end();
            }
        });

        socket.on('error', (err) => {
            hasError = true;
            reject(err);
        });

        socket.on('end', () => {
            if (!hasError) resolve(true);
        });
    });
}

module.exports = { sendNativeEmail };
