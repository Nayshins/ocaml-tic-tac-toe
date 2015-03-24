open Core.Std
open Async.Std
open IO
open Controller
open Negamax
open SimpleComputer
open Human
open Player
open Game

module Setup (IO:IO) = struct

  let rec pick_controller () =
    (* TODO split these apart *)
    IO.print_to_console "Enter 'h' for human, 's' for the simple AI, or 'n' for
      impossible AI\n";
    let module Human = Human (IO) in
    let input = (IO.get_player_input ()) in
    match input with
    | "n" -> (module Negamax : Controller)
    | "s" -> (module SimpleComputer : Controller)
    | "h" -> (module Human : Controller)
    |  _ ->(IO.print_to_console "Invalid selection: Please enter ,n ,s, or
h");
      pick_controller ()

  let play_again () =
    IO.print_to_console "Would you like to play again?\n enter 'y' to play
again\n any other key to quit";
    let input = IO.get_player_input () in
    input = "y"

  let setup_players () =
    (* TODO combine messages *)
    IO.print_to_console "Welcome to Tic Tac Toe!\n";
    IO.print_to_console "\n";
    IO.print_to_console "Who will be Controlling X?\n";
    let (module Player1Controller : Controller) = pick_controller () in
    let module Player1 = PlayerX (Player1Controller) in
    IO.print_to_console "Who will be Controlling O?\n";
    let (module Player2Controller : Controller) = pick_controller () in
    let module Player2 = PlayerO (Player2Controller) in
    let module Game = Game (Player1) (Player2) (IO) in
    Game.game_setup ()

  let rec setup_loop () =
    setup_players ();
    if play_again () then
      setup_loop ()
    else
      Shutdown.exit 0
end
