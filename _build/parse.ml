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

let frst (a,_,_) = a;;
let scnd (_,b,_) = b;;
let trd (_,_,c) = c;;

# 73 "parse.ml"
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
\001\000\004\000\003\000\003\000\005\000\002\000\007\000\008\000\
\008\000\009\000\009\000\009\000\009\000\009\000\009\000\012\000\
\012\000\013\000\013\000\014\000\014\000\015\000\006\000\006\000\
\006\000\006\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\017\000\017\000\018\000\
\018\000\016\000\011\000\011\000\000\000"

let yylen = "\002\000\
\003\000\000\000\000\000\002\000\003\000\003\000\006\000\001\000\
\002\000\001\000\002\000\003\000\001\000\006\000\004\000\005\000\
\005\000\005\000\005\000\000\000\001\000\003\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\000\000\001\000\001\000\
\003\000\005\000\000\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\053\000\003\000\000\000\000\000\000\000\
\006\000\023\000\024\000\025\000\026\000\001\000\004\000\000\000\
\000\000\000\000\000\000\005\000\000\000\000\000\000\000\000\000\
\000\000\028\000\030\000\000\000\029\000\031\000\010\000\000\000\
\008\000\000\000\013\000\027\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\009\000\000\000\000\000\000\000\
\000\000\011\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\012\000\000\000\000\000\000\000\000\000\000\000\
\007\000\000\000\000\000\036\000\037\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\000\
\000\000\000\000\000\000\000\000\000\000\016\000\017\000\021\000\
\000\000\050\000\000\000\000\000\000\000\014\000\000\000\000\000\
\022\000\000\000\018\000\019\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\000\000\015\000\016\000\031\000\032\000\
\033\000\034\000\038\000\035\000\086\000\087\000\088\000\036\000\
\082\000\083\000"

let yysindex = "\022\000\
\231\254\000\000\019\255\000\000\000\000\020\255\001\000\038\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\244\254\
\025\255\028\255\064\255\000\000\218\254\218\254\250\254\218\254\
\253\254\000\000\000\000\037\255\000\000\000\000\000\000\027\255\
\000\000\111\000\000\000\000\000\132\000\035\255\036\000\030\255\
\059\000\056\255\218\254\046\255\000\000\218\254\218\254\218\254\
\218\254\000\000\218\254\218\254\218\254\218\254\218\254\218\254\
\218\254\218\254\000\000\020\255\218\254\020\255\218\254\132\000\
\000\000\000\255\000\255\000\000\000\000\153\255\153\255\058\255\
\058\255\058\255\058\255\160\000\140\000\241\254\067\000\000\000\
\132\000\072\255\067\255\218\254\069\255\000\000\000\000\000\000\
\020\255\000\000\218\254\090\000\020\255\000\000\132\000\020\255\
\000\000\241\254\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\059\255\000\000\000\000\000\000\
\000\000\000\000\000\000\118\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\071\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\076\255\002\255\
\000\000\146\255\174\255\000\000\000\000\129\255\005\000\184\255\
\212\255\222\255\251\255\024\000\044\255\057\255\000\000\000\000\
\005\255\000\000\092\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\006\255\000\000\
\000\000\057\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\250\255\000\000\
\065\000\237\255\000\000\000\000\004\000\006\000\000\000\000\000\
\000\000\000\000"

