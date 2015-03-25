open Core.Std
open OUnit2
open IO
open Setup

let player_text_input = ref []
let printed_text = ref ""
let printed_board = ref []

module MockConsoleIO : IO = struct
  let get_player_integer_input () =
    0

  let print_newline () =
    ()

  let get_player_input () =
    let text = List.hd_exn !player_text_input in
    player_text_input := List.tl_exn !player_text_input;
    text

  let print_to_console text =
    printed_text := text;
    ()

  let print_board board =
    printed_board := board;
    ()
end

module TestSetup = Setup (MockConsoleIO)

let play_again_test_false tesxt_ctxt =
  player_text_input := ["n"];
  assert_equal
    ~ctxt:tesxt_ctxt
    false
    (TestSetup.play_again ())

let play_again_test_true tesxt_ctxt =
  player_text_input := ["t"];
  assert_equal
    ~ctxt:tesxt_ctxt
    false
    (TestSetup.play_again ())

let tests =
  "Setup tests" >:::
  ["play again test returns false when not given a 'y'" >::
   play_again_test_false;
   "play_again_test returns true when given a 'y'" >:: play_again_test_true;
  ]
