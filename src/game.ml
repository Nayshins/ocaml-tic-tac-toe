open Core.Std
open Token
open Player
open IO

module type Game = sig
  val game_setup : unit -> unit
end

module Game (PlayerX : Player) (PlayerO : Player) (IO : IO)= struct
  let player_turn_message token  =
    IO.print_to_console ("Player" ^(Token.to_string token) ^"it is your turn\n");
    IO.print_to_console "Enter a number 1-9 to select a cell\n";
    IO.print_to_console "\n"

  let print_winner board token =
    if (Rules.is_draw board) then
      (IO.print_to_console "Game Over: Draw!\n";
       IO.print_board board)
    else
      (IO.print_to_console ("Game Over:" ^(Token.to_string token) ^"is the winner!\n");
      IO.print_board board)

  let select_move board current_player =
    if current_player = X then
      PlayerX.make_move board
    else
      PlayerO.make_move board

  let rec game_loop current next board =
    IO.print_board board;
    IO.print_newline ();
    player_turn_message current;
    IO.print_newline ();
    let board = (select_move board current) in
    if (Rules.is_game_over board) then
      print_winner board current
    else (game_loop next current board)

  let game_setup () =
    game_loop (PlayerX.get_token) (PlayerO.get_token) (Board.new_board)
end
