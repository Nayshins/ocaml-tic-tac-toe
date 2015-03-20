open Core.Std
open Token

module type Controller = sig
  val make_move : Token.token list  -> int
end

module SimpleComputer : Controller = struct
  let make_move board =
     List.nth_exn (Grid.get_empty_cells board) 0
end

module Human : Controller = struct
  let rec get_move () =
    let move =
      try (ConsoleIO.get_player_integer_input ()) with
        Failure "int_of_string" -> ConsoleIO.print_to_console
                                     "Invalid entry please enter a number";
        get_move () in
    move

  let rec make_move board =
    let move = get_move () in
    if List.mem (Grid.get_empty_cells board) move then
      (* Grid.set_token board move get_token *)
      move
    else
      let () = ConsoleIO.print_to_console
          "Invalid entry: this box has already been selected" in
      make_move board
end

