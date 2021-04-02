type typ = Int | Float | Bool | String 

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | ActionCall of string * expr list

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

