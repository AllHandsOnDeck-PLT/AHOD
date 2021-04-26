(* Ocamllex scanner for AHOD *)
{ open Parse }

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' ] { token lexbuf } (* Whitespace *)
| '#'     { comment lexbuf }           (* Comments *)
| ('\n' [' ']*)+	   { NEWLINE }
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LSQUARE }
| ']'      { RSQUARE }
| "add"    { SERIESADD }
| "series" { SERIES }
(*| '<'      { LBRACK }*)
(*| '>'      { RBRACK }*)
| ':'      { COLON }
| ';'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { MULT }
| '/'      { DIVIDE }
| '%'      { MOD }
| "**"     { POWER }
| '.'      { DOT }
| ".."     { DOTDOT }
| "..."    { DOTDOTDOT }
| '='      { ASSIGN }
| "=="     { EQ }
| "!="     { NEQ }
| "<"      { LT }
| ">"      { GT }
| "<="     { LEQ }
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
| "times"  { TIMES }
| "pass"   { PASS }
| "const"  { CONST }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "string" { STRING }
| "float"  { FLOAT }
| "None"   { NONE }
| "external" { EXTERNAL }
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| "PRINT"   { PRINT }
| "main"   { MAIN }
| digits as lxm { ILIT(int_of_string lxm) }
| ['-']? (digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )?) as lxm { FLIT(lxm) }
(*| [('"' _* '"') (''' _* ''')] as  lxm { SLIT(lxm) }*)
| '"' ([' '-'!' '#'-'&' '('-'[' ']'-'~' 'a'-'z'' ' 'A'-'Z' '0'-'9']* as lxm) '"' { SLIT(lxm) }
(* | '"' (['a'-'z' 'A'-'Z' '0'-'9']* as lxm) '"' { SLIT(lxm) } *)
(*| '"' [' '-'!' '#'-'&' '('-'[' ']'-'~' 't' 'r' 'n' '\'' '"' '\\']* as lxm '"' { SLIT(lxm) }*)
(* how to represent single apostrophe?*)
| ['a'-'z']['a'-'z' '0'-'9' '_']*                     as lxm { ID(lxm) } 
| ['A'-'Z']['A'-'Z' '0'-'9' '_']*                     as actionID { ACTIONID(actionID) }
| ['A'-'Z']['a'-'z' '0'-'9']*                     as classID { CLASSID(classID) } 
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '\n' { token lexbuf }
| _    { comment lexbuf }
