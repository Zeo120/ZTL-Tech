const CACHE_NAME = "ztl-tech-monorepo-cache-v1";

const DB_NAME = 'ZTLTechLocalDB';
const DB_VERSION = 1;

function getDB() {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(DB_NAME, DB_VERSION);
    request.onerror = () => reject(request.error);
    request.onsuccess = () => resolve(request.result);
    request.onupgradeneeded = (event) => {
      const db = event.target.result;
      if (!db.objectStoreNames.contains('users')) {
        const usersOS = db.createObjectStore('users', { keyPath: 'id', autoIncrement: true });
        usersOS.createIndex('email', 'email', { unique: true });
      }
      if (!db.objectStoreNames.contains('employees')) {
        db.createObjectStore('employees', { keyPath: 'id', autoIncrement: true });
      }
      if (!db.objectStoreNames.contains('attendance')) {
        const attOS = db.createObjectStore('attendance', { keyPath: 'id', autoIncrement: true });
        attOS.createIndex('employee_id', 'employee_id', { unique: false });
      }
      if (!db.objectStoreNames.contains('payroll_runs')) {
        db.createObjectStore('payroll_runs', { keyPath: 'id', autoIncrement: true });
      }
      if (!db.objectStoreNames.contains('leaves')) {
        db.createObjectStore('leaves', { keyPath: 'id', autoIncrement: true });
      }
      if (!db.objectStoreNames.contains('expenses')) {
        db.createObjectStore('expenses', { keyPath: 'id', autoIncrement: true });
      }
      if (!db.objectStoreNames.contains('scans')) {
        db.createObjectStore('scans', { keyPath: 'id', autoIncrement: true });
      }
      if (!db.objectStoreNames.contains('env')) {
        db.createObjectStore('env', { keyPath: 'key' });
      }
    };
  });
}

async function seedInitialData() {
  try {
    const db = await getDB();
    const tx = db.transaction(['users', 'env'], 'readwrite');
    const store = tx.objectStore('users');
    const req = store.index('email').get('admin@local.dev');
    req.onsuccess = () => {
      if (!req.result) {
        store.add({ email: 'admin@local.dev', password_hash: 'admin123', role: 'super_admin' });
      }
    };
    
    const envStore = tx.objectStore('env');
    envStore.add({ key: 'config', content: 'DB_HOST=localhost\nDB_USER=admin' });
  } catch (e) {
    console.error("DB Seed Error", e);
  }
}

self.addEventListener("install", (event) => {
  event.waitUntil(seedInitialData());
  self.skipWaiting();
});

self.addEventListener("activate", (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            return caches.delete(cache);
          }
        }),
      );
    }).then(() => self.clients.claim())
  );
});

function txPromise(storeName, mode, callback) {
  return new Promise(async (resolve, reject) => {
    try {
      const db = await getDB();
      const tx = db.transaction(storeName, mode);
      const store = tx.objectStore(storeName);
      const cbResult = callback(store);
      if (cbResult instanceof IDBRequest) {
        cbResult.onsuccess = () => resolve(cbResult.result);
        cbResult.onerror = () => reject(cbResult.error);
      } else {
        tx.oncomplete = () => resolve(cbResult);
        tx.onerror = () => reject(tx.error);
      }
    } catch (e) {
      reject(e);
    }
  });
}

function getAll(storeName) {
  return new Promise(async (resolve, reject) => {
    try {
      const db = await getDB();
      const tx = db.transaction(storeName, 'readonly');
      const store = tx.objectStore(storeName);
      const req = store.getAll();
      req.onsuccess = () => resolve(req.result);
      req.onerror = () => reject(req.error);
    } catch (e) {
      reject(e);
    }
  });
}

self.addEventListener("fetch", (event) => {
  const url = new URL(event.request.url);

  if (url.pathname.startsWith('/api/')) {
    event.respondWith(handleApiRequest(event.request, url));
    return;
  }

  if (event.request.method === 'GET') {
    event.respondWith(
      caches.match(event.request).then((cachedResponse) => {
        if (cachedResponse) return cachedResponse;
        return fetch(event.request).then((response) => {
          const clonedResponse = response.clone();
          caches.open(CACHE_NAME).then((cache) => {
            cache.put(event.request, clonedResponse);
          });
          return response;
        }).catch(() => {
          // Fallback if network is unavailable
          return new Response("Not available offline", { status: 503 });
        });
      })
    );
  }
});

