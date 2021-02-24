type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LSQUARE
  | RSQUARE
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
  | FLIT of (string)
  | CONST
  | EOF

open Parsing;;
let _ = parse_error;;
# 4 "parse.mly"
open Ast
# 66 "parse.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* LBRACE *);
  260 (* RBRACE *);
  261 (* LSQUARE *);
  262 (* RSQUARE *);
  263 (* COLON *);
  264 (* COMMA *);
  265 (* PLUS *);
  266 (* MINUS *);
  267 (* TIMES *);
  268 (* DIVIDE *);
  269 (* ASSIGN *);
  270 (* MOD *);
  271 (* POWER *);
  272 (* FLOOR *);
  273 (* DOTDOT *);
  274 (* NEWLINE *);
  275 (* NOT *);
  276 (* EQ *);
  277 (* NEQ *);
  278 (* LT *);
  279 (* LEQ *);
  280 (* GT *);
  281 (* GEQ *);
  282 (* AND *);
  283 (* OR *);
  284 (* IN *);
  285 (* RETURN *);
  286 (* IF *);
  287 (* ELIF *);
  288 (* ELSE *);
  289 (* FOR *);
  290 (* WHILE *);
  291 (* INT *);
  292 (* BOOL *);
  293 (* FLOAT *);
  294 (* NONE *);
  295 (* STRING *);
  296 (* ACTOR *);
  297 (* OBJECT *);
  298 (* STACK *);
  299 (* SERIES *);
  300 (* COLLECTION *);
  301 (* RANGE *);
  302 (* WHEN *);
  303 (* DO *);
  304 (* LET *);
  305 (* BE *);
  306 (* WITH *);
  307 (* NEW *);
  308 (* MAIN *);
  313 (* CONST *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  309 (* LITERAL *);
  310 (* BLIT *);
  311 (* ID *);
  312 (* FLIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\003\000\000\000"

let yylen = "\002\000\
\002\000\002\000\000\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\004\000\000\000\001\000\002\000"

let yydgoto = "\002\000\
\003\000\004\000\006\000"

let yysindex = "\255\255\
\000\000\000\000\000\000\001\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000"

let yytablesize = 1
let yytable = "\001\000\
\005\000"

let yycheck = "\001\000\
\000\000"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LSQUARE\000\
  RSQUARE\000\
  COLON\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  MOD\000\
  POWER\000\
  FLOOR\000\
  DOTDOT\000\
  NEWLINE\000\
  NOT\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  AND\000\
  OR\000\
  IN\000\
  RETURN\000\
  IF\000\
  ELIF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  FLOAT\000\
  NONE\000\
  STRING\000\
  ACTOR\000\
  OBJECT\000\
  STACK\000\
  SERIES\000\
  COLLECTION\000\
  RANGE\000\
  WHEN\000\
  DO\000\
  LET\000\
  BE\000\
  WITH\000\
  NEW\000\
  MAIN\000\
  CONST\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  BLIT\000\
  ID\000\
  FLIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 23 "parse.mly"
              ( _1 )
# 230 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'main_decl) in
    Obj.repr(
# 26 "parse.mly"
                        ( 4 )
# 238 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 30 "parse.mly"
                        (      )
# 244 "parse.ml"
               : 'main_decl))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
