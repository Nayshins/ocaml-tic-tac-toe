open Core.Std
open OUnit2

let set_nth_test test_ctxt =
  assert_equal
    ~ctxt:test_ctxt
    [0;1;100;3;4;5]
    (Util.set_nth [0;1;2;3;4;5] 2 100)

let tests =
  "Util tests">:::
  ["Set nth returns a new list with a new value at specified index" >::
   set_nth_test;]
