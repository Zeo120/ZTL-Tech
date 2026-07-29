(* 
 * Division of Purpose: Economical Translation & Business Logic 
 * Tech Stack: OCaml (Strict, Immutable Heavy Logic)
 * 
 * Module 4: Economical Analysis 
 * This module translates the physical outputs of M1, M2, and M3 into 
 * absolute business metrics. Security is an economic equation. 
 * If the physical mass of the codebase is too high, or the attack surface 
 * is too wide, the Total Economic Cost of Maintenance (TEC/M) increases.
 * 
 * This module calculates the cost of keeping the codebase secure, allowing
 * the business to make a deterministic choice based on the physics.
 *)

type module_metrics = {
  official_endpoints_count : int;
  shadow_endpoints_count : int;
  total_physical_bytes : int;
  max_ast_depth : int;
  anomalies_detected : bool;
}

type economic_cost = {
  base_maintenance_cost : float;
  attack_surface_penalty : float;
  shadow_risk_liability : float;
  total_economic_cost : float;
  deploy_status : string;
}

(* Mathematical constants for cost translation (USD) *)
let cost_per_kilobyte = 0.05
let cost_per_official_endpoint = 50.0
let penalty_per_shadow_endpoint = 25000.0 (* Massive liability for undocumented routes *)
let anomaly_liability = 5000000.0 (* Absolute halt condition *)

let calculate_economics metrics =
  (* Base physical cost *)
  let kb = float_of_int metrics.total_physical_bytes /. 1024.0 in
  let base_cost = kb *. cost_per_kilobyte in

  (* Attack surface maintenance cost *)
  let surface_cost = float_of_int metrics.official_endpoints_count *. cost_per_official_endpoint in

  (* Liability cost for bad architecture / shadows *)
  let shadow_liability = float_of_int metrics.shadow_endpoints_count *. penalty_per_shadow_endpoint in
  
  (* Complexity penalty (AST depth > 15 increases audit time exponentially) *)
  let complexity_multiplier = 
    if metrics.max_ast_depth > 15 then 1.5 else 1.0 
  in

  (* Absolute failure condition *)
  let malware_liability = if metrics.anomalies_detected then anomaly_liability else 0.0 in

  let total_cost = 
    ((base_cost +. surface_cost) *. complexity_multiplier) +. shadow_liability +. malware_liability 
  in

  let status = 
    if metrics.anomalies_detected then "HALT: MALWARE LIABILITY EXCEEDS THRESHOLD"
    else if metrics.shadow_endpoints_count > 0 then "HALT: SHADOW INFRASTRUCTURE DETECTED"
    else if total_cost > 100000.0 then "REVIEW: TEC/M TOO HIGH"
    else "APPROVED: DEPLOYMENT VIABLE"
  in

  {
    base_maintenance_cost = base_cost;
    attack_surface_penalty = surface_cost;
    shadow_risk_liability = shadow_liability;
    total_economic_cost = total_cost;
    deploy_status = status;
  }

let print_report cost =
  Printf.printf "\n===========================================================\n";
  Printf.printf "PHASR (DEVM) - MODULE 4: TOTAL ECONOMIC COST (TEC/M)\n";
  Printf.printf "===========================================================\n";
  Printf.printf "Base Physical Maintenance:  $%.2f\n" cost.base_maintenance_cost;
  Printf.printf "Attack Surface Maintenance: $%.2f\n" cost.attack_surface_penalty;
  Printf.printf "Shadow Risk Liability:      $%.2f\n" cost.shadow_risk_liability;
  Printf.printf "-----------------------------------------------------------\n";
  Printf.printf "TOTAL ECONOMIC COST:        $%.2f\n" cost.total_economic_cost;
  Printf.printf "DEPLOYMENT STATUS:          %s\n" cost.deploy_status;
  Printf.printf "===========================================================\n"

let () =
  (* Mocking the ingestion of data from Modules 1, 2, and 3 *)
  let current_metrics = {
    official_endpoints_count = 24;
    shadow_endpoints_count = 0; (* Change to 1 to see the economic wave collapse *)
    total_physical_bytes = 1500000;
    max_ast_depth = 8;
    anomalies_detected = false;
  } in

  let final_cost = calculate_economics current_metrics in
  print_report final_cost
