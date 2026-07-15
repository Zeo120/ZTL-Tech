document.addEventListener('DOMContentLoaded', () => {
    
    // UI Elements
    const runButton = document.getElementById('btn-run-pipeline');
    const terminal = document.getElementById('terminal-output');
    const tecAmount = document.getElementById('tec-amount');
    const statMass = document.getElementById('stat-mass');
    const statDepth = document.getElementById('stat-depth');
    const statEntropy = document.getElementById('stat-entropy');
    const stateLight = document.getElementById('global-state-light');
    const stateText = document.getElementById('global-state-text');
    const breakdownItems = document.querySelectorAll('.breakdown-item .bold');

    // Navigation interactions
    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => {
        item.addEventListener('click', () => {
            navItems.forEach(n => n.classList.remove('active'));
            item.classList.add('active');
        });
    });

    // Helper: Add log to terminal
    const logToTerminal = (message, type = 'system') => {
        const line = document.createElement('div');
        line.className = `log-line ${type}`;
        
        // Add timestamp
        const time = new Date().toISOString().split('T')[1].substring(0, 8);
        line.textContent = `[${time}] ${message}`;
        
        terminal.appendChild(line);
        terminal.scrollTop = terminal.scrollHeight;
    };

    // Helper: Animate numbers
    const animateNumber = (element, start, end, duration, prefix = '', suffix = '') => {
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            
            // Format with commas if large
            const current = Math.floor(progress * (end - start) + start);
            element.innerText = prefix + current.toLocaleString() + suffix;
            
            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
        };
        window.requestAnimationFrame(step);
    };

    // Pipeline Execution (Real Data)
    runButton.addEventListener('click', async () => {
        if (runButton.classList.contains('pulse')) return;
        
        runButton.classList.add('pulse');
        runButton.innerText = "EVALUATING CODEBASE...";
        terminal.innerHTML = ''; 

        logToTerminal("INITIATING PHASR (DEVM) PIPELINE...", "system");
        logToTerminal("Fetching real-time mathematical analysis from bare-metal scanner...", "system");

        try {
            const res = await fetch('scan_results.json');
            if (!res.ok) throw new Error("Missing scan_results.json. Did you run the analyzer?");
            
            const data = await res.json();
            
            // Render Real Module 2 (Mass)
            setTimeout(() => {
                logToTerminal(`Module 2: Mapped ${data.metrics.files} physical files in target directory.`, "success");
                animateNumber(statMass, 0, data.metrics.mass, 1500, '', ' B');
                animateNumber(statDepth, 0, data.metrics.depth, 1500);
            }, 800);

            // Render Real Module 3 (Entropy)
            setTimeout(() => {
                logToTerminal("Module 3 (Anomaly Analyser): Executing FPU FYL2X Logarithms...", "system");
                statEntropy.innerText = "Calculating...";
            }, 1800);

            setTimeout(() => {
                statEntropy.innerText = `${data.metrics.entropy} H(X)`;
                
                if (data.anomalies.length > 0) {
                    data.anomalies.forEach(anomaly => {
                        logToTerminal(`Module 3: THRESHOLD BREACHED! H(X) = ${anomaly.value} in ${anomaly.file}`, "error");
                    });
                    logToTerminal("Inference Bridge: Hardware state contradiction. Executing Wave Collapse.", "error");
                    stateText.innerText = "0 : COLLAPSED";
                    document.querySelector('.status-indicator').classList.remove('valid');
                } else {
                    logToTerminal(`Module 3: Safe Entropy. Max H(X) = ${data.metrics.entropy}`, "success");
                }
            }, 3000);

            // Render Real Module 4 (Economics)
            setTimeout(() => {
                logToTerminal("Economic Layer: Calculating Liability (TEC/M)...", "system");
                
                // Real TEC calculation based on physical mass
                const baseMaint = (data.metrics.mass * 0.10).toFixed(2);
                const liab = (data.anomalies.length * 1500000).toFixed(2);
                
                breakdownItems[0].innerText = `$${baseMaint}`;
                breakdownItems[1].innerText = `$75,000.00`; // Static Attack Surface 
                breakdownItems[2].innerText = `$${liab}`; 
                
                animateNumber(tecAmount, 0, data.tecLiability, 2000);
                
                if (data.anomalies.length > 0) {
                    logToTerminal("DEVM PIPELINE HALTED. DEPLOYMENT REJECTED.", "error");
                    runButton.innerText = "PIPELINE HALTED";
                } else {
                    logToTerminal("PIPELINE SAFE. DEPLOYMENT APPROVED.", "success");
                    runButton.innerText = "PIPELINE SAFE";
                }
                
                runButton.classList.remove('pulse');
                
            }, 4500);

        } catch (error) {
            logToTerminal(`[ERROR] ${error.message}`, "error");
            runButton.classList.remove('pulse');
            runButton.innerText = "EXECUTE PIPELINE";
        }
    });

});
