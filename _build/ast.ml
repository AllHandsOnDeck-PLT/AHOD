type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type typ = Int | Float | Bool | String | ClassID

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | ActionCall of string * expr list
  | Id of string
  | Assign of bind * expr
  | Binop of expr * op * expr
  | ClassCall of string * expr list

type stmt =
  | Block of stmt list
  | Expr of expr

type global_decl = bind

type attr_decl = 
  | OneAdecl of typ * string * expr 

type class_decl = {
  cname : string;
  cparams : bind list;
  attributes : attr_decl list;
}

type action_decl = {
  entitytyp : typ;
  entityid : string;
  aname : string;
  aparams : bind list;
  abody: stmt;
}

type program = stmt * class_decl 

