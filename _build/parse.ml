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
\001\000\004\000\003\000\003\000\003\000\007\000\002\000\005\000\
\005\000\009\000\006\000\010\000\010\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\014\000\
\014\000\015\000\015\000\016\000\008\000\008\000\008\000\008\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\018\000\018\000\019\000\019\000\017\000\
\013\000\013\000\000\000"

let yylen = "\002\000\
\003\000\008\000\000\000\002\000\002\000\003\000\003\000\001\000\
\003\000\002\000\006\000\001\000\002\000\001\000\002\000\003\000\
\005\000\005\000\005\000\005\000\003\000\006\000\004\000\005\000\
\005\000\000\000\001\000\003\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\000\000\001\000\001\000\003\000\005\000\
\000\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\059\000\003\000\000\000\000\000\000\000\
\007\000\029\000\030\000\031\000\032\000\000\000\001\000\005\000\
\004\000\000\000\000\000\000\000\000\000\000\000\000\000\006\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\034\000\
\036\000\000\000\035\000\037\000\014\000\000\000\012\000\000\000\
\033\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\013\000\000\000\000\000\000\000\
\000\000\015\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\008\000\016\000\000\000\000\000\
\021\000\000\000\000\000\000\000\000\000\011\000\000\000\000\000\
\042\000\043\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\010\000\000\000\000\000\000\000\
\023\000\000\000\000\000\000\000\000\000\009\000\000\000\000\000\
\017\000\018\000\027\000\019\000\020\000\000\000\056\000\000\000\
\002\000\000\000\000\000\022\000\000\000\000\000\028\000\000\000\
\024\000\025\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\016\000\067\000\037\000\017\000\068\000\
\069\000\038\000\039\000\040\000\044\000\105\000\106\000\107\000\
\041\000\099\000\100\000"

let yysindex = "\011\000\
\208\254\000\000\012\255\000\000\000\000\000\255\001\000\028\255\
\000\000\000\000\000\000\000\000\000\000\252\254\000\000\000\000\
\000\000\003\255\039\255\007\255\048\255\095\255\078\255\000\000\
\229\255\229\255\229\255\075\255\025\255\229\255\034\255\000\000\
\000\000\079\255\000\000\000\000\000\000\002\255\000\000\123\000\
\000\000\096\255\144\000\083\255\040\000\048\000\000\255\081\255\
\071\000\115\255\229\255\086\255\000\000\229\255\229\255\229\255\
\229\255\000\000\229\255\229\255\229\255\229\255\229\255\229\255\
\229\255\229\255\073\255\062\255\000\000\000\000\000\255\000\255\
\000\000\229\255\000\255\229\255\144\000\000\000\249\254\249\254\
\000\000\000\000\176\000\176\000\157\255\157\255\157\255\157\255\
\172\000\152\000\111\255\096\255\000\000\239\254\239\254\079\000\
\000\000\144\000\120\255\124\255\000\255\000\000\229\255\116\255\
\000\000\000\000\000\000\000\000\000\000\000\255\000\000\229\255\
\000\000\102\000\000\255\000\000\144\000\000\255\000\000\239\254\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\118\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\135\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\121\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\138\255\069\255\000\000\001\255\163\255\
\000\000\000\000\065\255\249\255\173\255\201\255\211\255\239\255\
\017\000\076\255\000\000\000\000\000\000\066\255\066\255\000\000\
\000\000\105\255\000\000\149\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\106\255\000\000\000\000\066\255\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\250\255\000\000\145\000\
\064\000\000\000\136\000\244\255\000\000\168\255\235\255\000\000\
\000\000\000\000\000\000"

