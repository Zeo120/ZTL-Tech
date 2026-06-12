const fs = require('fs');
let routesContent = fs.readFileSync('backend/src/routes/admin.routes.js', 'utf8');

const sourcingRoutes = `
// ============================================================================
// EXTERNAL SOURCING & INTEGRATIONS (LinkedIn, Indeed)
// ============================================================================

// GET /api/admin/integrations
adminRoutes.get('/integrations', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .query('SELECT platform, status, created_at FROM dbo.OAuthIntegrations WHERE user_id = @userId');
  ok(res, { integrations: result.recordset });
}));

// POST /api/admin/integrations/link
adminRoutes.post('/integrations/link', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { platform } = req.body;
  if (!platform || !['LinkedIn', 'Indeed'].includes(platform)) return fail(res, 400, 'Invalid platform');
  
  const corePool = await getDbPool();
  
  // Upsert integration
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('platform', sql.NVarChar(50), platform)
    .input('token', sql.NVarChar(sql.MAX), 'mock_oauth_token_' + Date.now())
    .query(\`
      IF EXISTS (SELECT 1 FROM dbo.OAuthIntegrations WHERE user_id = @userId AND platform = @platform)
        UPDATE dbo.OAuthIntegrations SET status = 'Linked', auth_token = @token, updated_at = SYSUTCDATETIME() 
        WHERE user_id = @userId AND platform = @platform;
      ELSE
        INSERT INTO dbo.OAuthIntegrations (user_id, platform, auth_token, status)
        VALUES (@userId, @platform, @token, 'Linked');
    \`);
    
  ok(res, { success: true, platform });
}));

// POST /api/admin/recruitment/sourcing/boolean-search
adminRoutes.post('/recruitment/sourcing/boolean-search', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { query, platform } = req.body;
  
  // Verify integration exists
  const corePool = await getDbPool();
  const check = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('platform', sql.NVarChar(50), platform || 'LinkedIn')
    .query("SELECT 1 FROM dbo.OAuthIntegrations WHERE user_id = @userId AND platform = @platform AND status = 'Linked'");
    
  if (check.recordset.length === 0) {
    return fail(res, 403, \`\${platform || 'LinkedIn'} Account Not Linked. Please authenticate first.\`);
  }
  
  // Simulate Boolean Search Parsing & Scraping Pipeline
  // E.g. "Software Engineer" AND "React" NOT "Intern"
  const tokens = query.match(/"([^"]+)"|\\b(AND|OR|NOT)\\b/g) || [];
  
  // Mock Results Generator based on boolean query
  const titles = ['Senior Full Stack Engineer', 'Lead Developer', 'Backend Architect', 'Frontend Specialist'];
  const companies = ['TechCorp', 'Innovatech', 'DataSync', 'CloudNine', 'NeuralNet'];
  const names = ['Alex Mercer', 'Sarah Connor', 'John Wick', 'Elena Fisher', 'Marcus Fenix'];
  
  const candidates = [];
  const count = Math.floor(Math.random() * 5) + 2; // 2 to 6 candidates
  
  for (let i = 0; i < count; i++) {
      candidates.push({
          candidate_name: names[Math.floor(Math.random() * names.length)] + ' ' + Math.floor(Math.random() * 1000),
          job_title: titles[Math.floor(Math.random() * titles.length)],
          company: companies[Math.floor(Math.random() * companies.length)],
          candidate_email: \`candidate_\${Date.now()}_\${i}@\${platform.toLowerCase()}.mock\`,
          resume_url: \`https://\${platform.toLowerCase()}.com/in/mock-profile-\${Date.now()}\`,
          match_score: Math.floor(Math.random() * 20) + 80 + '%' // 80-99%
      });
  }
  
  // Simulate scraping delay
  await new Promise(r => setTimeout(r, 1500));
  
  ok(res, { results: candidates, boolean_tokens_parsed: tokens });
}));

`;

if (!routesContent.includes('/recruitment/sourcing/boolean-search')) {
    routesContent = routesContent.replace(/module\.exports\s*=\s*adminRoutes;/, sourcingRoutes + '\\nmodule.exports = adminRoutes;');
    fs.writeFileSync('backend/src/routes/admin.routes.js', routesContent);
    console.log('Sourcing Routes injected successfully');
} else {
    console.log('Sourcing Routes already present');
}
