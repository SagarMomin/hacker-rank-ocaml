open! Core

let command =
  let counting_valleys _steps path =
    String.fold path ~init:(0, 0) ~f:(fun (height, valleys) direction ->
        match direction with
        | 'D' -> height - 1, valleys
        | 'U' ->
          let height = height + 1 in
          let valleys = if height = 0 then valleys + 1 else valleys in
          height, valleys
        | _ -> failwith "Bad Input")
    |> snd
  in
  Common.Command_line.create () ~f:(fun () ->
      print_endline (counting_valleys 8 "DDUUDUDUDUDUDUUUUDDDD" |> Int.to_string))
;;
