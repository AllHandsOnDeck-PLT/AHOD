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
# 2 "parse.mly"
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
\001\000\003\000\003\000\003\000\002\000\005\000\004\000\008\000\
\010\000\010\000\007\000\007\000\012\000\011\000\006\000\014\000\
\014\000\015\000\015\000\009\000\009\000\009\000\009\000\009\000\
\013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
\013\000\013\000\013\000\013\000\013\000\013\000\013\000\013\000\
\013\000\013\000\013\000\013\000\018\000\018\000\019\000\019\000\
\016\000\017\000\000\000"

let yylen = "\002\000\
\003\000\000\000\002\000\002\000\003\000\008\000\003\000\005\000\
\001\000\002\000\001\000\003\000\002\000\005\000\006\000\001\000\
\002\000\001\000\002\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\001\000\000\000\001\000\001\000\003\000\
\005\000\004\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\051\000\002\000\000\000\000\000\000\000\
\005\000\020\000\021\000\022\000\023\000\000\000\024\000\001\000\
\003\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\
\007\000\000\000\026\000\028\000\000\000\000\000\027\000\029\000\
\018\000\000\000\000\000\016\000\025\000\044\000\000\000\000\000\
\011\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\019\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\017\000\000\000\000\000\013\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\034\000\035\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\015\000\
\000\000\012\000\000\000\050\000\000\000\000\000\049\000\000\000\
\000\000\006\000\000\000\000\000\000\000\009\000\000\000\000\000\
\010\000\000\000\008\000\000\000\014\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\017\000\018\000\033\000\039\000\090\000\
\040\000\093\000\094\000\041\000\034\000\035\000\036\000\037\000\
\038\000\066\000\067\000"

let yysindex = "\003\000\
\215\254\000\000\015\255\000\000\000\000\006\255\001\000\029\255\
\000\000\000\000\000\000\000\000\000\000\230\254\000\000\000\000\
\000\000\000\000\233\254\013\255\038\255\044\255\237\254\070\255\
\000\000\009\255\000\000\000\000\054\255\071\255\000\000\000\000\
\000\000\250\255\254\254\000\000\000\000\000\000\019\255\014\255\
\000\000\078\255\122\255\122\255\122\255\122\255\122\255\122\255\
\000\000\122\255\122\255\122\255\122\255\122\255\122\255\122\255\
\122\255\058\255\000\000\033\255\070\255\000\000\122\255\060\000\
\060\000\081\255\090\255\036\255\036\255\000\000\000\000\018\000\
\018\000\085\255\085\255\085\255\085\255\088\000\068\000\000\000\
\092\255\000\000\100\255\000\000\122\255\084\255\000\000\060\000\
\104\255\000\000\070\255\056\255\022\255\000\000\105\255\108\255\
\000\000\122\255\000\000\039\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\063\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\124\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\124\255\046\255\
\020\255\000\000\125\255\093\255\123\255\000\000\000\000\021\255\
\214\255\134\255\164\255\174\255\204\255\238\255\106\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\068\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\125\000\000\000\000\000\
\249\255\000\000\045\000\071\000\218\255\000\000\104\000\000\000\
\000\000\077\000\000\000"

