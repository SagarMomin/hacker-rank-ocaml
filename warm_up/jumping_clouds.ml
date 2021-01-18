open! Core

let command =
  let jumping_clouds _steps path =
    let path = String.split ~on:' ' path |> List.map ~f:Int.of_string in
    let path_traveled =
      List.foldi path ~init:[] ~f:(fun i acc cloud ->
          if cloud = 0
          then (
            match acc with
            | _ :: snd :: tl -> if snd = i - 2 then i :: snd :: tl else i :: acc
            | acc -> i :: acc)
          else acc)
    in
    List.length path_traveled - 1
  in
  Common.Command_line.create () ~f:(fun () ->
      print_endline (jumping_clouds 8 "0 0 0 0 0 0 0" |> Int.to_string))
;;
