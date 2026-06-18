class CrmLeadModal extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.innerHTML = `
      <!-- Modal CRM Add Lead -->
      <div class="modal" id="crm-modal" onclick="closeCRMModalOnBackdrop(event)">
        <div class="modal-content">
          <div class="modal-header">
            <h2 style="font-size: 1.1rem; font-weight: 800">
              Register New Account Lead
            </h2>
            <button class="modal-close" onclick="closeCRMModal()">✕</button>
          </div>
          <form
            id="crm-lead-form"
            onsubmit="
              event.preventDefault();
              submitCRMForm();
            "
          >
            <div class="form-grid">
              <div class="form-group">
                <label for="crm-name"
                  >Client Name<span class="required-star">*</span></label
                >
                <input
                  type="text"
                  id="crm-name"
                  class="form-control"
                  placeholder="Acme Corp"
                  required
                />
              </div>
              <div class="form-group">
                <label for="crm-contact"
                  >Contact Person<span class="required-star">*</span></label
                >
                <input
                  type="text"
                  id="crm-contact"
                  class="form-control"
                  placeholder="John Doe"
                  required
                />
              </div>
              <div class="form-group">
                <label for="crm-industry"
                  >Industry<span class="required-star">*</span></label
                >
                <select id="crm-industry" class="form-control" required>
                  <option value="SaaS / Software">SaaS / Software</option>
                  <option value="Finance & Banking">Finance & Banking</option>
                  <option value="Aerospace / Logistics">
                    Aerospace / Logistics
                  </option>
                  <option value="Medical Technology">Medical Technology</option>
                </select>
              </div>
              <div class="form-group">
                <label for="crm-stage">Stage</label>
                <select id="crm-stage" class="form-control">
                  <option value="Lead Qualification">Lead Qualification</option>
                  <option value="Active Proposal">Active Proposal</option>
                  <option value="Contract Negotiation">
                    Contract Negotiation
                  </option>
                  <option value="Closed-Won">Closed-Won</option>
                </select>
              </div>
              <div class="form-group">
                <label for="crm-value"
                  >Contract Value ($)<span class="required-star">*</span></label
                >
                <input
                  type="number"
                  id="crm-value"
                  class="form-control"
                  placeholder="50000"
                  min="0"
                  required
                />
              </div>
              <div
                class="form-actions"
                style="
                  grid-column: 1/-1;
                  display: flex;
                  justify-content: flex-end;
                  gap: 0.8rem;
                  margin-top: 1rem;
                "
              >
                <button
                  type="button"
                  class="btn-action btn-secondary"
                  onclick="closeCRMModal()"
                >
                  Cancel
                </button>
                <button type="submit" class="btn-action">Save Lead</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    `;
  }
}
customElements.define('crm-lead-modal', CrmLeadModal);
