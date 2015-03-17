open Core.Std
open OUnit2
open Token

let test1 test_ctxt = assert_equal true true
let empty_board test_ctxt = assert_equal [|EMPTY;EMPTY;EMPTY;
                                           EMPTY;EMPTY;EMPTY;
                                           EMPTY;EMPTY;EMPTY;|] Grid.new_board

let get_token_test test_ctxt =
  let board = Grid.new_board in
  assert_equal EMPTY (Grid.get_token board 0)

let set_token_test test_ctxt =
  let board = Grid.new_board in
  assert_equal [|X;EMPTY;EMPTY;
                 EMPTY;EMPTY;EMPTY;
                 EMPTY;EMPTY;EMPTY;|] (Grid.set_token board 0 X)

let tests = 
  "suite">:::
  ["test true">:: test1;
   "new board returns a board with all EMPTY">:: empty_board;
   "get_token returns the token at a specific index">:: get_token_test;
   "set_token returns an array with updated value">:: set_token_test ]

