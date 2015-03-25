open Core.Std
open Token
open ReaderWriter
open IO

module ConsoleIO (Pervasives : ReaderWriter) : IO  = struct
let get_player_input =
  Pervasives.read_line

let get_player_integer_input =
  (* throws string of int Failure *)
  Pervasives.read_int

let print_to_console message =
  Pervasives.print_string message

let print_newline =
  Pervasives.print_newline

let print_board board =
  (Board.get_rows board)
  |> BoardPresenter.format_rows
  |> BoardPresenter.concat_seperator
  |> Pervasives.print_endline
end