let yytablesize = 373
let yytable = "\019\000\
\016\000\058\000\008\000\001\000\064\000\065\000\068\000\069\000\
\070\000\071\000\003\000\072\000\073\000\074\000\075\000\076\000\
\077\000\078\000\079\000\008\000\060\000\047\000\038\000\006\000\
\065\000\096\000\026\000\008\000\061\000\047\000\038\000\020\000\
\021\000\022\000\023\000\027\000\028\000\029\000\024\000\030\000\
\031\000\032\000\038\000\026\000\038\000\038\000\088\000\031\000\
\047\000\048\000\038\000\038\000\027\000\028\000\029\000\031\000\
\030\000\031\000\032\000\100\000\010\000\011\000\012\000\013\000\
\030\000\025\000\042\000\031\000\043\000\048\000\062\000\044\000\
\030\000\030\000\030\000\030\000\030\000\048\000\063\000\080\000\
\015\000\081\000\084\000\092\000\030\000\092\000\030\000\030\000\
\030\000\030\000\030\000\030\000\030\000\030\000\032\000\045\000\
\046\000\047\000\048\000\085\000\086\000\087\000\032\000\032\000\
\032\000\089\000\091\000\037\000\010\000\011\000\012\000\013\000\
\095\000\098\000\032\000\037\000\032\000\032\000\032\000\032\000\
\032\000\032\000\032\000\032\000\033\000\045\000\046\000\037\000\
\015\000\099\000\009\000\082\000\033\000\033\000\033\000\040\000\
\037\000\097\000\059\000\083\000\000\000\000\000\000\000\040\000\
\033\000\000\000\033\000\033\000\033\000\033\000\033\000\033\000\
\033\000\033\000\000\000\040\000\000\000\040\000\040\000\040\000\
\040\000\040\000\040\000\040\000\040\000\041\000\000\000\026\000\
\000\000\000\000\000\000\000\000\000\000\041\000\000\000\042\000\
\027\000\028\000\029\000\000\000\030\000\031\000\032\000\042\000\
\000\000\041\000\000\000\041\000\041\000\041\000\041\000\041\000\
\041\000\041\000\041\000\042\000\000\000\042\000\042\000\042\000\
\042\000\042\000\042\000\042\000\042\000\043\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\043\000\000\000\039\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\039\000\
\000\000\043\000\000\000\043\000\043\000\043\000\043\000\043\000\
\043\000\043\000\043\000\039\000\000\000\039\000\039\000\036\000\
\000\000\000\000\000\000\039\000\039\000\000\000\000\000\036\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\036\000\045\000\046\000\047\000\048\000\
\000\000\000\000\000\000\036\000\036\000\000\000\000\000\049\000\
\000\000\050\000\051\000\052\000\053\000\054\000\055\000\056\000\
\057\000\000\000\000\000\000\000\045\000\046\000\047\000\048\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\010\000\
\011\000\012\000\013\000\052\000\053\000\054\000\055\000\000\000\
\014\000\045\000\046\000\047\000\048\000\000\000\000\000\000\000\
\000\000\000\000\000\000\015\000\101\000\000\000\050\000\051\000\
\052\000\053\000\054\000\055\000\056\000\057\000\045\000\046\000\
\047\000\048\000\000\000\000\000\000\000\000\000\045\000\046\000\
\047\000\048\000\000\000\050\000\051\000\052\000\053\000\054\000\
\055\000\056\000\057\000\050\000\051\000\052\000\053\000\054\000\
\055\000\056\000\045\000\046\000\047\000\048\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\050\000\
\051\000\052\000\053\000\054\000\055\000"

let yycheck = "\007\000\
\000\000\004\001\022\001\001\000\043\000\044\000\045\000\046\000\
\047\000\048\000\052\001\050\000\051\000\052\000\053\000\054\000\
\055\000\056\000\057\000\022\001\002\001\002\001\002\001\009\001\
\063\000\004\001\046\001\022\001\010\001\010\001\010\001\003\001\
\059\001\057\001\022\001\055\001\056\001\057\001\001\001\059\001\
\060\001\061\001\022\001\046\001\024\001\025\001\085\000\002\001\
\013\001\014\001\030\001\031\001\055\001\056\001\057\001\010\001\
\059\001\060\001\061\001\098\000\039\001\040\001\041\001\042\001\
\002\001\022\001\058\001\022\001\015\001\002\001\057\001\001\001\
\010\001\011\001\012\001\013\001\014\001\010\001\001\001\022\001\
\059\001\049\001\002\001\091\000\022\001\093\000\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\002\001\011\001\
\012\001\013\001\014\001\010\001\009\001\002\001\010\001\011\001\
\012\001\022\001\003\001\002\001\039\001\040\001\041\001\042\001\
\057\001\009\001\022\001\010\001\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\031\001\002\001\002\001\002\001\022\001\
\059\001\022\001\006\000\061\000\010\001\011\001\012\001\002\001\
\031\001\093\000\035\000\063\000\255\255\255\255\255\255\010\001\
\022\001\255\255\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\255\255\022\001\255\255\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\002\001\255\255\046\001\
\255\255\255\255\255\255\255\255\255\255\010\001\255\255\002\001\
\055\001\056\001\057\001\255\255\059\001\060\001\061\001\010\001\
\255\255\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\022\001\255\255\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\002\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\010\001\255\255\002\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\010\001\
\255\255\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\022\001\255\255\024\001\025\001\002\001\
\255\255\255\255\255\255\030\001\031\001\255\255\255\255\010\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\022\001\011\001\012\001\013\001\014\001\
\255\255\255\255\255\255\030\001\031\001\255\255\255\255\022\001\
\255\255\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\255\255\255\255\255\255\011\001\012\001\013\001\014\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\039\001\
\040\001\041\001\042\001\026\001\027\001\028\001\029\001\255\255\
\048\001\011\001\012\001\013\001\014\001\255\255\255\255\255\255\
\255\255\255\255\255\255\059\001\022\001\255\255\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\011\001\012\001\
\013\001\014\001\255\255\255\255\255\255\255\255\011\001\012\001\
\013\001\014\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\011\001\012\001\013\001\014\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001"

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
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 42 "parse.mly"
                        ( (_1, fst _2, snd _2) )
