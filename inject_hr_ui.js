const fs = require('fs');
let html = fs.readFileSync('paradigm/admin.html', 'utf8');

const navItem = `        <button class="drawer-item" id="nav-hr" onclick="switchView('hr')">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
            <circle cx="9" cy="7" r="4"></circle>
            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
          </svg>
          Deep HR Module
        </button>
        <div class="drawer-separator"></div>`;

const hrSection = `      <!-- Deep HR View -->
      <section class="view-panel" id="view-hr">
        <div class="view-header">
          <h1>Deep Human Resources</h1>
          <div style="display:flex; gap: 0.5rem">
            <button class="btn-action" onclick="alert('Recruitment ATS Pipeline Init')">Add Candidate</button>
            <button class="btn-action" onclick="alert('Launch Onboarding Pipeline')">Start Onboarding</button>
            <button class="btn-action btn-secondary" onclick="alert('Upload Vault Document')">Upload Doc</button>
          </div>
        </div>

        <div class="summary-label">
          <span>Active Pipelines: <strong id="hr-pipelines">4</strong></span>
          <span>Pending Reviews: <strong id="hr-reviews">12</strong></span>
        </div>

        <div class="control-panel" style="margin-top: 1rem;">
          <div class="table-responsive">
            <table class="data-table">
              <thead>
                <tr>
                  <th>TARGET</th>
                  <th>MODULE</th>
                  <th>STATUS</th>
                  <th>LAST UPDATE</th>
                  <th>ACTIONS</th>
                </tr>
              </thead>
              <tbody id="hr-table-body">
                <tr>
                  <td><strong>John Doe</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">john.doe@example.com</span></td>
                  <td>Recruitment (ATS)</td>
                  <td><span class="status-badge status-active">Interview Scheduled</span></td>
                  <td>2026-06-05</td>
                  <td><button class="btn-icon">View</button></td>
                </tr>
                <tr>
                  <td><strong>Jane Smith</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">EMP-0042</span></td>
                  <td>Onboarding</td>
                  <td><span class="status-badge status-pending">60% Complete</span></td>
                  <td>2026-06-06</td>
                  <td><button class="btn-icon">View</button></td>
                </tr>
                <tr>
                  <td><strong>Alice Johnson</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">EMP-0012</span></td>
                  <td>Performance Review</td>
                  <td><span class="status-badge status-error">Pending Rating</span></td>
                  <td>2026-06-01</td>
                  <td><button class="btn-icon">View</button></td>
                </tr>
                <tr>
                  <td><strong>Bob Brown</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">EMP-0015</span></td>
                  <td>Document Vault</td>
                  <td><span class="status-badge status-active">NDA Signed</span></td>
                  <td>2026-06-02</td>
                  <td><button class="btn-icon">View</button></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </section>
`;

if (!html.includes('id="nav-hr"')) {
    html = html.replace('<div class="drawer-separator"></div>', navItem);
}

if (!html.includes('id="view-hr"')) {
    html = html.replace('</main>', hrSection + '\\n      </main>');
}

fs.writeFileSync('paradigm/admin.html', html);
console.log('HR UI injected successfully.');
