open Core.Std
open OUnit2
open Token

let test_win_for_token_empty test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    false
    (Rules.is_token_winner [] X)

let test_win_for_token_multiple_empty test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    false
    (Rules.is_token_winner [EMPTY 0; EMPTY 1;
                            EMPTY 3;EMPTY 5;
                            EMPTY 6;EMPTY 8] O)

let test_win_for_token_X test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_token_winner [X;O;X;
                            EMPTY 1; EMPTY 2; EMPTY 3;
                            X;X;X] X)

let test_win_for_token_O test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_token_winner [O;O;O;
                            EMPTY 1; EMPTY 2; EMPTY 3;
                            X;X;X] O)

let test_is_winner_with_x test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_winner [[X;O;X];
                      [EMPTY 1; EMPTY 2; EMPTY 3];
                      [X;X;X]])

let test_is_winner_with_o test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_winner [[X;O;X];
                      [EMPTY 1; EMPTY 2; EMPTY 3];
                      [O;O;O]])

let test_is_winner_no_winner test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    false
    (Rules.is_winner [[X;O;X];
                      [O;X;O];
                      [X;X;O];
                      [O;O;X];
                      [X;O;X]])

let test_is_draw test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_draw [X;X;O;
                    O;O;X;
                    X;O;X])

let test_is_draw_false test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    false
    (Rules.is_draw [X;EMPTY 1; O;
                    X;O;X;
                    EMPTY 6; EMPTY 7; EMPTY 8])

let test_is_game_over_win test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_game_over [X;O;X;
                         O;X;O;
                         O;O;X])

let test_is_game_over_draw test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    true
    (Rules.is_game_over [X;X;O;
                         O;O;X;
                         X;O;X])

let test_is_game_over_false test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    false
    (Rules.is_game_over [X;X;EMPTY 2;
                         O;O;EMPTY 5;
                         X;X;EMPTY 8])

let win_state_test test_ctxt =
  let board = [X;O;X;
               O;X;O;
               O;X;O] in
  assert_equal
    ~ctxt:test_ctxt
    [[X;O;X];
     [O;X;O];
     [O;X;O];
     [X;O;O];
     [O;X;X];
     [X;O;O];[X;X;O];
     [X;X;O]]
    (Rules.win_state_matrix board)

let tests =
  "Rules Tests">:::
  ["is token winner returns false on empty list" >::
   test_win_for_token_empty;
   "is token winner returns false for multiple empty types">::
   test_win_for_token_multiple_empty;
   "is_token_winner returns true when 3 X's in a row" >:: test_win_for_token_X;
   "is_token_winner returns true when 3 O's in a row" >:: test_win_for_token_O;
   "is_winner returns true when there is a winner with X" >:: test_is_winner_with_x;
   "is_winner returns true when there is a winner with O" >::
   test_is_winner_with_o;
   "is_winner returns false when there is no winner" >::
   test_is_winner_no_winner;
   "is_draw returns true when the board is a draw" >:: test_is_draw;
   "is_draw returns false when the board is still empty" >:: test_is_draw_false;
   "is_game_over returns true when there is a winner" >:: test_is_game_over_win;
   "is_game_over returns true when there is a draw" >:: test_is_game_over_draw;
   "is_game over returns false when the game is not over" >::
   test_is_game_over_false;
   "win_state_matrix returns all of the possible win
conditions">::win_state_test;
  ]
