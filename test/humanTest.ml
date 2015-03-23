open Core.Std
open OUnit2
open ConsoleIO
open Human
open Token

let player_int_input = ref []
let printed_text = ref ""
let printed_board = ref [X]

module MockConsoleIO : ConsoleIO = struct
  let get_player_integer_input () =
    let move = List.hd_exn !player_int_input in
    player_int_input := List.tl_exn !player_int_input;
    move

  let get_player_input () =
    "test"

  let print_to_console text =
    printed_text := text;
    ()

  let print_board board =
    printed_board := board;
    ()
end

module TestHuman = Human (MockConsoleIO)

let test_get_move test_ctxt =
  player_int_input := [1;1];
  let move = TestHuman.get_move () in
  assert_equal
    ~ctxt:test_ctxt
    1
    move

let test_make_move test_ctxt =
  player_int_input := [1;1];
  let board = Grid.new_board in
  assert_equal
    ~ctxt:test_ctxt
    [X; EMPTY 1; EMPTY 2;
     EMPTY 3; EMPTY 4; EMPTY 5;
     EMPTY 6; EMPTY 7; EMPTY 8;]
    (TestHuman.make_move board X)

let test_make_move_on_occupied_sq test_ctxt =
  player_int_input := [1;2];
  let board = [X; EMPTY 1; EMPTY 2;
               EMPTY 3; EMPTY 4; EMPTY 5;
               EMPTY 6; EMPTY 7; EMPTY 8;] in
  assert_equal
    ~ctxt:test_ctxt
    [X; O; EMPTY 2;
     EMPTY 3; EMPTY 4; EMPTY 5;
     EMPTY 6; EMPTY 7; EMPTY 8;]
    (TestHuman.make_move board O);
  assert_equal
    ~ctxt:test_ctxt
    "Invalid entry: This box has already been selected"
    !printed_text

let tests =
  "Human player tests" >:::
  ["get_move returns an int" >:: test_get_move;
   "make_move returns a new token list with the player's move" >::
   test_make_move;
   "make move returns an error message when entry is not valid" >::
   test_make_move_on_occupied_sq;]
