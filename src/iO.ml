open Core.Std

module type IO = sig
  val get_player_input : unit -> string
  val get_player_integer_input : unit -> int
  val print_to_console : string -> unit
  val print_board : Token.token list -> unit
end

