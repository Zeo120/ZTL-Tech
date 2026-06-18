class PayrollRosterTable extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.innerHTML = `
      <div class="table-responsive">
        <table>
          <thead>
            <tr>
              <th>Employee Name</th>
              <th>Status</th>
              <th>Financial Detail</th>
              <th style="text-align: center">Actions</th>
            </tr>
          </thead>
          <tbody id="payroll-table-body">
            <tr>
              <td
                colspan="4"
                style="
                  text-align: center;
                  padding: 2rem;
                  color: var(--text-secondary);
                "
              >
                Syncing database...
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    `;
  }
}
customElements.define('payroll-roster-table', PayrollRosterTable);
