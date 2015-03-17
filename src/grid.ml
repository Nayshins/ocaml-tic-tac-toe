open Core.Std
open Token

let empty = ""

let new_board =
  [|EMPTY; EMPTY; EMPTY;
    EMPTY; EMPTY; EMPTY;
    EMPTY; EMPTY; EMPTY|]

let get_token board index =
  Array.get board index

let set_token board index token =
  let board = board in
  Array.set board index token
    board

