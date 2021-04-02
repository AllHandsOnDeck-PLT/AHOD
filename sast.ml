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

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr

type saction_decl = {
  sentitytyp : typ;
  sentityid : string;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sprogram = sstmt * saction_decl list