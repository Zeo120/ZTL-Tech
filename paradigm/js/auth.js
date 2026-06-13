function getCookie(name) {
  const value = `; ${document.cookie}`;
  const parts = value.split(`; ${name}=`);
  if (parts.length === 2) return parts.pop().split(";").shift();
  return null;
}

function getCSRFToken() {
  const match = document.cookie.match(/(^|;)\s*ztl_csrf\s*=\s*([^;]+)/);
  return match ? match[2] : "";
}

async function handleLogout() {
  try {
    await fetch(`${apiBase}/api/auth/logout`, {
      method: "POST",
      credentials: "include",
      headers: { "x-csrf-token": getCSRFToken() },
    });
    window.location.href = "login.html";
  } catch (err) {
    window.location.href = "login.html";
  }
}

async function loadUserData() {
  try {
    const res = await fetch(`${apiBase}/api/admin/me`, {
      credentials: "include",
    });
    if (res.ok) {
      const payload = await res.json();
      if (payload.success && payload.data && payload.data.user) {
        const user = payload.data.user;

        const welcomeName = user.email
          ? user.email.split("@")[0].toUpperCase()
          : "ADMIN";

        const header = document.querySelector(".top-header");
        if (header) header.classList.add("visible");

        const logoText = document.getElementById("logo-text-val");
        if (logoText) {
          logoText.innerHTML = `<span class="logo-separator">|</span> ${welcomeName}`;
        }
      } else {
        window.location.href = "login.html";
      }
    } else {
      window.location.href = "login.html";
    }
  } catch (err) {
    window.location.href = "login.html";
  }
}
