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

(* let find_missing_test test_ctxt =
  let board = [X;O;EMPTY 2;
               O;X;EMPTY 5;
               X;O;EMPTY 8] in
  assert_equal
    [2;5;8]
    (Grid.find_empty board) *)

let tests =
  "suite">:::
  ["test true">:: test1;
   "new board returns a board with all EMPTY tokens">:: empty_board;
   "get_token returns the token at a specific index">:: get_token_test;
   "set_token returns a new list with token inserted at index" >::
   set_token_test;
  ]
