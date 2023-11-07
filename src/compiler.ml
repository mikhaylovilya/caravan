(* let () = print_endline "Hello, World!" *)
(* type config = { embox_root : string } *)
let compile ~source ~filename =
  match Parselib.parse_with_err ~source ~filename with
  | Some value -> Genlib.gen [ value ]
  | None -> ()
;;

let loop filename is_dir () =
  let open Core in
  let compile_one filename =
    let ic = In_channel.create filename in
    let _ = compile ~source:(In_channel.read_all filename) ~filename in
    In_channel.close ic
  in
  let compile_many directory =
    let _ = directory in
    let open Stuff in
    let _ = readdir_r in
    ()
  in
  if is_dir then compile_many filename else compile_one filename
;;

let () =
  Core.Command.basic_spec
    ~summary:"Compile myfile/Compile myfiles"
    Command.Spec.(
      empty
      +> anon ("filename" %: string)
      +> flag "-dir" no_arg ~doc:"compile all sources in given directory")
    loop
  |> Command_unix.run
;;
