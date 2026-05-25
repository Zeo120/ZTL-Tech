const fs = require('fs');
const path = require('path');
const { exec } = require('child_process');
const { writeAuditEvent } = require('./audit.service');
const { sql, getDbPool } = require('../config/db');


// Supported file extensions (Mainstream and niche ones like Assembly, OCaml)
const SUPPORTED_EXTENSIONS = new Set([
  '.js', '.jsx', '.ts', '.tsx', '.py', '.cpp', '.h', '.hpp', '.c', '.cc',
  '.ml', '.mli', '.asm', '.s', '.go', '.rs', '.java', '.cs', '.sh', '.rb', '.php',
  '.html', '.css'
]);

// Excluded directories to prevent OOM and redundant checks
const EXCLUDED_FOLDERS = new Set([
  'node_modules', '.git', 'venv', '.opam', 'build', 'dist',
  'target', 'bin', 'obj', '.gemini', 'temp_clones'
]);

// Helper: Run shell commands as Promises
function runCommand(command, cwd) {
  return new Promise((resolve, reject) => {
    exec(command, { cwd }, (error, stdout, stderr) => {
      if (error) {
        reject(error);
      } else {
        resolve({ stdout, stderr });
      }
    });
  });
}

// Helper: Inspect first 1KB of files for NULL bytes or non-printable controls (excluding tab, CR, LF)
async function isBinaryFile(filePath) {
  let fd;
  try {
    const buffer = Buffer.alloc(1024);
    fd = await fs.promises.open(filePath, 'r');
    const { bytesRead } = await fd.read(buffer, 0, 1024, 0);
    for (let i = 0; i < bytesRead; i++) {
      if (buffer[i] === 0) {
        return true;
      }
    }
    return false;
  } catch (err) {
    return true; // default to skip on read errors
  } finally {
    if (fd) await fd.close();
  }
}

// Concurrency-limited promise queue
async function limitConcurrency(tasks, limit, fn) {
  const results = [];
  const executing = new Set();
  for (const task of tasks) {
    const p = Promise.resolve().then(() => fn(task));
    results.push(p);
    executing.add(p);
    const clean = () => executing.delete(p);
    p.then(clean, clean);
    if (executing.size >= limit) {
      await Promise.race(executing);
    }
  }
  return Promise.all(results);
}

