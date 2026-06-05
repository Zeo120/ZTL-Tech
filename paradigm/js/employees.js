function escapeHTML(str) {
  if (!str) return "";
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

let allEmployees = [];
let dropdownCached = false;
let allEmployeesFull = [];
let currentPage = 1;
const limitPerPage = 10;
let totalPages = 1;
let searchQuery = "";

// Cookie reading helpers for CSRF
function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(";").shift();
  return null;
}

function getCSRFToken() {
  const match = document.cookie.match(/(^|;)\s*ztl_csrf\s*=\s*([^;]+)/);
  return match ? match[2] : "";
}

const origin = window.location.origin;
const apiBase =
  origin.startsWith("file:") || origin === "null" || !origin
    ? "http://localhost:3000"
    : "";

// Visibility Toggles
function toggleSpouseField() {
  const maritalStatus = document.getElementById("emp-marital").value;
  const spouseWrapper = document.getElementById("spouse-field-wrapper");
  const spouseInput = document.getElementById("emp-spouse");

  if (maritalStatus === "Married") {
    spouseWrapper.classList.add("visible");
    spouseInput.required = true;
  } else {
    spouseWrapper.classList.remove("visible");
    spouseInput.required = false;
    spouseInput.value = "";
  }
}

function toggleExitDateField() {
  const status = document.getElementById("emp-status").value;
  const exitWrapper = document.getElementById("exit-date-field-wrapper");
  const exitInput = document.getElementById("emp-doe");

  if (status === "Terminated") {
    exitWrapper.classList.add("visible");
    exitInput.required = true;
  } else {
    exitWrapper.classList.remove("visible");
    exitInput.required = false;
    exitInput.value = "";
  }
}

function toggleUanField() {
  const pf = document.getElementById("emp-pf").value;
  const uanWrapper = document.getElementById("uan-field-wrapper");
  const uanInput = document.getElementById("emp-uan");

  if (pf === "Applicable") {
    uanWrapper.classList.add("visible");
    uanInput.required = true;
  } else {
    uanWrapper.classList.remove("visible");
    uanInput.required = false;
    uanInput.value = "";
  }
}

// Tab switching logic
function switchTab(tabId) {
  // Remove active classes
  document
    .querySelectorAll(".tab-link")
    .forEach((btn) => btn.classList.remove("active"));
  document
    .querySelectorAll(".tab-panel-view")
    .forEach((panel) => panel.classList.remove("active"));

  // Add active class to selected tab and panel
  if (tabId === "view") {
    document.getElementById("tab-btn-view").classList.add("active");
    document.getElementById("tab-view-employees").classList.add("active");
    toggleAddEmployeeForm(false);
    fetchRoster(); // Refresh the roster
  } else if (tabId === "salary") {
    document.getElementById("tab-btn-salary").classList.add("active");
    document.getElementById("tab-salary-details").classList.add("active");

    // Refresh selection lists and reset boxes
    fetchDropdownEmployees();
    loadEmployeeSalary();
  }
}

// Toggles Inline Employee Creation Form
function toggleAddEmployeeForm(show) {
  const rosterListCard = document.getElementById("roster-list-card");
  const rosterAddCard = document.getElementById("roster-add-card");

  if (show) {
    switchTab("view");
    rosterListCard.style.display = "none";
    rosterAddCard.style.display = "block";
    document.getElementById("create-employee-form").reset();
    toggleSpouseField();
    toggleExitDateField();
    toggleUanField();
    document.getElementById("form-error-banner").style.display = "none";
  } else {
    rosterListCard.style.display = "block";
    rosterAddCard.style.display = "none";
  }
}

// Dropdown populating for salaries
function populateEmployeeSelect() {
  const select = document.getElementById("salary-employee-select");
  const curVal = select.value;
  select.innerHTML = '<option value="">-- Choose Employee --</option>';
  allEmployees.forEach((emp) => {
    const opt = document.createElement("option");
    opt.value = emp.id;
    opt.textContent = `${escapeHTML(emp.name)} (PAN: ${escapeHTML(emp.pan).toUpperCase()})`;
    select.appendChild(opt);
  });
  select.value = curVal;
}

// Load salary details for chosen employee
function loadEmployeeSalary() {
  const select = document.getElementById("salary-employee-select");
  const empId = parseInt(select.value, 10);
  const errBanner = document.getElementById("salary-error-banner");
  const succBanner = document.getElementById("salary-success-banner");
  errBanner.style.display = "none";
  succBanner.style.display = "none";

  if (!empId) {
    document.getElementById("sal-base").value = "";
    document.getElementById("sal-hra").value = "";
    document.getElementById("sal-allowances").value = "";
    document.getElementById("sal-deductions").value = "";
    calculateTakeHome();
    return;
  }

  const emp = allEmployeesFull.find((e) => e.id === empId);
  if (emp) {
    document.getElementById("sal-base").value = emp.base_salary || "";
    document.getElementById("sal-hra").value = emp.hra || "";
    document.getElementById("sal-allowances").value = emp.allowances || "";
    document.getElementById("sal-deductions").value = emp.deductions || "";
    calculateTakeHome();
  }
}

