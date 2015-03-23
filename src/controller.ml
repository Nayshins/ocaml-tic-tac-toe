open Core.Std
open ConsoleIO
open Token

module type Controller = sig
  val make_move : Token.token list -> Token.token  -> Token.token list
end
