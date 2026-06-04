const fs = require('fs');
let html = fs.readFileSync('paradigm/login.html', 'utf8');

const newStyle = `<style>
        .login-container { display: flex; justify-content: center; align-items: center; min-height: 85vh; padding: 2rem; position: relative; z-index: 2; }
        .login-card { background: var(--surface-bg); border: 1px solid var(--surface-border); border-radius: 24px; padding: 3.5rem 3rem; max-width: 480px; width: 100%; box-shadow: 0 25px 60px rgba(0, 0, 0, 0.4), 0 0 30px rgba(79, 70, 229, 0.15); backdrop-filter: blur(20px); -webkit-backdrop-filter: blur(20px); transition: var(--transition); position: relative; overflow: hidden; }
        .login-card::before { content: ''; position: absolute; top: 0; left: 0; right: 0; height: 1px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent); }
        .login-card:hover { border-color: rgba(255,255,255,0.2); box-shadow: 0 30px 60px rgba(0, 0, 0, 0.5), 0 0 40px rgba(236, 72, 153, 0.15); transform: translateY(-5px); }
        .back-link { display: inline-flex; align-items: center; gap: 0.5rem; color: var(--text-secondary); text-decoration: none; font-size: 0.9rem; font-weight: 500; transition: var(--transition); margin-bottom: 2rem; }
        .back-link:hover { color: var(--text-primary); transform: translateX(-3px); }
        .auth-header { text-align: center; margin-bottom: 2.5rem; }
        .auth-header h1 { font-family: var(--font-display); font-size: 2.2rem; font-weight: 700; margin-bottom: 0.5rem; color: var(--text-primary); }
        .auth-header p { color: var(--text-secondary); font-size: 0.95rem; }
        .auth-error { background: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.3); color: #f87171; padding: 1rem; border-radius: 12px; margin-bottom: 1.5rem; font-size: 0.9rem; font-weight: 500; display: none; text-align: center; animation: shake 0.5s ease; }
        @keyframes shake { 0%, 100% {transform: translateX(0);} 25% {transform: translateX(-5px);} 75% {transform: translateX(5px);} }
        .forgot-password { text-align: right; margin-top: 0.8rem; }
        .forgot-password a { color: var(--text-secondary); font-size: 0.85rem; text-decoration: none; transition: var(--transition); }
        .forgot-password a:hover { color: var(--accent-primary); }
        .success-overlay { position: absolute; inset: 0; background: rgba(11, 12, 16, 0.95); backdrop-filter: blur(10px); z-index: 10; display: flex; flex-direction: column; align-items: center; justify-content: center; opacity: 0; pointer-events: none; transition: var(--transition); }
        .success-overlay.active { opacity: 1; pointer-events: auto; }
        .success-overlay h2 { color: var(--text-primary); font-size: 1.5rem; margin-bottom: 0.5rem; font-family: var(--font-display); }
        .success-overlay p { color: var(--accent-tertiary); font-family: monospace; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 1px; }
        .spinner { width: 50px; height: 50px; border-radius: 50%; border: 3px solid rgba(79, 70, 229, 0.2); border-top-color: var(--accent-primary); animation: spin 1s infinite linear; box-shadow: 0 0 20px rgba(79, 70, 229, 0.4); margin-bottom: 1.5rem; }
        @keyframes spin { 100% { transform: rotate(360deg); } }
    </style>`;

html = html.replace(/<style>[\s\S]*?<\/style>/, newStyle);
fs.writeFileSync('paradigm/login.html', html);
console.log('login.html style updated');
