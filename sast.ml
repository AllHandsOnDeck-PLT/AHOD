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
  | SPrintCall of sexpr  
  | SActionCall of string * sexpr list  
  | SId of string
  | SAssign of string * sexpr
  (* | SAttrAssign of string * string * sexpr *)
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SPlayerClassCall of sexpr list
  | SCardClassCall of sexpr list
  | SAttrCall of string * string 
  | SNoexpr

type sstmt =
  | SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt 
  | SFor of sexpr * sexpr * sexpr * sstmt
  (* | SForLit of string * sexpr * sstmt  *)
  | SWhile of sexpr * sstmt
  | SSeriesPush of string * sexpr 
  | SNostmt

type smain_decl = {
  smtyp : typ; 
  smparams : bind list; 
  smlocals : bind list;
  smbody: sstmt list;
}

type saction_decl = {
  (* sentitytyp : typ;
  sentityid : string; *)
  saname : string;
  satyp : typ; 
  saparams : bind list;
  salocals : bind list;
  sabody: sstmt list;
}

type sprogram = bind list * saction_decl list * smain_decl 

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
  | SPrintCall(e) -> "do" ^ "PRINT" ^ "(" ^ string_of_sexpr e ^ ")"
  | SActionCall(f, el) ->
  "do " ^f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SPlayerClassCall(el) ->
    "Player (" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SCardClassCall(el) ->
    "Card (" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SAttrCall(cls,fld) -> cls ^ "." ^ fld
  | SId(s) -> s
  | SAssign(v, e) -> v ^ " = " ^ string_of_sexpr e
  (* | SAttrAssign(s, v, e) ->  s ^ "." ^ v ^ " = " ^ string_of_sexpr e *)
  | SBinop(e1, o, e2) ->
      string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SNoexpr -> "")
  
let rec string_of_sstmt = function
  SBlock(stmts) -> "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "\n}"
  | SExpr(exp) -> string_of_sexpr exp ^ "\n"
  | SReturn(exp) -> "return" ^ string_of_sexpr exp ^ "\n"
  | SIf(exp, s1, s2) -> "if " ^ string_of_sexpr exp  ^ ":\n" ^ string_of_sstmt s1 ^ string_of_sstmt s2
  | SFor(e1, e2, e3, s) -> "for (" ^ string_of_sexpr e1 ^ ";" ^  string_of_sexpr e2 ^ ";" ^ 
                    string_of_sexpr e3 ^ "):\n" ^ string_of_sstmt s
  | SWhile(exp, stmt) -> "while " ^ string_of_sexpr exp ^ ":\n" ^ string_of_sstmt stmt
  | SSeriesPush(id, exp) -> id ^ "." ^ "push" ^ "(" ^ string_of_sexpr exp ^ ")"
  | SNostmt -> ""