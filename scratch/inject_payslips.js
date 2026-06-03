const fs = require('fs');

const file = 'D:/Project XT/paradigm/employee_portal.html';
let content = fs.readFileSync(file, 'utf8');

// Insert the HTML card
const cardHTML = `
    <div class="card full-width">
        <h2>My Payslips</h2>
        <div id="payslipsContainer" style="margin-top: 16px;">
            Loading payslips...
        </div>
    </div>
</div> <!-- Closing container div was here -->
`;

content = content.replace('</div>\n\n<script>', cardHTML + '\n\n<script>');

// Insert the Javascript logic
const jsLogic = `
    // Load Payslips
    let currentEmployeeData = null; // Store for payslip generation
    const monthNames = ['January','February','March','April','May','June','July','August','September','October','November','December'];

    async function loadPayslips(empData) {
        currentEmployeeData = empData;
        const container = document.getElementById('payslipsContainer');
        try {
            const res = await apiRequest('/api/employee/payslips');
            if (res.ok) {
                const data = await res.json();
                if (data.payslips && data.payslips.length > 0) {
                    let html = '<table style="width: 100%; border-collapse: collapse; font-size: 14px;">';
                    html += '<tr style="border-bottom: 1px solid var(--glass-border); text-align: left;">';
                    html += '<th style="padding: 10px;">Month</th><th style="padding: 10px;">Net Pay</th><th style="padding: 10px; text-align: right;">Action</th></tr>';
                    
                    data.payslips.forEach(tx => {
                        const month = monthNames[tx.month - 1] + ' ' + tx.year;
                        const net = '₹' + Number(tx.net_salary).toLocaleString('en-IN', {minimumFractionDigits: 2});
                        html += '<tr style="border-bottom: 1px solid rgba(255,255,255,0.05);">';
                        html += '<td style="padding: 12px 10px; font-weight: 500;">' + month + '</td>';
                        html += '<td style="padding: 12px 10px; font-family: monospace; color: var(--accent);">' + net + '</td>';
                        html += '<td style="padding: 12px 10px; text-align: right;"><button class="logout-btn" onclick="openPayslip(' + tx.id + ')" style="padding: 4px 10px; font-size: 12px;">View PDF</button></td>';
                        html += '</tr>';
                    });
                    html += '</table>';
                    container.innerHTML = html;
                    
                    // Store payslips in a global map
                    window.payslipsData = data.payslips.reduce((acc, tx) => {
                        acc[tx.id] = tx;
                        return acc;
                    }, {});
                } else {
                    container.innerHTML = '<p style="color: var(--text-secondary); font-size: 14px;">No payslips available yet.</p>';
                }
            } else {
                container.innerHTML = '<p style="color: #ef4444; font-size: 14px;">Failed to load payslips.</p>';
            }
        } catch (e) {
            container.innerHTML = '<p style="color: #ef4444; font-size: 14px;">Network error.</p>';
        }
    }

    window.openPayslip = function(txId) {
        if (!currentEmployeeData || !window.payslipsData[txId]) return;
        const tx = window.payslipsData[txId];
        const payload = {
            employee: currentEmployeeData,
            transaction: tx,
            run: { month: tx.month, year: tx.year }
        };
        sessionStorage.setItem('payslip_payload', JSON.stringify(payload));
        window.open('payslip.html', '_blank');
    };
`;

// Insert the JS logic before the DOMContentLoaded listener
content = content.replace('// Initialize', jsLogic + '\n    // Initialize');

// We also need to hook loadPayslips into loadEmployeeProfile
content = content.replace(
    `document.getElementById('profileDetails').innerHTML = html;`,
    `document.getElementById('profileDetails').innerHTML = html;\n                loadPayslips(data.employee);`
);

fs.writeFileSync(file, content);
console.log('Successfully injected Payslips card and JS.');
