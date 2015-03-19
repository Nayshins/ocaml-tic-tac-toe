open Core.Std
open Player
open Game

let () =
  let module Player1 = PlayerX in
  let module Player2 = PlayerO in
  let module Game = Game (Player1) (Player2) in
  Game.game_setup ();

