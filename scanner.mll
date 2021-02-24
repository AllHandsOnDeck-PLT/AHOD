(* Ocamllex scanner for AHOD *)
(* associativity only useful for multiple expressions*)
{ open Parse }


let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| '#'     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LSQUARE }
| ']'      { RSQUARE }
| ':'      { COLON }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '%'      { MOD }
| "**"     { POWER }
(*
| ".."     { DOTDOT }
*)
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "//"     { FLOOR }		
| "and"    { AND }
| "or"     { OR }
| "not"    { NOT }
| "if"     { IF }
| "elif"   { ELIF }
| "else"   { ELSE }
| "for"    { FOR }
| "in"     { IN }
| "while"  { WHILE }
| "when"   { WHEN }
| "do"     { DO }
| "let"    { LET }
| "be"     { BE }
| "with"   { WITH }
| "const"  { CONST }
| "new"	   { NEW }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "String" { STRING }
| "float"  { FLOAT }
| "Actor"  { ACTOR }
| "Object" { OBJECT }
| "Collection" { COLLECTION }
| "Series" { SERIES }
| "Stack"  { STACK }
| "none"   { NONE }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| "main"   { MAIN }
| digits as lxm { LITERAL(int_of_string lxm) }
| digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )? as lxm { FLIT(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*     as lxm { ID(lxm) }
(*
| ['a'-'z']+                                          as var { VAR(var) } 
| ['A'-'Z']+                                          as actionID { ACTIONID(actionId) }
*)
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '\n' { token lexbuf }
| _    { comment lexbuf }
