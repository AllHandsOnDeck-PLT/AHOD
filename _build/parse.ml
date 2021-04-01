type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LSQUARE
  | RSQUARE
  | LBRACK
  | RBRACK
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
# 4 "parse.mly"
open Ast

let frst (a,_,_) = a;;
let scnd (_,b,_) = b;;
let trd (_,_,c) = c;;

# 75 "parse.ml"
let yytransl_const = [|
  257 (* LPAREN *);
  258 (* RPAREN *);
  259 (* LBRACE *);
  260 (* RBRACE *);
  261 (* LSQUARE *);
  262 (* RSQUARE *);
  263 (* LBRACK *);
  264 (* RBRACK *);
  265 (* COLON *);
  266 (* COMMA *);
  267 (* PLUS *);
  268 (* MINUS *);
  269 (* MULT *);
  270 (* DIVIDE *);
  271 (* ASSIGN *);
  272 (* MOD *);
  273 (* POWER *);
  274 (* FLOOR *);
  275 (* DOT *);
  276 (* DOTDOT *);
  277 (* DOTDOTDOT *);
  278 (* NEWLINE *);
  279 (* NOT *);
  280 (* EQ *);
  281 (* NEQ *);
  282 (* LT *);
  283 (* LEQ *);
  284 (* GT *);
  285 (* GEQ *);
  286 (* AND *);
  287 (* OR *);
  288 (* IN *);
  289 (* RETURN *);
  290 (* IF *);
  291 (* ELIF *);
  292 (* ELSE *);
  293 (* FOR *);
  294 (* WHILE *);
  295 (* INT *);
  296 (* BOOL *);
  297 (* FLOAT *);
  298 (* NONE *);
  299 (* STRING *);
  300 (* RANGE *);
  301 (* WHEN *);
  302 (* DO *);
  303 (* EXTERNAL *);
  304 (* LET *);
  305 (* BE *);
  306 (* WITH *);
  307 (* PASS *);
  308 (* MAIN *);
  309 (* TIMES *);
  310 (* CONST *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  311 (* ILIT *);
  312 (* BLIT *);
  313 (* ID *);
  314 (* ACTIONID *);
  315 (* CLASSID *);
  316 (* FLIT *);
  317 (* SLIT *);
    0|]

let yylhs = "\255\255\
\001\000\004\000\004\000\005\000\005\000\002\000\003\000\003\000\
\003\000\003\000\009\000\009\000\007\000\007\000\010\000\006\000\
\011\000\011\000\013\000\013\000\014\000\014\000\015\000\008\000\
\008\000\008\000\017\000\017\000\017\000\017\000\017\000\018\000\
\012\000\012\000\019\000\016\000\016\000\020\000\020\000\020\000\
\020\000\000\000"

let yylen = "\002\000\
\003\000\000\000\001\000\001\000\002\000\003\000\005\000\008\000\
\007\000\010\000\000\000\001\000\001\000\003\000\002\000\004\000\
\001\000\002\000\000\000\001\000\001\000\003\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\004\000\
\001\000\002\000\001\000\001\000\001\000\002\000\003\000\005\000\
\006\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\042\000\000\000\000\000\000\000\000\000\
\000\000\006\000\027\000\028\000\029\000\031\000\030\000\000\000\
\000\000\000\000\024\000\026\000\001\000\000\000\000\000\000\000\
\000\000\000\000\037\000\033\000\000\000\017\000\035\000\000\000\
\036\000\000\000\000\000\000\000\000\000\000\000\016\000\018\000\
\034\000\000\000\000\000\000\000\013\000\007\000\032\000\000\000\
\000\000\000\000\000\000\000\000\015\000\000\000\000\000\000\000\
\000\000\021\000\000\000\000\000\000\000\000\000\014\000\000\000\
\009\000\040\000\000\000\000\000\008\000\000\000\022\000\041\000\
\000\000\010\000"

let yydgoto = "\002\000\
\004\000\005\000\008\000\000\000\000\000\028\000\043\000\044\000\
\000\000\045\000\029\000\030\000\056\000\057\000\058\000\059\000\
\019\000\020\000\060\000\033\000"

let yysindex = "\014\000\
\231\254\000\000\007\255\000\000\255\254\031\255\251\254\030\000\
\036\255\000\000\000\000\000\000\000\000\000\000\000\000\240\254\
\048\255\000\255\000\000\000\000\000\000\241\254\008\255\020\255\
\019\255\006\255\000\000\000\000\253\254\000\000\000\000\242\254\
\000\000\020\255\031\255\058\255\010\255\068\255\000\000\000\000\
\000\000\012\255\011\255\014\255\000\000\000\000\000\000\017\255\
\220\254\071\255\064\255\020\255\000\000\020\255\031\255\072\255\
\065\255\000\000\000\000\030\255\220\254\031\255\000\000\018\255\
\000\000\000\000\220\254\075\255\000\000\069\255\000\000\000\000\
\031\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\250\254\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\078\255\002\255\000\000\000\000\000\000\000\000\000\000\000\000\
\079\255\000\000\004\255\000\000\078\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\250\255\028\000\254\255\
\000\000\031\000\000\000\055\000\024\000\000\000\019\000\011\000\
\000\000\000\000\023\000\000\000"

let yytablesize = 86
let yytable = "\010\000\
\039\000\025\000\038\000\039\000\018\000\023\000\009\000\041\000\
\034\000\026\000\038\000\039\000\051\000\023\000\001\000\006\000\
\035\000\054\000\009\000\070\000\052\000\036\000\038\000\039\000\
\027\000\055\000\003\000\052\000\046\000\021\000\026\000\042\000\
\031\000\011\000\012\000\013\000\014\000\015\000\022\000\031\000\
\016\000\023\000\026\000\007\000\032\000\027\000\038\000\039\000\
\065\000\035\000\025\000\032\000\009\000\017\000\024\000\069\000\
\025\000\027\000\011\000\012\000\013\000\014\000\015\000\038\000\
\037\000\047\000\074\000\048\000\049\000\050\000\053\000\061\000\
\062\000\066\000\067\000\042\000\072\000\073\000\017\000\019\000\
\020\000\064\000\063\000\040\000\068\000\071\000"

let yycheck = "\006\000\
\004\001\008\001\002\001\002\001\007\000\002\001\022\001\022\001\
\001\001\046\001\010\001\010\001\002\001\010\001\001\000\009\001\
\009\001\001\001\022\001\002\001\010\001\024\000\022\001\022\001\
\061\001\009\001\052\001\010\001\035\000\000\000\046\001\046\001\
\022\000\039\001\040\001\041\001\042\001\043\001\003\001\029\000\
\046\001\058\001\046\001\045\001\022\000\061\001\046\001\046\001\
\055\000\046\001\057\001\029\000\022\001\059\001\007\001\062\000\
\057\001\061\001\039\001\040\001\041\001\042\001\043\001\058\001\
\046\001\008\001\073\000\058\001\001\001\058\001\057\001\001\001\
\009\001\002\001\010\001\046\001\002\001\009\001\059\001\002\001\
\002\001\054\000\052\000\029\000\061\000\067\000"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LSQUARE\000\
  RSQUARE\000\
  LBRACK\000\
  RBRACK\000\
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
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'action_decl) in
    Obj.repr(
# 43 "parse.mly"
                              ( (_1,_2) )
# 309 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parse.mly"
                         ()
# 315 "parse.ml"
               : 'newline_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'newline_list) in
    Obj.repr(
# 54 "parse.mly"
                         ()
# 322 "parse.ml"
               : 'newline_list_opt))
; (fun __caml_parser_env ->
    Obj.repr(
# 57 "parse.mly"
                  ()
# 328 "parse.ml"
               : 'newline_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'newline_list) in
    Obj.repr(
# 58 "parse.mly"
                              ()
# 335 "parse.ml"
               : 'newline_list))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 61 "parse.mly"
                            ( _3 )
# 342 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 65 "parse.mly"
    ({ 
      entitytyp = None;
      entityid = None;
      aname = _3;
      aparams = [];
      abody = _5 })
# 355 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 3 : 'params_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 73 "parse.mly"
    ({ 
      entitytyp = None;
      entityid = None;
      aname = _3;
      aparams = _5;
      abody = _8 })
# 369 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : 'typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 81 "parse.mly"
    ({ 
      entitytyp = Some _2;
      entityid = Some _3;
      aname = _5;
      aparams = [];
      abody = _7 })
# 384 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : 'params_list) in
    let _10 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 89 "parse.mly"
    ({ 
      entitytyp = Some _2;
      entityid = Some _3;
      aname = _5;
      aparams = _7;
      abody = _10 })
# 400 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 97 "parse.mly"
                                   ( [] )
# 406 "parse.ml"
               : 'params_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'params_list) in
    Obj.repr(
# 98 "parse.mly"
                                   ( List.rev _1 )
# 413 "parse.ml"
               : 'params_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 101 "parse.mly"
                                 ( [_1] )
# 420 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 102 "parse.mly"
                                   ( _3::_1 )
# 428 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "parse.mly"
                                   ( _1, _2 )
# 436 "parse.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 108 "parse.mly"
                                                 ( Block(List.rev _3) )
# 443 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 111 "parse.mly"
                                          ( [_1] )
# 450 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 113 "parse.mly"
                                             ( _2 :: _1 )
# 458 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 116 "parse.mly"
                                  ( [] )
# 464 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 117 "parse.mly"
                                  ( List.rev _1 )
# 471 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'arg) in
    Obj.repr(
# 120 "parse.mly"
                               ( [_1] )
# 478 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'arg) in
    Obj.repr(
# 121 "parse.mly"
                                   ( _3 :: _1 )
# 486 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'non_assign_expr) in
    Obj.repr(
# 124 "parse.mly"
                                  ( _1 )
# 493 "parse.ml"
               : 'arg))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'prim_typ) in
    Obj.repr(
# 127 "parse.mly"
                        ( _1 )
# 500 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 128 "parse.mly"
                        ( ClassID )
# 507 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'template_class) in
    Obj.repr(
# 129 "parse.mly"
                        ( _1 )
# 514 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 132 "parse.mly"
                        ( Int    )
# 520 "parse.ml"
               : 'prim_typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 133 "parse.mly"
                        ( Bool   )
# 526 "parse.ml"
               : 'prim_typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 134 "parse.mly"
                        ( Float  )
# 532 "parse.ml"
               : 'prim_typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 135 "parse.mly"
                        ( String  )
# 538 "parse.ml"
               : 'prim_typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 136 "parse.mly"
                        ( None   )
# 544 "parse.ml"
               : 'prim_typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 139 "parse.mly"
                               (TemplateClass(_1, _3) )
# 552 "parse.ml"
               : 'template_class))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 142 "parse.mly"
                                            ( _1 )
# 559 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 143 "parse.mly"
                                            ( Expr _1 )
# 566 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'non_assign_expr) in
    Obj.repr(
# 146 "parse.mly"
                       ( _1 )
# 573 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 149 "parse.mly"
                       ( _1 )
# 580 "parse.ml"
               : 'non_assign_expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 150 "parse.mly"
                   ( Sliteral(_1) )
# 587 "parse.ml"
               : 'non_assign_expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 153 "parse.mly"
                                                     ( ActionCall(_2, []) )
# 594 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 154 "parse.mly"
                                                     ( ExprActionCall(_1, _3, []) )
# 602 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 155 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 610 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 156 "parse.mly"
                                                     ( ExprActionCall(_1, _3, _5) )
# 619 "parse.ml"
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
