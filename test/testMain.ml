open Core.Std
open OUnit2

let tests =
  "Suite" >:::
  [TokenTest.tests;
   GridTest.tests;
   RulesTest.tests]

let _ =
  run_test_tt_main tests
