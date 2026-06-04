const fs = require('fs');

let content = fs.readFileSync('D:\\Project XT\\paradigm\\login.html', 'utf-8');

// Fix togglePasswordVisibility
content = content.replace(
    '} else if (mode === \\'super\\') {\\n                passwordInput.type = \\'password\\';\\n                // Standard eye icon path',
    '} else {\\n                passwordInput.type = \\'password\\';\\n                // Standard eye icon path'
);

// Completely replace switchMode function with the correct implementation
content = content.replace(
    /function switchMode\(mode\) \{[\s\S]*?\}(?=\s*function showError)/,
    `function switchMode(mode) {
            currentMode = mode;
            const tabAdmin = document.getElementById('tab-admin');
            const tabSuper = document.getElementById('tab-super');
            const tabEmployee = document.getElementById('tab-employee');
            const headerTitle = document.getElementById('header-title');
            const headerDesc = document.getElementById('header-desc');
            const superBanner = document.getElementById('super-banner');
            const accessIdInput = document.getElementById('access-id');

            if (mode === 'admin') {
                tabAdmin.classList.add('active');
                tabSuper.classList.remove('active');
                if (tabEmployee) tabEmployee.classList.remove('active');
                headerTitle.textContent = 'EXECUTIVE PORTAL';
                headerDesc.textContent = 'Provide authorized executive credentials to access the Paradigm control workspace.';
                superBanner.style.display = 'none';
                accessIdInput.placeholder = 'cfo@company.com';
            } else if (mode === 'super') {
                tabAdmin.classList.remove('active');
                if (tabEmployee) tabEmployee.classList.remove('active');
                tabSuper.classList.add('active');
                headerTitle.textContent = 'SUPER ADMIN CONSOLE';
                headerDesc.textContent = 'Out-of-band super admin configuration enabled.';
                superBanner.style.display = 'block';
                accessIdInput.placeholder = 'ROOT-ACCESS-ID';
            } else if (mode === 'employee') {
                tabAdmin.classList.remove('active');
                tabSuper.classList.remove('active');
                if (tabEmployee) tabEmployee.classList.add('active');
                headerTitle.textContent = 'EMPLOYEE PORTAL';
                headerDesc.textContent = 'Provide your credentials to access the self-service employee portal.';
                superBanner.style.display = 'none';
                accessIdInput.placeholder = 'employee@company.com';
            }
        }`
);

fs.writeFileSync('D:\\Project XT\\paradigm\\login.html', content);
