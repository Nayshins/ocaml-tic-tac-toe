open Core.Std
open OUnit2
open Token
open Player
open Controller

module MockController : Controller = struct
  let make_move board token =
    Grid.set_token board 0 token
end

module PlayerX = PlayerX(MockController)
module PlayerO = PlayerO(MockController)

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

let playerX_test_make_move test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    [X]
    (PlayerX.make_move [EMPTY 0])
let tests =
  "Player tests">:::
  ["playerX get_token returns X token" >:: playerX_test_get_token;
   "playerO get_token returns O token">:: playerO_test_get_token;
   (* simple computer TODO extract *)
   "playerX get move returns the first open square">:: playerX_test_make_move;
  ]