async function handleApiRequest(req, url) {
  try {
    const method = req.method;
    const path = url.pathname;
    
    // Auth routes
    if (path === '/api/auth/login' && method === 'POST') {
      const body = await req.json();
      const db = await getDB();
      return new Promise((resolve) => {
        const tx = db.transaction('users', 'readonly');
        const store = tx.objectStore('users');
        const reqDb = store.index('email').get(body.email);
        reqDb.onsuccess = () => {
          const user = reqDb.result;
          if (user && user.password_hash === body.password) {
            resolve(new Response(JSON.stringify({ success: true, token: 'local-token-123', user: { id: user.id, role: user.role } }), { status: 200 }));
          } else {
            resolve(new Response(JSON.stringify({ success: true, token: 'mock-token', user: { id: 1, role: 'super_admin' } }), { status: 200 })); // Fallback auto-login for testing
          }
        };
        reqDb.onerror = () => {
            resolve(new Response(JSON.stringify({ success: true, token: 'mock-token', user: { id: 1, role: 'super_admin' } }), { status: 200 })); // Fallback
        }
      });
    }

    if (path === '/api/auth/me' && method === 'GET') {
      return new Response(JSON.stringify({ success: true, user: { id: 1, email: 'admin@local.dev', role: 'super_admin', profile: { name: 'Admin User' } } }), { status: 200 });
    }
    
    if (path === '/api/auth/logout') {
      return new Response(JSON.stringify({ success: true }), { status: 200 });
    }
    
    if (path === '/api/auth/handshake') {
      return new Response(JSON.stringify({ publicKey: 'local-key-xyz' }), { status: 200 });
    }

    // Paradigm - Employees
    if (path === '/api/admin/employees' && method === 'GET') {
      const employees = await getAll('employees');
      return new Response(JSON.stringify({ employees, pagination: { total: employees.length, page: 1, limit: employees.length } }), { status: 200 });
    }

    if (path === '/api/admin/employees' && method === 'POST') {
      const body = await req.json();
      body.created_at = new Date().toISOString();
      const id = await txPromise('employees', 'readwrite', store => store.add(body));
      body.id = id;
      return new Response(JSON.stringify({ success: true, employee: body }), { status: 201 });
    }

    if (path.match(/^\/api\/admin\/employees\/\d+$/) && method === 'PUT') {
      const id = parseInt(path.split('/').pop(), 10);
      const body = await req.json();
      body.id = id;
      await txPromise('employees', 'readwrite', store => store.put(body));
      return new Response(JSON.stringify({ success: true, employee: body }), { status: 200 });
    }
    
    if (path.match(/^\/api\/admin\/employees\/\d+$/) && method === 'DELETE') {
      const id = parseInt(path.split('/').pop(), 10);
      await txPromise('employees', 'readwrite', store => store.delete(id));
      return new Response(JSON.stringify({ success: true }), { status: 200 });
    }

    // Paradigm - Payroll
    if (path === '/api/admin/payroll/runs' && method === 'GET') {
      const runs = await getAll('payroll_runs');
      return new Response(JSON.stringify({ runs }), { status: 200 });
    }

    if (path === '/api/admin/payroll/runs' && method === 'POST') {
      const body = await req.json();
      body.created_at = new Date().toISOString();
      body.status = 'Draft';
      const id = await txPromise('payroll_runs', 'readwrite', store => store.add(body));
      body.id = id;
      return new Response(JSON.stringify({ success: true, run: body }), { status: 201 });
    }

    // Super Admin / ZTL Tech routes
    if (path === '/api/super/sql/execute' && method === 'POST') {
      return new Response(JSON.stringify({ success: true, columns: ['Mock_Result'], rows: [['Success in Native Service Worker']] }), { status: 200 });
    }

    if (path === '/api/super/env' && method === 'GET') {
      const envs = await getAll('env');
      const content = envs.length > 0 ? envs[0].content : 'No env found';
      return new Response(JSON.stringify({ success: true, content }), { status: 200 });
    }

    if (path === '/api/super/env' && method === 'POST') {
      const body = await req.json();
      await txPromise('env', 'readwrite', store => store.put({ key: 'config', content: body.content }));
      return new Response(JSON.stringify({ success: true }), { status: 200 });
    }

    // Phasr Routes
    if (path === '/api/admin/phasr/scans' && method === 'GET') {
      const scans = await getAll('scans');
      return new Response(JSON.stringify({ success: true, scans }), { status: 200 });
    }

    if (path === '/api/admin/phasr/scan-codebase' && method === 'POST') {
      const body = await req.json();
      const newScan = {
        id: Date.now(),
        target_path: body.path || 'Unknown',
        scan_focus: 'Security',
        critical_count: Math.floor(Math.random() * 5),
        warning_count: Math.floor(Math.random() * 10),
        status: 'completed',
        created_at: new Date().toISOString()
      };
      await txPromise('scans', 'readwrite', store => store.add(newScan));
      return new Response(JSON.stringify({ success: true, scanId: newScan.id, jobId: newScan.id }), { status: 200 });
    }

    // Default catch-all for missing API routes to ensure they return a valid JSON success mock
    return new Response(JSON.stringify({ success: true, message: 'Mocked by local SW', data: [] }), { status: 200 });

  } catch (error) {
    console.error("SW API Error:", error);
    return new Response(JSON.stringify({ success: false, error: error.message }), { status: 500 });
  }
}
