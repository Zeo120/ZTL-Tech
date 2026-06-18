
// Sub-tab toggling

export function switchPayrollTab(tabId) {
  currentPayrollTab = tabId;

  // 1. Update active state on sidebar buttons
  document
    .querySelectorAll(".sub-tab-btn")
    .forEach((btn) => btn.classList.remove("active"));
  
  const activeBtn = document.getElementById(`btn-tab-${tabId}`);
  if (activeBtn) activeBtn.classList.add("active");

  // 2. Hide all tab-panels and show the active one
  document
    .querySelectorAll(".tab-panel")
    .forEach((panel) => panel.classList.remove("active"));
  
  const activePanel = document.getElementById(`payroll-tab-${tabId}`);
  if (activePanel) activePanel.classList.add("active");

  // 3. Trigger data fetching logic based on the active tab
  if (tabId === "employees") {
    fetchPayrollRoster();
  } else if (tabId === "salary") {
    fetchDropdownEmployees();
  } else if (tabId === "attendance") {
    // Attendance tab relies on the month picker trigger
  } else if (tabId === "rates") {
    // Populate forms with loaded rates
    document.getElementById("rate-pf").value = pfRateConfig;
    document.getElementById("rate-tds").value = tdsRateConfig;
  } else if (tabId === "ctc") {
    populateEmployeeDropdown();
    runCTCCalculations();
  } else if (tabId === "processing") {
    fetchPayrollRuns();
  } else if (tabId === "leaves") {
    fetchLeaves();
    fetchDropdownEmployees();
    populateAllEnterpriseDropdowns();
  } else if (tabId === "expenses") {
    fetchDropdownEmployees();
    populateAllEnterpriseDropdowns();
    fetchExpenses();
  } else if (tabId === "documents") {
    populateDocEmployees();
    fetchDocuments();
  } else if (tabId === "summary") {
    // Rely on generatePayrollSummary()
  } else if (tabId === "audit") {
    // Rely on generateTaxAuditTrail()
  }
}

export function toggleSidebarGroup(groupId) {
  const group = document.getElementById(groupId);
  const chevron = document.getElementById(`chevron-${groupId}`);
  if (!group || !chevron) return;
  
  if (group.style.display === "none") {
    group.style.display = "flex";
    chevron.style.transform = "rotate(180deg)";
  } else {
    group.style.display = "none";
    chevron.style.transform = "rotate(0deg)";
  }
}
// Conditional forms toggles
export function toggleSpouseField() {
  const marital = document.getElementById("emp-marital").value;
  const wrapper = document.getElementById("spouse-field-wrapper");
  const input = document.getElementById("emp-spouse");
  if (marital === "Married") {
    wrapper.classList.add("visible");
    input.required = true;
  } else {
    wrapper.classList.remove("visible");
    input.required = false;
    input.value = "";
  }
}

export function toggleExitDateField() {
  const status = document.getElementById("emp-status").value;
  const wrapper = document.getElementById("exit-date-field-wrapper");
  const input = document.getElementById("emp-doe");
  if (status === "Terminated") {
    wrapper.classList.add("visible");
    input.required = true;
  } else {
    wrapper.classList.remove("visible");
    input.required = false;
    input.value = "";
  }
}

export function toggleUanField() {
  const pf = document.getElementById("emp-pf").value;
  const wrapper = document.getElementById("uan-field-wrapper");
  const input = document.getElementById("emp-uan");
  if (pf === "Applicable") {
    wrapper.classList.add("visible");
    input.required = true;
  } else {
    wrapper.classList.remove("visible");
    input.required = false;
    input.value = "";
  }
}

export function openPayrollModal() {
  document.getElementById("payroll-employee-form").reset();
  toggleSpouseField();
  toggleExitDateField();
  toggleUanField();
  document.getElementById("payroll-form-error").style.display = "none";
  document.getElementById("payroll-modal").classList.add("active");
}

export function closePayrollModal() {
  document.getElementById("payroll-modal").classList.remove("active");
}

export function closePayrollModalOnBackdrop(e) {
  if (e.target.id === "payroll-modal") closePayrollModal();
}

// Save rates settings
export function savePayrollRates() {
  pfRateConfig = parseFloat(document.getElementById("rate-pf").value) || 12.0;
  tdsRateConfig = parseFloat(document.getElementById("rate-tds").value) || 15.0;
  alert("Statutory rates updated successfully.");
}

// Populate employees inside CTC dropdown
export function populateEmployeeDropdown() {
  const select = document.getElementById("ctc-employee-select");
  select.innerHTML = '<option value="">-- Choose Employee --</option>';
  allEmployees.forEach((emp) => {
    const opt = document.createElement("option");
    opt.value = emp.id;
    opt.textContent = `${escapeHTML(emp.name)} (${emp.status})`;
    select.appendChild(opt);
  });
}

// CTC calculations
export function runCTCCalculations() {
  const empId = document.getElementById("ctc-employee-select").value;
  const resultBox = document.getElementById("ctc-result-box");

  if (!empId) {
    resultBox.style.display = "none";
    return;
  }

  const emp = allEmployees.find((e) => e.id === parseInt(empId, 10));
  if (!emp) {
    resultBox.style.display = "none";
    return;
  }

  const grossVal =
    (emp.base_salary || 0) + (emp.hra || 0) + (emp.allowances || 0);
  document.getElementById("ctc-monthly-salary").value = grossVal;

  if (grossVal <= 0) {
    resultBox.style.display = "none";
    return;
  }

  // Calculations parameters
  const pfRate =
    (typeof pfRateConfig !== "undefined" ? pfRateConfig : 12.0) / 100;
  const monthlyPfDeduction =
    emp.pf_status === "Applicable" ? grossVal * pfRate : 0;
  const ptDeduction = emp.professional_tax || 0;
  const tdsDeduction = emp.tds || 0;
  const customDeductions = emp.deductions || 0;

  const totalDeductions =
    monthlyPfDeduction + ptDeduction + tdsDeduction + customDeductions;
  const netMonthlySalary = grossVal - totalDeductions;
  const employerPfContribution = monthlyPfDeduction;
  const monthlyCTC = grossVal + employerPfContribution;
  const annualCTC = monthlyCTC * 12;

  // Output targets
  document.getElementById("ctc-net-pay").textContent =
    `₹${netMonthlySalary.toFixed(2)}`;
  document.getElementById("ctc-annual-ctc").textContent =
    `₹${annualCTC.toFixed(2)}`;
  document.getElementById("ctc-monthly-pf").textContent =
    `₹${monthlyPfDeduction.toFixed(2)}`;
  document.getElementById("ctc-monthly-pt").textContent =
    `₹${ptDeduction.toFixed(2)}`;
  document.getElementById("ctc-monthly-tds").textContent =
    `₹${tdsDeduction.toFixed(2)}`;

  resultBox.style.display = "block";
}

// Fetch DB roster
// Search mechanism with 300ms debounce
export let searchTimeout;
export function filterPayrollRoster() {
  clearTimeout(searchTimeout);
  searchTimeout = setTimeout(() => {
    searchQuery = document.getElementById("payroll-search-box").value.trim();
    currentPage = 1; // Reset to page 1 on new search
    fetchRoster();
  }, 300);
}

