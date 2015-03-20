open Core.Std
open Token
open Controller

module SimpleComputer : Controller = struct
  let make_move board token =
    let move =  List.nth_exn (Grid.get_empty_cells board) 0 in
      Grid.set_token board move token
end
