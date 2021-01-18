open! Core

let command =
  Command.group
    ~summary:"Hacker Rank Problems"
    [ "bribes", Bribes.command; "matrix", Matrix.command ]
;;
