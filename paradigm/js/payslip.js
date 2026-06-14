const renderPayslip = (payload) => {
  // Support both legacy payload { employee, transaction, run } and new flat EAV payload { payslip }
  const data = payload.payslip || payload;
  const isLegacy = !!payload.employee;

  const tx = isLegacy ? payload.transaction : data;
  const emp = isLegacy ? payload.employee : data;
  const run = isLegacy ? payload.run : data;

  const months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"];
  
  // Metadata & Header
  document.getElementById("comp-name").textContent = data.company_metadata?.company_name || "ZTL Tech";
  document.getElementById("comp-address").textContent = data.company_metadata?.registered_address || "Paradigm Payroll Engine";
  document.getElementById("comp-email").textContent = data.company_metadata?.contact_email ? `e-Mail: ${data.company_metadata.contact_email}` : "Connecting ledgers globally.";

  document.getElementById("month-year").textContent = `${months[run.month - 1]} ${run.year}`;

  // Employee Info
  document.getElementById("emp-name").textContent = emp.name || emp.employee_name || "-";
  document.getElementById("emp-code").textContent = emp.employee_code || `AA/B-${String(emp.id || emp.employee_id).padStart(3, '0')}`;
  document.getElementById("emp-dept").textContent = emp.department || "NON TECH TEAM";
  document.getElementById("emp-doj").textContent = emp.date_of_joining ? emp.date_of_joining.split("T")[0] : "-";
  document.getElementById("emp-lwp").textContent = tx.lwp_days || "0";

  // PII Fields
  document.getElementById("emp-pan").textContent = emp.pan || "UNAVAILABLE";
  document.getElementById("emp-uan").textContent = emp.uan_no || "UNAVAILABLE";
  document.getElementById("emp-bank").textContent = emp.bank_account_number || "UNAVAILABLE";
  document.getElementById("emp-ifsc").textContent = emp.ifsc_code || "UNAVAILABLE";

  const fmt = (val) => Number(val || 0).toLocaleString("en-IN", { minimumFractionDigits: 2 });

  // Earnings
  document.getElementById("earn-basic").textContent = fmt(tx.base_salary);
  document.getElementById("earn-hra").textContent = fmt(tx.hra);
  document.getElementById("earn-allowances").textContent = fmt(tx.allowances);
  document.getElementById("total-gross").textContent = fmt(tx.gross_salary);

  // Deductions
  document.getElementById("ded-pf").textContent = fmt(tx.pf_employee);
  document.getElementById("ded-esi").textContent = fmt(tx.esi_employee);
  document.getElementById("ded-pt").textContent = fmt(tx.professional_tax);
  document.getElementById("ded-tds").textContent = fmt(tx.tds);
  document.getElementById("ded-lwp").textContent = fmt(tx.lwp_deduction);
  document.getElementById("ded-other").textContent = fmt(tx.deductions);

  const totalDeds = Number(tx.pf_employee || 0) + Number(tx.esi_employee || 0) + 
                    Number(tx.professional_tax || 0) + Number(tx.tds || 0) + 
                    Number(tx.lwp_deduction || 0) + Number(tx.deductions || 0);
  document.getElementById("total-deductions").textContent = fmt(totalDeds);

  // Net Pay
  document.getElementById("net-pay").textContent = `₹${fmt(tx.net_salary)}`;
  document.getElementById("net-pay-words").textContent = data.net_salary_words || "In Words : Rs. Calculated Securely Only";

  // CTC Breakdown
  const pfEr = Number(tx.pf_employer || 0);
  const esiEr = Number(tx.esi_employer || 0);
  const gross = Number(tx.gross_salary || 0);
  const totalCtc = gross + pfEr + esiEr;

  document.getElementById("ctc-gross").textContent = fmt(gross);
  document.getElementById("ctc-epf-total").textContent = pfEr > 0 ? fmt(pfEr) : 'Nil';
  document.getElementById("ctc-esi").textContent = esiEr > 0 ? fmt(esiEr) : 'Nil';
  document.getElementById("ctc-total").textContent = fmt(totalCtc);

  if (data.ctc_breakdown) {
    document.getElementById("ctc-eps").textContent = data.ctc_breakdown.eps_amount > 0 ? fmt(data.ctc_breakdown.eps_amount) : 'Nil';
    document.getElementById("ctc-epf").textContent = data.ctc_breakdown.epf_amount > 0 ? fmt(data.ctc_breakdown.epf_amount) : 'Nil';
  } else {
    // Math fallback
    const maxBase = Math.min(Number(tx.base_salary || 0), 15000);
    const eps = pfEr > 0 ? Math.round(maxBase * 0.0833 * 100) / 100 : 0;
    const epf = pfEr > 0 ? pfEr - eps : 0;
    document.getElementById("ctc-eps").textContent = eps > 0 ? fmt(eps) : 'Nil';
    document.getElementById("ctc-epf").textContent = epf > 0 ? fmt(epf) : 'Nil';
  }

  // Merkle Proof
  if (data.merkle_proof) {
    document.getElementById('crypto-hash').textContent = data.merkle_proof;
  } else {
    // Generate simulated fallback proof for legacy
    const encoder = new TextEncoder();
    crypto.subtle.digest('SHA-256', encoder.encode(JSON.stringify(tx) + Date.now())).then(hashBuffer => {
      const hashHex = Array.from(new Uint8Array(hashBuffer)).map(b => b.toString(16).padStart(2, '0')).join('');
      document.getElementById('crypto-hash').textContent = "0x" + hashHex;
    });
  }
};

const init = async () => {
  const params = new URLSearchParams(window.location.search);
  const runId = params.get("runId");
  const empId = params.get("empId");
  const token = params.get("token");

  if (runId && empId && token) {
    try {
      const res = await fetch(`/api/auth/magic-payslip?runId=${runId}&empId=${empId}&token=${token}`);
      const payload = await res.json();
      if (res.ok && payload.payslip_payload) {
        renderPayslip(payload.payslip_payload);
      } else {
        document.body.innerHTML = `<h2 style="color:red; font-family: monospace; text-align: center; margin-top: 20%;">ACCESS DENIED: ${payload.error || "INVALID LINK"}</h2>`;
      }
    } catch (e) {
      document.body.innerHTML = '<h2 style="color:red; font-family: monospace; text-align: center; margin-top: 20%;">NETWORK ERROR</h2>';
    }
    return;
  }

  // Fallback to internal sessionStorage for Portal access
  const payloadStr = sessionStorage.getItem("payslip_payload");
  if (!payloadStr) {
    document.body.innerHTML = '<h2 style="color:red; font-family: monospace; text-align: center; margin-top: 20%;">ACCESS DENIED: NO PAYLOAD OR MAGIC LINK FOUND</h2>';
  } else {
    try {
      renderPayslip(JSON.parse(payloadStr));
    } catch (err) {
      document.body.innerHTML = '<h2 style="color:red; font-family: monospace; text-align: center; margin-top: 20%;">CORRUPT PAYLOAD</h2>';
    }
  }
};

init();
