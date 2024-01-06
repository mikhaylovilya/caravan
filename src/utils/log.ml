(* TODO: what if not Core as stdlib? *)
let myfile flag x = if flag then Core.Printf.printf "myfile: %s\n" x
let myfiles flag xs = if flag then Core.List.iter ~f:(myfile true) xs
let str flag x = if flag then Core.Printf.printf "string: %s\n" x
let int flag x = if flag then Core.Printf.printf "int: %d\n" x
let float flag x = if flag then Core.Printf.printf "float: %f\n" x
