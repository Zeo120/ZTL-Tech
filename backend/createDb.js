const sql = require('mssql');
require('dotenv').config();

const config = {
    server: process.env.SQL_SERVER || 'localhost',
    user: process.env.SQL_USER || 'xt_admin',
    password: process.env.SQL_PASSWORD || '123456',
    port: parseInt(process.env.SQL_PORT || '1433'),
    options: {
        encrypt: true,
        trustServerCertificate: true
    }
};

async function createParadigmDB() {
    try {
        console.log('Connecting to MS SQL Server...');
        // We connect WITHOUT specifying a database, so we default to master
        const pool = await sql.connect(config);
        
        console.log('Checking if ParadigmSuite exists...');
        const checkResult = await pool.request().query(`
            SELECT database_id 
            FROM sys.databases 
            WHERE name = 'ParadigmSuite'
        `);

        if (checkResult.recordset.length > 0) {
            console.log('Database [ParadigmSuite] already exists.');
        } else {
            console.log('Creating database [ParadigmSuite]...');
            await pool.request().query('CREATE DATABASE ParadigmSuite;');
            console.log('Successfully created database [ParadigmSuite]!');
        }
        
        await pool.close();
    } catch (err) {
        console.error('Failed to create database:', err.message);
    }
}

createParadigmDB();
