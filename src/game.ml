open Core.Std
open Token
open Player
(* let rec game_loop player1 player2 board
   show board
   make_move
   if game_over
      print winner -> restart?
   else
      game_loop player2 player1 board
*)
module type Game = sig
  val game_setup : unit -> unit
end

module Game (PlayerX : Player) (PlayerO : Player)= struct

  let select_move board current_player =
    if current_player = X then
      PlayerX.make_move board
    else
      PlayerO.make_move board

  let rec game_loop current next board =
    ConsoleIO.print_board board;
    print_newline ();
    let board = (select_move board current) in
    if (Rules.is_game_over board) then
      print_string "game over mannn"
    else (game_loop next current board)

  let game_setup () =
    game_loop (PlayerX.get_token) (PlayerO.get_token) (Grid.new_board)
end
