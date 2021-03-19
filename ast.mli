(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or | Mod | Power | Floor

type uop = Neg | Not

type typ = Int | Bool | Float | None 

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

(*type class_decl = 
  | Cdecl of string * bind list * typ * stmt list * stmt*)

type class_decl = {
  a : string;
  b : bind list;
  c : typ;
  d : stmt list;
  e : stmt;
}

type helper_decl = 
  | Hdecl of string * bind list * stmt

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type main_decl = stmt

(*type program = bind list * func_decl list * class_decl list*)

type program = 
  | Program of main_decl * class_decl list * helper_decl list
(*type program = main_decl * class_decl list * action_decl list * helper_decl list*)

(*type program = unit*)


(*
We needa figure out how this works lmao
--------------------
Extra questions: 
 - series literal be changed to list literal so there's consistency (else there should also be stack literal)

 To do for next week: 
 - figure out how to call all of the parse file in program 
 - there will be midpoint check-in on Tuesday! 

Jang:
- if
- elif
- else
- typ

Christi:
- Data structure (series, ) 
- For
- while

Tiff:
- decl
- class + param + arg

Mara:
- expr
- call_*
- stmt

*)