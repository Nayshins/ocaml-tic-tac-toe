open Core.Std
open ConsoleIO
open Setup

let () =
  let module ConsoleIO = ConsoleIO (Pervasives) in
  let module Setup = Setup (ConsoleIO) in
  Setup.setup_loop ()

