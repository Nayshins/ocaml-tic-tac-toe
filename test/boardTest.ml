open Core.Std
open OUnit2
open Token

let empty_board test_ctxt = assert_equal
    ~ctxt:test_ctxt
    [EMPTY 0;EMPTY 1;EMPTY 2;
     EMPTY 3;EMPTY 4;EMPTY 5;
     EMPTY 6;EMPTY 7;EMPTY 8;]
    Board.new_board

let get_token_test test_ctxt =
  let board = Board.new_board in
  let token = Board.get_token board 0 in
  assert_equal
    ~ctxt:test_ctxt
    (EMPTY 0) token

let set_token_test test_ctxt =
  let board = Board.new_board in
  assert_equal
    ~ctxt:test_ctxt
    [X;EMPTY 1;EMPTY 2;
     EMPTY 3;EMPTY 4;EMPTY 5;
     EMPTY 6;EMPTY 7;EMPTY 8;] (Board.set_token board 0 X)

let clear_cell_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [EMPTY 0;O;X;
     O;X;O;
     O;X;O]
    (Board.clear_cell board 0)

let find_missing_test test_ctxt =
  let board = [X;O;EMPTY 2;
               O;X;EMPTY 5;
               X;O;EMPTY 8] in
  assert_equal
    ~ctxt:test_ctxt
    [2;5;8]
    (Board.get_empty_cells board)

let get_rows_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [[X;O;X];
     [O;X;O];
     [O;X;O]]
    (Board.get_rows board)

let get_columns_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [[X;O;O];
     [O;X;X];
     [X;O;O]]
    (Board.get_columns board)

let get_diagonal_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [X;X;O]
    (Board.get_diagonal board)

let get_reverse_diagonal_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [X;X;O]
    (Board.get_diagonal board)

let get_diagonals_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [[X;X;O];
     [X;X;O]]
    (Board.get_diagonals board)

let tests =
  "Board suite">:::
  ["new board returns a board with all EMPTY tokens">:: empty_board;
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
  ]