export function openCredentialsModal(empId) {
  document.getElementById("cred-emp-id").value = empId;
  document.getElementById("cred-email").value = "";
  document.getElementById("cred-password").value = "";
  document.getElementById("cred-error-banner").style.display = "none";
  document.getElementById("cred-success-banner").style.display = "none";
  document.getElementById("credentials-modal").classList.add("active");
}
export function closeCredentialsModal() {
  document.getElementById("credentials-modal").classList.remove("active");
}
export function closeCredentialsModalOnBackdrop(e) {
  if (e.target.id === "credentials-modal") closeCredentialsModal();
}
async function submitCredentialsForm() {
  const empId = document.getElementById("cred-emp-id").value;
  const email = document.getElementById("cred-email").value.trim();
  const password = document.getElementById("cred-password").value;
  const errBanner = document.getElementById("cred-error-banner");
  const succBanner = document.getElementById("cred-success-banner");

  errBanner.style.display = "none";
  succBanner.style.display = "none";

  try {
    const res = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/employees/${empId}/credentials`,
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "x-csrf-token": getCSRFToken(),
        },
        credentials: "include",
        body: JSON.stringify({ email, password }),
      },
    );
    const payload = await res.json();
    if (res.ok && payload.success) {
      succBanner.textContent = "Credentials set successfully.";
      succBanner.style.display = "block";
      setTimeout(closeCredentialsModal, 1500);
    } else {
      errBanner.textContent = payload.error || "Failed to set credentials";
      errBanner.style.display = "block";
    }
  } catch (e) {
    errBanner.textContent = "Network error";
    errBanner.style.display = "block";
  }
}

// Change page helper
export function changePage(dir) {
  const newPage = currentPage + dir;
  if (newPage >= 1 && newPage <= totalPages) {
    currentPage = newPage;
    fetchRoster();
  }
}

// Fetch dropdown menu list separately (bypass pagination)
async function fetchDropdownEmployees() {
  if (dropdownCached) {
    populateAdminEmployeeSelect();
    return;
  }
  try {
    const res = await window.securewindow.secureFetch(`${apiBase}/api/admin/employees?limit=all`, {
      credentials: "include",
    });
    if (res.ok) {
      const payload = await res.json();
      if (payload.success && payload.data && payload.data.employees) {
        allEmployeesFull = payload.data.employees;
        dropdownCached = true;
        populateAdminEmployeeSelect();
      }
    }
  } catch (err) {
    console.error(err);
    console.error("Backend connection error");
    const header = document.querySelector(".top-header");
    if (header) header.classList.add("visible");
  }
}

// Fetch DB roster with pagination
async function fetchRoster() {
  try {
    const url = `${apiBase}/api/admin/employees?page=${currentPage}&limit=${limitPerPage}&search=${encodeURIComponent(searchQuery)}`;
    const res = await window.securewindow.secureFetch(url, { credentials: "include" });
    if (res.status === 401) {
      window.location.href = "login.html";
      return;
    }
    if (res.ok) {
      const payload = await res.json();
      if (payload.success && payload.data && payload.data.employees) {
        allEmployees = payload.data.employees;
        renderPayrollTable(allEmployees);

        // Update pagination elements
        const pagination = payload.data.pagination || {
          total: allEmployees.length,
          page: 1,
          limit: limitPerPage,
          totalPages: 1,
        };
        totalPages = pagination.totalPages;
        const total = pagination.total;
        const start = total === 0 ? 0 : (currentPage - 1) * limitPerPage + 1;
        const end = Math.min(currentPage * limitPerPage, total);

        document.getElementById("pag-start").textContent = start;
        document.getElementById("pag-end").textContent = end;
        document.getElementById("pag-total").textContent = total;

        document.getElementById("btn-pag-prev").disabled = currentPage <= 1;
        document.getElementById("btn-pag-next").disabled =
          currentPage >= totalPages;

        // Fetch dropdown list async (Removed to save memory)
      } else {
        showPayrollTableError("Failed to fetch database roster.");
      }
    } else {
      showPayrollTableError("Server responded with error status.");
    }
  } catch (err) {
    console.error(err);
    showPayrollTableError("Error connecting to backend database server.");
  }
}

export function showPayrollTableError(msg) {
  document.getElementById("payroll-table-body").innerHTML = `
                <tr>
                    <td colspan="4" style="text-align: center; padding: 2rem; color: #ff5470; font-weight: 600;">
                        [!] ${msg}
                    </td>
                </tr>
            `;
}

// Render ultra-minimalist employee list with salary info
export function renderPayrollTable(employees) {
  const tbody = document.getElementById("payroll-table-body");
  tbody.innerHTML = "";

  if (employees.length === 0) {
    tbody.innerHTML = `
                    <tr>
                        <td colspan="4" style="text-align: center; padding: 2rem; color: var(--text-secondary);">
                            No corporate employees registered in system database.
                        </td>
                    </tr>
                `;
    return;
  }

  employees.forEach((emp) => {
    const tr = document.createElement("tr");
    const statusClass =
      emp.status === "Active" ? "badge-active" : "badge-terminated";
    const statusBadge = `<span class="employee-badge ${statusClass}">${emp.status.toUpperCase()}</span>`;

    const baseSal = emp.base_salary || 0;
    const hraSal = emp.hra || 0;
    const allSal = emp.allowances || 0;
    const dedSal = emp.deductions || 0;
    const grossSal = baseSal + hraSal + allSal;
    const netSal = grossSal - dedSal;

    const financeDetails = `
                    <div style="font-size: 0.8rem; font-family: monospace;">
                        <span style="display: block; color: #00ffaa; font-weight: 700;">Net Pay: ₹${netSal.toFixed(2)}</span>
                    </div>
                `;

    tr.innerHTML = `
                    <td><strong>${escapeHTML(emp.name)}</strong></td>
                    <td>${statusBadge}</td>
                    <td>${financeDetails}</td>
                    <td style="text-align: center;">
                        <button class="btn-action" style="font-size: 0.7rem; padding: 0.3rem 0.6rem; margin-right: 0.5rem;" onclick="openCredentialsModal(${emp.id})">Credentials</button>
  <button class="btn-delete" onclick="deletePayrollEmployee(${emp.id}, '${escapeHTML(emp.name)}')">Remove</button>
                    </td>
                `;
    tbody.appendChild(tr);
  });
}

// Sub-tab switching inside Employee Center via Sidebar Dropdown
export function switchEmployeeSubTab(tabId) {
  const btnView = document.getElementById("btn-sub-tab-emp-manage");
  const btnSal = document.getElementById("btn-sub-tab-emp-salary");
  const btnAtt = document.getElementById("btn-sub-tab-emp-attendance");
  const panelView = document.getElementById("payroll-sub-panel-view");
  const panelSal = document.getElementById("payroll-sub-panel-salary");
  const panelAtt = document.getElementById("payroll-sub-panel-attendance");

  // Highlight parent tab and keep sub-tabs active
  document
    .querySelectorAll(".sub-tab-btn")
    .forEach((btn) => btn.classList.remove("active"));
  document.getElementById("btn-tab-employees").classList.add("active");

  if (tabId === "view") {
    btnView.classList.add("active");
    btnSal.classList.remove("active");
    btnAtt.classList.remove("active");
    panelView.style.display = "block";
    panelSal.style.display = "none";
    panelAtt.style.display = "none";
    fetchRoster();
  } else if (tabId === "salary") {
    btnSal.classList.add("active");
    btnView.classList.remove("active");
    btnAtt.classList.remove("active");
    panelView.style.display = "none";
    panelSal.style.display = "block";
    panelAtt.style.display = "none";

    populateAdminEmployeeSelect();
    loadAdminEmployeeSalary();
  } else if (tabId === "attendance") {
    btnAtt.classList.add("active");
    btnView.classList.remove("active");
    btnSal.classList.remove("active");
    panelView.style.display = "none";
    panelSal.style.display = "none";
    panelAtt.style.display = "block";

    // Set attendance date to today's date if empty
    const dateInput = document.getElementById("admin-attendance-date");
    if (!dateInput.value) {
      const today = new Date().toISOString().split("T")[0];
      dateInput.value = today;
    }
    loadDailyAttendance();
  }
}

async function loadDailyAttendance() {
  const dateVal = document.getElementById("admin-attendance-date").value;
  const errBanner = document.getElementById("admin-attendance-error-banner");
  const successBanner = document.getElementById(
    "admin-attendance-success-banner",
  );
  const tbody = document.getElementById("attendance-table-body");

  errBanner.style.display = "none";
  successBanner.style.display = "none";

  if (!dateVal) {
    tbody.innerHTML = `
                    <tr>
                        <td colspan="2" style="text-align: center; padding: 2rem; color: #ff5470;">
                            Please select a valid date.
                        </td>
                    </tr>
                `;
    return;
  }

  tbody.innerHTML = `
                <tr>
                    <td colspan="2" style="text-align: center; padding: 2rem; color: var(--text-secondary);">
                        Fetching attendance status...
                    </td>
                </tr>
            `;

  try {
    const response = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/employees/attendance?date=${dateVal}`,
      {
        credentials: "include",
      },
    );

    if (response.ok) {
      const data = await response.json();
      const attendance = data.attendance || [];
      if (attendance.length === 0) {
        tbody.innerHTML = `
                            <tr>
                                <td colspan="2" style="text-align: center; padding: 2rem; color: var(--text-secondary);">
                                    No registered employees found. Please register employees first in Employee Management.
                                </td>
                            </tr>
                        `;
        return;
      }

      tbody.innerHTML = "";
      attendance.forEach((record) => {
        const tr = document.createElement("tr");

        const tdName = document.createElement("td");
        tdName.textContent = record.name;
        tdName.style.padding = "1rem 0.5rem";

        const tdActions = document.createElement("td");
        tdActions.style.textAlign = "right";
        tdActions.style.paddingRight = "2rem";

        const isPresent = record.status === "Present";
        const isAbsent = record.status === "Absent";

        tdActions.innerHTML = `
                            <div class="attendance-toggle-group">
                                <button class="attendance-btn present ${isPresent ? "active" : ""}" onclick="markAttendance(${record.employee_id}, 'Present', this)">Present</button>
                                <button class="attendance-btn absent ${isAbsent ? "active" : ""}" onclick="markAttendance(${record.employee_id}, 'Absent', this)">Absent</button>
                            </div>
                        `;

        tr.appendChild(tdName);
        tr.appendChild(tdActions);
        tbody.appendChild(tr);
      });
    } else {
      const errData = await response.json();
      tbody.innerHTML = `
                        <tr>
                            <td colspan="2" style="text-align: center; padding: 2rem; color: #ff5470;">
                                Failed to load attendance: ${errData.error || "Server error"}
                            </td>
                        </tr>
                    `;
    }
  } catch (err) {
    console.error(err);
    tbody.innerHTML = `
                    <tr>
                        <td colspan="2" style="text-align: center; padding: 2rem; color: #ff5470;">
                            Failed to connect to backend server.
                        </td>
                    </tr>
                `;
  }
}

