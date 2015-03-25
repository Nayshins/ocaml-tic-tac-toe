open Core.Std
open Token

module SimpleComputer = struct
  let make_move board token =
    let move =  List.nth_exn (Board.get_empty_cells board) 0 in
      Board.set_token board move token
end
