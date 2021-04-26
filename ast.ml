type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type uop = Neg | Not
          
type typ = Int | Float | Bool | String | None | Series of typ

type bind = typ * string

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | Seriesliteral of expr list
  | PrintCall of expr 
  | ActionCall of string * expr list
  | Id of string
  | Assign of string * expr
  | Binop of expr * op * expr
  | Unop of uop * expr
  | SeriesGet of string * expr
  | SeriesSize of string
  | SeriesPop of string
  | Noexpr

type stmt =
  | Block of stmt list
  | Expr of expr
  (* | Return of expr *)
  | If of expr * stmt * stmt 
  | For of expr * expr * expr * stmt
  (* | ForLit of string * expr * stmt  *)
  | While of expr * stmt
  | SeriesPush of string * expr
  | Nostmt

type main_decl = {
  mtyp : typ; 
  mparams : bind list; 
  mlocals : bind list;
  mbody: stmt list;
}

type action_decl = {
  (* entitytyp : typ;
  entityid : string; *)
  atyp : typ; 
  aname : string;
  aparams : bind list;
  alocals : bind list;
  abody: stmt list;
}

type program = bind list * action_decl list * main_decl

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

let string_of_uop = function
  Neg -> "-"
  | Not -> "!"

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
  | Seriesliteral(_) -> "series_literal"
  | PrintCall(e) -> "do" ^ "PRINT" ^ "(" ^ string_of_expr e ^ ")"
  | ActionCall(f, el) ->
  "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Id(s) -> s
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Binop(e1, o, e2) ->
  string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | SeriesGet(id, e) ->  id ^ "[" ^ (string_of_expr e) ^ "]"
  | SeriesSize(id) -> "series_size " ^ id
  | SeriesPop(id) -> "series_pop " ^ id
  | Noexpr -> ""