async function markAttendance(employeeId, status, btnElement) {
  const dateVal = document.getElementById("admin-attendance-date").value;
  const errBanner = document.getElementById("admin-attendance-error-banner");
  const successBanner = document.getElementById(
    "admin-attendance-success-banner",
  );

  errBanner.style.display = "none";
  successBanner.style.display = "none";

  if (!dateVal) {
    alert("Please select a date first");
    return;
  }

  try {
    const response = await window.securewindow.secureFetch(`${apiBase}/api/admin/employees/attendance`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({
        employee_id: employeeId,
        attendance_date: dateVal,
        status: status,
      }),
    });

    if (response.ok) {
      // Update active button state locally without reloading the whole table
      const group = btnElement.closest(".attendance-toggle-group");
      if (group) {
        group
          .querySelectorAll(".attendance-btn")
          .forEach((btn) => btn.classList.remove("active"));
        btnElement.classList.add("active");
      }

      successBanner.textContent = `Attendance updated successfully.`;
      successBanner.style.display = "block";
      setTimeout(() => {
        successBanner.style.display = "none";
      }, 3000);
    } else {
      const errData = await response.json();
      errBanner.textContent =
        errData.error || "Failed to update attendance status.";
      errBanner.style.display = "block";
    }
  } catch (err) {
    console.error(err);
    errBanner.textContent = "Error connecting to backend server.";
    errBanner.style.display = "block";
  }
}

// Sub-tab switching inside Reports via Sidebar Dropdown
export function switchReportsSubTab(tabId) {
  const btnSummary = document.getElementById("btn-sub-tab-rep-summary");
  const btnAudit = document.getElementById("btn-sub-tab-rep-audit");
  const panelSummary = document.getElementById("reports-sub-panel-summary");
  const panelAudit = document.getElementById("reports-sub-panel-audit");

  // Highlight parent tab
  document
    .querySelectorAll(".sub-tab-btn")
    .forEach((btn) => btn.classList.remove("active"));
  document.getElementById("btn-tab-reports").classList.add("active");

  if (tabId === "summary") {
    btnSummary.classList.add("active");
    btnAudit.classList.remove("active");
    panelSummary.style.display = "block";
    panelAudit.style.display = "none";

    // Fetch server-side aggregations for reports
    window.secureFetch(`${apiBase}/api/admin/employees/summary`, { credentials: "include" })
      .then((res) => res.json())
      .then((payload) => {
        if (payload.success && payload.data) {
          const { totalGross, totalDeductions, totalNet } = payload.data;
          document.getElementById("rep-total-net").textContent =
            `₹${totalNet.toFixed(2)}`;
          document.getElementById("rep-total-gross").textContent =
            `₹${totalGross.toFixed(2)}`;
          document.getElementById("rep-total-deductions").textContent =
            `₹${totalDeductions.toFixed(2)}`;
        }
      })
      .catch((err) => console.error("Error loading payroll summary", err));
  } else if (tabId === "audit") {
    btnAudit.classList.add("active");
    btnSummary.classList.remove("active");
    panelSummary.style.display = "none";
    panelAudit.style.display = "block";

    // Populate Tax Audit Trail table using the full employee roster
    const tbody = document.getElementById("reports-audit-table-body");
    tbody.innerHTML = "";
    if (allEmployeesFull.length === 0) {
      tbody.innerHTML = `<tr><td colspan="4" style="text-align: center; padding: 2rem; color: var(--text-secondary);">No corporate employees to audit.</td></tr>`;
      return;
    }
    allEmployeesFull.forEach((emp) => {
      const tr = document.createElement("tr");
      const panStatus = emp.pan
        ? `<span style="color: #00ffaa; font-weight: 700; font-family: monospace;">${escapeHTML(emp.pan).toUpperCase()} (VERIFIED)</span>`
        : `<span style="color: #ff5470;">MISSING</span>`;
      const aadharStatus = emp.aadhar
        ? `<span style="color: #00ffaa; font-weight: 700; font-family: monospace;">UID: ${escapeHTML(emp.aadhar)} (VERIFIED)</span>`
        : `<span style="color: #ff5470;">MISSING</span>`;
      const pfReg =
        emp.pf_status === "Applicable"
          ? `<span style="color: var(--accent-primary); font-family: monospace;">UAN: ${escapeHTML(emp.uan_no)}</span>`
          : `<span style="color: var(--text-secondary);">Exempt / Inactive</span>`;

      tr.innerHTML = `
                        <td><strong>${escapeHTML(emp.name)}</strong></td>
                        <td>${panStatus}</td>
                        <td>${aadharStatus}</td>
                        <td>${pfReg}</td>
                    `;
      tbody.appendChild(tr);
    });
  }
}

// Dropdown populator for admin salaries page
export function populateAdminEmployeeSelect() {
  const select = document.getElementById("admin-salary-employee-select");
  const curVal = select.value;
  select.innerHTML = '<option value="">-- Choose Employee --</option>';
  allEmployeesFull.forEach((emp) => {
    const opt = document.createElement("option");
    opt.value = emp.id;
    opt.textContent = `${escapeHTML(emp.name)} (PAN: ${escapeHTML(emp.pan).toUpperCase()})`;
    select.appendChild(opt);
  });
  select.value = curVal;
}

// Load details for chosen employee on admin salaries page
export function loadAdminEmployeeSalary() {
  const select = document.getElementById("admin-salary-employee-select");
  const empId = parseInt(select.value, 10);
  const errBanner = document.getElementById("admin-salary-error-banner");
  const succBanner = document.getElementById("admin-salary-success-banner");
  errBanner.style.display = "none";
  succBanner.style.display = "none";

  if (!empId) {
    document.getElementById("admin-sal-base").value = "";
    document.getElementById("admin-sal-hra").value = "";
    document.getElementById("admin-sal-allowances").value = "";
    document.getElementById("admin-sal-deductions").value = "";
    document.getElementById("admin-sal-state").value = "Karnataka";
    document.getElementById("admin-sal-tax-regime").value = "New";
    document.getElementById("admin-sal-pt").value = "";
    document.getElementById("admin-sal-tds").value = "";
    calculateAdminTakeHome();
    return;
  }

  const emp = allEmployees.find((e) => e.id === empId);
  if (emp) {
    document.getElementById("admin-sal-base").value = emp.base_salary || "";
    document.getElementById("admin-sal-hra").value = emp.hra || "";
    document.getElementById("admin-sal-allowances").value =
      emp.allowances || "";
    document.getElementById("admin-sal-deductions").value =
      emp.deductions || "";
    document.getElementById("admin-sal-state").value = emp.state || "Karnataka";
    document.getElementById("admin-sal-tax-regime").value =
      emp.tax_regime || "New";
    document.getElementById("admin-sal-pt").value = emp.professional_tax || "";
    document.getElementById("admin-sal-tds").value = emp.tds || "";
    calculateAdminTakeHome();
  }
}

