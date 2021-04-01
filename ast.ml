(* Abstract Syntax Tree and functions for printing it *)


type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or | Mod | Power | Floor

type uop = Neg | Not

type typ = Int | Bool | Float | String | None | ClassID | TemplateClass of string * typ

type bind = typ * string

type expr =
  | Sliteral of string
  | ActionCall of string * expr list
  | ExprActionCall of expr * string * expr list
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  | Noexpr

type action_decl = {
  entitytyp : typ;
  entityid : string;
  aname : string;
  aparams : bind list;
  abody: stmt;
}

type program = stmt * action_decl

(*type program = 
{
  main : stmt;
  action: action_decl;
} *)


(* let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs) *)