let yytablesize = 459
let yytable = "\009\000\
\015\000\003\000\040\000\056\000\057\000\052\000\108\000\040\000\
\040\000\040\000\040\000\001\000\043\000\045\000\046\000\103\000\
\104\000\049\000\006\000\008\000\040\000\008\000\040\000\040\000\
\040\000\040\000\040\000\040\000\040\000\040\000\019\000\121\000\
\025\000\026\000\027\000\028\000\029\000\030\000\077\000\020\000\
\073\000\079\000\080\000\081\000\082\000\031\000\083\000\084\000\
\085\000\086\000\087\000\088\000\089\000\090\000\032\000\033\000\
\034\000\021\000\022\000\035\000\036\000\096\000\023\000\098\000\
\094\000\095\000\046\000\024\000\097\000\026\000\039\000\046\000\
\046\000\109\000\091\000\039\000\039\000\045\000\042\000\048\000\
\092\000\047\000\045\000\045\000\046\000\026\000\046\000\046\000\
\039\000\050\000\114\000\051\000\046\000\046\000\113\000\045\000\
\026\000\026\000\122\000\117\000\026\000\026\000\070\000\116\000\
\045\000\078\000\054\000\055\000\119\000\026\000\074\000\120\000\
\054\000\055\000\008\000\076\000\093\000\101\000\026\000\026\000\
\026\000\111\000\115\000\026\000\026\000\025\000\026\000\027\000\
\028\000\029\000\030\000\112\000\010\000\011\000\012\000\013\000\
\038\000\057\000\031\000\052\000\058\000\038\000\038\000\038\000\
\038\000\038\000\038\000\032\000\033\000\034\000\053\000\018\000\
\035\000\036\000\038\000\102\000\038\000\038\000\038\000\038\000\
\038\000\038\000\038\000\038\000\041\000\054\000\055\000\056\000\
\057\000\041\000\041\000\041\000\041\000\053\000\048\000\000\000\
\000\000\000\000\000\000\048\000\048\000\000\000\041\000\000\000\
\041\000\041\000\041\000\041\000\041\000\041\000\041\000\041\000\
\048\000\000\000\048\000\048\000\048\000\048\000\048\000\048\000\
\048\000\048\000\049\000\000\000\000\000\000\000\000\000\049\000\
\049\000\000\000\000\000\000\000\050\000\000\000\000\000\000\000\
\000\000\050\000\050\000\000\000\049\000\000\000\049\000\049\000\
\049\000\049\000\049\000\049\000\049\000\049\000\050\000\000\000\
\050\000\050\000\050\000\050\000\050\000\050\000\050\000\050\000\
\051\000\000\000\000\000\000\000\000\000\051\000\051\000\000\000\
\000\000\000\000\047\000\000\000\000\000\000\000\000\000\047\000\
\047\000\000\000\051\000\000\000\051\000\051\000\051\000\051\000\
\051\000\051\000\051\000\051\000\047\000\000\000\047\000\047\000\
\031\000\000\000\044\000\000\000\047\000\047\000\000\000\044\000\
\044\000\032\000\033\000\034\000\000\000\000\000\035\000\036\000\
\000\000\000\000\000\000\000\000\044\000\010\000\011\000\012\000\
\013\000\000\000\000\000\014\000\044\000\044\000\071\000\000\000\
\054\000\055\000\056\000\057\000\000\000\000\000\072\000\000\000\
\054\000\055\000\056\000\057\000\000\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\066\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\066\000\075\000\000\000\054\000\
\055\000\056\000\057\000\000\000\000\000\110\000\000\000\054\000\
\055\000\056\000\057\000\000\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\066\000\059\000\060\000\061\000\062\000\
\063\000\064\000\065\000\066\000\118\000\000\000\054\000\055\000\
\056\000\057\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\059\000\060\000\061\000\062\000\063\000\
\064\000\065\000\066\000\054\000\055\000\056\000\057\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\058\000\000\000\
\059\000\060\000\061\000\062\000\063\000\064\000\065\000\066\000\
\054\000\055\000\056\000\057\000\000\000\000\000\000\000\000\000\
\054\000\055\000\056\000\057\000\000\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\066\000\059\000\060\000\061\000\
\062\000\063\000\064\000\065\000\054\000\055\000\056\000\057\000\
\054\000\055\000\056\000\057\000\000\000\000\000\000\000\000\000\
\000\000\059\000\060\000\061\000\062\000\063\000\064\000\061\000\
\062\000\063\000\064\000"

