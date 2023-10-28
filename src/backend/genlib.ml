(* open Core_unix *)
(* open Graph.Persistent.Graph *)

open Ast

type t = myfile

(* let embox_root = "/home/cy/Desktop/ocaml-rep/embox" *)
(* TODO: make pure *)
let embox_root = "/home/cy/Desktop/ocaml-rep/caravan"

let gen_package package =
  let _ = package in
  let cat = Core.String.concat ~sep:"/" (embox_root :: package) in
  (* let _ = Core.Printf.printf "%s\n" cat in *)
  let _ = Core_unix.mkdir_p cat in
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
