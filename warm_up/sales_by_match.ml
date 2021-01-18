(* Enter your code here. Read input from STDIN. Print output to STDOUT *)
open Core

module For_testing = struct
  let _number_of_socks = 9
  let _socks = [ 10; 20; 20; 10; 10; 30; 50; 10; 20 ]
end

let parse_socks_exn l =
  match l with
  | [ _; socks ] -> String.split ~on:' ' socks |> List.map ~f:Int.of_string
  | _ -> failwith "Parsed input incorrectly"
;;

let naive_sort_list () =
  let lines = Common.Io_util.read_n_lines ~n:2 in
  let socks = parse_socks_exn lines in
  let socks = List.sort ~compare:Int.compare socks in
  let pairs = List.group socks ~break:Int.( <> ) in
  let number_of_pairs =
    List.fold pairs ~init:0 ~f:(fun acc l -> acc + (List.length l / 2))
  in
  Out_channel.output_string stdout (Int.to_string number_of_pairs)
;;

let use_map () =
  let lines = Common.Io_util.read_n_lines ~n:2 in
  let socks = parse_socks_exn lines in
  let paired =
    List.fold socks ~init:Int.Map.empty ~f:(fun m sock ->
        Map.update m sock ~f:(function
            | None -> 1
            | Some count -> count + 1))
  in
  let number_of_pairs =
    Map.fold paired ~init:0 ~f:(fun ~key:_ ~data:paired acc -> acc + (paired / 2))
  in
  Out_channel.output_string stdout (Int.to_string number_of_pairs)
;;

let use_hashtbl () =
  let lines = Common.Io_util.read_n_lines ~n:2 in
  let socks = parse_socks_exn lines in
  let paired = Hashtbl.create (module Int) in
  List.iter socks ~f:(fun sock ->
      Hashtbl.update paired sock ~f:(function
          | None -> 1
          | Some count -> count + 1));
  let number_of_pairs =
    Hashtbl.fold paired ~init:0 ~f:(fun ~key:_ ~data:paired acc -> acc + (paired / 2))
  in
  Out_channel.output_string stdout (Int.to_string number_of_pairs)
;;

let command = Common.Command_line.create () ~f:use_hashtbl
