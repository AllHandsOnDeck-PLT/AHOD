open Ast

type sexpr = typ * sx

and sx =
  | SSliteral of string
  | SActionCall of string * sexpr list

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