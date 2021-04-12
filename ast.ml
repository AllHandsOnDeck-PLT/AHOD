type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type typ = Int | Float | Bool | String | None | List of typ

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | Seriesliteral of expr list
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

