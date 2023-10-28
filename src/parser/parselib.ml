open Core
open Lexing

type input = string

(* type 'a parse_result =
   | Failed of string
   | Parsed of 'a

   type 'a parser = input -> 'a parse_result

   let f = Parser.myfile_opt Lexer.read *)

let print_position channel lexbuf =
  let pos = lexbuf.lex_curr_p in
  fprintf channel "%s:%d:%d" pos.pos_fname pos.pos_lnum (pos.pos_cnum - pos.pos_bol + 1)
;;

let parse_with_err ~input ~filename =
  let lexbuf = Lexing.from_string input in
  lexbuf.lex_curr_p <- { lexbuf.lex_curr_p with pos_fname = filename };
  try Parser.myfile_opt Lexer.read lexbuf with
  | Lexer.Syntax_error msg ->
    fprintf stderr "%a: %s\n" print_position lexbuf msg;
    None
  | Parser.Error ->
    fprintf stderr "%a: Syntax error\n" print_position lexbuf;
    exit (-1)
;;

let parse_workspace_with_err ~input_filename_list =
  List.map
    ~f:(fun (input, filename) -> parse_with_err ~input ~filename)
    input_filename_list
;;
