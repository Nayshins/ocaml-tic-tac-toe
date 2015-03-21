open Core.Std
open Token

module Negamax = struct

  let board_score board token =
    if (Rules.is_token_winner board token) then
      1000
    else if (Rules.is_token_winner board (Token.get_opposite token)) then
      -1000
    else
      0

  let best_move_score move_scores =
    List.fold_left move_scores ~init:(Int.min_value, Int.min_value)
      ~f:(fun (acc_move, acc_score)(move, score) ->
          let best_score = Int.max acc_score score in
          if best_score = score then
            (move,score)
          else
            (acc_move,acc_score))

  let rec negamax board depth token =
    if (Rules.is_game_over board) || depth > 4 then
      (board_score board token) / depth
    else
      let possible_moves = Grid.get_empty_cells board in
      let opponent = Token.get_opposite token in
      let scores  = List.map possible_moves ~f:(fun move ->
          let board = Grid.set_token board move token in
          let score = -(negamax board (depth + 1) opponent) in
          score) in
      List.fold_left scores ~init: Int.min_value ~f: Int.max


  let negamax_base board token =
    let possible_moves = Grid.get_empty_cells board in
    let opponent = Token.get_opposite token in
    let move_scores = List.map possible_moves ~f:(fun move ->
        let board = Grid.set_token board move token in
        let score = -(negamax board 1 opponent) in
        (move, score)) in
    let best_move_score = best_move_score move_scores in
    fst best_move_score

  let make_move board token =
    Grid.set_token board (negamax_base board token) token
end
