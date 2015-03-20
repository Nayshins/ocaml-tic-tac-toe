open Core.Std
open Token

let get_player_input =
  read_line

let get_player_integer_input =
  (* throws error if input isnt an int*)
  read_int

let print_to_console message =
  print_string message

let string_of_row row =
  List.map row ~f:(Token.to_string)
  |> String.concat ~sep:"|"

let concat_seperator board_strings =
  String.concat board_strings ~sep:"\n---+---+---\n"

let format_rows rows =
    List.map rows ~f:string_of_row

let print_board board =
  (Grid.get_rows board)
  |> format_rows
  |> concat_seperator
  |> print_endline