let yytablesize = 443
let yytable = "\009\000\
\014\000\037\000\039\000\033\000\041\000\025\000\048\000\049\000\
\033\000\033\000\048\000\049\000\048\000\049\000\026\000\027\000\
\028\000\084\000\085\000\029\000\030\000\033\000\001\000\064\000\
\003\000\006\000\066\000\067\000\068\000\069\000\044\000\070\000\
\071\000\072\000\073\000\074\000\075\000\076\000\077\000\008\000\
\017\000\079\000\018\000\081\000\019\000\039\000\008\000\020\000\
\040\000\043\000\039\000\039\000\042\000\078\000\059\000\080\000\
\063\000\021\000\022\000\061\000\020\000\023\000\024\000\039\000\
\092\000\065\000\046\000\047\000\048\000\049\000\025\000\095\000\
\039\000\090\000\091\000\093\000\020\000\046\000\051\000\026\000\
\027\000\028\000\094\000\008\000\029\000\030\000\097\000\020\000\
\020\000\098\000\052\000\020\000\020\000\047\000\021\000\022\000\
\045\000\000\000\023\000\024\000\020\000\099\000\000\000\100\000\
\000\000\000\000\000\000\025\000\000\000\020\000\020\000\020\000\
\000\000\000\000\020\000\020\000\026\000\027\000\028\000\032\000\
\000\000\029\000\030\000\000\000\032\000\032\000\032\000\032\000\
\032\000\032\000\040\000\000\000\000\000\000\000\000\000\040\000\
\040\000\032\000\000\000\032\000\032\000\032\000\032\000\032\000\
\032\000\032\000\032\000\034\000\040\000\000\000\040\000\040\000\
\034\000\034\000\034\000\034\000\040\000\040\000\000\000\000\000\
\000\000\046\000\047\000\048\000\049\000\034\000\000\000\034\000\
\034\000\034\000\034\000\034\000\034\000\034\000\034\000\035\000\
\053\000\054\000\055\000\056\000\035\000\035\000\035\000\035\000\
\000\000\042\000\000\000\000\000\000\000\000\000\042\000\042\000\
\000\000\035\000\000\000\035\000\035\000\035\000\035\000\035\000\
\035\000\035\000\035\000\042\000\000\000\042\000\042\000\042\000\
\042\000\042\000\042\000\042\000\042\000\043\000\000\000\000\000\
\000\000\000\000\043\000\043\000\000\000\000\000\000\000\044\000\
\000\000\000\000\000\000\000\000\044\000\044\000\000\000\043\000\
\000\000\043\000\043\000\043\000\043\000\043\000\043\000\043\000\
\043\000\044\000\000\000\044\000\044\000\044\000\044\000\044\000\
\044\000\044\000\044\000\000\000\045\000\000\000\000\000\000\000\
\000\000\045\000\045\000\000\000\000\000\000\000\041\000\000\000\
\000\000\000\000\000\000\041\000\041\000\000\000\045\000\000\000\
\045\000\045\000\045\000\045\000\045\000\045\000\045\000\045\000\
\041\000\038\000\041\000\041\000\000\000\000\000\038\000\038\000\
\041\000\041\000\000\000\000\000\000\000\010\000\011\000\012\000\
\013\000\000\000\060\000\038\000\046\000\047\000\048\000\049\000\
\000\000\000\000\000\000\038\000\038\000\000\000\000\000\000\000\
\000\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\062\000\000\000\046\000\047\000\048\000\049\000\000\000\
\000\000\089\000\000\000\046\000\047\000\048\000\049\000\000\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\051\000\052\000\053\000\054\000\055\000\056\000\057\000\058\000\
\096\000\000\000\046\000\047\000\048\000\049\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\051\000\
\052\000\053\000\054\000\055\000\056\000\057\000\058\000\046\000\
\047\000\048\000\049\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\050\000\000\000\051\000\052\000\053\000\054\000\
\055\000\056\000\057\000\058\000\046\000\047\000\048\000\049\000\
\000\000\000\000\000\000\000\000\046\000\047\000\048\000\049\000\
\000\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\058\000\051\000\052\000\053\000\054\000\055\000\056\000\057\000\
\046\000\047\000\048\000\049\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\051\000\052\000\053\000\
\054\000\055\000\056\000"

let yycheck = "\006\000\
\000\000\021\000\022\000\002\001\024\000\044\001\002\001\002\001\
\007\001\008\001\011\001\012\001\008\001\008\001\053\001\054\001\
\055\001\033\001\034\001\058\001\059\001\020\001\001\000\043\000\
\050\001\007\001\046\000\047\000\048\000\049\000\004\001\051\000\
\052\000\053\000\054\000\055\000\056\000\057\000\058\000\020\001\
\003\001\061\000\055\001\063\000\020\001\002\001\020\001\020\001\
\055\001\013\001\007\001\008\001\056\001\060\000\020\001\062\000\
\001\001\031\001\032\001\030\001\004\001\035\001\036\001\020\001\
\084\000\020\001\009\001\010\001\011\001\012\001\044\001\091\000\
\029\001\002\001\008\001\007\001\020\001\002\001\020\001\053\001\
\054\001\055\001\089\000\020\001\058\001\059\001\093\000\031\001\
\032\001\096\000\020\001\035\001\036\001\002\001\031\001\032\001\
\032\000\255\255\035\001\036\001\044\001\098\000\255\255\098\000\
\255\255\255\255\255\255\044\001\255\255\053\001\054\001\055\001\
\255\255\255\255\058\001\059\001\053\001\054\001\055\001\002\001\
\255\255\058\001\059\001\255\255\007\001\008\001\009\001\010\001\
\011\001\012\001\002\001\255\255\255\255\255\255\255\255\007\001\
\008\001\020\001\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\002\001\020\001\255\255\022\001\023\001\
\007\001\008\001\009\001\010\001\028\001\029\001\255\255\255\255\
\255\255\009\001\010\001\011\001\012\001\020\001\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\002\001\
\024\001\025\001\026\001\027\001\007\001\008\001\009\001\010\001\
\255\255\002\001\255\255\255\255\255\255\255\255\007\001\008\001\
\255\255\020\001\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\020\001\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\002\001\255\255\255\255\
\255\255\255\255\007\001\008\001\255\255\255\255\255\255\002\001\
\255\255\255\255\255\255\255\255\007\001\008\001\255\255\020\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\020\001\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\255\255\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\255\255\255\255\255\255\002\001\255\255\
\255\255\255\255\255\255\007\001\008\001\255\255\020\001\255\255\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\
\020\001\002\001\022\001\023\001\255\255\255\255\007\001\008\001\
\028\001\029\001\255\255\255\255\255\255\037\001\038\001\039\001\
\040\001\255\255\007\001\020\001\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\028\001\029\001\255\255\255\255\255\255\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\007\001\255\255\009\001\010\001\011\001\012\001\255\255\
\255\255\007\001\255\255\009\001\010\001\011\001\012\001\255\255\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\
\007\001\255\255\009\001\010\001\011\001\012\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\009\001\
\010\001\011\001\012\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\020\001\255\255\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\255\255\009\001\010\001\011\001\012\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\009\001\010\001\011\001\012\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001"

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
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 40 "parse.mly"
                        ( (_1, fst _2, snd _2) )
