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
  | MULT
  | DIVIDE
  | ASSIGN
  | MOD
  | POWER
  | FLOOR
  | DOT
  | DOTDOT
  | DOTDOTDOT
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
  | RANGE
  | WHEN
  | DO
  | EXTERNAL
  | LET
  | BE
  | WITH
  | PASS
  | MAIN
  | TIMES
  | CONST
  | ILIT of (int)
  | BLIT of (bool)
  | ID of (string)
  | ACTIONID of (string)
  | CLASSID of (string)
  | FLIT of (string)
  | SLIT of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parse.mly"
	open Ast
# 68 "parse.ml"
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
  267 (* MULT *);
  268 (* DIVIDE *);
  269 (* ASSIGN *);
  270 (* MOD *);
  271 (* POWER *);
  272 (* FLOOR *);
  273 (* DOT *);
  274 (* DOTDOT *);
  275 (* DOTDOTDOT *);
  276 (* NEWLINE *);
  277 (* NOT *);
  278 (* EQ *);
  279 (* NEQ *);
  280 (* LT *);
  281 (* LEQ *);
  282 (* GT *);
  283 (* GEQ *);
  284 (* AND *);
  285 (* OR *);
  286 (* IN *);
  287 (* RETURN *);
  288 (* IF *);
  289 (* ELIF *);
  290 (* ELSE *);
  291 (* FOR *);
  292 (* WHILE *);
  293 (* INT *);
  294 (* BOOL *);
  295 (* FLOAT *);
  296 (* NONE *);
  297 (* STRING *);
  298 (* RANGE *);
  299 (* WHEN *);
  300 (* DO *);
  301 (* EXTERNAL *);
  302 (* LET *);
  303 (* BE *);
  304 (* WITH *);
  305 (* PASS *);
  306 (* MAIN *);
  307 (* TIMES *);
  308 (* CONST *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  309 (* ILIT *);
  310 (* BLIT *);
  311 (* ID *);
  312 (* ACTIONID *);
  313 (* CLASSID *);
  314 (* FLIT *);
  315 (* SLIT *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\002\000\004\000\005\000\005\000\006\000\006\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\007\000\009\000\009\000\010\000\010\000\008\000\
\000\000"

let yylen = "\002\000\
\003\000\000\000\003\000\006\000\001\000\002\000\001\000\002\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\000\000\001\000\001\000\003\000\005\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\033\000\002\000\000\000\000\000\000\000\
\003\000\001\000\000\000\000\000\000\000\010\000\012\000\000\000\
\011\000\013\000\007\000\000\000\005\000\000\000\009\000\000\000\
\000\000\000\000\006\000\000\000\000\000\000\000\000\000\008\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\004\000\000\000\000\000\018\000\019\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\032\000\000\000\000\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\019\000\020\000\021\000\022\000\023\000\
\057\000\058\000"

let yysindex = "\005\000\
\216\254\000\000\004\255\000\000\000\000\006\255\043\000\045\255\
\000\000\000\000\033\255\239\254\008\255\000\000\000\000\054\255\
\000\000\000\000\000\000\252\254\000\000\207\255\000\000\067\255\
\232\255\051\255\000\000\232\255\232\255\232\255\232\255\000\000\
\232\255\232\255\232\255\232\255\232\255\232\255\232\255\232\255\
\232\255\228\255\000\000\249\254\249\254\000\000\000\000\085\255\
\085\255\021\255\021\255\021\255\021\255\001\000\236\255\228\255\
\080\255\077\255\000\000\232\255\228\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\050\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\089\255\026\255\000\000\078\255\106\255\000\000\000\000\061\255\
\192\255\116\255\144\255\154\255\182\255\037\255\027\255\255\254\
\000\000\090\255\000\000\000\000\000\255"

let yygindex = "\000\000\
\000\000\000\000\000\000\087\000\000\000\079\000\240\255\000\000\
\000\000\000\000"

let yytablesize = 291
let yytable = "\026\000\
\030\000\031\000\008\000\030\000\031\000\001\000\030\000\031\000\
\042\000\003\000\006\000\044\000\045\000\046\000\047\000\008\000\
\048\000\049\000\050\000\051\000\052\000\053\000\054\000\055\000\
\056\000\008\000\013\000\015\000\021\000\028\000\029\000\030\000\
\031\000\015\000\021\000\014\000\015\000\016\000\020\000\013\000\
\017\000\018\000\010\000\061\000\020\000\015\000\021\000\011\000\
\014\000\015\000\016\000\014\000\012\000\017\000\018\000\021\000\
\020\000\014\000\014\000\014\000\014\000\014\000\022\000\024\000\
\020\000\020\000\025\000\041\000\022\000\014\000\043\000\014\000\
\014\000\014\000\014\000\014\000\014\000\014\000\014\000\016\000\
\022\000\059\000\022\000\022\000\060\000\016\000\016\000\016\000\
\022\000\022\000\028\000\029\000\009\000\028\000\029\000\030\000\
\031\000\016\000\027\000\016\000\016\000\016\000\016\000\016\000\
\016\000\016\000\016\000\017\000\035\000\036\000\037\000\038\000\
\000\000\017\000\017\000\017\000\000\000\024\000\000\000\000\000\
\000\000\000\000\000\000\024\000\000\000\017\000\000\000\017\000\
\017\000\017\000\017\000\017\000\017\000\017\000\017\000\024\000\
\000\000\024\000\024\000\024\000\024\000\024\000\024\000\024\000\
\024\000\025\000\000\000\000\000\000\000\000\000\000\000\025\000\
\000\000\000\000\000\000\026\000\000\000\000\000\000\000\000\000\
\000\000\026\000\000\000\025\000\000\000\025\000\025\000\025\000\
\025\000\025\000\025\000\025\000\025\000\026\000\000\000\026\000\
\026\000\026\000\026\000\026\000\026\000\026\000\026\000\027\000\
\000\000\000\000\000\000\000\000\000\000\027\000\000\000\000\000\
\000\000\023\000\000\000\000\000\000\000\000\000\000\000\023\000\
\000\000\027\000\000\000\027\000\027\000\027\000\027\000\027\000\
\027\000\027\000\027\000\023\000\000\000\023\000\023\000\028\000\
\029\000\030\000\031\000\023\000\023\000\000\000\000\000\000\000\
\000\000\000\000\032\000\000\000\033\000\034\000\035\000\036\000\
\037\000\038\000\039\000\040\000\028\000\029\000\030\000\031\000\
\000\000\000\000\000\000\000\000\028\000\029\000\030\000\031\000\
\000\000\033\000\034\000\035\000\036\000\037\000\038\000\039\000\
\040\000\033\000\034\000\035\000\036\000\037\000\038\000\039\000\
\000\000\028\000\029\000\030\000\031\000\000\000\000\000\000\000\
\000\000\000\000\000\000\013\000\000\000\000\000\033\000\034\000\
\035\000\036\000\037\000\038\000\014\000\015\000\016\000\000\000\
\000\000\017\000\018\000"

let yycheck = "\004\001\
\002\001\002\001\020\001\011\001\012\001\001\000\008\001\008\001\
\025\000\050\001\007\001\028\000\029\000\030\000\031\000\020\001\
\033\000\034\000\035\000\036\000\037\000\038\000\039\000\040\000\
\041\000\020\001\044\001\002\001\002\001\009\001\010\001\011\001\
\012\001\008\001\008\001\053\001\054\001\055\001\002\001\044\001\
\058\001\059\001\000\000\060\000\008\001\020\001\020\001\003\001\
\053\001\054\001\055\001\002\001\020\001\058\001\059\001\029\001\
\020\001\008\001\009\001\010\001\011\001\012\001\002\001\056\001\
\028\001\029\001\013\001\001\001\008\001\020\001\020\001\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\002\001\
\020\001\002\001\022\001\023\001\008\001\008\001\009\001\010\001\
\028\001\029\001\002\001\002\001\006\000\009\001\010\001\011\001\
\012\001\020\001\020\000\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\002\001\024\001\025\001\026\001\027\001\
\255\255\008\001\009\001\010\001\255\255\002\001\255\255\255\255\
\255\255\255\255\255\255\008\001\255\255\020\001\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\020\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\002\001\255\255\255\255\255\255\255\255\255\255\008\001\
\255\255\255\255\255\255\002\001\255\255\255\255\255\255\255\255\
\255\255\008\001\255\255\020\001\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\020\001\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\002\001\
\255\255\255\255\255\255\255\255\255\255\008\001\255\255\255\255\
\255\255\002\001\255\255\255\255\255\255\255\255\255\255\008\001\
\255\255\020\001\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\020\001\255\255\022\001\023\001\009\001\
\010\001\011\001\012\001\028\001\029\001\255\255\255\255\255\255\
\255\255\255\255\020\001\255\255\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\255\255\009\001\010\001\011\001\012\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\255\255\009\001\010\001\011\001\012\001\255\255\255\255\255\255\
\255\255\255\255\255\255\044\001\255\255\255\255\022\001\023\001\
\024\001\025\001\026\001\027\001\053\001\054\001\055\001\255\255\
\255\255\058\001\059\001"

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
  MULT\000\
  DIVIDE\000\
  ASSIGN\000\
  MOD\000\
  POWER\000\
  FLOOR\000\
  DOT\000\
  DOTDOT\000\
  DOTDOTDOT\000\
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
  RANGE\000\
  WHEN\000\
  DO\000\
  EXTERNAL\000\
  LET\000\
  BE\000\
  WITH\000\
  PASS\000\
  MAIN\000\
  TIMES\000\
  CONST\000\
  EOF\000\
  "

let yynames_block = "\
  ILIT\000\
  BLIT\000\
  ID\000\
  ACTIONID\000\
  CLASSID\000\
  FLIT\000\
  SLIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'main_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'action_decls) in
    Obj.repr(
# 35 "parse.mly"
                               ( (_1,_2) )
# 340 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parse.mly"
                 ([])
# 346 "parse.ml"
               : 'action_decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 41 "parse.mly"
                            ( _3 )
# 353 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 44 "parse.mly"
                                                                ( Block(List.rev _4) )
# 360 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 47 "parse.mly"
                                          ( [_1] )
# 367 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 48 "parse.mly"
                                             ( _2 :: _1 )
# 375 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 51 "parse.mly"
                                            ( _1 )
# 382 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 52 "parse.mly"
                                            ( Expr _1 )
# 389 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 55 "parse.mly"
                       ( _1 )
# 396 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 56 "parse.mly"
                       ( Iliteral(_1) )
# 403 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 57 "parse.mly"
                       ( Fliteral(_1) )
# 410 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 58 "parse.mly"
                       ( Bliteral(_1) )
# 417 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 59 "parse.mly"
                       ( Sliteral(_1) )
# 424 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 60 "parse.mly"
                       ( Id(_1) )
# 431 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 61 "parse.mly"
                       ( Assign(_1, _3) )
# 439 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 62 "parse.mly"
                       ( Binop(_1, Add,     _3) )
# 447 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 63 "parse.mly"
                       ( Binop(_1, Sub,     _3) )
# 455 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 64 "parse.mly"
                       ( Binop(_1, Mult,    _3) )
# 463 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 65 "parse.mly"
                       ( Binop(_1, Div,     _3) )
# 471 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 66 "parse.mly"
                       ( Binop(_1, And,     _3) )
# 479 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 67 "parse.mly"
                       ( Binop(_1, Or,      _3) )
# 487 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 69 "parse.mly"
                       ( Binop(_1, Equal,   _3) )
# 495 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parse.mly"
                       ( Binop(_1, Neq,   _3) )
# 503 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 71 "parse.mly"
                       ( Binop(_1, Less,    _3) )
# 511 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 72 "parse.mly"
                       ( Binop(_1, Leq,     _3) )
# 519 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 73 "parse.mly"
                       ( Binop(_1, Greater, _3) )
# 527 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 74 "parse.mly"
                       ( Binop(_1, Geq,     _3) )
# 535 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 78 "parse.mly"
                                  ( [] )
# 541 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 79 "parse.mly"
                                  ( List.rev _1 )
# 548 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parse.mly"
                                ( [_1] )
# 555 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parse.mly"
                                    ( _3 :: _1 )
# 563 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 86 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 571 "parse.ml"
               : 'call_action))
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
