open Core

(* open Core_unix *)
(* open Graph.Persistent.Graph *)

type t = Ast.myfile

(* let embox_root = "/home/cy/Desktop/ocaml-rep/embox" *)
let embox_root = "/home/cy/Desktop/ocaml-rep/caravan"

let gen_package package =
  let _ = package in
  let _ = String.concat ~sep:"/" package |> Core_unix.mkdir_p in
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

let gen trees =
  List.iter
    ~f:(fun (package, imports, entities) ->
      match gen_package package, gen_imports imports, gen_entities entities with
      | Result.Ok (), Ok (), Ok () -> ()
      | _ -> ())
    trees
;;
