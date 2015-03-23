open Core.Std
open OUnit2
open SimpleComputer
open Token

let make_move_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    [X;EMPTY 1; EMPTY 2;
     EMPTY 3; EMPTY 4; EMPTY 5;
     EMPTY 6; EMPTY 7; EMPTY 8;]
    (SimpleComputer.make_move (Grid.new_board) X)

let tests =
  "Simple Computer" >:::
  ["Make Move fills the first empty slot in a board" >:: make_move_test;]
