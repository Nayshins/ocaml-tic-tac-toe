open Core.Std
open OUnit2

let tests =
  "Suite" >:::
  [TokenTest.tests;
   GridTest.tests;
   RulesTest.tests;
   PlayerTest.tests;
   BoardFormatterTest.tests;
   NegamaxTest.tests;
   SimpleComputerTest.tests;
   HumanTest.tests;]

let _ =
  run_test_tt_main tests
