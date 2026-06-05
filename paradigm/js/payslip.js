const renderPayslip = (data) => {
            const emp = data.employee;
            const tx = data.transaction;
            const run = data.run;

            const months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
            document.getElementById('month-year').textContent = `${months[run.month - 1]} ${run.year}`;

            document.getElementById('emp-name').textContent = emp.name || '-';
            document.getElementById('emp-id').textContent = `ZTL-${emp.id}`;
            document.getElementById('emp-doj').textContent = emp.date_of_joining ? emp.date_of_joining.split('T')[0] : '-';
            document.getElementById('emp-lwp').textContent = tx.lwp_days || '0';

            // PII Fields
            document.getElementById('emp-pan').textContent = emp.pan || 'UNAVAILABLE';
            document.getElementById('emp-uan').textContent = emp.uan_no || 'UNAVAILABLE';
            document.getElementById('emp-bank').textContent = emp.bank_account_number || 'UNAVAILABLE';
            document.getElementById('emp-ifsc').textContent = emp.ifsc_code || 'UNAVAILABLE';

            // Earnings
            document.getElementById('earn-basic').textContent = Number(tx.base_salary).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('earn-hra').textContent = Number(tx.hra).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('earn-allowances').textContent = Number(tx.allowances).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('total-gross').textContent = Number(tx.gross_salary).toLocaleString('en-IN', {minimumFractionDigits: 2});

            // Deductions
            document.getElementById('ded-pf').textContent = Number(tx.pf_employee).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('ded-esi').textContent = Number(tx.esi_employee).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('ded-pt').textContent = Number(tx.professional_tax).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('ded-tds').textContent = Number(tx.tds).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('ded-lwp').textContent = Number(tx.lwp_deduction).toLocaleString('en-IN', {minimumFractionDigits: 2});
            document.getElementById('ded-other').textContent = Number(tx.deductions).toLocaleString('en-IN', {minimumFractionDigits: 2});
            
            const totalDeds = Number(tx.pf_employee) + Number(tx.esi_employee) + Number(tx.professional_tax) + Number(tx.tds) + Number(tx.lwp_deduction) + Number(tx.deductions);
            document.getElementById('total-deductions').textContent = totalDeds.toLocaleString('en-IN', {minimumFractionDigits: 2});

            // Net
            document.getElementById('net-pay').textContent = `₹${Number(tx.net_salary).toLocaleString('en-IN', {minimumFractionDigits: 2})}`;
        };

        const init = async () => {
            const params = new URLSearchParams(window.location.search);
            const runId = params.get('runId');
            const empId = params.get('empId');
            const token = params.get('token');

            if (runId && empId && token) {
                try {
                    // It's a magic link!
                    const res = await fetch(`/api/auth/magic-payslip?runId=${runId}&empId=${empId}&token=${token}`);
                    const payload = await res.json();
                    if (res.ok && payload.payslip_payload) {
                        renderPayslip(payload.payslip_payload);
                    } else {
                        document.body.innerHTML = `<h2 style="color:red; font-family: monospace;">ACCESS DENIED: ${payload.error || 'INVALID LINK'}</h2>`;
                    }
                } catch (e) {
                    document.body.innerHTML = '<h2 style="color:red; font-family: monospace;">NETWORK ERROR</h2>';
                }
                return;
            }

            // Fallback to internal sessionStorage for Portal access
            const payloadStr = sessionStorage.getItem('payslip_payload');
            if (!payloadStr) {
                document.body.innerHTML = '<h2 style="color:red; font-family: monospace;">ACCESS DENIED: NO PAYLOAD OR MAGIC LINK FOUND</h2>';
            } else {
                try {
                    renderPayslip(JSON.parse(payloadStr));
                } catch (err) {
                    document.body.innerHTML = '<h2 style="color:red; font-family: monospace;">CORRUPT PAYLOAD</h2>';
                }
            }
        };

        init();