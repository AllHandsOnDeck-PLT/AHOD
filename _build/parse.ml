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
\001\000\004\000\002\000\002\000\002\000\007\000\003\000\005\000\
\005\000\009\000\006\000\010\000\010\000\011\000\011\000\011\000\
\011\000\011\000\011\000\014\000\014\000\015\000\015\000\016\000\
\016\000\017\000\008\000\008\000\008\000\008\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\019\000\019\000\020\000\020\000\018\000\013\000\013\000\
\000\000"

let yylen = "\002\000\
\003\000\008\000\000\000\002\000\002\000\003\000\003\000\001\000\
\003\000\002\000\006\000\001\000\002\000\001\000\002\000\003\000\
\001\000\006\000\004\000\005\000\005\000\005\000\005\000\000\000\
\001\000\003\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\000\000\001\000\001\000\003\000\005\000\000\000\001\000\
\002\000"

let yydefred = "\000\000\
\003\000\000\000\057\000\000\000\027\000\028\000\029\000\030\000\
\000\000\000\000\000\000\005\000\004\000\000\000\000\000\000\000\
\001\000\000\000\000\000\000\000\007\000\006\000\000\000\000\000\
\000\000\000\000\008\000\000\000\000\000\000\000\010\000\000\000\
\000\000\000\000\000\000\000\000\032\000\034\000\000\000\033\000\
\035\000\014\000\000\000\012\000\000\000\017\000\031\000\000\000\
\009\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\013\000\000\000\000\000\000\000\000\000\015\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\
\016\000\000\000\000\000\000\000\000\000\000\000\011\000\000\000\
\000\000\040\000\041\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\019\000\000\000\000\000\
\000\000\000\000\000\000\020\000\021\000\025\000\000\000\054\000\
\000\000\000\000\000\000\018\000\000\000\000\000\026\000\000\000\
\022\000\023\000"

let yydgoto = "\002\000\
\003\000\004\000\011\000\012\000\025\000\042\000\013\000\026\000\
\027\000\043\000\044\000\045\000\051\000\046\000\100\000\101\000\
\102\000\047\000\096\000\097\000"

let yysindex = "\002\000\
\000\000\000\000\000\000\190\255\000\000\000\000\000\000\000\000\
\238\254\035\255\043\000\000\000\000\000\250\254\003\255\041\255\
\000\000\042\255\067\255\066\255\000\000\000\000\015\255\050\255\
\008\255\022\255\000\000\076\255\071\255\015\255\000\000\250\255\
\250\255\030\255\250\255\034\255\000\000\000\000\073\255\000\000\
\000\000\000\000\044\255\000\000\108\000\000\000\000\000\041\255\
\000\000\129\000\075\255\047\000\062\255\056\000\092\255\250\255\
\086\255\000\000\250\255\250\255\250\255\250\255\000\000\250\255\
\250\255\250\255\250\255\250\255\250\255\250\255\250\255\000\000\
\000\000\041\255\250\255\041\255\250\255\129\000\000\000\001\255\
\001\255\000\000\000\000\165\255\165\255\072\255\072\255\072\255\
\072\255\137\000\252\254\023\255\079\000\000\000\129\000\107\255\
\102\255\250\255\108\255\000\000\000\000\000\000\041\255\000\000\
\250\255\087\000\041\255\000\000\129\000\041\255\000\000\023\255\
\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\094\255\
\000\000\000\000\000\000\000\000\000\000\000\000\130\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\096\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\115\255\007\255\000\000\158\255\
\186\255\000\000\000\000\043\255\141\255\196\255\224\255\234\255\
\006\000\016\000\035\000\069\255\000\000\000\000\009\255\000\000\
\116\255\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\039\255\000\000\000\000\069\255\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\240\255\000\000\115\000\
\091\000\000\000\082\000\225\255\000\000\000\000\014\000\021\000\
\000\000\000\000\000\000\000\000"

