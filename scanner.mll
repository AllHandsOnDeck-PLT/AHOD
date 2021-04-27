(* Ocamllex scanner for AHOD *)
{ open Parse }

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' ] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| ('\n' [' ']*)+	   { NEWLINE }
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LSQUARE }
| ']'      { RSQUARE }
| "push"   { SERIESPUSH }
| "pop"    { SERIESPOP }
| "size"   { SERIESSIZE }
| "series" { SERIES }
| "Player" { PLAYER }
| "Card"   { CARD }
| ':'      { COLON }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { MULT }
| '/'      { DIVIDE }
| '.'      { DOT }
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| "<"      { LT }
| ">"      { GT }
| "<="     { LEQ }
| ">="     { GEQ }
| "and"    { AND }
| "or"     { OR }
| "not"    { NOT }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "when"   { WHEN }
| "do"     { DO }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "string" { STRING }
| "float"  { FLOAT }
| "void"   { VOID }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| "PRINT"   { PRINT }
| "main"   { MAIN }
| digits as lxm { ILIT(int_of_string lxm) }
| ['-']? (digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )?) as lxm { FLIT(lxm) }
| '"' ([' '-'!' '#'-'&' '('-'[' ']'-'~' 'a'-'z'' ' 'A'-'Z' '0'-'9']* as lxm) '"' { SLIT(lxm) }
| ['a'-'z']['a'-'z' '0'-'9' '_']*                     as lxm { ID(lxm) } 
| ['A'-'Z']['A'-'Z' '0'-'9' '_']*                     as actionID { ACTIONID(actionID) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/"  { CEND }
|  "\n" { token lexbuf }
| _     { comment lexbuf }
