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

let playerX_test_make_move tesxt_ctxt=
  assert_equal
    ~ctxt:tesxt_ctxt
    0
    (PlayerX.make_move Grid.new_board)

let tests =
  "Player tests">:::
  ["playerX get_token returns X token" >:: playerX_test_get_token;
   "playerO get_token returns O token">:: playerO_test_get_token;
   (* simple computer TODO extract *)
   "playerX get move returns the first open square">:: playerX_test_make_move;
  ]