let yycheck = "\006\000\
\000\000\050\001\002\001\011\001\012\001\004\001\095\000\007\001\
\008\001\009\001\010\001\001\000\025\000\026\000\027\000\033\001\
\034\001\030\000\007\001\020\001\020\001\020\001\022\001\023\001\
\024\001\025\001\026\001\027\001\028\001\029\001\003\001\120\000\
\031\001\032\001\033\001\034\001\035\001\036\001\051\000\044\001\
\047\000\054\000\055\000\056\000\057\000\044\001\059\000\060\000\
\061\000\062\000\063\000\064\000\065\000\066\000\053\001\054\001\
\055\001\055\001\020\001\058\001\059\001\074\000\056\001\076\000\
\071\000\072\000\002\001\020\001\075\000\004\001\002\001\007\001\
\008\001\095\000\002\001\007\001\008\001\002\001\001\001\055\001\
\008\001\007\001\007\001\008\001\020\001\020\001\022\001\023\001\
\020\001\056\001\103\000\013\001\028\001\029\001\101\000\020\001\
\031\001\032\001\120\000\112\000\035\001\036\001\020\001\110\000\
\029\001\020\001\002\001\002\001\115\000\044\001\030\001\118\000\
\008\001\008\001\020\001\001\001\055\001\007\001\053\001\054\001\
\055\001\002\001\007\001\058\001\059\001\031\001\032\001\033\001\
\034\001\035\001\036\001\008\001\037\001\038\001\039\001\040\001\
\002\001\020\001\044\001\002\001\020\001\007\001\008\001\009\001\
\010\001\011\001\012\001\053\001\054\001\055\001\002\001\007\000\
\058\001\059\001\020\001\092\000\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\002\001\009\001\010\001\011\001\
\012\001\007\001\008\001\009\001\010\001\038\000\002\001\255\255\
\255\255\255\255\255\255\007\001\008\001\255\255\020\001\255\255\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\
\020\001\255\255\022\001\023\001\024\001\025\001\026\001\027\001\
\028\001\029\001\002\001\255\255\255\255\255\255\255\255\007\001\
\008\001\255\255\255\255\255\255\002\001\255\255\255\255\255\255\
\255\255\007\001\008\001\255\255\020\001\255\255\022\001\023\001\
\024\001\025\001\026\001\027\001\028\001\029\001\020\001\255\255\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\
\002\001\255\255\255\255\255\255\255\255\007\001\008\001\255\255\
\255\255\255\255\002\001\255\255\255\255\255\255\255\255\007\001\
\008\001\255\255\020\001\255\255\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\020\001\255\255\022\001\023\001\
\044\001\255\255\002\001\255\255\028\001\029\001\255\255\007\001\
\008\001\053\001\054\001\055\001\255\255\255\255\058\001\059\001\
\255\255\255\255\255\255\255\255\020\001\037\001\038\001\039\001\
\040\001\255\255\255\255\043\001\028\001\029\001\007\001\255\255\
\009\001\010\001\011\001\012\001\255\255\255\255\007\001\255\255\
\009\001\010\001\011\001\012\001\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\007\001\255\255\009\001\
\010\001\011\001\012\001\255\255\255\255\007\001\255\255\009\001\
\010\001\011\001\012\001\255\255\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\007\001\255\255\009\001\010\001\
\011\001\012\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\009\001\010\001\011\001\012\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\020\001\255\255\
\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\
\009\001\010\001\011\001\012\001\255\255\255\255\255\255\255\255\
\009\001\010\001\011\001\012\001\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\009\001\010\001\011\001\012\001\
\009\001\010\001\011\001\012\001\255\255\255\255\255\255\255\255\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\024\001\
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
# 419 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 3 : 'params_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 44 "parse.mly"
    ({ 
      entitytyp = None;
      entityid = "";
      aname = _3;
      aparams = _5;
      abody = _8 })
# 433 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parse.mly"
                     ( ([], []) )
