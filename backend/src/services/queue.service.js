const { Worker } = require('worker_threads');
const path = require('path');
const { EventEmitter } = require('events');

class AsyncQueueManager extends EventEmitter {
  constructor() {
    super();
    this.jobs = new Map();
    this.activeWorkers = 0;
    this.MAX_WORKERS = 4; // Max CPU cores to utilize
    this.pendingQueue = [];
  }

  dispatchCodebaseScan(targetPath, scanFocus) {
    const jobId = `job-${Date.now()}-${Math.floor(Math.random()*1000)}`;
    const jobInfo = { jobId, targetPath, scanFocus, status: 'queued', progress: 0 };
    
    this.jobs.set(jobId, jobInfo);
    this.pendingQueue.push(jobInfo);
    
    this._processNext();
    return jobId;
  }

  getJobStatus(jobId) {
    return this.jobs.get(jobId) || null;
  }

  _processNext() {
    if (this.pendingQueue.length === 0 || this.activeWorkers >= this.MAX_WORKERS) {
      return;
    }

    const jobInfo = this.pendingQueue.shift();
    jobInfo.status = 'processing';
    this.activeWorkers++;

    const workerPath = path.join(__dirname, '../workers/scanner.worker.js');
    const worker = new Worker(workerPath, {
      workerData: { targetPath: jobInfo.targetPath, scanFocus: jobInfo.scanFocus, jobId: jobInfo.jobId }
    });

    worker.on('message', (msg) => {
      if (msg.type === 'progress') {
        jobInfo.progress = msg.progress;
      } else if (msg.type === 'done') {
        jobInfo.status = 'completed';
        jobInfo.progress = 100;
        jobInfo.result = msg.result;
        this.emit('job_completed', jobInfo);
        this._cleanupWorker();
      } else if (msg.type === 'error') {
        jobInfo.status = 'failed';
        jobInfo.error = msg.error;
        this._cleanupWorker();
      }
    });

    worker.on('error', (err) => {
      jobInfo.status = 'failed';
      jobInfo.error = err.message;
      this._cleanupWorker();
    });

    worker.on('exit', (code) => {
      if (code !== 0 && jobInfo.status !== 'failed') {
        jobInfo.status = 'failed';
        jobInfo.error = `Worker stopped with exit code ${code}`;
        this._cleanupWorker();
      }
    });
  }

  _cleanupWorker() {
    this.activeWorkers--;
    this._processNext();
  }
}

const queueService = new AsyncQueueManager();
module.exports = { queueService };
