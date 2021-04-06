<<<<<<< HEAD
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

  (*questions regarding dotted range: there's dotdotdot and i thought ta said to avoid?? 
  didn't define in pretty print for that reason just yet 
  *)

  let rec string_of_expr = function
    Iliteral(l) -> string_of_int l
  | Seriesliteral(exprs) -> 
      "[" ^ String.concat ", " (List.map string_of_expr exprs) ^ "]"
  | Dottedrange(e1, e2, true) -> 
      string_of_expr e1 ^ ".. " ^ string_of_expr e2 (*wrong format*)
  | Dottedrange(e1, e2, false) -> 
      string_of_expr e1 ^ "..." ^ string_of_expr e2 (*thought we werent including this?*)
  | Fliteral(l) -> l
  | Boollit(true) -> "True"
  | Boollit(false) -> "False"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | ClassCall(f, el) ->
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | HelperCall(f, el) ->
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | ActionCall(f, el) ->
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | ExprActionCall(e, f, el) -> (* most likely wrong format *)
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""

  (*attempt to do command line *)
  (*
  let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parse.expr Scanner.token lexbuf in 
  let result = string_of_expr expr in
  print_endline (result)

  *)
=======
type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type typ = Int | Float | Bool | String 

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | ActionCall of string * expr list
  | Id of string
  | Assign of string * expr
  | Binop of expr * op * expr

type stmt =
  | Block of stmt list
  | Expr of expr

type action_decl = {
  entitytyp : typ;
  entityid : string;
  aname : string;
  aparams : bind list;
  abody: stmt;
}

type program = stmt * action_decl list 

>>>>>>> c05578d194d1d87335d6ca67c011f38411b810a5
