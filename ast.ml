(* Abstract Syntax Tree and functions for printing it *)

type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or | Mod | Power | Floor

type uop = Neg | Not

type typ = Int | Bool | String | Float | None | ClassID | TemplateClass of string * typ

type bind = typ * string

type expr =
  | Iliteral of int
  | Seriesliteral of expr list
  (* | Comprehension of expr * string * expr *)
  | Dottedrange of expr * expr * bool
  | Fliteral of string
  | Sliteral of string
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

type class_decl = {
  cname : string;
  cparams : bind list;
  ctyp : typ;
  cargs : expr list;
  helpers : helper_decl list;
  attributes : attr_decl list;
}

(* can we have 2 cases of records *)

type program = {
  main : stmt;
  classes : class_decl list;
  actions : action_decl list;
  helpers : helper_decl list;
}

(*------------------------------------------------------------*)

(*let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Equal -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"
  | Mod -> "%"
  | Power -> "**"
  | Floor -> "//"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_expr = function
    Iliteral(l) -> string_of_int l
  (*| Seriesliteral(l) -> (List.map string_of_expr el)*)
  | Fliteral(l) -> l
  | Sliteral(l) -> l
  | Boollit(true) -> "True"
  | Boollit(false) -> "False"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  (*| Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"*)
  | Noexpr -> ""
  | _ -> ""
*)

  (*| Dottedrange of expr * expr * bool
  | HelperCall of string * expr list
  | ActionCall of string * expr list
  | ExprActionCall of expr * string * expr list*)