// Calculate and Update Take Home UI
function calculateTakeHome() {
  const base = parseFloat(document.getElementById("sal-base").value) || 0;
  const hra = parseFloat(document.getElementById("sal-hra").value) || 0;
  const allowances =
    parseFloat(document.getElementById("sal-allowances").value) || 0;
  const deductions =
    parseFloat(document.getElementById("sal-deductions").value) || 0;

  const gross = base + hra + allowances;
  const net = gross - deductions;

  document.getElementById("sal-display-gross").textContent =
    `$${gross.toFixed(2)}`;
  document.getElementById("sal-display-deductions").textContent =
    `$${deductions.toFixed(2)}`;
  document.getElementById("sal-display-net").textContent = `$${net.toFixed(2)}`;
}

function openCredentialsModal(empId) {
  document.getElementById("cred-emp-id").value = empId;
  document.getElementById("cred-email").value = "";
  document.getElementById("cred-password").value = "";
  document.getElementById("cred-error-banner").style.display = "none";
  document.getElementById("cred-success-banner").style.display = "none";
  document.getElementById("credentials-modal").classList.add("active");
}
function closeCredentialsModal() {
  document.getElementById("credentials-modal").classList.remove("active");
}
function closeCredentialsModalOnBackdrop(e) {
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
    const res = await fetch(
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

// Submit Salary Details via PUT
async function submitSalaryDetails() {
  const select = document.getElementById("salary-employee-select");
  const empId = parseInt(select.value, 10);
  const errBanner = document.getElementById("salary-error-banner");
  const succBanner = document.getElementById("salary-success-banner");
  errBanner.style.display = "none";
  succBanner.style.display = "none";

  if (!empId) {
    errBanner.textContent = "Please choose a corporate employee.";
    errBanner.style.display = "block";
    return;
  }

  const base_salary =
    parseFloat(document.getElementById("sal-base").value) || 0;
  const hra = parseFloat(document.getElementById("sal-hra").value) || 0;
  const allowances =
    parseFloat(document.getElementById("sal-allowances").value) || 0;
  const deductions =
    parseFloat(document.getElementById("sal-deductions").value) || 0;

  try {
    const response = await fetch(
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
        }),
      },
    );

    const payload = await response.json();
    if (response.ok && payload.success) {
      succBanner.textContent =
        "Employee salary structure updated successfully in database.";
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

// Search mechanism with 300ms debounce
let searchTimeout;
function handleSearch() {
  clearTimeout(searchTimeout);
  searchTimeout = setTimeout(() => {
    searchQuery = document.getElementById("search-box").value.trim();
    currentPage = 1; // Reset to page 1 on new search
    fetchRoster();
  }, 300);
}

// Change page helper
function changePage(dir) {
  const newPage = currentPage + dir;
  if (newPage >= 1 && newPage <= totalPages) {
    currentPage = newPage;
    fetchRoster();
  }
}

// Fetch dropdown menu list separately (bypass pagination)
async function fetchDropdownEmployees() {
  if (dropdownCached) {
    populateEmployeeSelectWithOptions(allEmployeesFull);
    return;
  }
  try {
    const res = await fetch(`${apiBase}/api/admin/employees?limit=all`, {
      credentials: "include",
    });
    if (res.ok) {
      const payload = await res.json();
      if (payload.success && payload.data && payload.data.employees) {
        allEmployeesFull = payload.data.employees;
        dropdownCached = true;
        populateEmployeeSelectWithOptions(allEmployeesFull);
      }
    }
  } catch (err) {
    console.error(err);
  }
}

function populateEmployeeSelectWithOptions(employees) {
  const select = document.getElementById("salary-employee-select");
  const curVal = select.value;
  select.innerHTML = '<option value="">-- Choose Employee --</option>';
  employees.forEach((emp) => {
    const opt = document.createElement("option");
    opt.value = emp.id;
    opt.textContent = `${escapeHTML(emp.name)} (PAN: ${escapeHTML(emp.pan).toUpperCase()})`;
    select.appendChild(opt);
  });
  select.value = curVal;
}

// Load data from Backend with pagination
async function fetchRoster() {
  try {
    const url = `${apiBase}/api/admin/employees?page=${currentPage}&limit=${limitPerPage}&search=${encodeURIComponent(searchQuery)}`;
    const res = await fetch(url, { credentials: "include" });
    if (res.status === 401) {
      window.location.href = "login.html";
      return;
    }
    if (res.ok) {
      const payload = await res.json();
      if (payload.success && payload.data && payload.data.employees) {
        allEmployees = payload.data.employees;
        renderRoster(allEmployees);

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

        // Load data for the dropdown (Removed to save memory)
      } else {
        showTableError("Failed to fetch corporate roster.");
      }
    } else {
      showTableError("Server responded with error status.");
    }
  } catch (err) {
    console.error(err);
    showTableError(
      "Failed to connect to the authentication server. Verify server is running.",
    );
  }
}

function showTableError(msg) {
  document.getElementById("roster-table-body").innerHTML = `
                <tr>
                    <td colspan="7" style="text-align: center; padding: 3rem; color: #ff5470; font-weight: 600;">
                        [!] ${msg}
                    </td>
                </tr>
            `;
}

// Render roster rows
function renderRoster(employees) {
  const tbody = document.getElementById("roster-table-body");
  tbody.innerHTML = "";

  if (employees.length === 0) {
    tbody.innerHTML = `
                    <tr>
                        <td colspan="7" style="text-align: center; padding: 3.5rem; color: var(--text-secondary); font-size: 0.88rem;">
                            No corporate employees registered in system.
                        </td>
                    </tr>
                `;
    return;
  }

  employees.forEach((emp) => {
    const tr = document.createElement("tr");

    // Status Badge
    const statusClass =
      emp.status === "Active" ? "badge-active" : "badge-terminated";
    const statusBadge = `
                    <span class="employee-badge ${statusClass}">
                        ${emp.status.toUpperCase()}
                    </span>
                `;

    // Marital Details string
    const maritalInfo =
      emp.marital_status === "Married"
        ? `<span style="font-size: 0.75rem; display: block; color: var(--text-secondary);">Spouse: ${escapeHTML(emp.spouse_name)}</span>`
        : "";

    // Financial details view
    const bankNum = escapeHTML(emp.bank_account_number) || "-";
    const pfInfo =
      emp.pf_status === "Applicable"
        ? `<span style="font-size: 0.72rem; display: block; color: var(--accent-primary); font-family: monospace;">UAN: ${escapeHTML(emp.uan_no)}</span>`
        : `<span style="font-size: 0.72rem; display: block; color: var(--text-secondary);">No PF Contribution</span>`;

    const baseSal = emp.base_salary || 0;
    const hraSal = emp.hra || 0;
    const allSal = emp.allowances || 0;
    const dedSal = emp.deductions || 0;
    const grossSal = baseSal + hraSal + allSal;
    const netSal = grossSal - dedSal;

    const financeDetails = `
                    <div style="font-size: 0.8rem;">
                        <span style="font-family: monospace; display: block;">A/C: ${bankNum}</span>
                        ${pfInfo}
                        <span style="display: block; color: #00ffaa; font-weight: 700; margin-top: 0.2rem;">Net Pay: $${netSal.toFixed(2)}</span>
                    </div>
                `;

    // Gov details
    const govInfo = `
                    <div style="font-family: monospace; font-size: 0.8rem;">
                        <span>PAN: ${escapeHTML(emp.pan).toUpperCase()}</span>
                        <span style="display: block; color: var(--text-secondary);">UID: ${escapeHTML(emp.aadhar)}</span>
                    </div>
                `;

    // Age / Gender
    const ageGender = `
                    <div>
                        <span>${emp.age} Years</span>
                        <span style="display: block; font-size: 0.78rem; color: var(--text-secondary);">${emp.gender}</span>
                    </div>
                `;

    // Exit date display if terminated
    const exitDate =
      emp.status === "Terminated" && emp.date_of_exit
        ? `<span style="display: block; font-size: 0.72rem; color: #ff5470;">Exit: ${emp.date_of_exit}</span>`
        : "";

    tr.innerHTML = `
                    <td style="padding: 1.1rem 1rem;">
                        <strong style="color: #fff; font-size: 0.95rem;">${escapeHTML(emp.name)}</strong>
                        ${maritalInfo}
                    </td>
                    <td>${ageGender}</td>
                    <td>
                        ${statusBadge}
                        ${exitDate}
                    </td>
                    <td>${govInfo}</td>
                    <td style="font-family: monospace; font-size: 0.82rem;">${emp.date_of_joining}</td>
                    <td>${financeDetails}</td>
                    <td style="text-align: center;">
                        <button class="btn-action" style="font-size: 0.7rem; padding: 0.3rem 0.6rem; margin-right: 0.5rem;" onclick="openCredentialsModal(${emp.id})">Credentials</button>
  <button class="btn-delete" onclick="deleteEmployee(${emp.id}, '${escapeHTML(emp.name)}')">Remove</button>
                    </td>
                `;

    tbody.appendChild(tr);
  });
}

// Add Employee Submit Handler
async function submitEmployeeForm() {
  const errorBanner = document.getElementById("form-error-banner");
  errorBanner.style.display = "none";

  // Gather elements
  const name = document.getElementById("emp-name").value.trim();
  const ageStr = document.getElementById("emp-age").value;
  const gender = document.getElementById("emp-gender").value;
  const dob = document.getElementById("emp-dob").value;
  const marital_status = document.getElementById("emp-marital").value;
  const spouse_name = document.getElementById("emp-spouse").value;
  const pan = document.getElementById("emp-pan").value.trim();
  const aadhar = document.getElementById("emp-aadhar").value.trim();
  const status = document.getElementById("emp-status").value;
  const date_of_joining = document.getElementById("emp-doj").value;
  const date_of_exit = document.getElementById("emp-doe").value;
  const bank_account_number = document.getElementById("emp-bank").value.trim();
  const ifsc_code = document.getElementById("emp-ifsc").value.trim();
  const pf_status = document.getElementById("emp-pf").value;
  const uan_no = document.getElementById("emp-uan").value.trim();

  // Client side validations
  const age = parseInt(ageStr, 10);
  if (isNaN(age) || age < 18 || age > 100) {
    errorBanner.textContent =
      "Employee age must be a valid number between 18 and 100.";
    errorBanner.style.display = "block";
    return;
  }

  // Simple PAN check
  if (pan.length < 5) {
    errorBanner.textContent = "Please enter a valid PAN Identification Number.";
    errorBanner.style.display = "block";
    return;
  }

  // Simple Aadhar check
  const aadharClean = aadhar.replace(/\s+/g, "");
  if (!/^\d{12}$/.test(aadharClean)) {
    errorBanner.textContent =
      "Aadhar Number must be exactly 12 numeric digits.";
    errorBanner.style.display = "block";
    return;
  }

  // Date validations
  if (status === "Terminated" && date_of_exit && date_of_joining) {
    if (new Date(date_of_exit) < new Date(date_of_joining)) {
      errorBanner.textContent =
        "Date of Exit cannot be prior to Date of Joining.";
      errorBanner.style.display = "block";
      return;
    }
  }

  const bodyData = {
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
  };

  try {
    const response = await fetch(`${apiBase}/api/admin/employees`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
        "x-csrf-token": getCSRFToken(),
      },
      body: JSON.stringify(bodyData),
    });

    const payload = await response.json();
    if (response.ok && payload.success) {
      switchTab("view");
    } else {
      errorBanner.textContent =
        payload.error || "Server rejected employee submission.";
      errorBanner.style.display = "block";
    }
  } catch (err) {
    errorBanner.textContent = "Network error during request submission.";
    errorBanner.style.display = "block";
    console.error(err);
  }
}

