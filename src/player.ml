open Core.Std
open Token

module type Player = sig
  val get_token : token
  val make_move : Token.token list  -> int
end

module PlayerX : Player = struct
  let get_token = X

(* TODO extract into functor *)
  let make_move board =
     List.nth_exn (Grid.get_empty_cells board) 0
end

module PlayerO : Player = struct
  let get_token = O

  (* human player code
     rec get_input
     prompt for selection
     if valid
      return int
     else
     get_input
  *)

  let rec get_move () =
    let move =
    try (ConsoleIO.get_player_integer_input ()) with
    | Failure "int_of_string" ->
      ConsoleIO.print_to_console "Invalid entry please enter a number";
      get_move () in
    move

  let rec make_move board =
    let move = get_move () in
    if List.mem (Grid.get_empty_cells board) move then
      let () = ConsoleIO.print_to_console
          "Invalid entry: this box has already been selected" in
      make_move board
    else
      (* Grid.set_token board move get_token *)
      move
end
