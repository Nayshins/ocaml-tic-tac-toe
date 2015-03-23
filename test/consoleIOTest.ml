open Core.Std
open OUnit2
open ReaderWriter
open ConsoleIO

let line_to_read_string = ref [""]
let line_to_read_int = ref [1]
let printed_string = ref ""

module MockPervasives : ReaderWriter = struct
  let read_line () =
    let line_read = List.hd_exn !line_to_read_string in
    line_to_read_string := List.tl_exn !line_to_read_string;
    line_read

  let read_int () =
    let int_read = List.hd_exn !line_to_read_int in
    line_to_read_int := List.tl_exn !line_to_read_int;
    int_read

  let print_string text =
    printed_string := text

  let print_endline text =
    printed_string := text ^"\n"

  let print_newline () =
    printed_string := "\n"
end

module TestConsoleIO = ConsoleIO (MockPervasives)

let test_player_input test_ctxt =
  line_to_read_string := ["hello"; "world"];
  assert_equal
    ~ctxt:test_ctxt
    "hello"
    (TestConsoleIO.get_player_input ())

let test_player_integer_input test_ctxt =
  line_to_read_int := [1;2];
  assert_equal
    ~ctxt:test_ctxt
    1
    (TestConsoleIO.get_player_integer_input ())

let test_print_to_console test_ctxt =
    (TestConsoleIO.print_to_console "hello world");
  assert_equal
    ~ctxt:test_ctxt
    "hello world"
    !printed_string

let test_print_board test_ctxt =
  (TestConsoleIO.print_board (Grid.new_board));
  assert_equal
    ~ctxt:test_ctxt
    " 1 | 2 | 3 \n---+---+---\n 4 | 5 | 6 \n---+---+---\n 7 | 8 | 9 \n"
    !printed_string

let tests =
  "Console IO tests" >:::
  ["get_player_input reads a string from the command line" >:: test_player_input;
   "get_player_integer_input reads an integer from the command line" >::
   test_player_integer_input;
   "print_to_console prints the given message" >:: test_print_to_console;
   "print_board prints the current board state to the console" >::
   test_print_board;
  ]
