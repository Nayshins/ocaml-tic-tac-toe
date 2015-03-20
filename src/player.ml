open Core.Std
open Token
open Controller

module type Player = sig
  val get_token : token
  val make_move : Token.token list -> Token.token list
end

module PlayerX (PlayerController : Controller) = struct
  let get_token = X

  let make_move board =
    PlayerController.make_move board get_token
end

module PlayerO (PlayerController : Controller) = struct
  let get_token = O

  let make_move board =
    PlayerController.make_move board get_token
end
