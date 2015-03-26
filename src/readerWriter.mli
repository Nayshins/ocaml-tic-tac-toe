open Core.Std

module type ReaderWriter = sig
  val read_line : unit -> string
  val read_int : unit -> int
  val print_string : string -> unit
  val print_endline : string -> unit
  val print_newline : unit -> unit
end
