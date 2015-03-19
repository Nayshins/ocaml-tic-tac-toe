open Core.Std
open Token

module Player : sig
  val get_token : token
  val make_move : Token.token list  -> int
end
