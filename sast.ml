open Ast

type sexpr = typ * sx

and sx =
  | SIliteral of int
  | SFliteral of string
  | SBliteral of bool
  | SSliteral of string
  | SSeriesliteral of typ * sexpr list
  | SSeriesGet of typ * string * sexpr
  | SSeriesSize of typ * string
  | SSeriesPop of typ * string
  | SActionCall of string * sexpr list
  | SId of string
  | SAssign of string * sexpr
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SNoexpr

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt 
  | SFor of sexpr * sexpr * sexpr * sstmt
  | SForLit of string * sexpr * sstmt 
  | SWhile of sexpr * sstmt
  | SSeriesPush of string * sexpr 

type saction_decl = {
  sentitytyp : typ;
  sentityid : string;
  saname : string;
  saparams : bind list;
  sabody: sstmt;
}

type sprogram = bind list * saction_decl list * sstmt 

(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_typ t ^ " : " ^ (match e with
    SIliteral(l) -> string_of_int l
  | SFliteral(l) -> l
  | SBliteral(true) -> "true"
  | SBliteral(false) -> "false"
  | SSliteral(l) -> l
  | SSeriesliteral(_) -> "list_literal"
  | SSeriesGet(_, id, e) -> id ^ "[" ^ (string_of_sexpr e) ^ "]"
  | SSeriesSize(_, id) -> "series_size " ^ id
  | SSeriesPop(_, id) -> "series_pop " ^ id
  | SActionCall(f, el) ->
  "do " ^f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SId(s) -> s
  | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
  | SBinop(e1, o, e2) ->
      string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SNoexpr -> ""
          ) ^ ")"  