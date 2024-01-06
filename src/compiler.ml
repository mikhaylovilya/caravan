(* let () = print_endline "Hello, World!" *)
(* type config = { embox_root : string } *)

let compile ~source ~filename =
  match Parselib.parse_with_err ~source ~filename with
  | Some value -> Genlib.gen [ value ]
  | None -> ()
;;

let loop filename is_dir is_verbose () =
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
    let myfiles =
      find ~name:(Some "*.my") directory @ find ~name:(Some "Mybuild") directory
    in
    let () = Log.myfiles is_verbose myfiles in
    let () = Log.int is_verbose (List.length myfiles) in
    let _ = Core.List.iter ~f:compile_one myfiles in
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
      +> flag "-dir" no_arg ~doc:"compile all sources in given directory"
      +> flag "-v" no_arg ~doc:"more verbose output")
    loop
  |> Command_unix.run
;;
