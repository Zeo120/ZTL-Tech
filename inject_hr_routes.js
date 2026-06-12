const fs = require('fs');
let routesContent = fs.readFileSync('backend/src/routes/admin.routes.js', 'utf8');

const hrRoutes = `
// ============================================================================
// DEEP HUMAN RESOURCES MODULES (Recruitment, Onboarding, Performance, Documents)
// ============================================================================

// GET /api/admin/recruitment
adminRoutes.get('/recruitment', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .query('SELECT * FROM dbo.Recruitment WHERE user_id = @userId ORDER BY created_at DESC');
  ok(res, { candidates: result.recordset });
}));

// POST /api/admin/recruitment
adminRoutes.post('/recruitment', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { job_title, candidate_name, candidate_email, resume_url } = req.body;
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('jobTitle', sql.NVarChar(255), job_title)
    .input('name', sql.NVarChar(255), candidate_name)
    .input('email', sql.NVarChar(255), candidate_email)
    .input('resume', sql.NVarChar(sql.MAX), resume_url || null)
    .query(\`
      INSERT INTO dbo.Recruitment (user_id, job_title, candidate_name, candidate_email, resume_url)
      OUTPUT INSERTED.*
      VALUES (@userId, @jobTitle, @name, @email, @resume)
    \`);
  ok(res, { candidate: result.recordset[0] }, 201);
}));

// GET /api/admin/onboarding
adminRoutes.get('/onboarding', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .query(\`
      SELECT o.*, e.name as employee_name
      FROM dbo.Onboarding o
      JOIN dbo.Employees e ON o.employee_id = e.id
      WHERE o.user_id = @userId ORDER BY o.created_at DESC
    \`);
  ok(res, { onboarding_pipelines: result.recordset });
}));

// POST /api/admin/onboarding
adminRoutes.post('/onboarding', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { employee_id, start_date, checklist_json } = req.body;
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('empId', sql.Int, employee_id)
    .input('startDate', sql.Date, start_date)
    .input('checklist', sql.NVarChar(sql.MAX), checklist_json || '[]')
    .query(\`
      INSERT INTO dbo.Onboarding (user_id, employee_id, start_date, checklist_json)
      OUTPUT INSERTED.*
      VALUES (@userId, @empId, @startDate, @checklist)
    \`);
  ok(res, { onboarding: result.recordset[0] }, 201);
}));

// GET /api/admin/performance-reviews
adminRoutes.get('/performance-reviews', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .query(\`
      SELECT p.*, e.name as employee_name
      FROM dbo.PerformanceReviews p
      JOIN dbo.Employees e ON p.employee_id = e.id
      WHERE p.user_id = @userId ORDER BY p.created_at DESC
    \`);
  ok(res, { reviews: result.recordset });
}));

// POST /api/admin/performance-reviews
adminRoutes.post('/performance-reviews', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { employee_id, review_period, rating, comments, goals_json } = req.body;
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('empId', sql.Int, employee_id)
    .input('period', sql.NVarChar(100), review_period)
    .input('rating', sql.Decimal(3,1), rating)
    .input('comments', sql.NVarChar(sql.MAX), comments)
    .input('goals', sql.NVarChar(sql.MAX), goals_json || '[]')
    .query(\`
      INSERT INTO dbo.PerformanceReviews (user_id, employee_id, review_period, rating, comments, goals_json)
      OUTPUT INSERTED.*
      VALUES (@userId, @empId, @period, @rating, @comments, @goals)
    \`);
  ok(res, { review: result.recordset[0] }, 201);
}));

// GET /api/admin/documents
adminRoutes.get('/documents', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .query('SELECT * FROM dbo.Documents WHERE user_id = @userId ORDER BY created_at DESC');
  ok(res, { documents: result.recordset });
}));

// POST /api/admin/documents
adminRoutes.post('/documents', adminLimiter, asyncHandler(async (req, res) => {
  const userId = Number(req.auth.userId);
  const { employee_id, document_type, filename, s3_url } = req.body;
  const corePool = await getDbPool();
  const result = await corePool.request()
    .input('userId', sql.Int, userId)
    .input('empId', sql.Int, employee_id || null)
    .input('type', sql.NVarChar(100), document_type)
    .input('filename', sql.NVarChar(255), filename)
    .input('s3', sql.NVarChar(sql.MAX), s3_url)
    .query(\`
      INSERT INTO dbo.Documents (user_id, employee_id, document_type, filename, s3_url)
      OUTPUT INSERTED.*
      VALUES (@userId, @empId, @type, @filename, @s3)
    \`);
  ok(res, { document: result.recordset[0] }, 201);
}));

`;

if (!routesContent.includes('/recruitment')) {
    routesContent = routesContent.replace(/module\.exports\s*=\s*adminRoutes;/, hrRoutes + '\\nmodule.exports = adminRoutes;');
    fs.writeFileSync('backend/src/routes/admin.routes.js', routesContent);
    console.log('HR Routes injected successfully');
} else {
    console.log('HR Routes already present');
}
