open Core

let print_value_to channel value = fprintf channel "%s\n" (Ast.show_myfile value)

let parse_and_print ?(channel = Out_channel.stdout) () ~input ~filename =
  match Parselib.parse_with_err ~input ~filename with
  | Some value -> print_value_to channel value
  (* parse_and_print lexbuf *)
  | None -> ()
;;

let loop filename () =
  let ic = In_channel.create filename in
  let () = parse_and_print () ~input:(In_channel.read_all filename) ~filename in
  In_channel.close ic
;;

let () =
  Command.basic_spec
    ~summary:"Parse myfile"
    Command.Spec.(empty +> anon ("filename" %: string))
    loop
  |> Command_unix.run
;;
