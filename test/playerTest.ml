open Core.Std
open OUnit2
open Token
open PlayerX
open PlayerO

let playerX_test_get_token test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    X
    PlayerX.get_token

let playerO_test_get_token test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    O
    PlayerO.get_token

let tests =
  "Player tests">:::
  ["playerX get_token returns X token" >:: playerX_test_get_token;
   "playerO get_token returns O token">:: playerO_test_get_token;]

