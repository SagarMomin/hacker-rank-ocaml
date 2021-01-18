open! Core

let command =
  Command.group
    ~summary:"Hacker Rank Problems"
    [ "counting-valleys", Counting_valleys.command
    ; "jumping-clouds", Jumping_clouds.command
    ; "repeated-string", Repeatead_string.command
    ; "sales-by-match", Sales_by_match.command
    ]
;;
