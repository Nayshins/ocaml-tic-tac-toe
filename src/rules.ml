open Core.Std
open Token

let match_row hd tl =
  let filtered =
    List.filter tl ~f:(fun token -> token = hd) in
  filtered = tl

let check_for_token_win win_states token =
    List.map win_states ~f:(fun row_state ->
      match row_state with
      | [] -> false
      | hd::tl when hd = token -> match_row hd tl
      | _ -> false
      )

let check_for_winner win_states =
    List.map win_states ~f:(fun row_state ->
      match row_state with
      | [] -> false
      | hd::tl when hd = X || hd = O -> match_row hd tl
      | _ -> false
      )

let is_token_winner board token =
  let win_states = (Grid.win_state_matrix board) in
  let checked_rows =
    check_for_token_win win_states token in
  let winning_rows = List.filter checked_rows ~f:(fun row -> row = true) in
  winning_rows <> []

let is_winner win_states =
  let checked_states = check_for_winner win_states in
  let winning_rows = List.filter checked_states ~f:(fun state -> state = true) in
  winning_rows <> []

let is_draw board =
  let empty_cells = Grid.get_empty_cells board in
  empty_cells = []

let is_game_over board =
  if is_winner (Grid.win_state_matrix board) then
    true
  else if is_draw board then
    true
  else
    false
