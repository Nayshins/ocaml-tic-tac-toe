open Core.Std
open OUnit2
open Token
open Player
open IO
open Game
open SimpleComputer

let player_int_input = ref []
let printed_text = ref ""
let printed_board = ref []
let playerX_moves = ref []
let playerO_moves = ref []

module MockPlayerX : Player = struct
  let get_token =
    X

  let make_move board =
    let move = List.hd_exn !playerX_moves in
    playerX_moves := List.tl_exn !playerX_moves;
    Grid.set_token board move X
end

module MockPlayerO : Player = struct
  let get_token =
    O

  let make_move board =
    let move = List.hd_exn !playerO_moves in
    playerO_moves := List.tl_exn !playerO_moves;
    Grid.set_token board move O
end

module MockConsoleIO : IO = struct
  let get_player_integer_input () =
    let move = List.hd_exn !player_int_input in
    player_int_input := List.tl_exn !player_int_input;
    move

  let print_newline () =
    ()

  let get_player_input () =
    "test"

  let print_to_console text =
    printed_text := text;
    ()

  let print_board board =
    printed_board := board;
    ()
end

module TestGame = Game (MockPlayerX) (MockPlayerO) (MockConsoleIO)

let test_game_loop_X_win test_ctxt =
  playerO_moves := [1;3;5;7];
  playerX_moves := [0;2;4;6];
  TestGame.game_setup ();
  assert_equal
  ~ctxt:test_ctxt
    "Game Over: X is the winner!\n"
    !printed_text

let test_game_loop_O_win test_ctxt =
  playerX_moves := [1;3;5;7];
  playerO_moves := [0;2;4;6];
  TestGame.game_setup ();
  assert_equal
  ~ctxt:test_ctxt
    "Game Over: O is the winner!\n"
    !printed_text

let test_game_loop_draw test_ctxt =
  playerX_moves := [0;1;5;6;7];
  playerO_moves := [2;3;4;8];
  TestGame.game_setup ();
  assert_equal
    ~ctxt:test_ctxt
    "Game Over: Draw!\n"
    !printed_text

let tests =
  "Game tests" >:::
  ["game loop runs through a full game when X is the winner" >:: test_game_loop_X_win;
   "game loop runs through a full game when O is the winner" >::
   test_game_loop_O_win;
   "game loop runs through a full game when there is a draw" >::
   test_game_loop_draw;]
