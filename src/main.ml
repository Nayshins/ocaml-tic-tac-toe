open Core.Std
open Async.Std
open ConsoleIO
open Setup

let launch_setup () =
  let module ConsoleIO = ConsoleIO (Pervasives) in
  let module Setup = Setup (ConsoleIO) in
  Setup.setup_loop ()


let () =
  Command.async_basic
  ~summary:"Lets play Tic Tac Toe"
  Command.Spec.(
    empty)
  (fun () -> launch_setup ())
|> Command.run
