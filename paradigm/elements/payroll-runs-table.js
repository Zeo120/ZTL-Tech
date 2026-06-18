class PayrollRunsTable extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.innerHTML = `
      <div class="table-responsive">
        <table>
          <thead>
            <tr>
              <th>Period</th>
              <th>Status</th>
              <th>Gross Payout</th>
              <th>Net Payout</th>
              <th style="text-align: center">Actions</th>
            </tr>
          </thead>
          <tbody id="payroll-runs-table-body">
            <tr>
              <td
                colspan="5"
                style="
                  text-align: center;
                  padding: 2rem;
                  color: var(--text-secondary);
                "
              >
                Loading payroll runs...
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    `;
  }
}
customElements.define('payroll-runs-table', PayrollRunsTable);