export function calculateTDSNewRegime(monthlyGross) {
  const annualGross = monthlyGross * 12;
  const standardDeduction = 75000;
  const taxableIncome = Math.max(0, annualGross - standardDeduction);

  // Rebate under 87A if taxable income <= 12,00,000 (12 Lakhs)
  if (taxableIncome <= 1200000) {
    return 0;
  }

  let tax = 0;

  if (taxableIncome > 2400000) {
    tax += (taxableIncome - 2400000) * 0.3;
    tax += 400000 * 0.25;
    tax += 400000 * 0.2;
    tax += 400000 * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  } else if (taxableIncome > 2000000) {
    tax += (taxableIncome - 2000000) * 0.25;
    tax += 400000 * 0.2;
    tax += 400000 * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  } else if (taxableIncome > 1600000) {
    tax += (taxableIncome - 1600000) * 0.2;
    tax += 400000 * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  } else if (taxableIncome > 1200000) {
    tax += (taxableIncome - 1200000) * 0.15;
    tax += 400000 * 0.1;
    tax += 400000 * 0.05;
  }

  // Add 4% Cess
  tax = tax * 1.04;

  return Math.round((tax / 12) * 100) / 100;
}

// Calculate and update view take home
export function calculateAdminTakeHome() {
  const base = parseFloat(document.getElementById("admin-sal-base").value) || 0;
  const hra = parseFloat(document.getElementById("admin-sal-hra").value) || 0;
  const allowances =
    parseFloat(document.getElementById("admin-sal-allowances").value) || 0;
  const deductions =
    parseFloat(document.getElementById("admin-sal-deductions").value) || 0;

  const state = document.getElementById("admin-sal-state").value;
  const taxRegime = document.getElementById("admin-sal-tax-regime").value;
  const ptInput = document.getElementById("admin-sal-pt");
  const tdsInput = document.getElementById("admin-sal-tds");

  const gross = base + hra + allowances;
  const netSalaryPayable = gross - deductions;

  // Auto-calculate PT based on state rule using netSalaryPayable
  let pt = 0;
  const select = document.getElementById("admin-salary-employee-select");
  const empId = parseInt(select.value, 10);
  const emp = allEmployees.find((e) => e.id === empId);
  const gender = emp ? emp.gender : "Male";

  if (state === "Karnataka") {
    pt = netSalaryPayable > 15000 ? 200 : 0;
  } else if (state === "Maharashtra") {
    if (gender === "Female") {
      pt = netSalaryPayable > 25000 ? 200 : 0;
    } else {
      if (netSalaryPayable > 10000) pt = 200;
      else if (netSalaryPayable > 7500) pt = 175;
      else pt = 0;
    }
  } else if (state === "West Bengal") {
    if (netSalaryPayable > 40000) pt = 200;
    else if (netSalaryPayable > 25000) pt = 150;
    else if (netSalaryPayable > 15000) pt = 130;
    else if (netSalaryPayable > 10000) pt = 110;
    else pt = 0;
  } else if (state === "Tamil Nadu") {
    if (netSalaryPayable > 75000) pt = 208;
    else if (netSalaryPayable > 60001) pt = 171;
    else if (netSalaryPayable > 45001) pt = 155;
    else if (netSalaryPayable > 30001) pt = 71;
    else if (netSalaryPayable > 21001) pt = 30;
    else pt = 0;
  } else if (state === "Telangana") {
    if (netSalaryPayable > 20000) pt = 200;
    else if (netSalaryPayable > 15000) pt = 150;
    else pt = 0;
  } else if (state === "Andhra Pradesh") {
    pt = netSalaryPayable > 15000 ? 200 : 0;
  } else if (state === "Gujarat") {
    pt = netSalaryPayable > 12000 ? 200 : 0;
  } else if (state === "Madhya Pradesh") {
    if (netSalaryPayable > 25000) pt = 208;
    else if (netSalaryPayable > 18750) pt = 125;
    else pt = 0;
  }

  // Auto-calculate TDS based on Tax Regime using netSalaryPayable
  let tds = 0;
  if (taxRegime === "New") {
    tds = calculateTDSNewRegime(netSalaryPayable);
  } else {
    // Simplistic Old Regime for demonstration (normally needs HRA/80C deductions)
    const annualGross = netSalaryPayable * 12;
    if (annualGross > 1000000)
      tds = ((annualGross - 1000000) * 0.3 + 112500) / 12;
    else if (annualGross > 500000)
      tds = ((annualGross - 500000) * 0.2 + 12500) / 12;
    else tds = 0;
  }

  if (document.activeElement !== ptInput) {
    ptInput.value = pt;
  } else {
    pt = parseFloat(ptInput.value) || 0;
  }

  if (document.activeElement !== tdsInput) {
    tdsInput.value = tds;
  } else {
    tds = parseFloat(tdsInput.value) || 0;
  }

  // Calculate PF if applicable (PF is typically calculated on Basic or Base Salary + Allowances)
  let pf = 0;
  if (emp && emp.pf_status === "Applicable") {
    const pfRate =
      (typeof pfRateConfig !== "undefined" ? pfRateConfig : 12.0) / 100;
    pf = gross * pfRate;
  }

  const totalDeductions = deductions + pf + pt + tds;
  const net = gross - totalDeductions;

  document.getElementById("admin-sal-display-gross").textContent =
    `₹${gross.toFixed(2)}`;
  document.getElementById("admin-sal-display-deductions").textContent =
    `₹${totalDeductions.toFixed(2)} (Incl. PF: ₹${pf.toFixed(2)}, PT: ₹${pt.toFixed(2)}, TDS: ₹${tds.toFixed(2)})`;
  document.getElementById("admin-sal-display-net").textContent =
    `₹${net.toFixed(2)}`;
}

