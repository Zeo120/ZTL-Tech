const http = require('http');

function request(options, postData) {
    return new Promise((resolve, reject) => {
        const req = http.request(options, (res) => {
            let data = '';
            res.on('data', (chunk) => data += chunk);
            res.on('end', () => {
                try {
                    resolve({
                        status: res.statusCode,
                        headers: res.headers,
                        body: data ? JSON.parse(data) : null
                    });
                } catch (e) {
                    resolve({ status: res.statusCode, headers: res.headers, body: data });
                }
            });
        });
        req.on('error', reject);
        if (postData) {
            req.write(postData);
        }
        req.end();
    });
}

async function verify() {
    console.log('--- DB SEPARATION VERIFICATION ---\n');

    // 1. ZTL Tech Admin Login (Queries Users table in ZTLtech DB)
    console.log('1. Testing Core DB (ZTLtech) - Admin Login...');
    const adminLoginData = JSON.stringify({ email: 'admin@local.dev', password: 'admin123' });
    const adminRes = await request({
        hostname: 'localhost',
        port: 3000,
        path: '/api/auth/login',
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(adminLoginData) }
    }, adminLoginData);
    
    let adminCookie = '';
    if (adminRes.status === 200 && adminRes.body.success) {
        console.log('✅ Admin Login Successful! (ZTLtech Database Verified)');
        const cookies = adminRes.headers['set-cookie'];
        if (cookies) {
            adminCookie = cookies.map(c => c.split(';')[0]).join('; ');
        }
    } else {
        console.error('❌ Admin Login Failed:', adminRes.body);
        return;
    }

    // 2. Fetch Employees using Admin session (Queries Employees table in ParadigmSuite DB)
    console.log('\n2. Testing Suite DB (ParadigmSuite) - Fetching Employees...');
    const csrfMatch = adminCookie.match(/ztl_csrf=([^;]+)/);
    const csrfToken = csrfMatch ? csrfMatch[1] : '';

    const empRes = await request({
        hostname: 'localhost',
        port: 3000,
        path: '/api/admin/employees',
        method: 'GET',
        headers: { 
            'Cookie': adminCookie,
            'x-csrf-token': csrfToken
        }
    });

    let employeeEmail = null;
    let employeeId = null;

    if (empRes.status === 200 && empRes.body.success) {
        console.log(`✅ Employees Fetched Successfully! (ParadigmSuite Database Verified)`);
        console.log(`   Found ${empRes.body.employees ? empRes.body.employees.length : 'unknown'} employees in the system.`);
        if (empRes.body.employees && empRes.body.employees.length > 0) {
            employeeEmail = empRes.body.employees[0].email;
            employeeId = empRes.body.employees[0].id;
            console.log(`   Sample Employee: ${employeeEmail}`);
        }
    } else {
        console.error('❌ Fetching Employees Failed:', empRes.status, empRes.body);
    }

    // 3. Employee Login (Queries BOTH Databases via Dual Pool architecture)
    if (employeeEmail) {
        console.log(`\n3. Testing Dual-Pool Architecture - Employee Login (${employeeEmail})...`);
        const empLoginData = JSON.stringify({ email: employeeEmail, empId: `ZTL-${employeeId}` });
        const empLoginRes = await request({
            hostname: 'localhost',
            port: 3000,
            path: '/api/auth/employee-login',
            method: 'POST',
            headers: { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(empLoginData) }
        }, empLoginData);

        if (empLoginRes.status === 200 && empLoginRes.body.success) {
            console.log('✅ Employee Login Successful! (Cross-Database Authentication Verified)');
        } else {
            console.error('❌ Employee Login Failed:', empLoginRes.body);
        }
    }

    console.log('\n--- VERIFICATION COMPLETE ---');
}

verify();
