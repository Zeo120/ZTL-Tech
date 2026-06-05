// Helper to get CSRF Token
function getCsrfToken() {
  const name = "ztl_csrf=";
  const decodedCookie = decodeURIComponent(document.cookie);
  const ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// Helper to make authenticated requests
async function apiRequest(url, options = {}) {
  const token = getCsrfToken();
  const headers = {
    "Content-Type": "application/json",
    ...options.headers,
  };

  if (token) {
    headers["x-csrf-token"] = token;
  }

  const config = {
    ...options,
    headers,
  };

  const response = await fetch(url, config);

  // Handle unauthorized
  if (response.status === 401 || response.status === 403) {
    window.location.href = "/paradigm/login.html";
    throw new Error("Unauthorized");
  }

  return response;
}

// Load Employee Details
async function loadEmployeeProfile() {
  try {
    const res = await apiRequest("/api/employee/me");
    if (res.ok) {
      const data = await res.json();
      document.getElementById("displayUsername").textContent =
        data.name || data.email || "Employee";

      let detailsHtml = "";
      if (data.email) detailsHtml += `<p>Email: <span>${data.email}</span></p>`;
      if (data.department)
        detailsHtml += `<p>Department: <span>${data.department}</span></p>`;
      if (data.role) detailsHtml += `<p>Role: <span>${data.role}</span></p>`;
      if (data.employee_id)
        detailsHtml += `<p>Employee ID: <span>${data.employee_id}</span></p>`;

      document.getElementById("profileDetails").innerHTML =
        detailsHtml || "<p>Profile data loaded successfully.</p>";
    } else {
      document.getElementById("profileDetails").innerHTML =
        '<p class="error">Failed to load profile data.</p>';
    }
  } catch (error) {
    console.error("Profile fetch error:", error);
  }
}

// Live Clock
function updateClock() {
  const now = new Date();
  document.getElementById("liveClock").textContent = now.toLocaleTimeString();
  document.getElementById("liveDate").textContent = now.toLocaleDateString(
    undefined,
    { weekday: "long", year: "numeric", month: "long", day: "numeric" },
  );
}
setInterval(updateClock, 1000);
updateClock();

// Set today's date as default for date inputs
const today = new Date().toISOString().split("T")[0];
document.getElementById("leaveStart").value = today;
document.getElementById("leaveEnd").value = today;

// Handle Attendance Form
document
  .getElementById("attendanceForm")
  .addEventListener("submit", async (e) => {
    e.preventDefault();
    const msg = document.getElementById("attMessage");
    msg.textContent = "Submitting...";
    msg.className = "message";

    if (!navigator.geolocation) {
      msg.textContent = "Geolocation is not supported by your browser.";
      msg.className = "message error";
      return;
    }

    navigator.geolocation.getCurrentPosition(
      async (position) => {
        const latitude = position.coords.latitude;
        const longitude = position.coords.longitude;

        const now = new Date();
        const offset = now.getTimezoneOffset() * 60000;
        const localISOTime = new Date(now - offset).toISOString().slice(0, -1);
        const date = localISOTime.split("T")[0];
        const status = "Present";
        const deviceTime = now.toString();

        try {
          const res = await apiRequest("/api/employee/attendance", {
            method: "POST",
            body: JSON.stringify({
              date,
              status,
              device_time: deviceTime,
              latitude,
              longitude,
            }),
          });

          if (res.ok) {
            msg.textContent = "Attendance submitted successfully!";
            msg.className = "message success";
            setTimeout(() => (msg.textContent = ""), 3000);
          } else {
            const err = await res.json().catch(() => ({}));
            msg.textContent = err.error || "Failed to submit attendance.";
            msg.className = "message error";
          }
        } catch (error) {
          if (error.message !== "Unauthorized") {
            msg.textContent = "Network error occurred.";
            msg.className = "message error";
          }
        }
      },
      (error) => {
        msg.textContent = "Location access is required to punch in.";
        msg.className = "message error";
      },
    );
  });

// Handle Leave Form
document.getElementById("leaveForm").addEventListener("submit", async (e) => {
  e.preventDefault();
  const type = document.getElementById("leaveType").value;
  const start_date = document.getElementById("leaveStart").value;
  const end_date = document.getElementById("leaveEnd").value;
  const reason = document.getElementById("leaveReason").value;
  const msg = document.getElementById("leaveMessage");

  msg.textContent = "Submitting...";
  msg.className = "message";

  try {
    const res = await apiRequest("/api/employee/leaves", {
      method: "POST",
      body: JSON.stringify({ type, start_date, end_date, reason }),
    });

    if (res.ok) {
      msg.textContent = "Leave request submitted successfully!";
      msg.className = "message success";
      document.getElementById("leaveForm").reset();
      document.getElementById("leaveStart").value = today;
      document.getElementById("leaveEnd").value = today;
      setTimeout(() => (msg.textContent = ""), 3000);
    } else {
      const err = await res.json().catch(() => ({}));
      msg.textContent = err.error || "Failed to submit leave request.";
      msg.className = "message error";
    }
  } catch (error) {
    if (error.message !== "Unauthorized") {
      msg.textContent = "Network error occurred.";
      msg.className = "message error";
    }
  }
});

// Logout
function logout() {
  document.cookie =
    "ztl_session=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;";
  window.location.href = "/paradigm/login.html";
}

// Load Payslips
let currentEmployeeData = null; // Store for payslip generation
const monthNames = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

async function loadPayslips(empData) {
  currentEmployeeData = empData;
  const container = document.getElementById("payslipsContainer");
  try {
    const res = await apiRequest("/api/employee/payslips");
    if (res.ok) {
      const data = await res.json();
      if (data.payslips && data.payslips.length > 0) {
        let html =
          '<table style="width: 100%; border-collapse: collapse; font-size: 14px;">';
        html +=
          '<tr style="border-bottom: 1px solid var(--glass-border); text-align: left;">';
        html +=
          '<th style="padding: 10px;">Month</th><th style="padding: 10px;">Net Pay</th><th style="padding: 10px; text-align: right;">Action</th></tr>';

        data.payslips.forEach((tx) => {
          const month = monthNames[tx.month - 1] + " " + tx.year;
          const net =
            "₹" +
            Number(tx.net_salary).toLocaleString("en-IN", {
              minimumFractionDigits: 2,
            });
          html +=
            '<tr style="border-bottom: 1px solid rgba(255,255,255,0.05);">';
          html +=
            '<td style="padding: 12px 10px; font-weight: 500;">' +
            month +
            "</td>";
          html +=
            '<td style="padding: 12px 10px; font-family: monospace; color: var(--accent);">' +
            net +
            "</td>";
          html +=
            '<td style="padding: 12px 10px; text-align: right;"><button class="logout-btn" onclick="openPayslip(' +
            tx.id +
            ')" style="padding: 4px 10px; font-size: 12px;">View PDF</button></td>';
          html += "</tr>";
        });
        html += "</table>";
        container.innerHTML = html;

        // Store payslips in a global map
        window.payslipsData = data.payslips.reduce((acc, tx) => {
          acc[tx.id] = tx;
          return acc;
        }, {});
      } else {
        container.innerHTML =
          '<p style="color: var(--text-secondary); font-size: 14px;">No payslips available yet.</p>';
      }
    } else {
      container.innerHTML =
        '<p style="color: #ef4444; font-size: 14px;">Failed to load payslips.</p>';
    }
  } catch (e) {
    container.innerHTML =
      '<p style="color: #ef4444; font-size: 14px;">Network error.</p>';
  }
}

window.openPayslip = function (txId) {
  if (!currentEmployeeData || !window.payslipsData[txId]) return;
  const tx = window.payslipsData[txId];
  const payload = {
    employee: currentEmployeeData,
    transaction: tx,
    run: { month: tx.month, year: tx.year },
  };
  sessionStorage.setItem("payslip_payload", JSON.stringify(payload));
  window.open("payslip.html", "_blank");
};

// Initialize
window.addEventListener("DOMContentLoaded", loadEmployeeProfile);
