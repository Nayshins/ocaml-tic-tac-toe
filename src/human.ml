open Core.Std
open ConsoleIO
open Token

(* TODO test this *)
module Human (IO : ConsoleIO) = struct
  let rec get_move () =
      try (IO.get_player_integer_input ()) with
        | Failure "int_of_string" ->
          (IO.print_to_console "Invalid entry please enter a number");
        get_move ()

  let rec make_move board token =
    let move = get_move ()  in
    if List.mem (Grid.get_empty_cells board) (move - 1) then
      (Grid.set_token board (move -1) token)
    else
      let () = IO.print_to_console
          "Invalid entry: This box has already been selected" in
      make_move board token
end
