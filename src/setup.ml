open Core.Std
open IO
open Strategy
open Negamax
open SimpleComputer
open Human
open Player
open Game

module Setup (IO:IO) = struct
  let controller_message () =
    IO.print_to_console "Enter 'h' for a human player.\n";
    IO.print_to_console "Enter 's' for a simple computer player.\n";
    IO.print_to_console "Enter 'n' for an impossible computer player.\n";
    IO.print_newline ()

  let play_again_message () =
    IO.print_newline ();
    IO.print_newline ();
    IO.print_to_console "Would you like to play again?\n";
    IO.print_to_console "enter 'y' to play again,\n";
    IO.print_to_console "or any other key to quit";
    IO.print_newline ()

  let welcome_message () =
    IO.print_to_console "Welcome to Tic Tac Toe!\n";
    IO.print_newline ()

  let rec pick_controller () =
    controller_message ();
    let module Human = Human (IO) in
    let input = (IO.get_player_input ()) in
    match input with
    | "n" -> (module Negamax : Strategy)
    | "s" -> (module SimpleComputer : Strategy)
    | "h" -> (module Human : Strategy)
    |  _ ->(IO.print_to_console "Invalid selection: Please enter ,n ,s, or
h");
      pick_controller ()

  let play_again () =
    play_again_message ();
    let input = IO.get_player_input () in
    input = "y"

  let setup_players () =
    welcome_message ();
    IO.print_to_console "Who will be Controlling X?\n";
    let (module Player1Strategy : Strategy) = pick_controller () in
    let module Player1 = PlayerX (Player1Strategy) in
    IO.print_to_console "Who will be Controlling O?\n";
    let (module Player2Strategy : Strategy) = pick_controller () in
    let module Player2 = PlayerO (Player2Strategy) in
    let module Game = Game (Player1) (Player2) (IO) in
    Game.game_setup ()

  let rec setup_loop () =
    setup_players ();
    if play_again () then
      setup_loop ()
    else
      ()
end
