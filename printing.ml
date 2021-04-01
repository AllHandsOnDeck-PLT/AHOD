open Ast

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


let rec string_of_expr = function
  | ActionCall(f, el) ->
      "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | ExprActionCall(e, f, el) -> (* most likely wrong format *)
      string_of_expr e ^ "do " ^ f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")"
  | Noexpr -> ""
  | Sliteral(s) -> s


let rec string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Float -> "float"
  | String -> "string"
  | None -> "none"
  | ClassID -> "classid"
  | TemplateClass(s, t) -> s ^ string_of_typ t 

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n"
  | _ -> "bop"


(*let string_of_adecl adecl = 
  "when" ^ " " ^ string_of_typ adecl.entitytyp ^ " " ^ adecl.entityid ^ " do " ^ adecl.aname ^ 
  "(" ^ String.concat ", " (List.map snd adecl.aparams) ^ 
  "):\n{\n" ^ String.concat "" (List.map string_of_stmt adecl.abody) ^"}\n" 
*)

(*let string_of_program (main, action) =
  "main: \n{\n" ^ String.concat "" (List.map string_of_stmt main)^
  "}\n" ^ "\n" ^ String.concat "\n" (List.map string_of_adecl action)
*)

let _ =
  let lexbuf = Lexing.from_channel stdin in
  let stmt = Parse.stmt Scanner.token lexbuf in
  let result = string_of_stmt stmt in
  print_endline (result)