// Helper: Scan project manifest files and extract dependencies
async function extractDependencies(scanDir) {
  const dependencies = [];
  try {
    // 1. package.json (NodeJS)
    const packageJsonPath = path.join(scanDir, 'package.json');
    if (fs.existsSync(packageJsonPath)) {
      const content = await fs.promises.readFile(packageJsonPath, 'utf8');
      const pkg = JSON.parse(content);
      if (pkg.dependencies) {
        for (const [name, ver] of Object.entries(pkg.dependencies)) {
          dependencies.push({ name, version: ver, manager: 'npm (package.json)', type: 'Direct Dependency' });
        }
      }
      if (pkg.devDependencies) {
        for (const [name, ver] of Object.entries(pkg.devDependencies)) {
          dependencies.push({ name, version: ver, manager: 'npm (package.json)', type: 'Dev Dependency' });
        }
      }
    }

    // 2. requirements.txt (Python)
    const reqPath = path.join(scanDir, 'requirements.txt');
    if (fs.existsSync(reqPath)) {
      const content = await fs.promises.readFile(reqPath, 'utf8');
      const lines = content.split(/\r?\n/);
      for (const line of lines) {
        const trimmed = line.trim();
        if (trimmed && !trimmed.startsWith('#')) {
          const parts = trimmed.split(/==|>=|<=|~=|>|</);
          const name = parts[0].trim();
          const version = parts[1] ? parts[1].trim() : 'latest';
          dependencies.push({ name, version, manager: 'pip (requirements.txt)', type: 'Dependency' });
        }
      }
    }

    // 3. go.mod (Go)
    const goModPath = path.join(scanDir, 'go.mod');
    if (fs.existsSync(goModPath)) {
      const content = await fs.promises.readFile(goModPath, 'utf8');
      const lines = content.split(/\r?\n/);
      let inRequireBlock = false;
      for (const line of lines) {
        const trimmed = line.trim();
        if (trimmed.startsWith('require (')) {
          inRequireBlock = true;
          continue;
        }
        if (inRequireBlock && trimmed.startsWith(')')) {
          inRequireBlock = false;
          continue;
        }
        if (inRequireBlock) {
          const parts = trimmed.split(/\s+/);
          if (parts.length >= 2) {
            const name = parts[0];
            const version = parts[1];
            const type = trimmed.includes('indirect') ? 'Indirect Dependency' : 'Direct Dependency';
            dependencies.push({ name, version, manager: 'go mod (go.mod)', type });
          }
        } else if (trimmed.startsWith('require ')) {
          const parts = trimmed.replace('require ', '').split(/\s+/);
          if (parts.length >= 2) {
            const name = parts[0];
            const version = parts[1];
            dependencies.push({ name, version, manager: 'go mod (go.mod)', type: 'Direct Dependency' });
          }
        }
      }
    }

    // 4. Cargo.toml (Rust)
    const cargoTomlPath = path.join(scanDir, 'Cargo.toml');
    if (fs.existsSync(cargoTomlPath)) {
      const content = await fs.promises.readFile(cargoTomlPath, 'utf8');
      const lines = content.split(/\r?\n/);
      let section = '';
      for (const line of lines) {
        const trimmed = line.trim();
        if (trimmed.startsWith('[') && trimmed.endsWith(']')) {
          section = trimmed.toLowerCase();
          continue;
        }
        if (section === '[dependencies]' || section === '[dev-dependencies]') {
          if (trimmed && !trimmed.startsWith('#')) {
            const eqIdx = trimmed.indexOf('=');
            if (eqIdx !== -1) {
              const name = trimmed.substring(0, eqIdx).trim();
              let verVal = trimmed.substring(eqIdx + 1).trim();
              let version = 'latest';
              if (verVal.startsWith('{')) {
                const match = verVal.match(/version\s*=\s*['"]([^'"]+)['"]/);
                if (match) version = match[1];
              } else {
                version = verVal.replace(/['"]/g, '');
              }
              const type = (section === '[dependencies]') ? 'Direct Dependency' : 'Dev Dependency';
              dependencies.push({ name, version, manager: 'cargo (Cargo.toml)', type });
            }
          }
        }
      }
    }

    // 5. CMakeLists.txt (C/C++)
    const cmakePath = path.join(scanDir, 'CMakeLists.txt');
    if (fs.existsSync(cmakePath)) {
      const content = await fs.promises.readFile(cmakePath, 'utf8');
      const regex = /find_package\s*\(\s*([a-zA-Z0-9_\-]+)(?:\s+([0-9\.]+))?/gi;
      let match;
      while ((match = regex.exec(content)) !== null) {
        const name = match[1];
        const version = match[2] || 'latest';
        dependencies.push({ name, version, manager: 'cmake (CMakeLists.txt)', type: 'Package Dependency' });
      }
    }

    // 6. dune-project (OCaml)
    const dunePath = path.join(scanDir, 'dune-project');
    if (fs.existsSync(dunePath)) {
      const content = await fs.promises.readFile(dunePath, 'utf8');
      const depMatch = content.match(/\(depends\s+([\s\S]+?)\)/);
      if (depMatch) {
        const items = depMatch[1].split(/\s+/);
        for (const item of items) {
          const cleanItem = item.replace(/[\(\)\"\']/g, '').trim();
          if (cleanItem && !cleanItem.startsWith(':') && isNaN(cleanItem[0])) {
            dependencies.push({ name: cleanItem, version: 'latest', manager: 'dune (dune-project)', type: 'Library Dependency' });
          }
        }
      }
    }
  } catch (err) {
    console.error('Error scanning dependencies:', err);
  }
  return dependencies;
}

// Main static codebase scan logic
async function runCodebaseScan({ userId, sourceType, targetPath, scanFocus, ip, userAgent }) {
  const auditId = Date.now();
  let scanDir = targetPath;
  let isTempClone = false;
  let tempClonePath = '';

  await writeAuditEvent({
    actorUserId: userId,
    action: 'phasr.scan_started',
    targetType: 'codebase',
    targetId: targetPath,
    ip,
    userAgent,
    success: true,
    metadata: { details: `Initializing PHASE codebase transition scanner for: ${targetPath}` }
  });

  try {
    // 1. Handle Online Repository (Clone via Git)
    if (sourceType === 'online') {
      isTempClone = true;
      const cloneDirName = `clone_${Date.now()}_${Math.random().toString(36).substring(2, 8)}`;
      tempClonePath = path.join(process.cwd(), 'temp_clones', cloneDirName);
      
      // Ensure temp_clones directory exists
      await fs.promises.mkdir(path.dirname(tempClonePath), { recursive: true });

      await writeAuditEvent({
        actorUserId: userId,
        action: 'phasr.scan_cloning',
        targetType: 'codebase',
        targetId: targetPath,
        ip,
        userAgent,
        success: true,
        metadata: { details: `Cloning public GitHub repository: ${targetPath} ...` }
      });

      // Run shallow clone
      await runCommand(`git clone --depth 1 "${targetPath}" "${tempClonePath}"`);
      scanDir = tempClonePath;

      await writeAuditEvent({
        actorUserId: userId,
        action: 'phasr.scan_cloned',
        targetType: 'codebase',
        targetId: targetPath,
        ip,
        userAgent,
        success: true,
        metadata: { details: `Git clone completed successfully. Starting parsing...` }
      });
    }

    // 2. Index files recursively
    await writeAuditEvent({
      actorUserId: userId,
      action: 'phasr.scan_indexing',
      targetType: 'codebase',
      targetId: targetPath,
      ip,
      userAgent,
      success: true,
      metadata: { details: `Indexing files in target workspace directory...` }
    });

    const filePaths = [];
    async function walkDir(dir) {
      const entries = await fs.promises.readdir(dir, { withFileTypes: true });
      for (const entry of entries) {
        const fullPath = path.join(dir, entry.name);
        if (entry.isDirectory()) {
          if (!EXCLUDED_FOLDERS.has(entry.name)) {
            await walkDir(fullPath);
          }
        } else if (entry.isFile()) {
          const ext = path.extname(entry.name).toLowerCase();
          if (SUPPORTED_EXTENSIONS.has(ext)) {
            filePaths.push(fullPath);
          }
        }
      }
    }

    if (!fs.existsSync(scanDir)) {
      throw new Error(`Target path does not exist: ${scanDir}`);
    }
    await walkDir(scanDir);

    await writeAuditEvent({
      actorUserId: userId,
      action: 'phasr.scan_indexed',
      targetType: 'codebase',
      targetId: targetPath,
      ip,
      userAgent,
      success: true,
      metadata: { details: `Indexing complete. Found ${filePaths.length} candidate source files.` }
    });

    // 3. Scan files in concurrency-limited batches
    const findings = [];
    let fileIndex = 0;

    const processFile = async (filePath) => {
      fileIndex++;
      // Progress log every 100 files or at completion
      if (fileIndex % 100 === 0 || fileIndex === filePaths.length) {
        await writeAuditEvent({
          actorUserId: userId,
          action: 'phasr.scan_progress',
          targetType: 'codebase',
          targetId: targetPath,
          ip,
          userAgent,
          success: true,
          metadata: { details: `Static analysis parsing: ${fileIndex} / ${filePaths.length} files scanned.` }
        });
      }

      // Check if file is binary
      if (await isBinaryFile(filePath)) {
        return;
      }

      try {
        const content = await fs.promises.readFile(filePath, 'utf8');
        const lines = content.split(/\r?\n/);
        const relPath = path.relative(scanDir, filePath).replace(/\\/g, '/');

        // File-level indicators for Leaks
        let hasInterval = false;
        let hasIntervalCleanup = false;
        let hasTimeout = false;
        let hasTimeoutCleanup = false;
        let hasMalloc = false;
        let hasFree = false;
        let hasSocket = false;
        let hasSocketCleanup = false;

        let firstIntervalLine = 0;
        let firstTimeoutLine = 0;
        let firstMallocLine = 0;
        let firstSocketLine = 0;

        // Perform line-by-line checks
        for (let i = 0; i < lines.length; i++) {
          const line = lines[i];
          const lineNum = i + 1;
          const trimmed = line.trim();

          // 1. Transition/Navigation Discrepancies
          // Matches redirection keyword but lacks authorization or role checks on the same line
          const transitionTrigger = /(window\.location|redirect_to|res\.redirect|router\.push|navigate|self\.redirect|Location:\s*['"]|jmp\s+admin|goto\s+admin|jump\s+admin)/i;
          const protectionCheck = /auth|admin|role|session|permission|token|jwt|cookie|guard|verify|check|allow|require/i;

          if (transitionTrigger.test(trimmed) && !protectionCheck.test(trimmed)) {
            // Check if scanFocus permits
            if (scanFocus === 'full' || scanFocus === 'navigation') {
              findings.push({
                file: relPath,
                line: lineNum,
                code: trimmed.substring(0, 120),
                category: 'Transition Discrepancy',
                severity: 'Warning',
                remediation: 'Verify user authorization status or role permissions prior to executing navigation redirections.'
              });
            }
          }

          // 2. Weak Login Logic
          const hardcodedCreds = /(password|secret|admin_pass|api_key|access_id)\s*(==|===|=)\s*['"][a-zA-Z0-9_@#!$%^&*()-+=]{4,}['"]/i;
          const weakHash = /md5\s*\(|sha1\s*\(/i;
          const insecureStorage = /localStorage\.(setItem|getItem)/i;

          if (hardcodedCreds.test(trimmed)) {
            if (scanFocus === 'full' || scanFocus === 'login') {
              findings.push({
                file: relPath,
                line: lineNum,
                code: trimmed.substring(0, 120),
                category: 'Weak Login Logic',
                severity: 'Critical',
                remediation: 'Remove hardcoded passwords, secrets, or API keys. Use environment configurations or secure secrets vaults.'
              });
            }
          }

          if (weakHash.test(trimmed)) {
            if (scanFocus === 'full' || scanFocus === 'login') {
              findings.push({
                file: relPath,
                line: lineNum,
                code: trimmed.substring(0, 120),
                category: 'Weak Login Logic',
                severity: 'Warning',
                remediation: 'Migrate legacy hash utilities (MD5, SHA1) to secure salted hashing mechanisms (e.g. Argon2id, bcrypt).'
              });
            }
          }

          if (insecureStorage.test(trimmed)) {
            if (scanFocus === 'full' || scanFocus === 'login') {
              findings.push({
                file: relPath,
                line: lineNum,
                code: trimmed.substring(0, 120),
                category: 'Weak Login Logic',
                severity: 'Warning',
                remediation: 'Avoid saving authentication credentials or state keys inside localStorage. Use secure HTTP-only cookies.'
              });
            }
          }

          // 3. Button/Action CSRF Vulnerabilities
          const actionTrigger = /onclick\s*=|on_click\s*=|trigger\s*\(|button\s+type=|action\s*=\s*['"]\/api|fetch\s*\(\s*['"]|axios\.post\s*\(/i;
          const csrfCheck = /csrf|xsrf|token|header|authenticity_token/i;

          if (actionTrigger.test(trimmed) && !csrfCheck.test(trimmed)) {
            if (scanFocus === 'full' || scanFocus === 'buttons') {
              findings.push({
                file: relPath,
                line: lineNum,
                code: trimmed.substring(0, 120),
                category: 'Action CSRF Vulnerability',
                severity: 'Warning',
                remediation: 'Enforce anti-CSRF headers or CSRF validation tokens on state-changing API request channels and event listeners.'
              });
            }
          }

          // Gather indicators for Leaks (File level)
          if (/setInterval\s*\(/i.test(trimmed)) {
            hasInterval = true;
            if (!firstIntervalLine) firstIntervalLine = lineNum;
          }
          if (/clearInterval\s*\(/i.test(trimmed)) {
            hasIntervalCleanup = true;
          }
          if (/setTimeout\s*\(/i.test(trimmed)) {
            hasTimeout = true;
            if (!firstTimeoutLine) firstTimeoutLine = lineNum;
          }
          if (/clearTimeout\s*\(/i.test(trimmed)) {
            hasTimeoutCleanup = true;
          }
          if (/malloc\s*\(/i.test(trimmed)) {
            hasMalloc = true;
            if (!firstMallocLine) firstMallocLine = lineNum;
          }
          if (/free\s*\(/i.test(trimmed)) {
            hasFree = true;
          }
          if (/BroadcastChannel|WebSocket|socket/i.test(trimmed)) {
            hasSocket = true;
            if (!firstSocketLine) firstSocketLine = lineNum;
          }
          if (/close\s*\(|destroy|disconnect/i.test(trimmed)) {
            hasSocketCleanup = true;
          }
        }

        // Add file-level leak findings
        if (scanFocus === 'full' || scanFocus === 'leaks') {
          if (hasInterval && !hasIntervalCleanup) {
            findings.push({
              file: relPath,
              line: firstIntervalLine,
              code: 'setInterval(...)',
              category: 'Resource/Timer Leak',
              severity: 'Warning',
              remediation: 'Ensure interval loops are terminated via clearInterval() when context terminates or component unmounts.'
            });
          }
          if (hasTimeout && !hasTimeoutCleanup) {
            // Note: timeouts are often short, but persistent un-cleared timeouts can cause leaks
            findings.push({
              file: relPath,
              line: firstTimeoutLine,
              code: 'setTimeout(...)',
              category: 'Resource/Timer Leak',
              severity: 'Info',
              remediation: 'Clear active timeout timers via clearTimeout() to ensure routines do not trigger on stale components.'
            });
          }
          if (hasMalloc && !hasFree) {
            findings.push({
              file: relPath,
              line: firstMallocLine,
              code: 'malloc(...)',
              category: 'Resource/Timer Leak',
              severity: 'Warning',
              remediation: 'Deallocate heap memory structures using free() to prevent program memory exhaustion.'
            });
          }
          if (hasSocket && !hasSocketCleanup) {
            findings.push({
              file: relPath,
              line: firstSocketLine,
              code: 'Socket / Connection initialization',
              category: 'Resource/Timer Leak',
              severity: 'Warning',
              remediation: 'Close active sockets, network interfaces, or channels using close() or disconnect() routines.'
            });
          }
        }

      } catch (err) {
        // Log individual file read fail but do not crash the entire scan
        console.error(`Failed to scan file ${filePath}:`, err);
      }
    };

    // Concurrency limit of 5 parallel reads
    await limitConcurrency(filePaths, 5, processFile);

    // Extract dependencies from target directory
    const dependencies = await extractDependencies(scanDir);

    // 4. Summarize results
    const criticalCount = findings.filter(f => f.severity === 'Critical').length;
    const warningCount = findings.filter(f => f.severity === 'Warning').length;
    const infoCount = findings.filter(f => f.severity === 'Info').length;

    const report = {
      auditId,
      sourceType,
      targetPath,
      scanFocus,
      dependencies,
      summary: {
        totalFilesScanned: filePaths.length,
        criticalCount,
        warningCount,
        infoCount,
        vulnerabilitiesCount: findings.length
      },
      findings,
      details: `Static code scan finalized. Scanned ${filePaths.length} files. Issues found: ${findings.length} (Critical: ${criticalCount}, Warning: ${warningCount}, Info: ${infoCount}).`
    };

    // Save scan metadata and dependencies to database
    try {
      const pool = await getDbPool();
      const scanResult = await pool.request()
        .input('userId', sql.Int, userId)
        .input('targetPath', sql.NVarChar(sql.MAX), targetPath)
        .input('sourceType', sql.NVarChar(50), sourceType)
        .input('scanFocus', sql.NVarChar(50), scanFocus)
        .input('totalFiles', sql.Int, filePaths.length)
        .input('criticalCount', sql.Int, criticalCount)
        .input('warningCount', sql.Int, warningCount)
        .input('infoCount', sql.Int, infoCount)
        .query(`
          INSERT INTO CodebaseScans (user_id, target_path, source_type, scan_focus, total_files, critical_count, warning_count, info_count, created_at)
          VALUES (@userId, @targetPath, @sourceType, @scanFocus, @totalFiles, @criticalCount, @warningCount, @infoCount, SYSUTCDATETIME());
          SELECT SCOPE_IDENTITY() as id;
        `);
      
      const scanId = scanResult.recordset[0].id;

      if (dependencies && dependencies.length > 0) {
        for (const dep of dependencies) {
          await pool.request()
            .input('scanId', sql.Int, scanId)
            .input('name', sql.NVarChar(255), dep.name)
            .input('version', sql.NVarChar(50), dep.version)
            .input('manager', sql.NVarChar(100), dep.manager)
            .input('type', sql.NVarChar(100), dep.type)
            .query(`
              INSERT INTO CodebaseDependencies (scan_id, name, version, manager, type, created_at)
              VALUES (@scanId, @name, @version, @manager, @type, SYSUTCDATETIME());
            `);
        }
      }

      if (findings && findings.length > 0) {
        for (const finding of findings) {
          await pool.request()
            .input('scanId', sql.Int, scanId)
            .input('filePath', sql.NVarChar(sql.MAX), finding.file || '')
            .input('lineNumber', sql.Int, finding.line || 0)
            .input('codeSnippet', sql.NVarChar(sql.MAX), finding.code || '')
            .input('category', sql.NVarChar(100), finding.category || '')
            .input('severity', sql.NVarChar(50), finding.severity || '')
            .input('remediation', sql.NVarChar(sql.MAX), finding.remediation || '')
            .query(`
              INSERT INTO CodebaseScanFindings (scan_id, file_path, line_number, code_snippet, category, severity, remediation, created_at)
              VALUES (@scanId, @filePath, @lineNumber, @codeSnippet, @category, @severity, @remediation, SYSUTCDATETIME());
            `);
        }
      }

      // Generate the text report
      let reportText = `================================================================================
PHASR VULNERABILITY AUDIT & CODEBASE SCAN FINDINGS REPORT
================================================================================
Generated on: ${new Date().toISOString()}
Target System: ZTL Tech Codebase Scans
================================================================================

--------------------------------------------------------------------------------
SCAN ID: ${scanId} | Target: ${targetPath}
--------------------------------------------------------------------------------
Scan Date: ${new Date().toISOString()}
Focus Area: ${scanFocus}
Source Type: ${sourceType}
Total Files Scanned: ${filePaths.length}
Severity Summary:
  - Critical Vulnerabilities: ${criticalCount}
  - Warning Vulnerabilities:  ${warningCount}
  - Informational Notes:      ${infoCount}
  - Total Findings:           ${findings.length}

`;

      reportText += `Dependencies Audited (${dependencies.length} found):\n`;
      if (dependencies.length === 0) {
        reportText += `  No package dependencies registered.\n`;
      } else {
        for (const dep of dependencies) {
          reportText += `  - [${dep.manager}] ${dep.name} (${dep.version}) - Type: ${dep.type}\n`;
        }
      }
      reportText += `\n`;

      reportText += `Detailed Vulnerability Findings (${findings.length} found):\n`;
      if (findings.length === 0) {
        reportText += `  No vulnerabilities or informational notes detected in this scan.\n`;
      } else {
        findings.forEach((finding, idx) => {
          reportText += `  Finding #${idx + 1}: [${finding.severity || 'UNKNOWN'}]\n`;
          reportText += `    - File Path:    ${finding.file || 'N/A'}\n`;
          reportText += `    - Line Number:  ${finding.line || 'N/A'}\n`;
          reportText += `    - Category:     ${finding.category || 'N/A'}\n`;
          reportText += `    - Code Snippet: ${finding.code || 'N/A'}\n`;
          reportText += `    - Remediation:  ${finding.remediation || 'N/A'}\n\n`;
        });
      }

      // Write report to the target directory if it is offline and exists
      if (sourceType === 'offline' && fs.existsSync(targetPath)) {
        try {
          fs.writeFileSync(path.join(targetPath, 'codebase_scan_findings_report.txt'), reportText, 'utf8');
        } catch (err) {
          console.error(`Failed to write findings report to target path ${targetPath}:`, err);
        }
      }

      // Always write to workspace root for quick user access
      try {
        fs.writeFileSync('d:/Project XT/codebase_scan_findings_report.txt', reportText, 'utf8');
      } catch (err) {
        console.error('Failed to write findings report to workspace root:', err);
      }
    } catch (dbErr) {
      console.error('Failed to save codebase scan telemetry to database:', dbErr);
    }

    await writeAuditEvent({
      actorUserId: userId,
      action: 'phasr.vulnerability_report_generated',
      targetType: 'codebase',
      targetId: targetPath,
      ip,
      userAgent,
      success: findings.length === 0,
      metadata: report
    });

    return report;

  } finally {
    // 5. Cleanup Temp cloned folders always
    if (isTempClone && tempClonePath) {
      try {
        await fs.promises.rm(tempClonePath, { recursive: true, force: true });
        console.log(`Successfully deleted temporary repository clone: ${tempClonePath}`);
      } catch (cleanupErr) {
        console.error(`Failed to clean up cloned directory: ${tempClonePath}`, cleanupErr);
      }
    }
  }
}

module.exports = { runCodebaseScan };
