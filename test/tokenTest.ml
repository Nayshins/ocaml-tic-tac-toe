open Core.Std
open OUnit2
open Token

let match_token token =
  match token with
  | X -> true
  | O -> true
  | (EMPTY _) -> true

let test_x test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true (match_token X)

let test_o test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true (match_token O)

let test_empty test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true (match_token (EMPTY 0))

let test_to_string_X test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    " X "
    (Token.to_string X)

let test_to_string_O test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    " O "
    (Token.to_string O)

let test_to_string_EMPTY test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    " 1 "
    (Token.to_string (EMPTY 0))

let test_get_opposite_X test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    O
    (Token.get_opposite X)

let tests =
  "suite" >:::
  ["X is a valid token" >:: test_x;
   "O is a valid token" >:: test_o;
   "EMPTY is a valid token" >:: test_empty;
   "to_string X returns 'X'" >:: test_to_string_X;
   "to_string O returns 'O'" >:: test_to_string_O;
   "to_string EMPTY returns ' '" >:: test_to_string_EMPTY;
   "get_opposite X returns O" >:: test_get_opposite_X;
  ]
