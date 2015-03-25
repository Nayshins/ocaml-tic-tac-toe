open Core.Std
open Token

let new_board =
  [EMPTY 0; EMPTY 1; EMPTY 2;
   EMPTY 3; EMPTY 4; EMPTY 5;
   EMPTY 6; EMPTY 7; EMPTY 8]

let get_token board index =
  List.nth_exn board index

let set_token board index token =
  Util.set_nth board index token

let clear_cell board index =
  set_token board index (EMPTY index)

let match_empty_cells cell =
  match cell with
  | EMPTY _ -> true
  | _ -> false

let extract_cell_number cell =
  match cell with
  | EMPTY num -> num
  | _ -> 0

let get_empty_cells board =
  let empty_cells = List.filter board ~f:match_empty_cells in
    List.map empty_cells ~f:extract_cell_number

let get_rows board =
 List.groupi board ~break:(fun index _ _-> index mod 3 = 0)

let get_columns board =
  let rows = get_rows board in
  List.transpose_exn rows

let get_diagonal board =
  let rows = get_rows board in
  List.mapi rows ~f:(fun index row -> List.nth_exn row index)

let get_reverse_diagonal board =
  let rows = get_rows board in
  List.mapi rows ~f:(fun index row ->
      let reverse_row = List.rev row in
      List.nth_exn reverse_row index)

let get_diagonals board =
  [get_diagonal board; get_reverse_diagonal board;]
