const { sendNativeEmail } = require('./nativeMailer');
const { logger } = require('./logger');

// Zero-dependency in-memory worker queue
class MailDaemon {
    constructor() {
        this.queue = [];
        this.isProcessing = false;
    }

    // Add job to the background queue
    enqueue(job) {
        this.queue.push(job);
        logger.info('mail_daemon_enqueued', { queue_length: this.queue.length });
        
        // If daemon is idle, wake it up
        if (!this.isProcessing) {
            this.processQueue();
        }
    }

    async processQueue() {
        this.isProcessing = true;

        while (this.queue.length > 0) {
            const job = this.queue.shift();
            try {
                // Throttle slightly to prevent spamming the SMTP server or maxing TCP sockets
                await new Promise(resolve => setTimeout(resolve, 100));
                
                await sendNativeEmail(job);
                logger.info('mail_daemon_success', { to: job.to });
            } catch (err) {
                logger.error('mail_daemon_failed', { to: job.to, error: err.message });
                // Optional: We could implement a retry queue here
            }
        }

        this.isProcessing = false;
        logger.info('mail_daemon_idle', { status: 'All queues cleared.' });
    }
}

const mailDaemon = new MailDaemon();

module.exports = { mailDaemon };
