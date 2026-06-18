class EmployeeCredentialsModal extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.innerHTML = `
      <!-- Modal Employee Credentials -->
      <div
        class="slide-over-overlay"
        id="credentials-modal"
        onclick="closeCredentialsModalOnBackdrop(event)"
      >
        <div class="slide-over-panel">
          <div class="slide-over-header">
            <h2 style="font-size: 1.1rem; font-weight: 800">
              Set Employee Portal Credentials
            </h2>
            <button class="modal-close" onclick="closeCredentialsModal()">
              ✕
            </button>
          </div>
          <form
            id="credentials-form"
            onsubmit="
              event.preventDefault();
              submitCredentialsForm();
            "
          >
            <input type="hidden" id="cred-emp-id" />
            <div class="form-grid">
              <div class="form-group">
                <label>Email Address</label>
                <input
                  type="email"
                  id="cred-email"
                  class="form-control"
                  required
                  placeholder="employee@company.com"
                />
              </div>
              <div class="form-group">
                <label>New Password</label>
                <input
                  type="password"
                  id="cred-password"
                  class="form-control"
                  required
                  minlength="6"
                  placeholder="******"
                />
              </div>
            </div>
            <div
              id="cred-error-banner"
              class="error-banner"
              style="display: none; margin-bottom: 1rem"
            ></div>
            <div
              id="cred-success-banner"
              class="success-banner"
              style="display: none; margin-bottom: 1rem"
            ></div>
            <div class="modal-footer" style="margin-top: 1.5rem">
              <button type="submit" class="btn-action">Save Credentials</button>
            </div>
          </form>
        </div>
      </div>
    `;
  }
}
customElements.define('employee-credentials-modal', EmployeeCredentialsModal);
