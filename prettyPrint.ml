(*  Pretty-printing functions *)
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
      string_of_expr e1 ^ ".. " ^ string_of_expr e2 (*wronng format*)
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
  | ExprActionCall(e, f, el) ->
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let expr = Parse.expr Scanner.token lexbuf in 
  let result = string_of_expr expr in
  print_endline (result)