let yytablesize = 420
let yytable = "\021\000\
\050\000\052\000\001\000\054\000\059\000\060\000\061\000\062\000\
\037\000\029\000\052\000\061\000\062\000\037\000\037\000\030\000\
\052\000\064\000\065\000\066\000\067\000\068\000\069\000\070\000\
\078\000\015\000\037\000\080\000\081\000\082\000\083\000\072\000\
\084\000\085\000\086\000\087\000\088\000\089\000\090\000\091\000\
\053\000\016\000\017\000\093\000\044\000\095\000\053\000\057\000\
\018\000\044\000\044\000\005\000\006\000\007\000\008\000\098\000\
\099\000\092\000\019\000\094\000\020\000\022\000\044\000\020\000\
\044\000\044\000\106\000\023\000\024\000\028\000\044\000\044\000\
\024\000\109\000\032\000\033\000\031\000\048\000\034\000\035\000\
\059\000\060\000\061\000\062\000\053\000\056\000\108\000\036\000\
\024\000\055\000\111\000\075\000\077\000\112\000\073\000\020\000\
\037\000\038\000\039\000\024\000\024\000\040\000\041\000\024\000\
\024\000\079\000\032\000\033\000\104\000\105\000\034\000\035\000\
\024\000\055\000\107\000\056\000\050\000\051\000\014\000\036\000\
\049\000\024\000\024\000\024\000\058\000\113\000\024\000\024\000\
\037\000\038\000\039\000\036\000\114\000\040\000\041\000\000\000\
\036\000\036\000\036\000\036\000\036\000\036\000\045\000\000\000\
\000\000\000\000\000\000\045\000\045\000\036\000\000\000\036\000\
\036\000\036\000\036\000\036\000\036\000\036\000\036\000\038\000\
\045\000\000\000\045\000\045\000\038\000\038\000\038\000\038\000\
\045\000\045\000\000\000\000\000\000\000\059\000\060\000\061\000\
\062\000\038\000\000\000\038\000\038\000\038\000\038\000\038\000\
\038\000\038\000\038\000\039\000\066\000\067\000\068\000\069\000\
\039\000\039\000\039\000\039\000\000\000\046\000\000\000\000\000\
\000\000\000\000\046\000\046\000\000\000\039\000\000\000\039\000\
\039\000\039\000\039\000\039\000\039\000\039\000\039\000\046\000\
\000\000\046\000\046\000\046\000\046\000\046\000\046\000\046\000\
\046\000\047\000\005\000\006\000\007\000\008\000\047\000\047\000\
\009\000\000\000\000\000\048\000\000\000\000\000\000\000\010\000\
\048\000\048\000\000\000\047\000\000\000\047\000\047\000\047\000\
\047\000\047\000\047\000\047\000\047\000\048\000\000\000\048\000\
\048\000\048\000\048\000\048\000\048\000\048\000\048\000\049\000\
\000\000\000\000\000\000\000\000\049\000\049\000\000\000\000\000\
\000\000\042\000\000\000\000\000\000\000\000\000\042\000\042\000\
\000\000\049\000\000\000\049\000\049\000\049\000\049\000\049\000\
\049\000\049\000\049\000\042\000\043\000\036\000\000\000\000\000\
\000\000\043\000\043\000\042\000\042\000\000\000\037\000\038\000\
\039\000\000\000\000\000\040\000\041\000\074\000\043\000\059\000\
\060\000\061\000\062\000\000\000\000\000\000\000\076\000\043\000\
\059\000\060\000\061\000\062\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\000\000\064\000\065\000\066\000\
\067\000\068\000\069\000\070\000\071\000\103\000\000\000\059\000\
\060\000\061\000\062\000\000\000\000\000\110\000\000\000\059\000\
\060\000\061\000\062\000\000\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\064\000\065\000\066\000\067\000\
\068\000\069\000\070\000\071\000\059\000\060\000\061\000\062\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\063\000\
\000\000\064\000\065\000\066\000\067\000\068\000\069\000\070\000\
\071\000\059\000\060\000\061\000\062\000\000\000\000\000\000\000\
\000\000\059\000\060\000\061\000\062\000\000\000\064\000\065\000\
\066\000\067\000\068\000\069\000\070\000\071\000\064\000\065\000\
\066\000\067\000\068\000\069\000"

