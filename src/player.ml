open Core.Std
open Token
open Controller

module type Player = sig
  val get_token : token
  val make_move : Token.token list  -> int
end

module PlayerX (PlayerController : Controller) = struct
  let get_token = X

(* TODO extract into functor *)
  let make_move board =
    PlayerController.make_move board
end

module PlayerO (PlayerController : Controller) = struct
  let get_token = O

  let make_move board =
    PlayerController.make_move board
end
