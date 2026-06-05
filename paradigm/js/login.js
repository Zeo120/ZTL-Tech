let currentMode = "admin";

// Password Show/Hide Toggle Logic

// Active mode toggle switcher (Visible but Hidden context)

function showError(message) {
  let errDiv = document.getElementById("login-error");
  if (!errDiv) {
    errDiv = document.createElement("div");
    errDiv.id = "login-error";
    errDiv.style.background = "rgba(255, 0, 60, 0.1)";
    errDiv.style.border = "1px solid rgba(255, 0, 60, 0.3)";
    errDiv.style.color = "#ff5376";
    errDiv.style.padding = "0.8rem 1rem";
    errDiv.style.borderRadius = "8px";
    errDiv.style.fontSize = "0.85rem";
    errDiv.style.marginBottom = "1.5rem";
    errDiv.style.textAlign = "left";
    const form = document.getElementById("login-form");
    form.parentNode.insertBefore(errDiv, form);
  }
  errDiv.textContent = message;
  errDiv.style.display = "block";
}

function clearError() {
  const errDiv = document.getElementById("login-error");
  if (errDiv) {
    errDiv.style.display = "none";
  }
}

async function handleAuth() {
  const email = document.getElementById("access-id").value.trim();
  const password = document.getElementById("password").value;

  if (!email || !password) {
    showError("Access ID (Email) and password are required.");
    return;
  }

  clearError();

  try {
    const origin = window.location.origin;
    const apiBase =
      origin.startsWith("file:") || origin === "null" || !origin
        ? "http://localhost:3000"
        : "";
    const endpoint =
      currentMode === "employee" ? "/api/employee/login" : "/api/auth/login";
    const response = await fetch(`${apiBase}${endpoint}`, {
      method: "POST",
      credentials: "include",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({ email, password }),
    });

    let payload = null;
    try {
      payload = await response.json();
    } catch (parseErr) {
      payload = null;
    }

    if (!response.ok || !payload || payload.success !== true) {
      const errMsg =
        (payload && (payload.message || payload.error)) ||
        "Authentication failed. Please check your credentials.";
      showError(errMsg);
      return;
    }

    // Show epic scanner verification overlay
    const overlay = document.getElementById("auth-success-overlay");
    const statusText = document.getElementById("auth-status-text");
    overlay.classList.add("active");

    // Step-by-step simulated telemetry
    const steps = [
      { delay: 300, msg: "SECURITY CHECK CLEAR..." },
      { delay: 700, msg: "SESSION HANDSHAKE INITIATED..." },
      { delay: 1100, msg: "VERIFYING CRYPTO TOKEN..." },
      { delay: 1500, msg: "LOADING SECURE WORKSPACE..." },
    ];

    steps.forEach((step) => {
      setTimeout(() => {
        statusText.textContent = step.msg;
      }, step.delay);
    });

    setTimeout(() => {
      const userRole =
        payload.data && payload.data.user && payload.data.user.role;
      if (currentMode === "employee") {
        window.location.href = "./employee_portal.html";
      } else if (
        (userRole === "super_admin" || userRole === "super-admin") &&
        currentMode === "super"
      ) {
        window.location.href = "../ztl_tech/super_admin.html";
      } else {
        window.location.href = "./admin.html";
      }
    }, 1900);
  } catch (error) {
    if (window.location.protocol === "file:") {
      showError(
        "Unable to connect to the authentication server. Since this page was loaded directly from the file system (file://), your browser blocks cookie authentication due to CORS security. Please access the application via http://localhost:3000/paradigm/login.html instead.",
      );
    } else {
      showError(
        "Unable to connect to the authentication server. Confirm the backend is running.",
      );
    }
  }
}