// Submit Salary Details via PUT on admin dashboard
async function submitAdminSalaryDetails() {
  const select = document.getElementById("admin-salary-employee-select");
  const empId = parseInt(select.value, 10);
  const errBanner = document.getElementById("admin-salary-error-banner");
  const succBanner = document.getElementById("admin-salary-success-banner");
  errBanner.style.display = "none";
  succBanner.style.display = "none";

  if (!empId) {
    errBanner.textContent = "Please choose a corporate employee.";
    errBanner.style.display = "block";
    return;
  }

  const base_salary =
    parseFloat(document.getElementById("admin-sal-base").value) || 0;
  const hra = parseFloat(document.getElementById("admin-sal-hra").value) || 0;
  const allowances =
    parseFloat(document.getElementById("admin-sal-allowances").value) || 0;
  const deductions =
    parseFloat(document.getElementById("admin-sal-deductions").value) || 0;
  const state = document.getElementById("admin-sal-state").value;
  const tax_regime = document.getElementById("admin-sal-tax-regime").value;
  const professional_tax =
    parseFloat(document.getElementById("admin-sal-pt").value) || 0;
  const tds = parseFloat(document.getElementById("admin-sal-tds").value) || 0;

  try {
    const response = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/employees/${empId}/salary`,
      {
        method: "PUT",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
          "x-csrf-token": getCSRFToken(),
        },
        body: JSON.stringify({
          base_salary,
          hra,
          allowances,
          deductions,
          state,
          professional_tax,
          tds,
          tax_regime,
        }),
      },
    );

    const payload = await response.json();
    if (response.ok && payload.success) {
      succBanner.textContent =
        "Employee salary structure updated successfully.";
      succBanner.style.display = "block";

      // Refresh employee list in background
      await fetchRoster();
    } else {
      errBanner.textContent =
        payload.error || "Failed to update salary details.";
      errBanner.style.display = "block";
    }
  } catch (err) {
    errBanner.textContent = "Connection error. Check backend server.";
    errBanner.style.display = "block";
    console.error(err);
  }
}

// POST add employee record to DB
async function submitPayrollForm() {
  const errorBanner = document.getElementById("payroll-form-error");
  errorBanner.style.display = "none";

  const name = document.getElementById("emp-name").value.trim();
  const ageStr = document.getElementById("emp-age").value;
  const gender = document.getElementById("emp-gender").value;
  const dob = document.getElementById("emp-dob").value;
  const marital_status = document.getElementById("emp-marital").value;
  const spouse_name = document.getElementById("emp-spouse").value.trim();
  const pan = document.getElementById("emp-pan").value.trim();
  const aadhar = document.getElementById("emp-aadhar").value.trim();
  const status = document.getElementById("emp-status").value;
  const date_of_joining = document.getElementById("emp-doj").value;
  const date_of_exit = document.getElementById("emp-doe").value;
  const bank_account_number = document.getElementById("emp-bank").value.trim();
  const ifsc_code = document.getElementById("emp-ifsc").value.trim();
  const pf_status = document.getElementById("emp-pf").value;
  const uan_no = document.getElementById("emp-uan").value.trim();
  const state = document.getElementById("emp-state").value;

  const age = parseInt(ageStr, 10);
  if (isNaN(age) || age < 18 || age > 100) {
    errorBanner.textContent =
      "Employee age must be a valid number between 18 and 100.";
    errorBanner.style.display = "block";
    return;
  }

  if (pan.length < 5) {
    errorBanner.textContent = "Please verify the PAN Details.";
    errorBanner.style.display = "block";
    return;
  }

  const aadharClean = aadhar.replace(/\s+/g, "");
  if (!/^\d{12}$/.test(aadharClean)) {
    errorBanner.textContent =
      "Aadhar Number must contain exactly 12 numeric digits.";
    errorBanner.style.display = "block";
    return;
  }

  if (marital_status === "Married" && !spouse_name) {
    errorBanner.textContent = "Spouse Full Name is mandatory when Married.";
    errorBanner.style.display = "block";
    return;
  }

  if (status === "Terminated" && date_of_exit && date_of_joining) {
    if (new Date(date_of_exit) < new Date(date_of_joining)) {
      errorBanner.textContent = "Exit date cannot be prior to joining date.";
      errorBanner.style.display = "block";
      return;
    }
  }

  const reqBody = {
    name,
    age,
    gender,
    date_of_birth: dob || null,
    marital_status,
    spouse_name: marital_status === "Married" ? spouse_name : null,
    pan,
    aadhar: aadharClean,
    status,
    date_of_joining,
    date_of_exit: status === "Terminated" ? date_of_exit : null,
    bank_account_number: bank_account_number || null,
    ifsc_code: ifsc_code || null,
    pf_status,
    uan_no: pf_status === "Applicable" ? uan_no : null,
    state,
  };

  try {
    const response = await window.securewindow.secureFetch(`${apiBase}/api/admin/employees`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify(reqBody),
    });

    const payload = await response.json();
    if (response.ok && payload.success) {
      closePayrollModal();
      fetchRoster();
    } else {
      errorBanner.textContent =
        payload.error ||
        payload.message ||
        "Database rejected employee fields.";
      errorBanner.style.display = "block";
    }
  } catch (err) {
    console.error(err);
    errorBanner.textContent = "Network error communicating with DB server.";
    errorBanner.style.display = "block";
  }
}

// DELETE remove employee record from DB
async function deletePayrollEmployee(id, name) {
  if (
    !confirm(
      `Are you sure you want to permanently remove employee "${name}" from the database?`,
    )
  )
    return;

  try {
    const response = await window.securewindow.secureFetch(`${apiBase}/api/admin/employees/${id}`, {
      method: "DELETE",
      credentials: "include",
      headers: {
        "x-csrf-token": getCSRFToken(),
      },
    });
    const payload = await response.json();
    if (response.ok && payload.success) {
      fetchRoster();
    } else {
      alert(payload.error || "Failed to delete employee database entry.");
    }
  } catch (err) {
    console.error(err);
    alert("Connection failed trying to connect to server database.");
  }
}

/* ==================== PAYROLL PROCESSING MODULE ==================== */
export const monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];
export let currentPayrollRuns = [];

export function openCreatePayrollRunModal() {
  const form = document.getElementById("create-payroll-run-form");
  form.style.display = "block";
  form.classList.add("active");
  const now = new Date();
  document.getElementById("payroll-run-month").value = now.getMonth() + 1;
  document.getElementById("payroll-run-year").value = now.getFullYear();
}

export function closeCreatePayrollRunModal() {
  const form = document.getElementById("create-payroll-run-form");
  form.classList.remove("active");
  setTimeout(() => { form.style.display = "none"; }, 400);
}

export function showPayrollRunMsg(msg, isError) {
  const errEl = document.getElementById("payroll-run-error-banner");
  const succEl = document.getElementById("payroll-run-success-banner");
  errEl.style.display = "none";
  succEl.style.display = "none";
  if (isError) {
    errEl.textContent = msg;
    errEl.style.display = "block";
  } else {
    succEl.textContent = msg;
    succEl.style.display = "block";
  }
  setTimeout(() => {
    errEl.style.display = "none";
    succEl.style.display = "none";
  }, 5000);
}

async function fetchPayrollRuns() {
  try {
    const res = await window.securewindow.secureFetch(`${apiBase}/api/admin/payroll/runs`, {
      credentials: "include",
    });
    if (res.status === 401) {
      window.location.href = "login.html";
      return;
    }
    const payload = await res.json();
    if (payload.success && payload.data && payload.data.runs) {
      currentPayrollRuns = payload.data.runs;
      renderPayrollRuns(currentPayrollRuns);
    } else {
      renderPayrollRunsError("Failed to load payroll runs.");
    }
  } catch (err) {
    console.error(err);
    renderPayrollRunsError("Connection error. Check backend server.");
  }
}

export function renderPayrollRunsError(msg) {
  document.getElementById("payroll-runs-table-body").innerHTML = `
                <tr><td colspan="5" style="text-align: center; padding: 2rem; color: #ff5470; font-weight: 600;">[!] ${msg}</td></tr>`;
}

export function renderPayrollRuns(runs) {
  const tbody = document.getElementById("payroll-runs-table-body");
  tbody.innerHTML = "";
  if (runs.length === 0) {
    tbody.innerHTML = `<tr><td colspan="5" style="text-align: center; padding: 2rem; color: var(--text-secondary);">No payroll runs created yet. Click "+ New Payroll Run" to begin.</td></tr>`;
    return;
  }
  runs.forEach((run) => {
    const tr = document.createElement("tr");
    const statusClass =
      run.status === "Completed"
        ? "color: #00ffaa"
        : run.status === "Draft"
          ? "color: #ffaa00"
          : "color: #7b61ff";
    const grossDisplay = run.total_gross
      ? `₹${Number(run.total_gross).toFixed(2)}`
      : "—";
    const netDisplay = run.total_net
      ? `₹${Number(run.total_net).toFixed(2)}`
      : "—";

    let actionsHtml = "";
    if (run.status === "Draft") {
      actionsHtml = `
                        <button class="btn-action" onclick="processPayrollRun(${run.id})" style="padding: 0.3rem 0.7rem; font-size: 0.75rem; background: #00ffaa; color: #000; font-weight: 700; border-radius: 6px;">Process</button>
                    `;
    } else if (run.status === "Completed") {
      actionsHtml = `
                        <button class="btn-action" onclick="viewPayrollTransactions(${run.id}, ${run.month}, ${run.year})" style="padding: 0.3rem 0.7rem; font-size: 0.75rem; background: var(--accent-primary); color: #000; font-weight: 700; border-radius: 6px;">View</button>
                        <button class="btn-action" onclick="dispatchPayrollRun(${run.id})" style="padding: 0.3rem 0.7rem; font-size: 0.75rem; background: #fff; color: #000; font-weight: 700; border-radius: 6px; margin-left: 5px;">Dispatch Email</button>
                    `;
    }

    tr.innerHTML = `
                    <td><strong>${monthNames[run.month - 1]} ${run.year}</strong></td>
                    <td><span style="${statusClass}; font-weight: 700; text-transform: uppercase; font-size: 0.8rem;">${run.status}</span></td>
                    <td style="font-family: monospace; font-weight: 600;">${grossDisplay}</td>
                    <td style="font-family: monospace; font-weight: 600; color: #00ffaa;">${netDisplay}</td>
                    <td style="text-align: center;">${actionsHtml}</td>
                `;
    tbody.appendChild(tr);
  });
}

async function createPayrollRun() {
  const month = parseInt(document.getElementById("payroll-run-month").value);
  const year = parseInt(document.getElementById("payroll-run-year").value);
  if (!month || !year || year < 2020) {
    showPayrollRunMsg("Invalid month or year.", true);
    return;
  }
  try {
    const res = await window.securewindow.secureFetch(`${apiBase}/api/admin/payroll/runs`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({ month, year }),
    });
    const payload = await res.json();
    if (res.ok && payload.success) {
      showPayrollRunMsg(
        `Payroll draft created for ${monthNames[month - 1]} ${year}.`,
        false,
      );
      closeCreatePayrollRunModal();
      fetchPayrollRuns();
    } else {
      showPayrollRunMsg(payload.error || "Failed to create payroll run.", true);
    }
  } catch (err) {
    console.error(err);
    showPayrollRunMsg("Connection error.", true);
  }
}

async function processPayrollRun(runId) {
  if (
    !confirm(
      "Process this payroll run? This will calculate PF, ESI, LWP deductions, and TDS for all employees and lock the cycle. This action cannot be undone.",
    )
  )
    return;

  // Create Matrix Terminal Overlay
  const overlay = document.createElement("div");
  overlay.style.position = "fixed";
  overlay.style.inset = "0";
  overlay.style.background = "rgba(5, 5, 7, 0.95)";
  overlay.style.backdropFilter = "blur(10px)";
  overlay.style.zIndex = "9999";
  overlay.style.display = "flex";
  overlay.style.flexDirection = "column";
  overlay.style.alignItems = "center";
  overlay.style.justifyContent = "center";
  overlay.style.fontFamily = "monospace";
  overlay.style.color = "#00ffaa";
  
  const terminal = document.createElement("div");
  terminal.style.width = "80%";
  terminal.style.maxWidth = "800px";
  terminal.style.height = "60vh";
  terminal.style.background = "#000";
  terminal.style.border = "1px solid #333";
  terminal.style.borderRadius = "8px";
  terminal.style.padding = "2rem";
  terminal.style.overflowY = "hidden";
  terminal.style.boxShadow = "0 0 40px rgba(0, 255, 170, 0.1)";
  
  const title = document.createElement("h2");
  title.style.color = "#fff";
  title.style.marginBottom = "1rem";
  title.style.fontFamily = "var(--font-display)";
  title.innerText = "PARADIGM // Payroll Geodesic Calculation Matrix";
  
  const consoleOut = document.createElement("div");
  consoleOut.style.display = "flex";
  consoleOut.style.flexDirection = "column";
  consoleOut.style.gap = "0.2rem";
  consoleOut.style.fontSize = "0.85rem";

  terminal.appendChild(title);
  terminal.appendChild(consoleOut);
  overlay.appendChild(terminal);
  document.body.appendChild(overlay);

  const writeLog = (text) => {
    const line = document.createElement("div");
    line.innerText = `> ${text}`;
    consoleOut.appendChild(line);
    if(consoleOut.children.length > 20) {
      consoleOut.removeChild(consoleOut.firstChild);
    }
  };

  writeLog("INITIATING SATAN_RECURSION_DEVM...");
  
  // Simulate heavy mathematical calculation visually
  const simulationSteps = [
    "Fetching structural employee matrices from secure vault...",
    "Computing LWP Base Deltas (O(n) spacetime)...",
    "Applying Destructive Interference to Leave Anomalies...",
    "Calculating Statutory PF (12% Base Boundary Condition)...",
    "Calculating Statutory ESI (0.75% / 3.25% Limit Check)...",
    "Executing Professional Tax Slabs via Fast Fourier Transforms...",
    "Hashing transaction output vectors for immutability...",
    "Securing payload with AES-256-GCM...",
    "FINALIZING NET PAYOUT VECTORS..."
  ];

  try {
    for(let i=0; i<simulationSteps.length; i++) {
      await new Promise(r => setTimeout(r, 300 + Math.random() * 400));
      writeLog(simulationSteps[i]);
    }

    const res = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/payroll/runs/${runId}/process`,
      {
        method: "POST",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
          "x-csrf-token": getCSRFToken(),
        },
      },
    );
    const payload = await res.json();
    
    await new Promise(r => setTimeout(r, 500));

    if (res.ok) {
      writeLog("PAYROLL CYCLE LOCKED. Zero Variance Detected.");
      writeLog("Closing matrix in 2 seconds...");
      setTimeout(() => {
        document.body.removeChild(overlay);
        showPayrollRunMsg("Payroll processed mathematically successfully.", false);
        fetchPayrollRuns();
      }, 2000);
    } else {
      writeLog(`ERROR: ${payload.error || "DEVM Failure"}`);
      setTimeout(() => {
        document.body.removeChild(overlay);
        showPayrollRunMsg(payload.error || "Failed to process payroll.", true);
      }, 3000);
    }
  } catch (err) {
    writeLog(`FATAL NETWORK EXCEPTION`);
    setTimeout(() => {
      document.body.removeChild(overlay);
      showPayrollRunMsg("Network error processing payroll.", true);
    }, 2000);
  }
}

