open! Core

let _repeated_string_naive ~s ~n =
  let character_to_count = 'a' in
  let s_length = String.length s in
  let f = Char.equal character_to_count in
  let rec count_a's i ~acc =
    match i with
    | end_ when end_ = n -> acc
    | i ->
      if i % 1000 = 0 then printf "MOO: %d?\n" i;
      let c = s.[i % s_length] in
      let acc = if f c then acc + 1 else acc in
      count_a's (i + 1) ~acc
  in
  count_a's 0 ~acc:0
;;

let command =
  let repeated_string ~s ~n =
    let s_length = String.length s in
    let f = Char.equal 'a' in
    let chars_per_length = String.count s ~f in
    let chars_leftover =
      match n % s_length with
      | 0 -> 0
      | len -> String.count (String.slice s 0 len) ~f
    in
    (n / s_length * chars_per_length) + chars_leftover
  in
  Common.Command_line.create () ~f:(fun () ->
      let s, n =
        match Common.Io_util.read_n_lines ~n:2 with
        | [ s; n ] -> s, Int.of_string n
        | _ -> failwith "impossible"
      in
      printf "%d\n" (repeated_string ~s ~n))
;;
