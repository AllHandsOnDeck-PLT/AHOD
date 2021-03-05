(* Ocamllex scanner for AHOD *)
{ open Parse }

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' ] { token lexbuf } (* Whitespace *)
| '#'     { comment lexbuf }           (* Comments *)
| "\n"	   { NEWLINE }
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LSQUARE }
| ']'      { RSQUARE }
| '<'      { LBRACK }
| '>'      { RBRACK }
| ':'      { COLON }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { MULT }
| '/'      { DIVIDE }
| '%'      { MOD }
| "**"     { POWER }
| ".."     { DOTDOT }
| "..."     { DOTDOTDOT }
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
| "times"  { TIMES }
| "pass"   { PASS }
| "const"  { CONST }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "string" { STRING }
| "float"  { FLOAT }
| "None"   { NONE }
| "True"   { BLIT(true)  }
| "False"  { BLIT(false) }
| "main"   { MAIN }
| digits as lxm { ILIT(int_of_string lxm) }
| ['-']? (digits '.'  digit* ( ['e' 'E'] ['+' '-']? digits )?) as lxm { FLIT(lxm) }
(*| [('"' _* '"') (''' _* ''')] as  lxm { SLIT(lxm) }*)
| ['a'-'z']['a'-'z' '0'-'9' '_']*                     as lxm { ID(lxm) } 
| ['A'-'Z']['A'-'Z' '0'-'9' '_']*                     as actionID { ACTIONID(actionID) }
| ['A'-'Z']['a'-'z' 'A'-'Z' '0'-'9']*                     as classID { CLASSID(classID) } 
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '\n' { token lexbuf }
| _    { comment lexbuf }

(* THINGS TO IMPLEMENT
- String Literals
- Figure out if other "ID"s are needed i.e. other IDs in general..?
  - Class ID: Start w/ capital, everything else lower. Doesn't have under_score
- Should have a series literal i.e. []
  - This detection may be specified in the AST

*)