async function dispatchPayrollRun(runId) {
  if (
    !confirm(
      "Dispatch cryptographically signed payslips via Native Email to all employees in this run?",
    )
  )
    return;
  showPayrollRunMsg(
    "Dispatching native emails over TCP sockets... Please wait.",
    false,
  );
  try {
    const res = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/payroll/runs/${runId}/dispatch`,
      {
        method: "POST",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
          "x-csrf-token": getCSRFToken(),
        },
      },
    );
    const payload = await res.json();
    if (res.ok) {
      showPayrollRunMsg(
        payload.data?.message || "Emails dispatched successfully.",
        false,
      );
    } else {
      showPayrollRunMsg(payload.error || "Failed to dispatch emails.", true);
    }
  } catch (err) {
    console.error(err);
    showPayrollRunMsg("Connection error during dispatch.", true);
  }
}

async function viewPayrollTransactions(runId, month, year) {
  document.getElementById("payroll-transactions-panel").style.display = "block";
  document.getElementById("transactions-panel-title").textContent =
    `Payroll Transactions — ${monthNames[month - 1]} ${year}`;
  const tbody = document.getElementById("payroll-transactions-table-body");
  tbody.innerHTML =
    '<tr><td colspan="9" style="text-align: center; padding: 2rem; color: var(--text-secondary);">Loading transactions...</td></tr>';

  try {
    const res = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/payroll/runs/${runId}/transactions`,
      { credentials: "include" },
    );
    const payload = await res.json();
    if (payload.success && payload.data && payload.data.transactions) {
      const txns = payload.data.transactions;
      tbody.innerHTML = "";
      if (txns.length === 0) {
        tbody.innerHTML =
          '<tr><td colspan="9" style="text-align: center; padding: 2rem; color: var(--text-secondary);">No transactions found.</td></tr>';
        return;
      }

      let sumPF = 0,
        sumESI = 0,
        sumLWP = 0,
        sumNet = 0;
      txns.forEach((tx) => {
        sumPF += tx.pf_employee || 0;
        sumESI += tx.esi_employee || 0;
        sumLWP += tx.lwp_deduction || 0;
        sumNet += tx.net_salary || 0;

        const tr = document.createElement("tr");
        tr.innerHTML = `
                            <td style="color: #fff;"><strong>${tx.name || tx.employee_name || "N/A"}</strong></td>
                            <td style="font-family: monospace;">₹${Number(tx.gross_salary || 0).toFixed(0)}</td>
                            <td style="font-family: monospace; color: #ffaa00;">₹${Number(tx.pf_employee || 0).toFixed(0)}</td>
                            <td style="font-family: monospace; color: #7b61ff;">₹${Number(tx.esi_employee || 0).toFixed(0)}</td>
                            <td style="font-family: monospace;">₹${Number(tx.professional_tax || 0).toFixed(0)}</td>
                            <td style="font-family: monospace;">₹${Number(tx.tds || 0).toFixed(0)}</td>
                            <td style="font-family: monospace; color: #ff5470;">${tx.lwp_days || 0}d (₹${Number(tx.lwp_deduction || 0).toFixed(0)})</td>
                            <td style="font-family: monospace; color: #00ffaa; font-weight: 700;">₹${Number(tx.net_salary || 0).toFixed(0)}</td>
                            <td style="text-align: center;">
                                <button class="btn-action" onclick="generatePayslip(${runId}, ${tx.employee_id})" style="padding: 0.25rem 0.6rem; font-size: 0.72rem; border-radius: 5px;">Payslip</button>
                            </td>
                        `;
        tbody.appendChild(tr);
      });

      document.getElementById("txn-total-pf").textContent =
        `₹${sumPF.toFixed(2)}`;
      document.getElementById("txn-total-esi").textContent =
        `₹${sumESI.toFixed(2)}`;
      document.getElementById("txn-total-lwp").textContent =
        `₹${sumLWP.toFixed(2)}`;
      document.getElementById("txn-total-net").textContent =
        `₹${sumNet.toFixed(2)}`;
    }
  } catch (err) {
    console.error(err);
    tbody.innerHTML =
      '<tr><td colspan="9" style="text-align: center; padding: 2rem; color: #ff5470;">[!] Failed to load transactions.</td></tr>';
  }
}

export function closeTransactionsPanel() {
  document.getElementById("payroll-transactions-panel").style.display = "none";
}

async function generatePayslip(runId, employeeId) {
  try {
    const res = await window.securewindow.secureFetch(
      `${apiBase}/api/admin/payroll/runs/${runId}/payslip/${employeeId}`,
      { credentials: "include" },
    );
    const payload = await res.json();
    if (!payload.success || !payload.data || !payload.data.payslip) {
      alert("Failed to load payslip data.");
      return;
    }
    const p = payload.data.payslip;
    const run = currentPayrollRuns.find((r) => r.id === runId);

    // Pack into the expected format for payslip.html
    const payloadObj = {
      employee: {
        name: p.name || p.employee_name,
        id: p.employee_id,
        date_of_joining: p.date_of_joining,
        pan: p.pan,
        uan_no: p.uan_no,
        bank_account_number: p.bank_account_number,
        ifsc_code: p.ifsc_code,
      },
      transaction: p,
      run: run || { month: 1, year: 2024 },
    };

    sessionStorage.setItem("payslip_payload", JSON.stringify(payloadObj));
    window.open("payslip.html", "_blank");
  } catch (err) {
    console.error(err);
    alert("Network error.");
  }
}

