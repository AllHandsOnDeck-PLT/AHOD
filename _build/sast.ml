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
  | SNoexpr

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt 
  | SFor of string * sexpr * sstmt 
  | SWhile of sexpr * sstmt
  | SNoexprexpr

type saction_decl = {
  sentitytyp : typ;
  sentityid : string;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sprogram = sstmt * bind list * saction_decl list
