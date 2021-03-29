open Ast

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
  | And -> "&&"
  | Or -> "||"
  | Mod -> "%"
  | Power -> "**"
  | Floor -> "//"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

let rec string_of_expr = function
    Iliteral(l) -> string_of_int l
  (*| Seriesliteral(l) -> (List.map string_of_expr el)*)
  | Fliteral(l) -> l
  | Sliteral(l) -> l
  | Boollit(true) -> "True"
  | Boollit(false) -> "False"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  (*| Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"*)
  | Noexpr -> ""
  | _ -> ""

      
let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parse.expr Scanner.tokenize lexbuf in
  let result = eval expr in
  print_endline (string_of_int result)