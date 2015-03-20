open Core.Std
open OUnit2
open Token

let string_of_row_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    " X | O | X "
    (ConsoleIO.string_of_row [X;O;X])

let tests =
  "Console IO tests">:::
  ["string_of_row returns a row split by | ">:: string_of_row_test;]