# 392 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 45 "parse.mly"
                     ( ([], []) )
# 398 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'global_decl) in
    Obj.repr(
# 46 "parse.mly"
                         ( (List.rev (_2::fst _1), snd _1) )
# 406 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'class_decl) in
    Obj.repr(
# 47 "parse.mly"
                       ( (fst _1, List.rev (_2::snd _1)) )
# 414 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 57 "parse.mly"
                          ( _3 )
# 421 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : 'params_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'class_block) in
    Obj.repr(
# 61 "parse.mly"
    ({ 
      cname = _2;
      cparams = _4;
      attributes = _8 })
# 433 "parse.ml"
               : 'class_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 70 "parse.mly"
                   ( (_1, _2) )
# 441 "parse.ml"
               : 'global_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'class_decl_list) in
    Obj.repr(
# 73 "parse.mly"
                                                  ( _3 )
# 448 "parse.ml"
               : 'class_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'attr_decl) in
    Obj.repr(
# 76 "parse.mly"
                                    ( [_1]) )
# 455 "parse.ml"
               : 'class_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'class_decl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'attr_decl) in
    Obj.repr(
# 77 "parse.mly"
                                    ( List.rev (_2::_1) )
# 463 "parse.ml"
               : 'class_decl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 80 "parse.mly"
                                 ( [_1] )
# 470 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 81 "parse.mly"
                                   ( _3::_1 )
# 478 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parse.mly"
                                   ( _1, _2 )
# 486 "parse.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 87 "parse.mly"
                                ( OneAdecl(_1, _2, _4))
# 495 "parse.ml"
               : 'attr_decl))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 90 "parse.mly"
                                                                ( Block(List.rev _4) )
# 502 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 93 "parse.mly"
                                          ( [_1] )
# 509 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 94 "parse.mly"
                                             ( _2 :: _1 )
# 517 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 97 "parse.mly"
                                            ( _1 )
# 524 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 98 "parse.mly"
                                            ( Expr _1 )
# 531 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 101 "parse.mly"
                        ( Int    )
# 537 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parse.mly"
                        ( Bool   )
# 543 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "parse.mly"
                        ( Float  )
# 549 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "parse.mly"
                        ( None   )
# 555 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "parse.mly"
                        ( ClassID )
# 562 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 108 "parse.mly"
                       ( _1 )
# 569 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 109 "parse.mly"
                       ( Iliteral(_1) )
# 576 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 110 "parse.mly"
                       ( Fliteral(_1) )
# 583 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 111 "parse.mly"
                       ( Bliteral(_1) )
# 590 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "parse.mly"
                       ( Sliteral(_1) )
# 597 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 113 "parse.mly"
                       ( Id(_1) )
# 604 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parse.mly"
                       ( Assign(_1, _3) )
# 612 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parse.mly"
                       ( Binop(_1, Add,     _3) )
# 620 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parse.mly"
                       ( Binop(_1, Sub,     _3) )
# 628 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parse.mly"
                       ( Binop(_1, Mult,    _3) )
# 636 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parse.mly"
                       ( Binop(_1, Div,     _3) )
# 644 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parse.mly"
                       ( Binop(_1, And,     _3) )
# 652 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parse.mly"
                       ( Binop(_1, Or,      _3) )
# 660 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parse.mly"
                       ( Binop(_1, Equal,   _3) )
# 668 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parse.mly"
                       ( Binop(_1, Neq,   _3) )
# 676 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parse.mly"
                       ( Binop(_1, Less,    _3) )
# 684 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parse.mly"
                       ( Binop(_1, Leq,     _3) )
# 692 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parse.mly"
                       ( Binop(_1, Greater, _3) )
# 700 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parse.mly"
                       ( Binop(_1, Geq,     _3) )
# 708 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_class) in
    Obj.repr(
# 129 "parse.mly"
                       ( _1 )
# 715 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 133 "parse.mly"
                                  ( [] )
# 721 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 134 "parse.mly"
                                  ( List.rev _1 )
# 728 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parse.mly"
                                ( [_1] )
# 735 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "parse.mly"
                                    ( _3 :: _1 )
# 743 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 141 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 751 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 144 "parse.mly"
                                                    ( ClassCall(_1, _3) )
# 759 "parse.ml"
               : 'call_class))
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
