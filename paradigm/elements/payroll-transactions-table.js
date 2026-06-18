class PayrollTransactionsTable extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    this.innerHTML = `
      <div class="table-responsive">
        <table>
          <thead>
            <tr>
              <th>Employee</th>
              <th>Gross</th>
              <th>PF</th>
              <th>ESI</th>
              <th>PT</th>
              <th>TDS</th>
              <th>LWP</th>
              <th>Net</th>
              <th style="text-align: center">Payslip</th>
            </tr>
          </thead>
          <tbody id="payroll-transactions-table-body">
            <tr>
              <td
                colspan="9"
                style="
                  text-align: center;
                  padding: 2rem;
                  color: var(--text-secondary);
                "
              >
                Loading transactions...
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    `;
  }
}
customElements.define('payroll-transactions-table', PayrollTransactionsTable);
