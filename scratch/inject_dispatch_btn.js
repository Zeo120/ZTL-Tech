const fs = require('fs');
const file = 'D:/Project XT/paradigm/admin.html';
let content = fs.readFileSync(file, 'utf8');

const injection = `
        async function dispatchPayrollRun(runId) {
            if (!confirm('Dispatch cryptographically signed payslips via Native Email to all employees in this run?')) return;
            showPayrollRunMsg('Dispatching native emails over TCP sockets... Please wait.', false);
            try {
                const res = await fetch(\`\${apiBase}/api/admin/payroll/runs/\${runId}/dispatch\`, {
                    method: 'POST', credentials: 'include',
                    headers: { 'Content-Type': 'application/json', 'x-csrf-token': getCSRFToken() }
                });
                const payload = await res.json();
                if (res.ok) {
                    showPayrollRunMsg(payload.data?.message || 'Emails dispatched successfully.', false);
                } else {
                    showPayrollRunMsg(payload.error || 'Failed to dispatch emails.', true);
                }
            } catch (err) {
                console.error(err);
                showPayrollRunMsg('Connection error during dispatch.', true);
            }
        }
`;

content = content.replace(/async function processPayrollRun.*?}[\r\n ]+}/s, match => match + "\n" + injection);
fs.writeFileSync(file, content);
console.log('Injected dispatchPayrollRun function.');
