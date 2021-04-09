open Ast

type sexpr = typ * sx

and sx =
  | SIliteral of int
  | SFliteral of string
  | SBliteral of bool
  | SSliteral of string
  | SActionCall of string * sexpr list  
  | SExprActionCall of sexpr * string * sexpr list
  | SId of string
  | SAssign of string * sexpr
  | SBinop of sexpr * op * sexpr
  | SClassCall of string * sexpr list
  | SAttrCall of string * string 
  | SNoexpr

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt 
  | SFor of string * sexpr * sstmt 
  | SWhile of sexpr * sstmt

type sattr_decl = 
  | SOneAdecl of typ * string * sexpr 

type saction_decl = {
  sentitytyp : typ;
  sentityid : string;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sclass_decl = {
  scname : string;
  scparams : bind list;
  sactions : saction_decl list;
  sattributes : sattr_decl list;
}

type sprogram = bind list * sclass_decl list * sstmt 
