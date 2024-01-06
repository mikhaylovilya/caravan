(* open Core_unix *)
(* open Graph.Persistent.Graph *)

open Ast

type t = myfile

(* let embox_root = "/home/cy/Desktop/ocaml-rep/embox" *)
(* TODO: make pure *)
let path_embox_build_base_gen =
  "/home/cy/Desktop/ocaml-rep/caravan/test/backend_test_local/caravan_build/base/gen"
;;

let gen_package package =
  let _ = package in
  let dir = Core.String.concat ~sep:"/" (path_embox_build_base_gen :: package) in
  (* let _ = Core.Printf.printf "%s\n" cat in *)
  let _ = Core_unix.mkdir_p dir in
  Result.Ok ()
;;

let gen_imports imports =
  let _ = imports in
  Result.Ok ()
;;

let gen_entities entities =
  let _ = entities in
  Result.Ok ()
;;

let gen (trees : t list) =
  Core.List.iter
    ~f:(fun (package, imports, entities) ->
      let unwrap_package =
        match package with
        | Some x -> x
        | None -> []
      in
      match gen_package unwrap_package, gen_imports imports, gen_entities entities with
      | Result.Ok (), Ok (), Ok () -> ()
      | _ -> ())
    trees
;;
