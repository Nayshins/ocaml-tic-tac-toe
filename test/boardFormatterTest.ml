open Core.Std
open OUnit2
open Token

let string_of_row_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    " X | O | X "
    (BoardFormatter.string_of_row [X;O;X])

let concat_seperator_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    " X | O | X \n---+---+---\n O | X | O \n---+---+---\n X | O | X "
    (BoardFormatter.concat_seperator [" X | O | X ";
                                 " O | X | O ";
                                 " X | O | X ";])

let format_rows_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    [" X | O | X ";
     " O | X | O ";
     " X | O | X ";]
    (BoardFormatter.format_rows [[X; O; X];
                            [O; X; O;];
                            [X; O; X;]])

let tests =
  "Console IO tests">:::
  ["string_of_row returns a row split by | ">:: string_of_row_test;
   "concat_seperator adds row sepeator between rows" >:: concat_seperator_test;
   "format_rows returns the string_of a board row" >:: format_rows_test;
  ]