# 404 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parse.mly"
                 ([])
# 410 "parse.ml"
               : 'action_decls))
; (fun __caml_parser_env ->
    Obj.repr(
# 46 "parse.mly"
                     ( ([], []) )
# 416 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'global_decl) in
    Obj.repr(
# 47 "parse.mly"
                         ( (List.rev (_2::fst _1), snd _1) )
# 424 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 50 "parse.mly"
                   ( (_1, _2) )
# 432 "parse.ml"
               : 'global_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 53 "parse.mly"
                            ( _3 )
# 439 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 56 "parse.mly"
                                                                 ( Block(List.rev _4) )
# 446 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 59 "parse.mly"
                                          ( [_1] )
# 453 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 60 "parse.mly"
                                             ( _2 :: _1 )
# 461 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 63 "parse.mly"
                                            ( _1 )
# 468 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 64 "parse.mly"
                                            ( Expr _1 )
# 475 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 66 "parse.mly"
                                            ( Return _2 )
# 482 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'if_stmt) in
    Obj.repr(
# 67 "parse.mly"
                                            ( _1 )
# 489 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 68 "parse.mly"
                                            ( For(_2, _4, _6) )
# 498 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 69 "parse.mly"
                                           ( While(_2, _4) )
# 506 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 72 "parse.mly"
                                                ( If(_2, _4, _5) )
# 515 "parse.ml"
               : 'if_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 73 "parse.mly"
                                                ( If(_2, _4, _5) )
# 524 "parse.ml"
               : 'if_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 76 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 533 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 77 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 542 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parse.mly"
                         ( Block([]) )
# 548 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'else_block) in
    Obj.repr(
# 81 "parse.mly"
                         ( _1 )
# 555 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 84 "parse.mly"
                                ( _3 )
# 562 "parse.ml"
               : 'else_block))
; (fun __caml_parser_env ->
    Obj.repr(
# 87 "parse.mly"
                        ( Int    )
# 568 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 88 "parse.mly"
                        ( Bool   )
# 574 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parse.mly"
                        ( Float  )
# 580 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parse.mly"
                        ( None   )
# 586 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 93 "parse.mly"
                       ( _1 )
# 593 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 94 "parse.mly"
                       ( Iliteral(_1) )
# 600 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 95 "parse.mly"
                       ( Fliteral(_1) )
# 607 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 96 "parse.mly"
                       ( Bliteral(_1) )
# 614 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 97 "parse.mly"
                       ( Sliteral(_1) )
# 621 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 98 "parse.mly"
                       ( Id(_1) )
# 628 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 99 "parse.mly"
                       ( Assign(_1, _3) )
# 636 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parse.mly"
                       ( Binop(_1, Add,     _3) )
# 644 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parse.mly"
                       ( Binop(_1, Sub,     _3) )
# 652 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 102 "parse.mly"
                       ( Binop(_1, Mult,    _3) )
# 660 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 103 "parse.mly"
                       ( Binop(_1, Div,     _3) )
# 668 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 104 "parse.mly"
                       ( Binop(_1, And,     _3) )
# 676 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 105 "parse.mly"
                       ( Binop(_1, Or,      _3) )
# 684 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parse.mly"
                       ( Binop(_1, Equal,   _3) )
# 692 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 108 "parse.mly"
                       ( Binop(_1, Neq,   _3) )
# 700 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 109 "parse.mly"
                       ( Binop(_1, Less,    _3) )
# 708 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 110 "parse.mly"
                       ( Binop(_1, Leq,     _3) )
# 716 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 111 "parse.mly"
                       ( Binop(_1, Greater, _3) )
# 724 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 112 "parse.mly"
                       ( Binop(_1, Geq,     _3) )
# 732 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 116 "parse.mly"
                                  ( [] )
# 738 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 117 "parse.mly"
                                  ( List.rev _1 )
# 745 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parse.mly"
                                ( [_1] )
# 752 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parse.mly"
                                    ( _3 :: _1 )
# 760 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 124 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 768 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 127 "parse.mly"
                       ( Noexpr )
# 774 "parse.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parse.mly"
                       ( _1 )
# 781 "parse.ml"
               : 'expr_opt))
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
