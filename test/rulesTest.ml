open Core.Std
open OUnit2
open Token

let test_win_for_token_empty test_ctxt =
  assert_equal
    false
    (Rules.is_token_winner [[]] X)

let test_win_for_token_multiple_empty test_ctxt =
  assert_equal
    false
    (Rules.is_token_winner [[EMPTY 0; EMPTY 1];
                            [EMPTY 3];[EMPTY 5];
                            [EMPTY 6];[EMPTY 8];] O)

let test_win_for_token_X test_ctxt =
  assert_equal
    true
    (Rules.is_token_winner [[X;O;X];
                            [EMPTY 1; EMPTY 2; EMPTY 3];
                            [X;X;X]] X)

let test_win_for_token_O test_ctxt =
  assert_equal
    true
    (Rules.is_token_winner [[O;O;O];
                            [EMPTY 1; EMPTY 2; EMPTY 3];
                            [X;X;X]] O)

let tests = 
  "Rules Tests">:::
  ["is token winner returns false on empty list" >::
   test_win_for_token_empty;
   "is token winner returns false for multiple empty types">::
   test_win_for_token_multiple_empty;
   "is_token_winner returns true when 3 X's in a row" >:: test_win_for_token_X;
   "is_token_winner returns true when 3 O's in a row" >:: test_win_for_token_O;
  ]

