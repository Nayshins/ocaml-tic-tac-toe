open Core.Std
open Player
open ConsoleIO
open Game
open Human
open SimpleComputer
open Negamax

let () =
  let module Player1 = PlayerX in
  let module Player2 = PlayerO in
  let module ConsoleIO = ConsoleIO (Pervasives) in
  let module Computer = Negamax in
  let module Human = Human (ConsoleIO) in
  let module Game = Game (Player1 (Computer))
      (Player2 (Human)) (ConsoleIO) in
  Game.game_setup ();

