(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or | Mod | Power | Floor

type uop = Neg | Not

type typ = Int | Bool | Float | None

type bind = typ * string

(*type Stack = typ*)

type expr =
    Literal of int
  | Fliteral of string
  | BoolLit of bool
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

(*
We needa figure out how this works lmao
--------------------
Jang:
- if
- elif
- else
- typ

Christi:
- Data structure
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
type program = unit(*bind list * func_decl list*)