(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or | Mod | Power | Floor

type uop = Neg | Not

type typ = Int | Bool | Float | None | ClassID | TemplateClass of string * typ

type bind = typ * string

type expr =
  | Iliteral of int
  | Seriesliteral of expr list
  (* | Comprehension of expr * string * expr *)
  | Dottedrange of expr * expr * bool
  | Fliteral of string
  | Boollit of bool
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | ClassCall of string * expr list
  | HelperCall of string * expr list
  | ActionCall of string * expr list
  | ExprActionCall of expr * string * expr list
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt 
  | For of string * expr * stmt 
  | While of expr * stmt
  | Noexpr

type helper_decl = 
  | OneHdecl of string * bind list * expr 
  | MultiHdecl of string * bind list * stmt

(*typ option*)
type attr_decl = 
  | MultiAdecl of typ option * string * stmt
  | OneAdecl of typ option * string * expr 

type action_decl = {
  entitytyp : typ option;
  entityid : string option;
  aname : string;
  aparams : bind list;
  abody: stmt;
}
  (*| Nahadecl of string * bind list * stmt *)

  (*| Adecl of typ option * string option * string * bind list * stmt *)

(*type class_decl = 
  | Cdecl of string * bind list * typ * expr list * helper_decl list * attr_decl list 
*)

type class_decl = {
  cname : string;
  cparams : bind list;
  ctyp : typ;
  cargs : expr list;
  helpers : helper_decl list;
  attributes : attr_decl list;
}

(* can we have 2 cases of records *)

(*type decl = helper_decl | attr_decl | action_decl | class_decl*)

type program = Program of stmt * class_decl list * action_decl list * helper_decl list
(*type program = Program of stmt * class_decl list * action_decl list*)


(* before when wrote it all out Program of stmt * action_decl list * helper_decl list * class_decl list *)
(* ^ how to enable any order of the lists *)
(* in microc, explain bind list in program = bind list * func_decl list (seemed that program got decl, both vdecl and fdecl from parse), why the distinction between bind_list and func_decl list in ast *)

(*type program = Program of stmt * decl list*)

