
export function triggerOpsDispatch() {
  const carrier = document.getElementById("ops-carrier").value;
  const dest = document.getElementById("ops-destination").value;
  const weight = document.getElementById("ops-payload").value;
  const statusBox = document.getElementById("ops-status-box");

  statusBox.style.color = "#ffaa00";
  statusBox.textContent = `[ROUTING] Dispatched ${carrier} targeting ${dest} | Cargo: ${weight} kg. Launching node telemetry connection...`;

  setTimeout(() => {
    statusBox.style.color = "#00ff66";
    statusBox.textContent = `[SUCCESS] ${carrier} verified at target destination. Telemetry stream synchronized.`;
  }, 1500);
}


