open Core.Std
open Token

let new_board =
  [EMPTY 0; EMPTY 1; EMPTY 2;
   EMPTY 3; EMPTY 4; EMPTY 5;
   EMPTY 6; EMPTY 7; EMPTY 8]

let get_token board index =
  List.nth_exn board index

let set_token board index token =
  let grid_array = Array.of_list board in
  Array.set grid_array index token;
  Array.to_list grid_array
