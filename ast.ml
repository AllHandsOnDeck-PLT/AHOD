type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type typ = Int | Float | Bool | String | None | ClassID

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | ActionCall of string * expr list
  | ExprActionCall of expr * string * expr list
  | Id of string
  | Assign of string * expr
  | Binop of expr * op * expr
  | ClassCall of string * expr list
  | AttrCall of string * string 
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt 
  | For of string * expr * stmt 
  | While of expr * stmt

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
  aname : string;
  typ : typ; 
  aparams : bind list;
  abody: stmt;
}

type class_decl = {
  cname : string;
  cparams : bind list;
  actions : action_decl list;
  attributes : attr_decl list;
}

(* type program = bind list * class_decl list * stmt *)
type program = bind list * action_decl list * stmt

let string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Float -> "float"
  | String -> "string"