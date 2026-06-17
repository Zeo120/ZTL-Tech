export function escapeHTML(str) {
  if (!str) return "";
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

export let currentView = "landing";
export let currentPayrollTab = "employees";
export let allEmployees = [];
export let allEmployeesFull = [];
export let dropdownCached = false;
export let currentPage = 1;
export const limitPerPage = 10;
export let totalPages = 1;
export let searchQuery = "";

// Settings rates store
export let pfRateConfig = 12.0;
export let tdsRateConfig = 15.0;

export let mockCRMLeads = [
  {
    id: 1,
    name: "Solis Energy Partners",
    stage: "Active Proposal",
    value: 85000,
  },
  { id: 2, name: "Hexagon Global Systems", stage: "Closed-Won", value: 110000 },
  { id: 3, name: "Apex Medicom", stage: "Contract Negotiation", value: 45000 },
];

// Backend connectivity base URL config
export const origin = window.location.origin;
export const apiBase =
  origin.startsWith("file:") || origin === "null" || !origin
    ? "http://localhost:3000"
    : "";


