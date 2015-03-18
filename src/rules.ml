open Core.Std
open Token

(* TODO clean this up *)
let check_for_token_win win_states token =
    List.map win_states (fun row_state ->
      match row_state with
      | [] -> false
      | hd::tl when hd = token -> 
        let filtered = 
          List.filter row_state (fun ele -> ele = token) in
        filtered = row_state;
      | _::_ -> false
      )

let is_token_winner win_states token =
  let checked_rows =
    check_for_token_win win_states token in
  let winning_rows = List.filter checked_rows (fun row -> row = true) in
  match winning_rows with
  | [] -> false
  | hd -> true
