import { apiBase, escapeHTML, store } from './core.js';

export async function loadHRData() {
    if (typeof window.checkIntegrations === 'function') window.checkIntegrations();
    try {
        const token = localStorage.getItem('paradigm_token');
        if (!token) return;

        const headers = { 'Authorization': 'Bearer ' + token };
        
        // Fetch from all 4 deep HR modules concurrently
        const [recRes, onbRes, prfRes, docRes] = await Promise.all([
            window.secureFetch(apiBase + '/api/admin/recruitment', { headers }).then(r => r.ok ? r.json() : { candidates: [] }),
            window.secureFetch(apiBase + '/api/admin/onboarding', { headers }).then(r => r.ok ? r.json() : { onboarding_pipelines: [] }),
            window.secureFetch(apiBase + '/api/admin/performance-reviews', { headers }).then(r => r.ok ? r.json() : { reviews: [] }),
            window.secureFetch(apiBase + '/api/admin/documents', { headers }).then(r => r.ok ? r.json() : { documents: [] })
        ]);

        const candidates = recRes.candidates || [];
        const pipelines = onbRes.onboarding_pipelines || [];
        const reviews = prfRes.reviews || [];
        const documents = docRes.documents || [];

        // Update KPIs
        document.getElementById('hr-pipelines').textContent = pipelines.length + candidates.length;
        document.getElementById('hr-reviews').textContent = reviews.length;

        const tbody = document.getElementById('hr-table-body');
        if (!tbody) return;
        tbody.innerHTML = '';

        // Combine all streams into a unified ledger
        let unified = [];

        candidates.forEach(c => unified.push({
            target: `<strong>${escapeHTML(c.candidate_name)}</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">${escapeHTML(c.candidate_email)}</span>`,
            module: 'Recruitment (ATS)',
            status: `<span class="status-badge ${c.status === 'Applied' ? 'status-pending' : 'status-active'}">${escapeHTML(c.status)}</span>`,
            date: new Date(c.created_at).toISOString().split('T')[0]
        }));

        pipelines.forEach(p => unified.push({
            target: `<strong>${escapeHTML(p.employee_name)}</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">EMP-${p.employee_id}</span>`,
            module: 'Onboarding',
            status: `<span class="status-badge ${p.progress_percent === 100 ? 'status-active' : 'status-pending'}">${p.progress_percent}% - ${escapeHTML(p.current_stage)}</span>`,
            date: new Date(p.created_at).toISOString().split('T')[0]
        }));

        reviews.forEach(r => unified.push({
            target: `<strong>${escapeHTML(r.employee_name)}</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">EMP-${r.employee_id}</span>`,
            module: 'Performance Review',
            status: `<span class="status-badge ${r.rating ? 'status-active' : 'status-error'}">${r.rating ? 'Rated ' + r.rating : 'Pending Rating'}</span>`,
            date: new Date(r.created_at).toISOString().split('T')[0]
        }));

        documents.forEach(d => unified.push({
            target: `<strong>${escapeHTML(d.filename)}</strong><br><span style="color:var(--text-secondary); font-size:0.75rem;">${escapeHTML(d.document_type)}</span>`,
            module: 'Document Vault',
            status: `<span class="status-badge ${d.status === 'Active' ? 'status-active' : 'status-error'}">${escapeHTML(d.status)}</span>`,
            date: new Date(d.created_at).toISOString().split('T')[0]
        }));

        // Sort by date descending
        unified.sort((a, b) => new Date(b.date) - new Date(a.date));

        if (unified.length === 0) {
            tbody.innerHTML = '<tr><td colspan="5" style="text-align:center; color: var(--text-secondary);">No HR records found. Add a candidate or start onboarding.</td></tr>';
            return;
        }

        unified.forEach(row => {
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td>${row.target}</td>
                <td>${row.module}</td>
                <td>${row.status}</td>
                <td>${row.date}</td>
                <td>
                    <button style="background: transparent; border: 1px solid rgba(255, 255, 255, 0.2); border-radius: 4px; padding: 0.4rem 0.8rem; color: #fff; cursor: pointer; transition: all 0.3s ease; display: inline-flex; align-items: center; gap: 0.4rem; font-size: 0.8rem; backdrop-filter: blur(4px);" onmouseover="this.style.background='rgba(255, 255, 255, 0.1)'; this.style.borderColor='rgba(255, 255, 255, 0.4)';" onmouseout="this.style.background='transparent'; this.style.borderColor='rgba(255, 255, 255, 0.2)';">
                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle></svg>
                        View
                    </button>
                </td>
            `;
            tbody.appendChild(tr);
        });

    } catch(e) {
        console.error('HR Sync Failed:', e);
    }
}



