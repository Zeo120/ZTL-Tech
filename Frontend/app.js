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

    // Pipeline Execution Simulation
    runButton.addEventListener('click', () => {
        if (runButton.classList.contains('pulse')) return; // Already running
        
        runButton.classList.add('pulse');
        runButton.innerText = "EXECUTING...";
        terminal.innerHTML = ''; // Clear terminal

        logToTerminal("INITIATING PHASR (DEVM) PIPELINE...", "system");

        // Module 1 Simulation
        setTimeout(() => {
            logToTerminal("Module 1 (Access Points): Auto-discovering boundaries...", "system");
        }, 800);

        setTimeout(() => {
            logToTerminal("Module 1 (Access Points): 24 Official Routes mapped. 0 Shadow Routes.", "success");
        }, 2000);

        // Module 2 Simulation
        setTimeout(() => {
            logToTerminal("Module 2 (Data Analyser): Measuring physical mass and structural depth...", "system");
            animateNumber(statMass, 0, 1500000, 1500, '', ' B');
            animateNumber(statDepth, 0, 14, 1500);
        }, 3000);

        // Module 3 Simulation
        setTimeout(() => {
            logToTerminal("Module 3 (Anomaly Analyser): Executing FPU FYL2X Logarithms...", "system");
            statEntropy.innerText = "Calculating...";
        }, 5000);

        setTimeout(() => {
            statEntropy.innerText = "5.10 H(X)";
            logToTerminal("Module 3 (Anomaly Analyser): Safe Entropy. H(X) = 5.10", "success");
        }, 6500);

        // Module 4 Simulation
        setTimeout(() => {
            logToTerminal("Module 4 (Security Math): Tracing Taint Flows via Bare-Metal SIMD...", "system");
        }, 7500);

        setTimeout(() => {
            logToTerminal("Module 4 (Security Math): 0 Unsanitized executions detected. Safe.", "success");
        }, 8500);

        // Module 5 Simulation (Temporal Physics)
        setTimeout(() => {
            logToTerminal("Module 5 (Temporal Physics): Hooking RDTSC Clock Cycles for Side-Channel Leak Detection...", "system");
        }, 9500);

        setTimeout(() => {
            logToTerminal("Module 5 (Temporal Physics): TIMING LEAK DETECTED! Delta T = 14,021 Cycles.", "error");
            logToTerminal("Inference Bridge: Hardware state contradiction. Executing Wave Collapse.", "error");
            
            // UI State Change for Collapse
            stateText.innerText = "0 : COLLAPSED";
            document.querySelector('.status-indicator').classList.remove('valid');
        }, 11500);

        // OCaml Economics Simulation
        setTimeout(() => {
            logToTerminal("Economic Layer: Calculating Liability (TEC/M)...", "system");
            
            breakdownItems[0].innerText = "$75,000.00";
            breakdownItems[1].innerText = "$1,200.00";
            breakdownItems[2].innerText = "$12,500,000.00"; // Massive penalty for side-channel
            
            animateNumber(tecAmount, 0, 12576200, 2000);
            
            logToTerminal("DEVM PIPELINE HALTED. DEPLOYMENT REJECTED.", "error");
            
            runButton.classList.remove('pulse');
            runButton.innerText = "PIPELINE HALTED";
            
        }, 12500);
    });

});
