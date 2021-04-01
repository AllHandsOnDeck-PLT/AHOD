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
  entitytyp : typ option;
  entityid : string option;
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

(*  Pretty-printing functions *)
let string_of_op = function
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
  | And -> "and"
  | Or -> "or"
  | Mod -> "%"
  | Power -> "**"
  | Floor -> "//"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"


  let rec string_of_expr = function
  | ActionCall(f, el) ->
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | ExprActionCall(e, f, el) -> (* most likely wrong format *)
      string_of_expr e ^ "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""
  | Sliteral(s) -> s


let rec string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Float -> "float"
  | String -> "string"
  | None -> "none"
  | ClassID -> "classid"
  | TemplateClass(s, t) -> s ^ string_of_typ t 

(*
let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parse.expr Scanner.tokenize lexbuf in
  let result = eval expr in
  print_endline (string_of_int result)
*)
