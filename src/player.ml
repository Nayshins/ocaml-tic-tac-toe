open Core.Std
open Token
open Strategy

module type Player = sig
  val get_token : token
  val make_move : Token.token list -> Token.token list
end

module PlayerX (PlayerStrategy : Strategy) = struct
  let get_token = X

  let make_move board =
    PlayerStrategy.make_move board get_token
end

module PlayerO (PlayerStrategy : Strategy) = struct
  let get_token = O

  let make_move board =
    PlayerStrategy.make_move board get_token
end
