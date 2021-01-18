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

let valid_bounds ~x ~y = x >= 0 && x + 2 < 6 && y >= 0 && y + 2 < 6

let calc_hour_glasses (matrix : int array array) =
  let max_hourglass = ref Int.min_value in
  Array.iteri matrix ~f:(fun y row ->
      Array.iteri row ~f:(fun x _ ->
          if valid_bounds ~x ~y |> not
          then ()
          else (
            let hourglass =
              0
              + matrix.(y + 0).(x + 0)
              + matrix.(y + 0).(x + 1)
              + matrix.(y + 0).(x + 2)
              + matrix.(y + 1).(x + 1)
              + matrix.(y + 2).(x + 0)
              + matrix.(y + 2).(x + 1)
              + matrix.(y + 2).(x + 2)
            in
            max_hourglass := max !max_hourglass hourglass)));
  printf "%d\n" !max_hourglass
;;

let read_matrix () =
  let input_cases = Io_util.read_n_lines ~n:6 in
  let matrix =
    List.map input_cases ~f:(fun s ->
        String.split s ~on:' '
        |> List.filter_map ~f:(function
               | "" -> None
               | s -> Int.of_string s |> Option.return)
        |> List.to_array)
    |> List.to_array
  in
  calc_hour_glasses matrix
;;

let command = Common.Command_line.create () ~f:read_matrix
