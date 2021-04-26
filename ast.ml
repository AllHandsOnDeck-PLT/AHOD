type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or 

type uop = Neg | Not
          
type typ = Int | Float | Bool | String | None | Series of typ | Player | Card

type bind = typ * string
          

type expr =
  | Iliteral of int
  | Fliteral of string
  | Bliteral of bool
  | Sliteral of string
  | Seriesliteral of expr list
  | PrintCall of expr 
  | ActionCall of string * expr list
  | ExprActionCall of expr * string * expr list
  | Id of string
  | Assign of string * expr
  | Binop of expr * op * expr
  | Unop of uop * expr
  | PlayerClassCall of expr list
  | CardClassCall of expr list
 (*| ClassCall of string * expr list*)
  | AttrCall of string * string 
  | SeriesGet of string * expr
  | SeriesSize of string
  | SeriesPop of string
  | Noexpr


type stmt =
  | Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt 
  | For of expr * expr * expr * stmt
  | ForLit of string * expr * stmt 
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
  | Player -> "player"
  | Card -> "card"

let rec string_of_expr = function
    Iliteral(l) -> string_of_int l
  | Fliteral(l) -> l
  | Bliteral(true) -> "true"
  | Bliteral(false) -> "false"
  | Sliteral(l) -> l
  | SeriesGet(id, e) ->  id ^ "[" ^ (string_of_expr e) ^ "]"
  | Seriesliteral(_) -> "series_literal"
  | ActionCall(f, el) ->
  "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Id(s) -> s
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Binop(e1, o, e2) ->
  string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | SeriesSize(id) -> "series_size " ^ id
  | SeriesPop(id) -> "series_pop " ^ id
  | Noexpr -> ""
  | ExprActionCall(exp, f, el) ->
    string_of_expr exp ^ "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | AttrCall(f, el) ->
    f ^ "." ^ el

let rec string_of_stmt = function
  Block(stmts) -> "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "\n}"
  | Expr(exp) -> string_of_expr exp ^ "\n"
  | Return(exp) -> "return" ^ string_of_expr exp ^ "\n"
  | If(exp, s1, s2) -> "if " ^ string_of_expr exp  ^ ":\n" ^ string_of_stmt s1 ^ string_of_stmt s2
  | For(e1, e2, e3, s) -> "for (" ^ string_of_expr e1 ^ ";" ^  string_of_expr e2 ^ ";" ^ 
                      string_of_expr e3 ^ "):\n" ^ string_of_stmt s
  | While(exp, stmt) -> "while " ^ string_of_expr exp ^ ":\n" ^ string_of_stmt stmt
  | SeriesPush(id, exp) -> id ^ "." ^ "push" ^ "(" ^ string_of_expr exp ^ ")"