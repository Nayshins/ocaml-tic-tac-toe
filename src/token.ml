open Core.Std

type token = X | O | EMPTY of int

let to_string token =
  match token with
  | X -> "X"
  | O -> "O"
  | EMPTY _  -> " "
