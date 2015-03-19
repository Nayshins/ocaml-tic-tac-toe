open Core.Std
open Token

module PlayerX = struct
  let get_token = X

(* TODO extract into functor *)
  let make_move board =
     List.nth_exn (Grid.get_empty_cells board) 0
end
