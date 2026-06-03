const fs = require('fs');

const file = 'D:/Project XT/paradigm/admin.html';
let content = fs.readFileSync(file, 'utf8');

const regex = /async function generatePayslip\(runId, employeeId\) \{([\s\S]*?)const payslipHTML = `([\s\S]*?)<\/[hH][tT][mM][lL]>\s*`;/m;

// Let's replace the whole generatePayslip function
const oldFuncRegex = /async function generatePayslip\(runId, employeeId\) \{[\s\S]*?w\.document\.close\(\);\s*\n\s*\}/m;

const newFunc = `async function generatePayslip(runId, employeeId) {
            try {
                const res = await fetch(\`\${apiBase}/api/admin/payroll/runs/\${runId}/payslip/\${employeeId}\`, { credentials: 'include' });
                const payload = await res.json();
                if (!payload.success || !payload.data || !payload.data.payslip) {
                    alert('Failed to load payslip data.');
                    return;
                }
                const p = payload.data.payslip;
                const run = currentPayrollRuns.find(r => r.id === runId);
                
                // Pack into the expected format for payslip.html
                const payloadObj = {
                    employee: {
                        name: p.name || p.employee_name,
                        id: p.employee_id,
                        date_of_joining: p.date_of_joining,
                        pan: p.pan,
                        uan_no: p.uan_no,
                        bank_account_number: p.bank_account_number,
                        ifsc_code: p.ifsc_code
                    },
                    transaction: p,
                    run: run || { month: 1, year: 2024 }
                };
                
                sessionStorage.setItem('payslip_payload', JSON.stringify(payloadObj));
                window.open('payslip.html', '_blank');

            } catch (err) {
                console.error(err);
                alert('Network error.');
            }
        }`;

content = content.replace(oldFuncRegex, newFunc);
fs.writeFileSync(file, content);
console.log('Replaced generatePayslip in admin.html');
