(* Semantically-checked Abstract Syntax Tree and functions for printing it *)

open Ast

type sexpr = typ * sx

and sx =
  | SIliteral of int
  | SSeriesliteral of sexpr list
  (* | Comprehension of expr * string * expr *)
  | SDottedrange of sexpr * sexpr * bool
  | SFliteral of string
  | SBoollit of bool
  | SId of string
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SAssign of string * sexpr
  | SClassCall of string * sexpr list
  | SHelperCall of string * sexpr list
  | SActionCall of string * sexpr list
  | SExprActionCall of sexpr * string * sexpr list
  | SNoexpr

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt 
  | SFor of string * sexpr * sstmt 
  | SWhile of sexpr * sstmt
  | SNoexpr

type shelper_decl = 
  | SOneHdecl of string * bind list * sexpr 
  | SMultiHdecl of string * bind list * sstmt

type sattr_decl = 
  | SMultiAdecl of typ option * string * sstmt
  | SOneAdecl of typ option * string * sexpr 

type saction_decl = {
  sentitytyp : typ option;
  sentityid : string option;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sclass_decl = {
  scname : string;
  scparams : bind list;
  sctyp : typ;
  scargs : sexpr list;
  shelpers : shelper_decl list;
  sattributes : sattr_decl list;
}

(* can we have 2 cases of records *)

type sprogram = {
  smain : sstmt;
  sclasses : sclass_decl list;
  sactions : saction_decl list;
  shelpers : shelper_decl list;
}