# 439 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'global_decl) in
    Obj.repr(
# 53 "parse.mly"
                         ( (List.rev (_2::fst _1), snd _1) )
# 447 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'action_decl) in
    Obj.repr(
# 54 "parse.mly"
                         ( (fst _1, List.rev (_2::snd _1)) )
# 455 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 57 "parse.mly"
                   ( (_1, _2) )
# 463 "parse.ml"
               : 'global_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 60 "parse.mly"
                            ( _3 )
# 470 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 63 "parse.mly"
                                 ( [_1] )
# 477 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 64 "parse.mly"
                                   ( _3::_1 )
# 485 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "parse.mly"
                                   ( _1, _2 )
# 493 "parse.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 70 "parse.mly"
                                                                 ( Block(List.rev _4) )
# 500 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 73 "parse.mly"
                                          ( [_1] )
# 507 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "parse.mly"
                                             ( _2 :: _1 )
# 515 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 77 "parse.mly"
                                            ( _1 )
# 522 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 78 "parse.mly"
                                            ( Expr _1 )
# 529 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 80 "parse.mly"
                                            ( Return _2 )
# 536 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 81 "parse.mly"
                                                ( If(_2, _4, _5) )
# 545 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 82 "parse.mly"
                                                ( If(_2, _4, _5) )
# 554 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 83 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 563 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 84 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 572 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 85 "parse.mly"
                                                    ( _3 )
# 579 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 86 "parse.mly"
                                            ( For(_2, _4, _6) )
# 588 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 87 "parse.mly"
                                            ( While(_2, _4) )
# 596 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 92 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 605 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 93 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 614 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 96 "parse.mly"
                         ( Block([]) )
# 620 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'else_block) in
    Obj.repr(
# 97 "parse.mly"
                         ( _1 )
# 627 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 100 "parse.mly"
                                ( _3 )
# 634 "parse.ml"
               : 'else_block))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "parse.mly"
                        ( Int    )
# 640 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "parse.mly"
                        ( Bool   )
# 646 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 105 "parse.mly"
                        ( Float  )
# 652 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parse.mly"
                        ( None   )
# 658 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 109 "parse.mly"
                       ( _1 )
# 665 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 110 "parse.mly"
                       ( Iliteral(_1) )
# 672 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "parse.mly"
                       ( Fliteral(_1) )
# 679 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 112 "parse.mly"
                       ( Bliteral(_1) )
# 686 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 113 "parse.mly"
                       ( Sliteral(_1) )
# 693 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 114 "parse.mly"
                       ( Id(_1) )
# 700 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parse.mly"
                       ( Assign(_1, _3) )
# 708 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parse.mly"
                       ( Binop(_1, Add,     _3) )
# 716 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parse.mly"
                       ( Binop(_1, Sub,     _3) )
# 724 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parse.mly"
                       ( Binop(_1, Mult,    _3) )
# 732 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parse.mly"
                       ( Binop(_1, Div,     _3) )
# 740 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parse.mly"
                       ( Binop(_1, And,     _3) )
# 748 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parse.mly"
                       ( Binop(_1, Or,      _3) )
# 756 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parse.mly"
                       ( Binop(_1, Equal,   _3) )
# 764 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parse.mly"
                       ( Binop(_1, Neq,   _3) )
# 772 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parse.mly"
                       ( Binop(_1, Less,    _3) )
# 780 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parse.mly"
                       ( Binop(_1, Leq,     _3) )
# 788 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parse.mly"
                       ( Binop(_1, Greater, _3) )
# 796 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parse.mly"
                       ( Binop(_1, Geq,     _3) )
# 804 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 132 "parse.mly"
                                  ( [] )
# 810 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 133 "parse.mly"
                                  ( List.rev _1 )
# 817 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parse.mly"
                                ( [_1] )
# 824 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parse.mly"
                                    ( _3 :: _1 )
# 832 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 140 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 840 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 143 "parse.mly"
                       ( Noexpr )
# 846 "parse.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 144 "parse.mly"
                       ( _1 )
# 853 "parse.ml"
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
