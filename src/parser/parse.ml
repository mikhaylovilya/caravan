open Core
open Lexing

let print_position channel lexbuf =
  let pos = lexbuf.lex_curr_p in
  fprintf channel "%s:%d:%d" pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)
;;

let parse_with_err lexbuf =
  try Parser.myfile_opt Lexer.read lexbuf with
  | Lexer.Syntax_error msg ->
    fprintf stderr "%a: %s\n" print_position lexbuf msg;
    None
  | Parser.Error ->
    fprintf stderr "%a: Syntax error\n" print_position lexbuf;
    exit (-1)
;;

let print_value_to channel value = fprintf channel "%s\n" (Ast_myfile.show_myfile value)

let parse_and_print ?(channel = Out_channel.stdout) lexbuf =
  match parse_with_err lexbuf with
  | Some value -> print_value_to channel value
  (* parse_and_print lexbuf *)
  | None -> ()
;;

let loop filename () =
  let ic = In_channel.create filename in
  let lexbuf = Lexing.from_channel ic in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
  let _ = parse_and_print lexbuf in
  In_channel.close ic
;;

let () =
  Command.basic_spec
    ~summary:"Parse myfile"
    Command.Spec.(empty +> anon ("filename" %: string))
    loop
  |> Command_unix.run
;;
