
export function renderCRMTable() {
  const tbody = document.getElementById("crm-table-body");
  tbody.innerHTML = "";
  let totalVal = 0;

  if (mockCRMLeads.length === 0) {
    tbody.innerHTML = `<tr><td colspan="4" style="text-align:center; color: var(--text-secondary);">No leads found.</td></tr>`;
    document.getElementById("crm-total-pipeline").textContent = "$0";
    document.getElementById("crm-active-leads").textContent = "0";
    return;
  }

  mockCRMLeads.forEach((lead) => {
    totalVal += Number(lead.value);
    const tr = document.createElement("tr");
    tr.innerHTML = `
                    <td><strong>${lead.name}</strong></td>
                    <td><span class="employee-badge" style="background:rgba(255,255,255,0.02); color:#fff;">${lead.stage}</span></td>
                    <td style="font-family: monospace;">$${Number(lead.value).toLocaleString()}</td>
                    <td style="text-align: center;">
                        <button class="btn-delete" onclick="deleteCRMLead(${lead.id})">Remove</button>
                    </td>
                `;
    tbody.appendChild(tr);
  });

  document.getElementById("crm-total-pipeline").textContent =
    `$${totalVal.toLocaleString()}`;
  document.getElementById("crm-active-leads").textContent = mockCRMLeads.length;
}

export function filterCRMLeads() {
  const q = document
    .getElementById("crm-search-box")
    .value.toLowerCase()
    .trim();
  const rows = document.querySelectorAll("#crm-table-body tr");
  rows.forEach((row) => {
    row.style.display = row.textContent.toLowerCase().includes(q) ? "" : "none";
  });
}

export function openCRMModal() {
  document.getElementById("crm-lead-form").reset();
  document.getElementById("crm-modal").classList.add("active");
}

export function closeCRMModal() {
  document.getElementById("crm-modal").classList.remove("active");
}

export function closeCRMModalOnBackdrop(e) {
  if (e.target.id === "crm-modal") closeCRMModal();
}

export function submitCRMForm() {
  const name = document.getElementById("crm-name").value.trim();
  const stage = document.getElementById("crm-stage").value;
  const value = document.getElementById("crm-value").value;

  const newId =
    mockCRMLeads.length > 0
      ? Math.max(...mockCRMLeads.map((l) => l.id)) + 1
      : 1;
  mockCRMLeads.unshift({ id: newId, name, stage, value: Number(value) });
  closeCRMModal();
  renderCRMTable();
}

export function deleteCRMLead(id) {
  if (confirm("Subtract lead entry from database?")) {
    mockCRMLeads = mockCRMLeads.filter((l) => l.id !== id);
    renderCRMTable();
  }
}


