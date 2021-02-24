type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LSQUARE
  | RSQUARE
  | STICK
  | COLON
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | MOD
  | POWER
  | FLOOR
  | DOTDOT
  | NEWLINE
  | NOT
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | AND
  | OR
  | IN
  | RETURN
  | IF
  | ELIF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | FLOAT
  | NONE
  | STRING
  | ACTOR
  | OBJECT
  | STACK
  | SERIES
  | COLLECTION
  | RANGE
  | WHEN
  | DO
  | LET
  | BE
  | WITH
  | NEW
  | MAIN
  | LITERAL of (int)
  | BLIT of (bool)
  | ID of (string)
  | ACTIONID of (string)
  | FLIT of (string)
  | CONST
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