let yycheck = "\016\000\
\032\000\033\000\001\000\035\000\009\001\010\001\011\001\012\001\
\002\001\002\001\002\001\011\001\012\001\007\001\008\001\008\001\
\008\001\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\056\000\044\001\020\001\059\000\060\000\061\000\062\000\048\000\
\064\000\065\000\066\000\067\000\068\000\069\000\070\000\071\000\
\002\001\007\001\000\000\075\000\002\001\077\000\008\001\004\001\
\055\001\007\001\008\001\037\001\038\001\039\001\040\001\033\001\
\034\001\074\000\056\001\076\000\020\001\020\001\020\001\020\001\
\022\001\023\001\098\000\001\001\003\001\020\001\028\001\029\001\
\004\001\105\000\031\001\032\001\055\001\007\001\035\001\036\001\
\009\001\010\001\011\001\012\001\055\001\013\001\103\000\044\001\
\020\001\056\001\107\000\030\001\001\001\110\000\020\001\020\001\
\053\001\054\001\055\001\031\001\032\001\058\001\059\001\035\001\
\036\001\020\001\031\001\032\001\002\001\008\001\035\001\036\001\
\044\001\020\001\007\001\020\001\002\001\002\001\004\000\044\001\
\030\000\053\001\054\001\055\001\043\000\112\000\058\001\059\001\
\053\001\054\001\055\001\002\001\112\000\058\001\059\001\255\255\
\007\001\008\001\009\001\010\001\011\001\012\001\002\001\255\255\
\255\255\255\255\255\255\007\001\008\001\020\001\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\002\001\
\020\001\255\255\022\001\023\001\007\001\008\001\009\001\010\001\
\028\001\029\001\255\255\255\255\255\255\009\001\010\001\011\001\
\012\001\020\001\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\002\001\024\001\025\001\026\001\027\001\
\007\001\008\001\009\001\010\001\255\255\002\001\255\255\255\255\
\255\255\255\255\007\001\008\001\255\255\020\001\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\020\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\002\001\037\001\038\001\039\001\040\001\007\001\008\001\
\043\001\255\255\255\255\002\001\255\255\255\255\255\255\050\001\
\007\001\008\001\255\255\020\001\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\020\001\255\255\022\001\
\023\001\024\001\025\001\026\001\027\001\028\001\029\001\002\001\
\255\255\255\255\255\255\255\255\007\001\008\001\255\255\255\255\
\255\255\002\001\255\255\255\255\255\255\255\255\007\001\008\001\
\255\255\020\001\255\255\022\001\023\001\024\001\025\001\026\001\
\027\001\028\001\029\001\020\001\002\001\044\001\255\255\255\255\
\255\255\007\001\008\001\028\001\029\001\255\255\053\001\054\001\
\055\001\255\255\255\255\058\001\059\001\007\001\020\001\009\001\
\010\001\011\001\012\001\255\255\255\255\255\255\007\001\029\001\
\009\001\010\001\011\001\012\001\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\255\255\022\001\023\001\024\001\
\025\001\026\001\027\001\028\001\029\001\007\001\255\255\009\001\
\010\001\011\001\012\001\255\255\255\255\007\001\255\255\009\001\
\010\001\011\001\012\001\255\255\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\022\001\023\001\024\001\025\001\
\026\001\027\001\028\001\029\001\009\001\010\001\011\001\012\001\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\020\001\
\255\255\022\001\023\001\024\001\025\001\026\001\027\001\028\001\
\029\001\009\001\010\001\011\001\012\001\255\255\255\255\255\255\
\255\255\009\001\010\001\011\001\012\001\255\255\022\001\023\001\
\024\001\025\001\026\001\027\001\028\001\029\001\022\001\023\001\
\024\001\025\001\026\001\027\001"

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
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'main_decl) in
    Obj.repr(
# 40 "parse.mly"
                        ( (fst _1, snd _1, _2) )
# 406 "parse.ml"
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
# 420 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parse.mly"
                     ( ([], []) )
# 426 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'global_decl) in
    Obj.repr(
# 53 "parse.mly"
                         ( (List.rev (_2::fst _1), snd _1) )
# 434 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'action_decl) in
    Obj.repr(
# 54 "parse.mly"
                         ( (fst _1, List.rev (_2::snd _1)) )
# 442 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 57 "parse.mly"
                   ( (_1, _2) )
# 450 "parse.ml"
               : 'global_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 60 "parse.mly"
                            ( _3 )
# 457 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 63 "parse.mly"
                                 ( [_1] )
# 464 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 64 "parse.mly"
                                   ( _3::_1 )
# 472 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "parse.mly"
                                   ( _1, _2 )
# 480 "parse.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 70 "parse.mly"
                                                                 ( Block(List.rev _4) )
# 487 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 73 "parse.mly"
                                          ( [_1] )
# 494 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "parse.mly"
                                             ( _2 :: _1 )
# 502 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 77 "parse.mly"
                                            ( _1 )
# 509 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 78 "parse.mly"
                                            ( Expr _1 )
# 516 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 80 "parse.mly"
                                            ( Return _2 )
# 523 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'if_stmt) in
    Obj.repr(
# 81 "parse.mly"
                                            ( _1 )
# 530 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 82 "parse.mly"
                                            ( For(_2, _4, _6) )
# 539 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 83 "parse.mly"
                                           ( While(_2, _4) )
# 547 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 86 "parse.mly"
                                                ( If(_2, _4, _5) )
# 556 "parse.ml"
               : 'if_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 87 "parse.mly"
                                                ( If(_2, _4, _5) )
# 565 "parse.ml"
               : 'if_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 90 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 574 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 91 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 583 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parse.mly"
                         ( Block([]) )
# 589 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'else_block) in
    Obj.repr(
# 95 "parse.mly"
                         ( _1 )
# 596 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 98 "parse.mly"
                                ( _3 )
# 603 "parse.ml"
               : 'else_block))
; (fun __caml_parser_env ->
    Obj.repr(
# 101 "parse.mly"
                        ( Int    )
# 609 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parse.mly"
                        ( Bool   )
# 615 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "parse.mly"
                        ( Float  )
# 621 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "parse.mly"
                        ( None   )
# 627 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 107 "parse.mly"
                       ( _1 )
# 634 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 108 "parse.mly"
                       ( Iliteral(_1) )
# 641 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 109 "parse.mly"
                       ( Fliteral(_1) )
# 648 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 110 "parse.mly"
                       ( Bliteral(_1) )
# 655 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 111 "parse.mly"
                       ( Sliteral(_1) )
# 662 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "parse.mly"
                       ( Id(_1) )
# 669 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 113 "parse.mly"
                       ( Assign(_1, _3) )
# 677 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 114 "parse.mly"
                       ( Binop(_1, Add,     _3) )
# 685 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 115 "parse.mly"
                       ( Binop(_1, Sub,     _3) )
# 693 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 116 "parse.mly"
                       ( Binop(_1, Mult,    _3) )
# 701 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 117 "parse.mly"
                       ( Binop(_1, Div,     _3) )
# 709 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parse.mly"
                       ( Binop(_1, And,     _3) )
# 717 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parse.mly"
                       ( Binop(_1, Or,      _3) )
# 725 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parse.mly"
                       ( Binop(_1, Equal,   _3) )
# 733 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parse.mly"
                       ( Binop(_1, Neq,   _3) )
# 741 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parse.mly"
                       ( Binop(_1, Less,    _3) )
# 749 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parse.mly"
                       ( Binop(_1, Leq,     _3) )
# 757 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parse.mly"
                       ( Binop(_1, Greater, _3) )
# 765 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parse.mly"
                       ( Binop(_1, Geq,     _3) )
# 773 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 130 "parse.mly"
                                  ( [] )
# 779 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 131 "parse.mly"
                                  ( List.rev _1 )
# 786 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parse.mly"
                                ( [_1] )
# 793 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parse.mly"
                                    ( _3 :: _1 )
# 801 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 138 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 809 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 141 "parse.mly"
                       ( Noexpr )
# 815 "parse.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parse.mly"
                       ( _1 )
# 822 "parse.ml"
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
