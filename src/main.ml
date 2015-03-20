open Core.Std
open Player
open Game
open Human
open SimpleComputer

let () =
  let module Player1 = PlayerX in
  let module Player2 = PlayerO in
  let module Computer = SimpleComputer in
  let module Human = Human in
  let module Game = Game (Player1 (Computer))
      (Player2 (Human)) in
  Game.game_setup ();

