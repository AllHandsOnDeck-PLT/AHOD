(* Semantically-checked Abstract Syntax Tree and functions for printing it *)

open Ast

type sexpr = typ * sx

and sx =
  | SSliteral of string
  | SActionCall of string * sexpr list
  | SExprActionCall of sexpr * string * sexpr list
  | SNoexpr

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr
  | SNoexpr

type saction_decl = {
  sentitytyp : typ option;
  sentityid : string option;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sprogram = sstmt * saction_decl

(*type sprogram = {
  smain : sstmt;
  saction : saction_decl;
}*)
(* let string_of_sprogram (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs) *)
