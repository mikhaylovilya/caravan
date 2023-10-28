(* let () = print_endline "Hello, World!" *)

(* type config = { embox_root : string } *)
let compile ~input ~filename =
  match Parselib.parse_with_err ~input ~filename with
  | Some value -> Genlib.gen [ value ]
  | None -> ()
;;

let loop filename () =
  let open Core in
  let ic = In_channel.create filename in
  let _ = compile ~input:(In_channel.read_all filename) ~filename in
  In_channel.close ic
;;

let () =
  Core.Command.basic_spec
    ~summary:"Compile myfile"
    Command.Spec.(empty +> anon ("filename" %: string))
    loop
  |> Command_unix.run
;;
