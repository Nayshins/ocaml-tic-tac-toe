open Core.Std

let get_board_string board =
  List.iter board ~f:(fun token -> print_string (Token.to_string token))

let get_player_input =
  read_line

let get_player_integer_input =
  (* throws error if input isnt an int*)
  read_int

let print_to_console message =
  print_string message

let print_board board =
  List.iter board ~f:(fun token -> print_string (Token.to_string token))
