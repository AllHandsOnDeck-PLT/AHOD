type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or | Mod

type typ = Int | Float | Bool | String | None | ClassID | Series of typ

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | Seriesliteral of expr list
  | ActionCall of string * expr list
  | ExprActionCall of expr * string * expr list
  | Id of string
  | Assign of string * expr
  | Binop of expr * op * expr (*need to add binop*)
  | ClassCall of string * expr list
  | AttrCall of string * string 
  | SeriesGet of string * expr
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt 
  | For of expr * expr * expr * stmt
  | ForLit of string * expr * stmt 
  | While of expr * stmt
  | SeriesAdd of string * expr

type attr_decl = 
  | OneAdecl of typ * string * expr 

(*type class_decl = {
  cname : string;
  cparams : bind list;
  attributes : attr_decl list;
}*)

type action_decl = {
  entitytyp : typ;
  entityid : string;
  atyp : typ; 
  aname : string;
  aparams : bind list;
  alocals : bind list;
  abody: stmt list;
}

type class_decl = {
  cname : string;
  cparams : bind list;
  actions : action_decl list;
  attributes : attr_decl list;
}

(* type program = bind list * class_decl list * stmt *)
type program = bind list * action_decl list * stmt

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

let rec string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Float -> "float"
  | String -> "string"
  | None -> "none"
  | Series x -> "series<" ^ (string_of_typ x) ^ ">"

let rec string_of_expr = function
    Iliteral(l) -> string_of_int l
  | Fliteral(l) -> l
  | Bliteral(true) -> "true"
  | Bliteral(false) -> "false"
  | Sliteral(l) -> l
  | SeriesGet(id, e) ->  id ^ "[" ^ (string_of_expr e) ^ "]"
  | Seriesliteral(_) -> "series_literal"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | ActionCall(f, el) ->
    "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""
