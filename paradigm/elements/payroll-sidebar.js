class PayrollSidebar extends HTMLElement {
  constructor() {
    super();
  }

  connectedCallback() {
    this.innerHTML = `
      <aside class="payroll-sidebar">
        <!-- Employee Core Group -->
        <div class="sidebar-dropdown-header" onclick="toggleSidebarGroup('group-employee-core')" style="display: flex; justify-content: space-between; align-items: center; cursor: pointer; padding: 0.5rem 1rem; margin-top: 0.5rem;">
          <div style="font-size: 0.7rem; color: var(--text-secondary); text-transform: uppercase; letter-spacing: 1px; font-weight: 700;">Employee Core</div>
          <svg id="chevron-group-employee-core" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="transition: transform 0.3s ease;"><polyline points="6 9 12 15 18 9"></polyline></svg>
        </div>
        <div id="group-employee-core" style="display: none; flex-direction: column; gap: 0.2rem;">
          <button class="sub-tab-btn" id="btn-tab-employees" onclick="switchPayrollTab('employees')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            Directory
          </button>
          <button class="sub-tab-btn" id="btn-tab-salary" onclick="switchPayrollTab('salary')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="1" x2="12" y2="23"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>
            Salary Details
          </button>
          <button class="sub-tab-btn" id="btn-tab-attendance" onclick="switchPayrollTab('attendance')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            Attendance
          </button>
        </div>

        <!-- Operations Group -->
        <div class="sidebar-dropdown-header" onclick="toggleSidebarGroup('group-operations')" style="display: flex; justify-content: space-between; align-items: center; cursor: pointer; padding: 0.5rem 1rem; margin-top: 0.5rem;">
          <div style="font-size: 0.7rem; color: var(--text-secondary); text-transform: uppercase; letter-spacing: 1px; font-weight: 700;">Operations</div>
          <svg id="chevron-group-operations" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="transition: transform 0.3s ease;"><polyline points="6 9 12 15 18 9"></polyline></svg>
        </div>
        <div id="group-operations" style="display: none; flex-direction: column; gap: 0.2rem;">
          <button class="sub-tab-btn" id="btn-tab-leaves" onclick="switchPayrollTab('leaves')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
            Leave Approvals
          </button>
          <button class="sub-tab-btn" id="btn-tab-expenses" onclick="switchPayrollTab('expenses')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="2" y="5" width="20" height="14" rx="2"></rect><line x1="2" y1="10" x2="22" y2="10"></line></svg>
            Expense Claims
          </button>
          <button class="sub-tab-btn" id="btn-tab-documents" onclick="switchPayrollTab('documents')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
            Document Vault
          </button>
        </div>

        <!-- Processing Engine Group -->
        <div class="sidebar-dropdown-header" onclick="toggleSidebarGroup('group-processing')" style="display: flex; justify-content: space-between; align-items: center; cursor: pointer; padding: 0.5rem 1rem; margin-top: 0.5rem;">
          <div style="font-size: 0.7rem; color: var(--text-secondary); text-transform: uppercase; letter-spacing: 1px; font-weight: 700;">Processing Engine</div>
          <svg id="chevron-group-processing" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="transition: transform 0.3s ease;"><polyline points="6 9 12 15 18 9"></polyline></svg>
        </div>
        <div id="group-processing" style="display: none; flex-direction: column; gap: 0.2rem;">
          <button class="sub-tab-btn" id="btn-tab-rates" onclick="switchPayrollTab('rates')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
            Deductions & Rates
          </button>
          <button class="sub-tab-btn" id="btn-tab-ctc" onclick="switchPayrollTab('ctc')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect x="4" y="4" width="16" height="16" rx="2" ry="2"></rect><rect x="9" y="9" width="6" height="6"></rect><line x1="9" y1="1" x2="9" y2="4"></line><line x1="15" y1="1" x2="15" y2="4"></line><line x1="9" y1="20" x2="9" y2="23"></line><line x1="15" y1="20" x2="15" y2="23"></line><line x1="20" y1="9" x2="23" y2="9"></line><line x1="20" y1="14" x2="23" y2="14"></line><line x1="1" y1="9" x2="4" y2="9"></line><line x1="1" y1="14" x2="4" y2="14"></line></svg>
            CTC Calculator
          </button>
          <button class="sub-tab-btn" id="btn-tab-processing" onclick="switchPayrollTab('processing')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg>
            Run Payroll
          </button>
        </div>

        <!-- Intelligence Group -->
        <div class="sidebar-dropdown-header" onclick="toggleSidebarGroup('group-intelligence')" style="display: flex; justify-content: space-between; align-items: center; cursor: pointer; padding: 0.5rem 1rem; margin-top: 0.5rem;">
          <div style="font-size: 0.7rem; color: var(--text-secondary); text-transform: uppercase; letter-spacing: 1px; font-weight: 700;">Intelligence</div>
          <svg id="chevron-group-intelligence" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="transition: transform 0.3s ease;"><polyline points="6 9 12 15 18 9"></polyline></svg>
        </div>
        <div id="group-intelligence" style="display: none; flex-direction: column; gap: 0.2rem;">
          <button class="sub-tab-btn" id="btn-tab-summary" onclick="switchPayrollTab('summary')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
            Payroll Summary
          </button>
          <button class="sub-tab-btn" id="btn-tab-audit" onclick="switchPayrollTab('audit')">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
            Tax Audit Trail
          </button>
        </div>
      </aside>
    `;
  }
}

customElements.define('payroll-sidebar', PayrollSidebar);
