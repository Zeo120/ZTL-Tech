export function escapeHTML(str) {
  if (!str) return "";
  return String(str)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#039;");
}

const initialState = {
  currentView: "landing",
  currentPayrollTab: "employees",
  allEmployees: [],
  allEmployeesFull: [],
  dropdownCached: false,
  currentPage: 1,
  limitPerPage: 10,
  totalPages: 1,
  searchQuery: "",
  pfRateConfig: 12.0,
  tdsRateConfig: 15.0,
  mockCRMLeads: [
    { id: 1, name: "Solis Energy Partners", stage: "Active Proposal", value: 85000 },
    { id: 2, name: "Hexagon Global Systems", stage: "Closed-Won", value: 110000 },
    { id: 3, name: "Apex Medicom", stage: "Contract Negotiation", value: 45000 },
  ]
};

let state = { ...initialState };
const listeners = new Set();

export const store = {
  getState: () => state,
  dispatch: (action) => {
    state = rootReducer(state, action);
    listeners.forEach(listener => listener(state));
  },
  subscribe: (listener) => {
    listeners.add(listener);
    return () => listeners.delete(listener);
  }
};

function rootReducer(state, action) {
  switch (action.type) {
    case 'SET_VIEW':
      return { ...state, currentView: action.payload };
    case 'SET_PAYROLL_TAB':
      return { ...state, currentPayrollTab: action.payload };
    case 'SET_EMPLOYEES':
      return { ...state, allEmployees: action.payload };
    case 'SET_EMPLOYEES_FULL':
      return { ...state, allEmployeesFull: action.payload, dropdownCached: true };
    case 'SET_PAGE':
      return { ...state, currentPage: action.payload };
    case 'SET_TOTAL_PAGES':
      return { ...state, totalPages: action.payload };
    case 'SET_SEARCH_QUERY':
      return { ...state, searchQuery: action.payload, currentPage: 1 };
    case 'SET_RATES':
      return { ...state, pfRateConfig: action.payload.pf, tdsRateConfig: action.payload.tds };
    case 'UPDATE_LEAD':
      return {
        ...state,
        mockCRMLeads: state.mockCRMLeads.map(lead => 
          lead.id === action.payload.id ? { ...lead, ...action.payload } : lead
        )
      };
    default:
      return state;
  }
}

export const origin = window.location.origin;
export const apiBase =
  origin.startsWith("file:") || origin === "null" || !origin
    ? "http://localhost:3000"
    : "";
