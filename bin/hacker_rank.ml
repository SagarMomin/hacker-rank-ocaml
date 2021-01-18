open! Core
open! Async

let () =
  Command.group
    ~summary:"Interview prep"
    [ "warm-up", Warm_up_lib.Warm_up.command; "arrays", Arrays_lib.Arrays.command ]
  |> Command.run
;;