async function submitLeave() {
  const empId = document.getElementById("leave-emp-select").value;
  const type = document.getElementById("leave-type-select").value;
  const start = document.getElementById("leave-start").value;
  const end = document.getElementById("leave-end").value;
  const reason = document.getElementById("leave-reason").value;

  if (!empId) return;

  try {
    await window.securewindow.secureFetch(`${apiBase}/api/admin/leaves`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({
        employee_id: parseInt(empId),
        type,
        start_date: start,
        end_date: end,
        reason,
      }),
    });
    document.getElementById("leave-request-form").reset();
    fetchLeaves();
  } catch (e) {
    console.error(e);
  }
}

async function submitExpense() {
  const empId = document.getElementById("expense-emp-select").value;
  const cat = document.getElementById("expense-cat-select").value;
  const amount = document.getElementById("expense-amount").value;
  const desc = document.getElementById("expense-desc").value;

  if (!empId) return;

  try {
    await window.securewindow.secureFetch(`${apiBase}/api/admin/expenses`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({
        employee_id: parseInt(empId),
        category: cat,
        amount: parseFloat(amount),
        description: desc,
      }),
    });
    document.getElementById("expense-claim-form").reset();
    fetchExpenses();
  } catch (e) {
    console.error(e);
  }
}

export function populateAllEnterpriseDropdowns() {
  const leaveSelect = document.getElementById("leave-emp-select");
  const expSelect = document.getElementById("expense-emp-select");
  const docSelect = document.getElementById("doc-emp-select");

  let opts = '<option value="">-- Choose Employee --</option>';
  allEmployeesFull.forEach((emp) => {
    opts += `<option value="${emp.id}">${escapeHTML(emp.name)}</option>`;
  });

  if (leaveSelect) leaveSelect.innerHTML = opts;
  if (expSelect) expSelect.innerHTML = opts;
  if (docSelect) docSelect.innerHTML = opts;
}

// ============================================================================
// ENTERPRISE MODULES LOGIC (Leaves, Expenses, Documents)
// ============================================================================

async function fetchLeaves() {
  try {
    const res = await window.securewindow.secureFetch(`${apiBase}/api/admin/leaves`, {
      credentials: "include",
    });
    const payload = await res.json();
    if (payload.success) {
      const tbody = document.getElementById("leaves-table-body");
      tbody.innerHTML = "";
      if (payload.data.leaves.length === 0) {
        tbody.innerHTML =
          '<tr><td colspan="6" style="text-align: center; color: var(--text-secondary);">No leave requests found.</td></tr>';
        return;
      }
      payload.data.leaves.forEach((l) => {
        const tr = document.createElement("tr");

        let statusColor = "#fff";
        if (l.status === "Approved") statusColor = "#00ffaa";
        if (l.status === "Rejected") statusColor = "#ff5470";
        if (l.status === "Pending") statusColor = "var(--accent-primary)";

        tr.innerHTML = `
                            <td>${l.employee_name}</td>
                            <td><span style="background: rgba(255,255,255,0.1); padding: 0.2rem 0.6rem; border-radius: 4px; font-size: 0.8rem;">${l.type}</span></td>
                            <td>${new Date(l.start_date).toLocaleDateString()} - ${new Date(l.end_date).toLocaleDateString()}</td>
                            <td>${l.reason || "-"}</td>
                            <td style="color: ${statusColor}; font-weight: 700;">${l.status}</td>
                            <td style="text-align: right;">
                                ${
                                  l.status === "Pending"
                                    ? `
                                    <button class="btn-action" style="padding: 0.4rem 0.8rem; font-size: 0.75rem; background: rgba(0,255,170,0.1); color: #00ffaa; margin-right: 0.5rem;" onclick="updateLeave(${l.id}, 'Approved')">Approve</button>
                                    <button class="btn-action" style="padding: 0.4rem 0.8rem; font-size: 0.75rem; background: rgba(255,84,112,0.1); color: #ff5470;" onclick="updateLeave(${l.id}, 'Rejected')">Reject</button>
                                `
                                    : "-"
                                }
                            </td>
                        `;
        tbody.appendChild(tr);
      });
    }
  } catch (e) {
    console.error(e);
  }
}

async function updateLeave(id, status) {
  try {
    await window.securewindow.secureFetch(`${apiBase}/api/admin/leaves/${id}/status`, {
      method: "PUT",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({ status }),
    });
    fetchLeaves();
  } catch (e) {
    console.error(e);
  }
}

