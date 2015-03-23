open Core.Std
open Token
open IO

module ConsoleIO : IO = struct
(* TODO add pervasive functor *)
let get_player_input =
  read_line

let get_player_integer_input =
  (* throws error if input isnt an int*)
  read_int

let print_to_console message =
  print_string message

let print_board board =
  (Grid.get_rows board)
  |> BoardFormatter.format_rows
  |> BoardFormatter.concat_seperator
  |> print_endline
end
