class PayrollAttendanceTable extends HTMLElement {
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
              <th style="text-align: right; padding-right: 2rem">
                Mark Status
              </th>
            </tr>
          </thead>
          <tbody id="attendance-table-body">
            <tr>
              <td
                colspan="2"
                style="
                  text-align: center;
                  padding: 2rem;
                  color: var(--text-secondary);
                "
              >
                Loading employees registry...
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    `;
  }
}
customElements.define('payroll-attendance-table', PayrollAttendanceTable);