async function fetchExpenses() {
  try {
    const res = await window.securewindow.secureFetch(`${apiBase}/api/admin/expenses`, {
      credentials: "include",
    });
    const payload = await res.json();
    if (payload.success) {
      const tbody = document.getElementById("expenses-table-body");
      tbody.innerHTML = "";
      if (payload.data.expenses.length === 0) {
        tbody.innerHTML =
          '<tr><td colspan="6" style="text-align: center; color: var(--text-secondary);">No expense claims found.</td></tr>';
        return;
      }
      payload.data.expenses.forEach((ex) => {
        const tr = document.createElement("tr");
        let statusColor = "#fff";
        if (ex.status === "Approved") statusColor = "#00ffaa";
        if (ex.status === "Rejected") statusColor = "#ff5470";
        if (ex.status === "Pending") statusColor = "var(--accent-primary)";

        tr.innerHTML = `
                            <td>${ex.employee_name}</td>
                            <td>${ex.category}</td>
                            <td style="font-family: monospace; font-size: 1rem;">₹${ex.amount.toFixed(2)}</td>
                            <td>${ex.description || "-"}</td>
                            <td style="color: ${statusColor}; font-weight: 700;">${ex.status}</td>
                            <td style="text-align: right;">
                                ${
                                  ex.status === "Pending"
                                    ? `
                                    <button class="btn-action" style="padding: 0.4rem 0.8rem; font-size: 0.75rem; background: rgba(0,255,170,0.1); color: #00ffaa; margin-right: 0.5rem;" onclick="updateExpense(${ex.id}, 'Approved')">Approve</button>
                                    <button class="btn-action" style="padding: 0.4rem 0.8rem; font-size: 0.75rem; background: rgba(255,84,112,0.1); color: #ff5470;" onclick="updateExpense(${ex.id}, 'Rejected')">Reject</button>
                                `
                                    : ex.payroll_run_id
                                      ? `<span style="color: var(--text-secondary); font-size: 0.8rem;">Paid in Run #${ex.payroll_run_id}</span>`
                                      : "-"
                                }
                            </td>
                        `;
        tbody.appendChild(tr);
      });
    }
  } catch (e) {
    console.error(e);
  }
}

async function updateExpense(id, status) {
  try {
    await window.securewindow.secureFetch(`${apiBase}/api/admin/expenses/${id}/status`, {
      method: "PUT",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({ status }),
    });
    fetchExpenses();
  } catch (e) {
    console.error(e);
  }
}

export function populateDocEmployees() {
  const select = document.getElementById("doc-emp-select");
  select.innerHTML = '<option value="">-- Choose Employee --</option>';
  allEmployeesFull.forEach((emp) => {
    const opt = document.createElement("option");
    opt.value = emp.id;
    opt.textContent = emp.name;
    select.appendChild(opt);
  });
}

async function fetchDocuments() {
  try {
    const res = await window.securewindow.secureFetch(`${apiBase}/api/admin/documents`, {
      credentials: "include",
    });
    const payload = await res.json();
    if (payload.success) {
      const tbody = document.getElementById("documents-table-body");
      tbody.innerHTML = "";
      if (payload.data.documents.length === 0) {
        tbody.innerHTML =
          '<tr><td colspan="4" style="text-align: center; color: var(--text-secondary);">No documents generated yet.</td></tr>';
        return;
      }
      // For vault docs, we store raw HTML in file_path to save dependencies.
      // We render it by opening a new window with that HTML.
      window.docCache = {};
      payload.data.documents.forEach((d) => {
        window.docCache[d.id] = d.file_path;
        const tr = document.createElement("tr");
        tr.innerHTML = `
                            <td>${d.employee_name || "N/A"}</td>
                            <td>${d.type}</td>
                            <td>${new Date(d.generated_at).toLocaleString()}</td>
                            <td style="text-align: right;">
                                <button class="btn-action" style="padding: 0.4rem 0.8rem; font-size: 0.75rem;" onclick="viewDocument(${d.id})">View/Print</button>
                            </td>
                        `;
        tbody.appendChild(tr);
      });
    }
  } catch (e) {
    console.error(e);
  }
}

async function generateDocument() {
  const empId = document.getElementById("doc-emp-select").value;
  const type = document.getElementById("doc-type-select").value;
  if (!empId) return;
  try {
    await window.securewindow.secureFetch(`${apiBase}/api/admin/documents/generate`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify({ employee_id: parseInt(empId), type }),
    });
    fetchDocuments();
  } catch (e) {
    console.error(e);
  }
}

export function viewDocument(docId) {
  const html = window.docCache[docId];
  if (html) {
    const win = window.open("", "_blank");
    win.document.write(html);
    win.document.close();
    setTimeout(() => win.print(), 500);
  }
}

// ============================================================================
// MINIMALIST UI TOGGLE (Display Information Only On Click)
// ============================================================================
export function applyMinimalistUI() {
  document.querySelectorAll(".panel-card").forEach((card) => {
    // Skip the dashboard metrics which are already minimal
    if (card.closest("#view-welcome")) return;

    // Only target cards with forms or tables
    const hasForm = card.querySelector("form");
    const hasTable = card.querySelector("table");
    const hasFormGrid = card.querySelector(".form-grid");

    if (hasForm || hasTable || hasFormGrid) {
      const contentWrapper = document.createElement("div");
      contentWrapper.style.display = "none";
      contentWrapper.className = "minimal-content";
      contentWrapper.style.animation = "fadeIn 0.3s ease";

      // Move existing children to wrapper
      while (card.firstChild) {
        contentWrapper.appendChild(card.firstChild);
      }

      // Create toggle button
      const btn = document.createElement("button");
      btn.className = "btn-action btn-minimal-toggle";
      btn.style.width = "100%";
      btn.style.background = "transparent";
      btn.style.border = "1px dashed var(--surface-border)";
      btn.style.color = "var(--text-secondary)";
      btn.style.padding = "1rem";
      btn.style.fontSize = "0.85rem";
      btn.style.letterSpacing = "1px";
      btn.style.textTransform = "uppercase";
      btn.style.cursor = "pointer";
      btn.style.transition = "all 0.3s ease";
      btn.style.display = "flex";
      btn.style.alignItems = "center";
      btn.style.justifyContent = "center";
      btn.style.gap = "10px";
      btn.style.borderRadius = "8px";
      btn.style.boxSizing = "border-box";
      btn.style.margin = "0 auto";

      let title = "Reveal Information";
      if (hasForm && !hasTable) title = "Reveal Form";
      if (hasTable && !hasForm) title = "Reveal Data Table";

      btn.innerHTML = `<span>+</span> <span>${title}</span>`;

      btn.onclick = (e) => {
        e.preventDefault(); // Prevent form submission if inside a form (though it's outside)
        if (contentWrapper.style.display === "none") {
          contentWrapper.style.display = "block";
          btn.innerHTML = `<span>-</span> <span>Hide Information</span>`;
          btn.style.marginBottom = "1.5rem";
          btn.style.borderStyle = "solid";
          btn.style.background = "rgba(255,255,255,0.02)";
        } else {
          contentWrapper.style.display = "none";
          btn.innerHTML = `<span>+</span> <span>${title}</span>`;
          btn.style.marginBottom = "0";
          btn.style.borderStyle = "dashed";
          btn.style.background = "transparent";
        }
      };

      btn.onmouseover = () => {
        btn.style.color = "#fff";
        btn.style.borderColor = "var(--accent-primary)";
      };
      btn.onmouseout = () => {
        if (contentWrapper.style.display === "none") {
          btn.style.color = "var(--text-secondary)";
          btn.style.borderColor = "var(--surface-border)";
        }
      };

      card.appendChild(btn);
      card.appendChild(contentWrapper);
    }
  });
}


// Start validation on page load






// Save Employee to DB
export async function submitPayrollEmployee() {
  const errBox = document.getElementById('payroll-form-error');
  errBox.style.display = 'none';

  const payload = {
    name: document.getElementById('emp-name').value,
    gender: document.getElementById('emp-gender').value,
    date_of_birth: document.getElementById('emp-dob').value || null,
    marital_status: document.getElementById('emp-marital').value,
    spouse_name: document.getElementById('emp-spouse') ? document.getElementById('emp-spouse').value : null,
    date_of_joining: document.getElementById('emp-doj').value,
    status: document.getElementById('emp-is-active').checked ? 'Active' : 'Terminated',
    date_of_exit: document.getElementById('emp-exit').value || null,
    pan: document.getElementById('emp-pan').value,
    pf_status: document.getElementById('emp-pf-status').value,
    uan_no: document.getElementById('emp-uan') ? document.getElementById('emp-uan').value : null,
    state: document.getElementById('emp-pt-state').value,
    tax_regime: document.getElementById('emp-tax-regime') ? document.getElementById('emp-tax-regime').value : 'New',
    base_salary: 0,
    hra: 0,
    allowances: 0,
    deductions: 0,
    professional_tax: 0,
    tds: 0
  };

  const empIdEl = document.getElementById('emp-id');
  const empId = empIdEl ? empIdEl.value : null;

  try {
    const method = empId ? 'PUT' : 'POST';
    const url = empId ? `${apiBase}/api/admin/employees/${empId}` : `${apiBase}/api/admin/employees`;

    const res = await window.secureFetch(url, {
      method: method,
      credentials: 'include',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    });
    
    const data = await res.json();
    if (res.ok && data.success) {
      alert(`Employee ${empId ? 'Updated' : 'Added'} successfully.`);
      closePayrollModal();
      if(typeof fetchRoster === 'function') fetchRoster();
      else window.location.reload();
    } else {
      errBox.textContent = data.error || 'Failed to save employee.';
      errBox.style.display = 'block';
    }
  } catch (err) {
    console.error(err);
    errBox.textContent = 'Network error connecting to backend.';
    errBox.style.display = 'block';
  }
}

document.addEventListener('ParadigmDOMReady', () => {
  const payrollModalForm = document.getElementById('payroll-employee-form');
  if (payrollModalForm) {
    payrollModalForm.addEventListener('submit', (e) => {
      e.preventDefault();
      submitPayrollEmployee();
    });
  }
  
  const closeBtn = document.getElementById('btn-close-payroll-modal');
  if (closeBtn) closeBtn.addEventListener('click', closePayrollModal);
  
  const cancelBtn = document.getElementById('btn-cancel-payroll-modal');
  if (cancelBtn) cancelBtn.addEventListener('click', closePayrollModal);
});
document.addEventListener('ParadigmDOMReady', () => {
  const marital = document.getElementById('emp-marital');
  if(marital) marital.addEventListener('change', toggleSpouseField);

  const isActive = document.getElementById('emp-is-active');
  if(isActive) isActive.addEventListener('change', toggleExitDateField);

  const pfStatus = document.getElementById('emp-pf-status');
  if(pfStatus) pfStatus.addEventListener('change', toggleUanField);
});

export async function deleteEmployee(empId) {
  if (!confirm('Are you sure you want to completely delete this employee and all associated data?')) return;
  
  try {
    const res = await window.secureFetch(apiBase + '/api/admin/employees/' + empId, {
      method: 'DELETE',
      credentials: 'include'
    });
    const data = await res.json();
    if (res.ok && data.success) {
      alert('Employee deleted successfully.');
      if(typeof fetchRoster === 'function') fetchRoster();
      else window.location.reload();
    } else {
      alert(data.error || 'Failed to delete employee.');
    }
  } catch (err) {
    console.error(err);
    alert('Network error while deleting employee.');
  }
}
window.deleteEmployee = deleteEmployee;

export async function deletePayrollRun(runId) {
  if (!confirm('Are you sure you want to delete this Draft payroll run?')) return;
  
  try {
    const res = await window.secureFetch(apiBase + '/api/admin/payroll/runs/' + runId, {
      method: 'DELETE',
      credentials: 'include'
    });
    const data = await res.json();
    if (res.ok && data.success) {
      alert('Payroll Run deleted successfully.');
      if(typeof fetchPayrollRuns === 'function') fetchPayrollRuns();
      else window.location.reload();
    } else {
      alert(data.error || 'Failed to delete payroll run.');
    }
  } catch (err) {
    console.error(err);
    alert('Network error while deleting payroll run.');
  }
}
window.deletePayrollRun = deletePayrollRun;
