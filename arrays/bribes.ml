(* Enter your code here. Read input from STDIN. Print output to STDOUT *)
open Core

module Io_util = struct
  let read_n_lines ~n =
    List.init n ~f:(fun _ ->
        let line = In_channel.(input_line stdin) in
        Option.value_exn line)
    |> List.rev
  ;;
end

let handle_case one_case =
  let one_case = List.to_array one_case in
  Array.foldi one_case ~init:0 ~f:(fun i bribes starting_place ->
      let place_in_line = i + 2 in
      if starting_place - place_in_line >= 3 then failwith "Too chaotic";
      match max 1 (starting_place - 2) with
      | best_place_in_line when best_place_in_line < place_in_line ->
        let bribes_taken =
          let best_place_in_line_index = best_place_in_line - 1 in
          Array.slice one_case best_place_in_line_index place_in_line
          |> Array.fold ~init:0 ~f:(fun bribes x ->
                 printf "moo";
                 if x > starting_place then bribes + 1 else bribes)
        in
        bribes_taken + bribes
      | _ -> bribes)
;;

let calculate_bribes () =
  let input_cases = Io_util.read_n_lines ~n:1 |> List.hd_exn |> Int.of_string in
  let test_cases =
    Array.init input_cases ~f:(fun _ ->
        Io_util.read_n_lines ~n:2
        |> List.last_exn
        |> String.split ~on:' '
        |> List.map ~f:Int.of_string)
  in
  Array.iter test_cases ~f:(fun one_case ->
      Option.try_with (fun () -> handle_case one_case)
      |> Option.value_map ~f:Int.to_string ~default:"Too chaotic"
      |> print_endline)
;;

let command = Common.Command_line.create () ~f:calculate_bribes
