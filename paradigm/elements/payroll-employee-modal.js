class PayrollEmployeeModal extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.innerHTML = `
      <!-- Modal Payroll Add Employee -->
      <div
        class="slide-over-overlay"
        id="payroll-modal"
        onclick="closePayrollModalOnBackdrop(event)"
      >
        <div class="slide-over-panel">
          <div class="slide-over-header">
            <h2 style="font-size: 1.1rem; font-weight: 800">
              Add Corporate Employee
            </h2>
            <button class="modal-close" id="btn-close-payroll-modal" style="background:transparent;border:none;color:#fff;font-size:1.2rem;cursor:pointer;">✕</button>
          </div>
          <form id="payroll-employee-form">
            <div id="payroll-form-error" style="display: none; background: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.3); color: #fca5a5; padding: 1rem; border-radius: 8px; margin-bottom: 1rem; font-size: 0.85rem;"></div>
            <div class="slide-over-body" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem">
              <!-- Basic Details -->
              <div class="neon-input-group" style="grid-column: 1/-1">
                <h3 style="font-size: 0.85rem; color: var(--accent); margin-bottom: 0.5rem; text-transform: uppercase;">
                  Personal Information
                </h3>
                <div style="height: 1px; background: rgba(255,255,255,0.1); margin-bottom: 1rem;"></div>
              </div>
              
              <div class="neon-input-group">
                <label for="emp-name">Full Name<span class="required-star">*</span></label>
                <input type="text" id="emp-name" class="neon-input" required />
              </div>
              <div class="neon-input-group">
                <label for="emp-gender">Gender<span class="required-star">*</span></label>
                <select id="emp-gender" class="neon-input" required>
                  <option value="">Select Gender</option>
                  <option value="Male">Male</option>
                  <option value="Female">Female</option>
                  <option value="Other">Other</option>
                </select>
              </div>
              <div class="neon-input-group">
                <label for="emp-dob">Date of Birth</label>
                <input type="date" id="emp-dob" class="neon-input" />
              </div>
              <div class="neon-input-group">
                <label for="emp-marital">Marital Status</label>
                <select id="emp-marital" class="neon-input">
                  <option value="Unmarried">Unmarried</option>
                  <option value="Married">Married</option>
                </select>
              </div>
              
              <div class="neon-input-group conditional-field" id="spouse-field-wrapper" style="display: none;">
                <label for="emp-spouse">Spouse Name<span class="required-star">*</span></label>
                <input type="text" id="emp-spouse" class="neon-input" />
              </div>
              
              <div class="neon-input-group" style="grid-column: 1/-1; margin-top: 1rem;">
                <h3 style="font-size: 0.85rem; color: var(--accent); margin-bottom: 0.5rem; text-transform: uppercase;">
                  Corporate & Statutory
                </h3>
                <div style="height: 1px; background: rgba(255,255,255,0.1); margin-bottom: 1rem;"></div>
              </div>

              <div class="neon-input-group">
                <label for="emp-doj">Date of Joining<span class="required-star">*</span></label>
                <input type="date" id="emp-doj" class="neon-input" required />
              </div>
              <div class="neon-input-group">
                <label for="emp-exit">Exit Date</label>
                <input type="date" id="emp-exit" class="neon-input" disabled />
                <div style="margin-top: 0.5rem;">
                  <input type="checkbox" id="emp-is-active" checked />
                  <label for="emp-is-active" style="display:inline; font-size: 0.75rem;">Currently Active</label>
                </div>
              </div>
              <div class="neon-input-group">
                <label for="emp-pan">PAN Number<span class="required-star">*</span></label>
                <input type="text" id="emp-pan" class="neon-input" placeholder="ABCDE1234F" required />
              </div>
              <div class="neon-input-group">
                <label for="emp-pf-status">PF Status</label>
                <select id="emp-pf-status" class="neon-input">
                  <option value="Eligible">Eligible</option>
                  <option value="Exempt">Exempt</option>
                </select>
              </div>
              <div class="neon-input-group conditional-field" id="uan-field-wrapper">
                <label for="emp-uan">UAN Number<span class="required-star">*</span></label>
                <input type="text" id="emp-uan" class="neon-input" placeholder="100XXXXXXXXX" />
              </div>
              <div class="neon-input-group">
                <label for="emp-pt-state">PT State<span class="required-star">*</span></label>
                <select id="emp-pt-state" class="neon-input" required>
                  <option value="Karnataka">Karnataka</option>
                  <option value="Maharashtra">Maharashtra</option>
                  <option value="Tamil Nadu">Tamil Nadu</option>
                  <option value="Telangana">Telangana</option>
                  <option value="Andhra Pradesh">Andhra Pradesh</option>
                  <option value="Gujarat">Gujarat</option>
                  <option value="Madhya Pradesh">Madhya Pradesh</option>
                  <option value="Exempt">Exempt / Other (No PT)</option>
                </select>
              </div>
              <div class="neon-input-group">
                <label for="emp-tax-regime">Tax Regime<span class="required-star">*</span></label>
                <select id="emp-tax-regime" class="neon-input" required>
                  <option value="New">New Tax Regime</option>
                  <option value="Old">Old Tax Regime</option>
                </select>
              </div>
            </div>
            
            <div class="slide-over-footer">
              <button type="button" class="btn-context" id="btn-cancel-payroll-modal">Cancel</button>
              <button type="submit" class="btn-engine" id="btn-save-payroll-modal">Save Employee</button>
            </div>
          </form>
        </div>
      </div>
    `;
  }
}
customElements.define('payroll-employee-modal', PayrollEmployeeModal);
