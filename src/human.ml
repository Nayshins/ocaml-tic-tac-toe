open Core.Std
open Token

(* TODO test this *)
module Human = struct
  let rec get_move () =
    let move =
      try (ConsoleIO.get_player_integer_input ()) with
        Failure "int_of_string" -> ConsoleIO.print_to_console
                                     "Invalid entry please enter a number";
        get_move () in
    move

  let rec make_move board token =
    let move = get_move () in
    if List.mem (Grid.get_empty_cells board) move then
      (* Grid.set_token board move get_token *)
      (Grid.set_token board move token)
    else
      let () = ConsoleIO.print_to_console
          "Invalid entry: this box has already been selected" in
      make_move board token
end