// Delete Employee Handler
async function deleteEmployee(id, name) {
  const confirmed = confirm(
    `Are you sure you want to permanently remove employee "${name}" from the corporate registry?`,
  );
  if (!confirmed) return;

  try {
    const response = await fetch(`${apiBase}/api/admin/employees/${id}`, {
      method: "DELETE",
      credentials: "include",
      headers: {
        "x-csrf-token": getCSRFToken(),
      },
    });

    if (response.ok) {
      fetchRoster();
    } else {
      const payload = await response.json();
      alert(payload.error || "Failed to remove employee.");
    }
  } catch (err) {
    console.error(err);
    alert("Connection failure during record deletion.");
  }
}

// ============================================================================
// MINIMALIST UI TOGGLE (Display Information Only On Click)
// ============================================================================
function applyMinimalistUI() {
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

      let title = "Reveal Information";
      if (hasForm && !hasTable) title = "Reveal Form";
      if (hasTable && !hasForm) title = "Reveal Data Table";

      btn.innerHTML = `<span style="margin-right:8px;">+</span> ${title}`;

      btn.onclick = (e) => {
        e.preventDefault(); // Prevent form submission if inside a form (though it's outside)
        if (contentWrapper.style.display === "none") {
          contentWrapper.style.display = "block";
          btn.innerHTML = `<span style="margin-right:8px;">-</span> Hide Information`;
          btn.style.marginBottom = "1.5rem";
          btn.style.borderStyle = "solid";
          btn.style.background = "rgba(255,255,255,0.02)";
        } else {
          contentWrapper.style.display = "none";
          btn.innerHTML = `<span style="margin-right:8px;">+</span> ${title}`;
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

applyMinimalistUI();
// Initialize fetch
fetchRoster();
