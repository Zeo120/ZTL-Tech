function toggleDrawer(isOpen) {
  const drawer = document.getElementById("sidebar-drawer");
  const backdrop = document.getElementById("drawer-backdrop");
  const logo = document.getElementById("hero-logo");
  const hamburger = document.getElementById("hamburger-toggle");
  const navHeader = document.querySelector(".drawer-header h3");
  
  if (isOpen) {
    drawer.classList.add("active");
    backdrop.classList.add("active");
    if (logo) logo.style.opacity = "0";
    if (hamburger) hamburger.style.opacity = "0";
    if (navHeader) navHeader.style.opacity = "0";
  } else {
    drawer.classList.remove("active");
    backdrop.classList.remove("active");
    if (logo && (typeof currentView === "undefined" || currentView === "landing")) {
       logo.style.opacity = "1";
    }
    if (hamburger) hamburger.style.opacity = "1";
    if (navHeader) navHeader.style.opacity = "1";
  }
}



function switchView(viewId) {
  currentView = viewId;
  document
    .querySelectorAll(".drawer-item")
    .forEach((item) => item.classList.remove("active"));
  const activeNav = document.getElementById(`nav-${viewId}`);
  if (activeNav) activeNav.classList.add("active");
  const heroLogo = document.getElementById("hero-logo");
  if (heroLogo) heroLogo.style.opacity = (viewId === "landing") ? "1" : "0";

  document
    .querySelectorAll(".view-panel")
    .forEach((panel) => panel.classList.remove("active"));
  const activePanel = document.getElementById(`view-${viewId}`);
  if (activePanel) activePanel.classList.add("active");

  if (viewId === "payroll") {
    document
      .querySelectorAll(".payroll-sidebar .sub-tab-btn")
      .forEach((btn) => btn.classList.remove("active"));
    document.getElementById("employees-dropdown").style.display = "none";
    document.getElementById("reports-dropdown").style.display = "none";
    document
      .querySelectorAll(".tab-panel")
      .forEach((panel) => panel.classList.remove("active"));
    document.getElementById("payroll-tab-welcome").classList.add("active");
  } else if (viewId === "hr") {
    if (typeof loadHRData === "function") loadHRData();
  } else if (viewId === "crm") {
    renderCRMTable();
  }
  toggleDrawer(false);
}

function switchMode(mode) {
  currentMode = mode;
  const tabAdmin = document.getElementById("tab-admin");
  const tabSuper = document.getElementById("tab-super");
  const tabEmployee = document.getElementById("tab-employee");
  const headerTitle = document.getElementById("header-title");
  const headerDesc = document.getElementById("header-desc");
  const superBanner = document.getElementById("super-banner");
  const accessIdInput = document.getElementById("access-id");

  if (mode === "admin") {
    tabAdmin.classList.add("active");
    tabSuper.classList.remove("active");
    if (tabEmployee) tabEmployee.classList.remove("active");
    headerTitle.textContent = "ADMIN PORTAL";
    headerDesc.textContent =
      "Provide authorized admin credentials to access the Paradigm control workspace.";
    superBanner.style.display = "none";
    accessIdInput.placeholder = "cfo@company.com";
  } else if (mode === "super") {
    tabAdmin.classList.remove("active");
    if (tabEmployee) tabEmployee.classList.remove("active");
    tabSuper.classList.add("active");
    headerTitle.textContent = "SUPER ADMIN CONSOLE";
    headerDesc.textContent = "Out-of-band super admin configuration enabled.";
    superBanner.style.display = "block";
    accessIdInput.placeholder = "ROOT-ACCESS-ID";
  } else if (mode === "employee") {
    tabAdmin.classList.remove("active");
    tabSuper.classList.remove("active");
    if (tabEmployee) tabEmployee.classList.add("active");
    headerTitle.textContent = "EMPLOYEE PORTAL";
    headerDesc.textContent =
      "Provide your credentials to access the self-service employee portal.";
    superBanner.style.display = "none";
    accessIdInput.placeholder = "employee@company.com";
  }
}

function togglePasswordVisibility() {
  const passwordInput = document.getElementById("password");
  const eyeIcon = document.getElementById("eye-icon");

  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    // Eye-off/slash icon path
    eyeIcon.innerHTML = `
                    <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                    <line x1="1" y1="1" x2="23" y2="23"></line>
                `;
  } else {
    passwordInput.type = "password";
    // Standard eye icon path
    eyeIcon.innerHTML = `
                    <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                    <circle cx="12" cy="12" r="3"></circle>
                `;
  }
}
