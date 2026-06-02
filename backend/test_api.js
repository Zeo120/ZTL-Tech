const jwt = require('jsonwebtoken');

const token = jwt.sign(
    { userId: 1, email: 'admin@ztl-tech.com', role: 'admin', auth_type: 'tenant' },
    'd207d896660ef7df1915bfaea2fa3b375d78ffd6c2114f9449dab2bc521dda4ad4a28fe5c0d68da0454d9d8fdbacdaeb0e7de2964f65c3a79a1d9b8c87210888',
    { issuer: 'ztl-tech', audience: 'ztl-admin' }
);

async function testPost() {
    try {
        const res = await fetch('http://localhost:3000/api/admin/employees', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Cookie': 'ztl_session=' + token
            },
            body: JSON.stringify({
                name: "Test User",
                age: 25,
                gender: "Male",
                date_of_birth: "1995-01-01",
                marital_status: "Unmarried",
                pan: "ABCDE1234F",
                aadhar: "123456789012",
                status: "Active",
                date_of_joining: "2020-01-01",
                pf_status: "Not Applicable"
            })
        });
        const data = await res.json();
        console.log(data);
    } catch (e) {
        console.error(e);
    }
}
testPost();
