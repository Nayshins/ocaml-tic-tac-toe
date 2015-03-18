open Core.Std
open OUnit2
open Token

let test1 test_ctxt = assert_equal true true
let empty_board test_ctxt = assert_equal [EMPTY 0;EMPTY 1;EMPTY 2;
                                          EMPTY 3;EMPTY 4;EMPTY 5;
                                          EMPTY 6;EMPTY 7;EMPTY 8;] Grid.new_board

let get_token_test test_ctxt =
  let board = Grid.new_board in
  let token = Grid.get_token board 0 in
  assert_equal (EMPTY 0) token

let set_token_test test_ctxt =
  let board = Grid.new_board in
  assert_equal [X;EMPTY 1;EMPTY 2;
                EMPTY 3;EMPTY 4;EMPTY 5;
                EMPTY 6;EMPTY 7;EMPTY 8;] (Grid.set_token board 0 X)

let find_missing_test test_ctxt =
  let board = [X;O;EMPTY 2;
               O;X;EMPTY 5;
               X;O;EMPTY 8] in
  assert_equal
    [2;5;8]
    (Grid.get_empty_cells board)

let get_rows_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    [[X;O;X];
     [O;X;O];
     [O;X;O]]
    (Grid.get_rows board)

let get_columns_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    [[X;O;O];
     [O;X;X];
     [X;O;O]]
    (Grid.get_columns board)

let get_diagonal_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    [X;X;O]
    (Grid.get_diagonal board)

let get_reverse_diagonal_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    [X;X;O]
    (Grid.get_diagonal board)

let get_diagonals_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    [[X;X;O];
     [X;X;O]]
    (Grid.get_diagonals board)

let win_state_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    [[X;O;X];
     [O;X;O];
     [O;X;O];
     [X;O;O];
     [O;X;X];
     [X;O;O];[X;X;O];
     [X;X;O]]
    (Grid.win_state_matrix board)

let tests =
  "Grid suite">:::
  ["test true">:: test1;
   "new board returns a board with all EMPTY tokens">:: empty_board;
   "get_token returns the token at a specific index">:: get_token_test;
   "set_token returns a new list with token inserted at index" >::
   set_token_test;
   "get empty cells returns the indecies of the empty cells">::
   find_missing_test;
   "get_rows returns a 3x3 list of grid rows">:: get_rows_test;
   "get_columns returns 3x3 list of columns" >:: get_columns_test;
   "get_diagonal returns the first diagonal">:: get_diagonal_test;
   "get_reverse_diagonal returns the second diagonal">::
   get_reverse_diagonal_test;
   "get_diagonals returns both diagonals as a nested list">::
   get_diagonals_test;
   "win_state_matrix returns all of the possible win
conditions">::win_state_test;
  ]
