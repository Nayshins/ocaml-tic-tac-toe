open Core.Std

type token = X | O | EMPTY of int

let to_string token =
  match token with
  | X -> " X "
  | O -> " O "
  | EMPTY num  -> " " ^(string_of_int (num + 1)) ^" "

let get_opposite token =
  if token = X then
    O
  else
    X
