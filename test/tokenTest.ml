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

let tests =
  "suite" >:::
  ["X is a valid token" >:: test_x;
   "O is a valid token" >:: test_o;
   "EMPTY is a valid token" >:: test_empty]

