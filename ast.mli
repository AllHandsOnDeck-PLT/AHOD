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
  | Call of string * expr list
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt 
  | ForId of expr * stmt (* not 100% sure if first expr is correct because it's ID*)
  (* | ForTimes of expr * stmt *)
  | While of expr * stmt
  | Noexpr

type helper_decl = 
  | OneHdecl of string * bind list * expr 
  | MultiHdecl of string * bind list * stmt

type action_decl = 
  | Nahadecl of string * bind list * stmt
  | Yesadecl of typ * string * string * bind list * stmt

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

(*type program = bind list * func_decl list*)
type program = Program of stmt * action_decl list * helper_decl list

(*type program = unit*)
