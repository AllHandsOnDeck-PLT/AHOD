type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LSQUARE
  | RSQUARE
  | SERIESSIZE
  | SERIESPUSH
  | SERIESPOP
  | SERIES
  | CARD
  | PLAYER
  | COLON
  | SEMI
  | COMMA
  | PLUS
  | MINUS
  | MULT
  | DIVIDE
  | ASSIGN
  | FLOOR
  | DOT
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
  | RETURN
  | IF
  | ELIF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | FLOAT
  | VOID
  | STRING
  | RANGE
  | WHEN
  | DO
  | LET
  | BE
  | WITH
  | MAIN
  | PRINT
  | TIMES
  | CONST
  | CEND
  | ILIT of (int)
  | BLIT of (bool)
  | ID of (string)
  | ACTIONID of (string)
  | FLIT of (string)
  | SLIT of (string)
  | EOF

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
