open Core.Std
open OUnit2

let tests =
  "Suite" >:::
  [TokenTest.tests;
   BoardTest.tests;
   RulesTest.tests;
   PlayerTest.tests;
   BoardPresenterTest.tests;
   NegamaxTest.tests;
   SimpleComputerTest.tests;
   HumanTest.tests;
   ConsoleIOTest.tests;
   GameTest.tests;
   SetupTest.tests;]

let _ =
  run_test_tt_main tests
