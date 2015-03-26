open Core.Std
open OUnit2
open Token
open Negamax

let board_score_test_X_win test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    1000
    (Negamax.board_score [X;O;X;
                          EMPTY 1; EMPTY 2; EMPTY 3;
                          X;X;X] X)

let board_score_test_O_loss test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    1000
    (Negamax.board_score [X;O;X;
                          EMPTY 1; EMPTY 2; EMPTY 3;
                          X;X;X] X)

let board_score_test_no_winner test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    0
    (Negamax.board_score [X;O;X;
                          EMPTY 1; EMPTY 2; EMPTY 3;
                          X;O;X] X)

let best_move_score_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    (5,100)
    (Negamax.best_move_score [(1,-20);(5,100);(3,40)])

let negamax_draw_test test_ctxt =
  let board = [X;O;X;
               X;O;X;
               O;X;O;] in
  assert_equal
    ~ctxt:test_ctxt
    0
    (Negamax.negamax board 1 X)

let negamax_win_test test_ctxt =
  let board = [O;O;X;
               X;O;O;
               X;X;X;] in
  assert_equal
    ~ctxt:test_ctxt
    1000
    (Negamax.negamax board 1 X)

let negamax_loss_test test_ctxt =
  let board = [O;O;X;
               X;O;O;
               X;O;X;] in
  assert_equal
    ~ctxt:test_ctxt
    (-1000)
    (Negamax.negamax board 1 X)

let negamax_base_blocks_three_in_a_row_test test_ctxt =
  let board = [O;O;EMPTY 2;
               EMPTY 3; EMPTY 4; EMPTY 5;
               X; EMPTY 7; EMPTY 8;] in
  assert_equal
    ~ctxt:test_ctxt
    2
    (Negamax.negamax_base board X)

let negamax_base_returns_cell_for_win test_ctxt =
  let board = [O;O;EMPTY 2;
               EMPTY 3; EMPTY 4; EMPTY 5;
               X;X; EMPTY 8;] in
  assert_equal
    ~ctxt:test_ctxt
    8
    (Negamax.negamax_base board X)

let tests =
  "Negamax tests">:::
  ["board score returns 1000 when token is the winner">::
   board_score_test_X_win;
   "board_score returns -1000 when token is the loser">:: board_score_test_O_loss;
   "board_score returns 0 when there is no winner">::
   board_score_test_no_winner;
   "best_move_score returns the tuple with the highest score">::
   best_move_score_test;
     "negamax returns 0 when the game ends in a draw">:: negamax_draw_test;
   "negamax returns 1000 when the game ends in a win for player token" >::
   negamax_win_test;
   "negamax returns -1000 when the game ends in a loss for player token">::
   negamax_loss_test;
   "negamax_base blocks opponent 3 in a row">::
   negamax_base_blocks_three_in_a_row_test;
   "negamax_base goes for win over a block">::
   negamax_base_returns_cell_for_win;
  ]
