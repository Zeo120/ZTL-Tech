const { parentPort, workerData } = require('worker_threads');
const fs = require('fs');
const path = require('path');

// Simulated heavy CPU-bound AST Parsing
function performStaticAnalysis(targetPath, scanFocus) {
  let fileCount = 0;
  let vulnCount = 0;
  const criticalFindings = [];

  // Simulate heavy computation that would normally block the main event loop
  // by occupying the thread for a short duration
  const start = Date.now();
  while (Date.now() - start < 3000) {
    // Spin loop to max out the CPU core for 3 seconds
  }

  // Generate some fake findings
  fileCount = 1420;
  
  if (scanFocus === 'full' || scanFocus === 'leaks') {
    vulnCount++;
    criticalFindings.push({
      id: `VULN-${Date.now()}`,
      file: 'src/controllers/auth.js',
      line: 42,
      type: 'Resource Leak',
      description: 'Unclosed database connection detected in error handler.',
      severity: 'high'
    });
  }

  return {
    totalFilesScanned: fileCount,
    vulnerabilitiesCount: vulnCount,
    criticalCount: criticalFindings.filter(f => f.severity === 'critical' || f.severity === 'high').length,
    warningCount: 0,
    findings: criticalFindings
  };
}

try {
  const { targetPath, scanFocus, jobId } = workerData;
  parentPort.postMessage({ type: 'progress', jobId, progress: 10 });
  
  const summary = performStaticAnalysis(targetPath, scanFocus);
  
  parentPort.postMessage({ 
    type: 'done', 
    jobId, 
    result: {
      targetPath,
      scanFocus,
      summary,
      sourceType: 'offline', // mocking
      timestamp: new Date().toISOString()
    }
  });

} catch (error) {
  parentPort.postMessage({ type: 'error', jobId: workerData.jobId, error: error.message });
}
