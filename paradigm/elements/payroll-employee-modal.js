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
            <button class="modal-close" onclick="closePayrollModal()" style="background:transparent;border:none;color:#fff;font-size:1.2rem;cursor:pointer;">✕</button>
          </div>
          <form
            id="payroll-employee-form"
            onsubmit="
              event.preventDefault();
              alert('Employee Added to LEDGER');
              closePayrollModal();
            "
          >
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
                <select id="emp-marital" class="neon-input" onchange="toggleSpouseField()">
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
                  <input type="checkbox" id="emp-is-active" checked onchange="toggleExitDateField()" />
                  <label for="emp-is-active" style="display:inline; font-size: 0.75rem;">Currently Active</label>
                </div>
              </div>
              <div class="neon-input-group">
                <label for="emp-pan">PAN Number<span class="required-star">*</span></label>
                <input type="text" id="emp-pan" class="neon-input" placeholder="ABCDE1234F" required />
              </div>
              <div class="neon-input-group">
                <label for="emp-pf-status">PF Status</label>
                <select id="emp-pf-status" class="neon-input" onchange="toggleUanField()">
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
            </div>
            
            <div class="slide-over-footer">
              <button type="button" class="btn-context" onclick="closePayrollModal()">Cancel</button>
              <button type="submit" class="btn-engine">Save Employee</button>
            </div>
          </form>
        </div>
      </div>
    `;
  }
}
customElements.define('payroll-employee-modal', PayrollEmployeeModal);
