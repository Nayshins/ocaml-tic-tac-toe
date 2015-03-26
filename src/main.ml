open Core.Std
open ConsoleIO
open Setup

let launch_setup () =
  let module ConsoleIO = ConsoleIO (Pervasives) in
  let module Setup = Setup (ConsoleIO) in
  Setup.setup_loop ()

let () =
  Command.basic
  ~summary:"Lets play Tic Tac Toe"
  Command.Spec.(
    empty)
  (fun () -> launch_setup ())
|> Command.run ~version:"1.0"
