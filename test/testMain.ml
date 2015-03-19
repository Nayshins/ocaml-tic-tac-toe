open Core.Std
open OUnit2

let tests =
  "Suite" >:::
  [TokenTest.tests;
   GridTest.tests;
   RulesTest.tests;
   PlayerTest.tests]

let _ =
  run_test_tt_main tests
