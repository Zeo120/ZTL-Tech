import { apiBase, escapeHTML, store } from './core.js';

export async function checkIntegrations() {
    const token = localStorage.getItem('paradigm_token');
    if (!token) return;
    try {
        const res = await window.secureFetch(apiBase + '/api/admin/integrations', {
            headers: { 'Authorization': 'Bearer ' + token }
        });
        const data = await res.json();
        if (data.integrations && data.integrations.length > 0) {
            const linked = data.integrations.map(i => i.platform).join(' & ');
            document.getElementById('integration-status').textContent = `Linked: ${linked}`;
        }
    } catch(e) { console.error(e); }
}

export async function linkIntegration(platform) {
    const token = localStorage.getItem('paradigm_token');
    try {
        const res = await window.secureFetch(apiBase + '/api/admin/integrations/link', {
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json' },
            body: JSON.stringify({ platform })
        });
        if(res.ok) {
            alert(`${platform} Account Successfully Linked via OAuth Protocol.`);
            checkIntegrations();
        }
    } catch(e) { console.error(e); }
}

export async function runBooleanSearch() {
    const token = localStorage.getItem('paradigm_token');
    const query = document.getElementById('sourcing-query').value;
    const platform = document.getElementById('sourcing-platform').value;
    const container = document.getElementById('sourcing-results');
    
    if(!query) return alert('Enter a boolean prompt');
    
    container.innerHTML = '<div style="color:var(--text-secondary);">Executing Boolean Extraction on ' + platform + '...</div>';
    
    try {
        const res = await window.secureFetch(apiBase + '/api/admin/recruitment/sourcing/boolean-search', {
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json' },
            body: JSON.stringify({ query, platform })
        });
        
        const data = await res.json();
        if(!res.ok) {
            container.innerHTML = `<div style="color:red;">${data.error || 'Access Denied. Link Account first.'}</div>`;
            return;
        }
        
        container.innerHTML = '';
        data.results.forEach(c => {
            const card = document.createElement('div');
            card.className = 'panel-card';
            card.style.padding = '1rem';
            card.innerHTML = `
                <div style="font-weight:bold; font-size:1.1rem; color:var(--text-primary);">${escapeHTML(c.candidate_name)} <span class="status-badge status-active" style="float:right;">${escapeHTML(c.match_score)} Match</span></div>
                <div style="color:var(--text-secondary); margin-bottom:0.5rem; font-size:0.85rem;">${escapeHTML(c.job_title)} @ ${escapeHTML(c.company)}</div>
                <div style="margin-bottom:0.5rem; font-size:0.8rem; font-family:monospace;">${escapeHTML(c.candidate_email)}</div>
                <button class="btn-action" style="width:100%;" onclick="importToATS('${escapeHTML(c.candidate_name)}', '${escapeHTML(c.candidate_email)}', '${escapeHTML(c.job_title)}', '${escapeHTML(c.resume_url)}')">Import to ATS Pipeline</button>
            `;
            container.appendChild(card);
        });
    } catch(e) { console.error(e); }
}

export async function importToATS(name, email, title, resume) {
    const token = localStorage.getItem('paradigm_token');
    try {
        const res = await window.secureFetch(apiBase + '/api/admin/recruitment', {
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json' },
            body: JSON.stringify({
                candidate_name: name,
                candidate_email: email,
                job_title: title,
                resume_url: resume
            })
        });
        if(res.ok) {
            alert(`Candidate ${name} imported successfully!`);
            loadHRData(); // refresh table
        }
    } catch(e) { console.error(e); }
}
