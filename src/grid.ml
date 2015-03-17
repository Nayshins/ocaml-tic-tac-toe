open Core.Std
open Token

let new_board =
  [EMPTY; EMPTY; EMPTY;
    EMPTY; EMPTY; EMPTY;
    EMPTY; EMPTY; EMPTY]

let get_token board index =
  List.nth_exn board index

let set_token board index token =
  let grid_array = Array.of_list board in
  Array.set grid_array index token;
  Array.to_list grid_array

