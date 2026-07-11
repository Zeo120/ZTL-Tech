(* 
  Division of Purpose: State Space Mapping (Phase)
  Language: OCaml (Heavy Business Logic)

  The StateMapper reads the fractured chunks and mathematically maps every 
  possible state transition (e.g., button clicks, API routes, DOM events).
  It generates a chronological state-transition graph (Acheron's Gate) and 
  outputs a deterministic Mock-Architecture Diagram.
*)

type trigger = 
  | UI_Click of string 
  | API_Route of string 
  | Lifecycle_Event of string 
  | Shadow_Trigger of string

type state_node = {
  id: string;
  chunk_reference: string;
  trigger: trigger;
  mutates_to: string list;
}

type architecture_graph = state_node list

(* 
  Mock heuristic function to parse a raw chunk buffer and extract state transitions.
  In a production DEMV, this relies on a formal Abstract Syntax Tree parser.
*)
let parse_state_transitions (chunk_data : string) (chunk_ref : string) : state_node list =
  (* Pattern matching for deterministic evaluation of state triggers *)
  let extract_trigger line =
    if String.contains line "addEventListener(\"click\"" || String.contains line "onClick" then
      Some (UI_Click line)
    else if String.contains line "app.post(" || String.contains line "app.get(" then
      Some (API_Route line)
    else
      None
  in
  
  (* Pure functional fold over lines of the chunk *)
  let lines = String.split_on_char '\n' chunk_data in
  List.filter_map (fun line ->
    match extract_trigger line with
    | Some t -> Some { id = string_of_int (Hashtbl.hash line); chunk_reference = chunk_ref; trigger = t; mutates_to = [] }
    | None -> None
  ) lines

(* 
  Generates a Mock-Architecture Diagram (Mermaid Format) from the state graph.
  This allows visual attestation of the chronological execution paths.
*)
let generate_architecture_diagram (graph : architecture_graph) : string =
  let header = "graph TD\n" in
  let edges = List.map (fun node -> 
    let trigger_label = match node.trigger with
      | UI_Click s -> "UI Click: " ^ String.trim (String.sub s 0 (min (String.length s) 30))
      | API_Route s -> "API Request: " ^ String.trim (String.sub s 0 (min (String.length s) 30))
      | Lifecycle_Event s -> "Lifecycle: " ^ String.trim s
      | Shadow_Trigger s -> "Unknown Trigger: " ^ String.trim s
    in
    Printf.sprintf "  %s[%s] --> |Mutates State| %s_Next" node.id trigger_label node.id
  ) graph in
  header ^ String.concat "\n" edges

(* 
  Entry point for OCaml binary 
  Reads from stdin, outputs diagram to stdout
*)
let () =
  let rec read_input acc =
    try
      let line = input_line stdin in
      read_input (line :: acc)
    with End_of_file -> 
      String.concat "\n" (List.rev acc)
  in
  let raw_chunk = read_input [] in
  let graph = parse_state_transitions raw_chunk "chunk_0" in
  let diagram = generate_architecture_diagram graph in
  print_endline diagram
