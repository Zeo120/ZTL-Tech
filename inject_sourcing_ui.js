const fs = require('fs');

// 1. Inject HTML into admin.html
let html = fs.readFileSync('paradigm/admin.html', 'utf8');

const sourcingHTML = `
        <div class="form-section-title" style="margin-top:2rem;">EXTERNAL SOURCING ENGINE</div>
        <div class="summary-label" style="display:flex; justify-content:space-between; align-items:center;">
          <div style="display:flex; gap: 0.5rem">
            <button class="btn-action btn-secondary" onclick="linkIntegration('LinkedIn')" id="btn-link-linkedin">Link LinkedIn</button>
            <button class="btn-action btn-secondary" onclick="linkIntegration('Indeed')" id="btn-link-indeed">Link Indeed</button>
          </div>
          <div><span id="integration-status" style="color:var(--accent-primary); font-weight:bold;">Awaiting Integration...</span></div>
        </div>

        <div class="control-panel" style="margin-top: 1rem;">
          <label style="display:block; margin-bottom:0.5rem; color:var(--text-secondary); font-weight:bold;">Boolean Prompting (e.g. "Software Engineer" AND "React" NOT "Intern")</label>
          <div style="display:flex; gap:0.5rem;">
            <input type="text" id="sourcing-query" class="search-input" style="flex:1;" placeholder='"Full Stack" AND "AWS" AND "5+ Years"'>
            <select id="sourcing-platform" class="form-control" style="width:150px;">
              <option value="LinkedIn">LinkedIn</option>
              <option value="Indeed">Indeed</option>
            </select>
            <button class="btn-action" onclick="runBooleanSearch()">Run Deep Search</button>
          </div>
        </div>

        <div id="sourcing-results" style="margin-top: 1rem; display:grid; gap:0.8rem; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));">
          <!-- Search results will appear here -->
        </div>
`;

if (!html.includes('EXTERNAL SOURCING ENGINE')) {
    html = html.replace('<!-- Search results will appear here -->', ''); // Clean up any accidents
    html = html.replace('</section>\\n      </main>', sourcingHTML + '\\n      </section>\\n      </main>');
    fs.writeFileSync('paradigm/admin.html', html);
    console.log('Sourcing UI injected into admin.html');
}

// 2. Inject JS into admin.js
let js = fs.readFileSync('paradigm/js/admin.js', 'utf8');

const sourcingJS = `
/* ------------------ SOURCING ENGINE ------------------ */
async function checkIntegrations() {
    const token = localStorage.getItem('paradigm_token');
    if (!token) return;
    try {
        const res = await fetch(apiBase + '/api/admin/integrations', {
            headers: { 'Authorization': 'Bearer ' + token }
        });
        const data = await res.json();
        if (data.integrations && data.integrations.length > 0) {
            const linked = data.integrations.map(i => i.platform).join(' & ');
            document.getElementById('integration-status').textContent = \`Linked: \${linked}\`;
        }
    } catch(e) { console.error(e); }
}

async function linkIntegration(platform) {
    const token = localStorage.getItem('paradigm_token');
    try {
        const res = await fetch(apiBase + '/api/admin/integrations/link', {
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json' },
            body: JSON.stringify({ platform })
        });
        if(res.ok) {
            alert(\`\${platform} Account Successfully Linked via OAuth Protocol.\`);
            checkIntegrations();
        }
    } catch(e) { console.error(e); }
}

async function runBooleanSearch() {
    const token = localStorage.getItem('paradigm_token');
    const query = document.getElementById('sourcing-query').value;
    const platform = document.getElementById('sourcing-platform').value;
    const container = document.getElementById('sourcing-results');
    
    if(!query) return alert('Enter a boolean prompt');
    
    container.innerHTML = '<div style="color:var(--text-secondary);">Executing Boolean Extraction on ' + platform + '...</div>';
    
    try {
        const res = await fetch(apiBase + '/api/admin/recruitment/sourcing/boolean-search', {
            method: 'POST',
            headers: { 'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json' },
            body: JSON.stringify({ query, platform })
        });
        
        const data = await res.json();
        if(!res.ok) {
            container.innerHTML = \`<div style="color:red;">\${data.error || 'Access Denied. Link Account first.'}</div>\`;
            return;
        }
        
        container.innerHTML = '';
        data.results.forEach(c => {
            const card = document.createElement('div');
            card.className = 'panel-card';
            card.style.padding = '1rem';
            card.innerHTML = \`
                <div style="font-weight:bold; font-size:1.1rem; color:var(--text-primary);">\${escapeHTML(c.candidate_name)} <span class="status-badge status-active" style="float:right;">\${escapeHTML(c.match_score)} Match</span></div>
                <div style="color:var(--text-secondary); margin-bottom:0.5rem; font-size:0.85rem;">\${escapeHTML(c.job_title)} @ \${escapeHTML(c.company)}</div>
                <div style="margin-bottom:0.5rem; font-size:0.8rem; font-family:monospace;">\${escapeHTML(c.candidate_email)}</div>
                <button class="btn-action" style="width:100%;" onclick="importToATS('\${escapeHTML(c.candidate_name)}', '\${escapeHTML(c.candidate_email)}', '\${escapeHTML(c.job_title)}', '\${escapeHTML(c.resume_url)}')">Import to ATS Pipeline</button>
            \`;
            container.appendChild(card);
        });
    } catch(e) { console.error(e); }
}

async function importToATS(name, email, title, resume) {
    const token = localStorage.getItem('paradigm_token');
    try {
        const res = await fetch(apiBase + '/api/admin/recruitment', {
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
            alert(\`Candidate \${name} imported successfully!\`);
            loadHRData(); // refresh table
        }
    } catch(e) { console.error(e); }
}
`;

if (!js.includes('runBooleanSearch')) {
    js = js.replace('async function loadHRData() {', 'async function loadHRData() {\\n    checkIntegrations();');
    js += '\\n' + sourcingJS;
    fs.writeFileSync('paradigm/js/admin.js', js);
    console.log('Sourcing JS injected into admin.js');
}
