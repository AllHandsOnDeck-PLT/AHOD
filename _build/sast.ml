open Ast

type sexpr = typ * sx

and sx =
  | SIliteral of int
  | SFliteral of string
  | SBliteral of bool
  | SSliteral of string
  | SActionCall of string * sexpr list
  | SId of string
  | SAssign of string * sexpr
  | SBinop of sexpr * op * sexpr
  | SClassCall of string * sexpr list

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr

type sattr_decl = 
  | SOneAdecl of typ * string * sexpr 

type sclass_decl = {
  scname : string;
  scparams : bind list;
  sattributes : sattr_decl list;
}

type saction_decl = {
  sentitytyp : typ;
  sentityid : string;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sprogram = sstmt * bind list * sclass_decl list