open! Core

module Io_util = struct
  let read_n_lines ~n =
    List.init n ~f:(fun _ ->
        let line = In_channel.(input_line stdin) in
        Option.value_exn line)
    |> List.rev
  ;;
end

module Command_line = struct
  let create ?(summary = "Interview Prep") ~f () =
    Command.basic
      ~summary
      (let open Command.Let_syntax in
      let%map_open () = return () in
      fun () -> f ())
  ;;
end
