open Core.Std
open Token

let string_of_row row =
  List.map row ~f:(Token.to_string)
  |> String.concat ~sep:"|"

let concat_seperator board_strings =
  String.concat board_strings ~sep:"\n---+---+---\n"

let format_rows rows =
    List.map rows ~f:string_of_row
