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

type func_decl = {
  typ : typ;
  fname : string;
  formals : bind list;
  locals : bind list;
  body : stmt list;
  }

type class_decl = {
  cname : string;
  cparams : bind list;
  ctyp : typ;
  cargs : expr list;
  helpers : helper_decl list;
  attributes : attr_decl list;
}

(* can we have 2 cases of records *)

type program = 
func_decl list
(* {
  main : stmt;
  classes : class_decl list;
  actions : action_decl list;
  helpers : helper_decl list;
} *)


(* let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs) *)
