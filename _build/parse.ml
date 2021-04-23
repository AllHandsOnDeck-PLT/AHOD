type token =
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LSQUARE
  | RSQUARE
  | SERIESADD
  | SERIES
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
  263 (* SERIESADD *);
  264 (* SERIES *);
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
\001\000\004\000\002\000\002\000\002\000\007\000\003\000\005\000\
\005\000\009\000\006\000\010\000\010\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\014\000\014\000\015\000\015\000\
\016\000\016\000\017\000\008\000\008\000\008\000\008\000\008\000\
\008\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\019\000\019\000\
\020\000\020\000\018\000\013\000\013\000\000\000"

let yylen = "\002\000\
\003\000\008\000\000\000\002\000\002\000\003\000\003\000\001\000\
\003\000\002\000\006\000\001\000\002\000\001\000\002\000\003\000\
\001\000\006\000\004\000\006\000\005\000\005\000\005\000\005\000\
\000\000\001\000\003\000\001\000\001\000\001\000\001\000\001\000\
\004\000\001\000\001\000\001\000\001\000\001\000\003\000\004\000\
\001\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\000\000\001\000\
\001\000\003\000\005\000\000\000\001\000\002\000"

let yydefred = "\000\000\
\003\000\000\000\062\000\000\000\000\000\028\000\029\000\030\000\
\032\000\031\000\000\000\000\000\000\000\005\000\004\000\000\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\007\000\006\000\033\000\000\000\000\000\000\000\000\000\008\000\
\000\000\000\000\000\000\010\000\000\000\000\000\000\000\000\000\
\000\000\000\000\035\000\037\000\000\000\036\000\038\000\014\000\
\000\000\012\000\000\000\017\000\034\000\000\000\009\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\013\000\000\000\000\000\
\000\000\000\000\015\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\002\000\039\000\000\000\016\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\011\000\000\000\
\000\000\045\000\046\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\019\000\000\000\
\040\000\000\000\000\000\000\000\021\000\022\000\026\000\000\000\
\059\000\000\000\000\000\000\000\018\000\020\000\000\000\027\000\
\000\000\023\000\024\000"

let yydgoto = "\002\000\
\003\000\004\000\013\000\014\000\030\000\048\000\015\000\031\000\
\032\000\049\000\050\000\051\000\061\000\052\000\117\000\118\000\
\119\000\053\000\058\000\059\000"

let yysindex = "\018\000\
\000\000\000\000\000\000\115\255\026\255\000\000\000\000\000\000\
\000\000\000\000\009\255\052\255\072\000\000\000\000\000\016\255\
\122\255\017\255\056\255\000\000\071\255\076\255\102\255\109\255\
\000\000\000\000\000\000\122\255\097\255\047\255\063\255\000\000\
\091\255\117\255\122\255\000\000\007\255\007\255\007\255\077\255\
\007\255\074\255\000\000\000\000\055\255\000\000\000\000\000\000\
\054\255\000\000\187\000\000\000\000\000\056\255\000\000\035\255\
\229\000\130\255\123\255\229\000\120\255\112\000\111\255\135\000\
\143\255\007\255\007\255\138\255\128\255\000\000\007\255\007\255\
\007\255\007\255\000\000\007\255\007\255\007\255\007\255\007\255\
\007\255\007\255\007\255\000\000\000\000\007\255\000\000\056\255\
\007\255\056\255\007\255\104\000\229\000\148\255\000\000\002\255\
\002\255\000\000\000\000\005\001\005\001\127\255\127\255\127\255\
\127\255\001\001\237\000\229\000\254\254\143\000\000\000\151\255\
\000\000\007\255\007\255\150\255\000\000\000\000\000\000\056\255\
\000\000\215\255\166\000\056\255\000\000\000\000\056\255\000\000\
\254\254\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\162\255\147\255\000\000\000\000\
\000\000\000\000\000\000\000\000\208\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\164\255\
\012\255\000\000\011\255\149\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\170\255\000\000\080\255\000\000\000\000\255\254\
\194\255\000\000\000\000\052\000\078\000\228\255\002\000\012\000\
\042\000\083\000\075\255\125\255\061\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\061\255\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\237\255\000\000\003\000\
\144\000\000\000\131\000\221\255\000\000\000\000\053\000\054\000\
\000\000\000\000\090\000\000\000"

let yytablesize = 546
let yytable = "\025\000\
\043\000\057\000\060\000\062\000\043\000\064\000\016\000\043\000\
\043\000\043\000\043\000\037\000\056\000\057\000\073\000\074\000\
\056\000\057\000\001\000\022\000\043\000\057\000\043\000\043\000\
\043\000\043\000\043\000\043\000\043\000\043\000\092\000\093\000\
\115\000\116\000\084\000\096\000\097\000\098\000\099\000\066\000\
\100\000\101\000\102\000\103\000\104\000\105\000\106\000\107\000\
\034\000\067\000\108\000\017\000\042\000\110\000\018\000\057\000\
\035\000\069\000\037\000\066\000\019\000\043\000\044\000\056\000\
\025\000\025\000\046\000\047\000\109\000\067\000\111\000\020\000\
\021\000\068\000\023\000\024\000\048\000\024\000\122\000\123\000\
\048\000\042\000\025\000\048\000\048\000\042\000\038\000\039\000\
\042\000\042\000\040\000\041\000\026\000\025\000\025\000\037\000\
\048\000\025\000\025\000\042\000\125\000\042\000\028\000\027\000\
\128\000\048\000\025\000\129\000\043\000\044\000\045\000\029\000\
\024\000\046\000\047\000\025\000\025\000\025\000\033\000\036\000\
\025\000\025\000\005\000\038\000\039\000\054\000\058\000\040\000\
\041\000\005\000\058\000\065\000\086\000\063\000\058\000\085\000\
\042\000\071\000\072\000\073\000\074\000\087\000\089\000\091\000\
\094\000\043\000\044\000\045\000\114\000\095\000\046\000\047\000\
\121\000\006\000\007\000\008\000\009\000\010\000\124\000\011\000\
\006\000\007\000\008\000\009\000\010\000\041\000\012\000\055\000\
\060\000\041\000\061\000\055\000\041\000\041\000\041\000\041\000\
\041\000\041\000\055\000\070\000\112\000\130\000\131\000\000\000\
\000\000\041\000\000\000\041\000\041\000\041\000\041\000\041\000\
\041\000\041\000\041\000\044\000\000\000\000\000\000\000\044\000\
\000\000\000\000\044\000\044\000\044\000\044\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\044\000\
\126\000\044\000\044\000\044\000\044\000\044\000\044\000\044\000\
\044\000\071\000\072\000\073\000\074\000\051\000\000\000\000\000\
\000\000\051\000\000\000\000\000\051\000\051\000\076\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\000\000\000\000\
\000\000\051\000\000\000\051\000\051\000\051\000\051\000\051\000\
\051\000\051\000\051\000\052\000\000\000\000\000\000\000\052\000\
\000\000\000\000\052\000\052\000\000\000\053\000\000\000\000\000\
\000\000\053\000\000\000\000\000\053\000\053\000\000\000\052\000\
\000\000\052\000\052\000\052\000\052\000\052\000\052\000\052\000\
\052\000\053\000\000\000\053\000\053\000\053\000\053\000\053\000\
\053\000\053\000\053\000\054\000\000\000\000\000\000\000\054\000\
\000\000\000\000\054\000\054\000\000\000\049\000\000\000\000\000\
\000\000\049\000\000\000\000\000\049\000\049\000\000\000\054\000\
\000\000\054\000\054\000\054\000\054\000\054\000\054\000\054\000\
\054\000\049\000\000\000\049\000\049\000\000\000\000\000\050\000\
\000\000\049\000\049\000\050\000\047\000\000\000\050\000\050\000\
\047\000\000\000\000\000\047\000\047\000\000\000\000\000\000\000\
\000\000\000\000\000\000\050\000\000\000\050\000\050\000\000\000\
\047\000\000\000\000\000\050\000\050\000\113\000\000\000\000\000\
\047\000\047\000\071\000\072\000\073\000\074\000\000\000\000\000\
\088\000\000\000\071\000\072\000\073\000\074\000\000\000\076\000\
\077\000\078\000\079\000\080\000\081\000\082\000\083\000\076\000\
\077\000\078\000\079\000\080\000\081\000\082\000\083\000\090\000\
\000\000\071\000\072\000\073\000\074\000\000\000\000\000\120\000\
\000\000\071\000\072\000\073\000\074\000\000\000\076\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\076\000\077\000\
\078\000\079\000\080\000\081\000\082\000\083\000\127\000\000\000\
\071\000\072\000\073\000\074\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\076\000\077\000\078\000\
\079\000\080\000\081\000\082\000\083\000\071\000\072\000\073\000\
\074\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\075\000\000\000\076\000\077\000\078\000\079\000\080\000\081\000\
\082\000\083\000\041\000\041\000\041\000\041\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\041\000\000\000\041\000\
\041\000\041\000\041\000\041\000\041\000\041\000\041\000\071\000\
\072\000\073\000\074\000\000\000\000\000\000\000\000\000\071\000\
\072\000\073\000\074\000\000\000\076\000\077\000\078\000\079\000\
\080\000\081\000\082\000\083\000\076\000\077\000\078\000\079\000\
\080\000\081\000\082\000\071\000\072\000\073\000\074\000\071\000\
\072\000\073\000\074\000\000\000\000\000\000\000\000\000\000\000\
\076\000\077\000\078\000\079\000\080\000\081\000\078\000\079\000\
\080\000\081\000"

let yycheck = "\019\000\
\002\001\037\000\038\000\039\000\006\001\041\000\004\000\009\001\
\010\001\011\001\012\001\005\001\002\001\002\001\013\001\014\001\
\006\001\006\001\001\000\017\000\022\001\010\001\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\066\000\067\000\
\035\001\036\001\054\000\071\000\072\000\073\000\074\000\005\001\
\076\000\077\000\078\000\079\000\080\000\081\000\082\000\083\000\
\002\001\015\001\086\000\026\001\046\001\089\000\046\001\091\000\
\010\001\004\001\005\001\005\001\009\001\055\001\056\001\057\001\
\004\001\005\001\060\001\061\001\088\000\015\001\090\000\000\000\
\057\001\019\001\058\001\022\001\002\001\022\001\114\000\115\000\
\006\001\002\001\022\001\009\001\010\001\006\001\033\001\034\001\
\009\001\010\001\037\001\038\001\022\001\033\001\034\001\005\001\
\022\001\037\001\038\001\046\001\120\000\022\001\001\001\028\001\
\124\000\031\001\046\001\127\000\055\001\056\001\057\001\003\001\
\022\001\060\001\061\001\055\001\056\001\057\001\022\001\057\001\
\060\001\061\001\008\001\033\001\034\001\009\001\002\001\037\001\
\038\001\008\001\006\001\058\001\010\001\057\001\010\001\006\001\
\046\001\011\001\012\001\013\001\014\001\022\001\032\001\001\001\
\007\001\055\001\056\001\057\001\001\001\022\001\060\001\061\001\
\002\001\039\001\040\001\041\001\042\001\043\001\009\001\045\001\
\039\001\040\001\041\001\042\001\043\001\002\001\052\001\006\001\
\022\001\006\001\022\001\002\001\009\001\010\001\011\001\012\001\
\013\001\014\001\035\000\049\000\091\000\129\000\129\000\255\255\
\255\255\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\002\001\255\255\255\255\255\255\006\001\
\255\255\255\255\009\001\010\001\011\001\012\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\022\001\
\002\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\011\001\012\001\013\001\014\001\002\001\255\255\255\255\
\255\255\006\001\255\255\255\255\009\001\010\001\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\255\255\255\255\
\255\255\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\002\001\255\255\255\255\255\255\006\001\
\255\255\255\255\009\001\010\001\255\255\002\001\255\255\255\255\
\255\255\006\001\255\255\255\255\009\001\010\001\255\255\022\001\
\255\255\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\022\001\255\255\024\001\025\001\026\001\027\001\028\001\
\029\001\030\001\031\001\002\001\255\255\255\255\255\255\006\001\
\255\255\255\255\009\001\010\001\255\255\002\001\255\255\255\255\
\255\255\006\001\255\255\255\255\009\001\010\001\255\255\022\001\
\255\255\024\001\025\001\026\001\027\001\028\001\029\001\030\001\
\031\001\022\001\255\255\024\001\025\001\255\255\255\255\002\001\
\255\255\030\001\031\001\006\001\002\001\255\255\009\001\010\001\
\006\001\255\255\255\255\009\001\010\001\255\255\255\255\255\255\
\255\255\255\255\255\255\022\001\255\255\024\001\025\001\255\255\
\022\001\255\255\255\255\030\001\031\001\006\001\255\255\255\255\
\030\001\031\001\011\001\012\001\013\001\014\001\255\255\255\255\
\009\001\255\255\011\001\012\001\013\001\014\001\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\009\001\
\255\255\011\001\012\001\013\001\014\001\255\255\255\255\009\001\
\255\255\011\001\012\001\013\001\014\001\255\255\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\024\001\025\001\
\026\001\027\001\028\001\029\001\030\001\031\001\009\001\255\255\
\011\001\012\001\013\001\014\001\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\024\001\025\001\026\001\
\027\001\028\001\029\001\030\001\031\001\011\001\012\001\013\001\
\014\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\022\001\255\255\024\001\025\001\026\001\027\001\028\001\029\001\
\030\001\031\001\011\001\012\001\013\001\014\001\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\022\001\255\255\024\001\
\025\001\026\001\027\001\028\001\029\001\030\001\031\001\011\001\
\012\001\013\001\014\001\255\255\255\255\255\255\255\255\011\001\
\012\001\013\001\014\001\255\255\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\031\001\024\001\025\001\026\001\027\001\
\028\001\029\001\030\001\011\001\012\001\013\001\014\001\011\001\
\012\001\013\001\014\001\255\255\255\255\255\255\255\255\255\255\
\024\001\025\001\026\001\027\001\028\001\029\001\026\001\027\001\
\028\001\029\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LSQUARE\000\
  RSQUARE\000\
  SERIESADD\000\
  SERIES\000\
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
# 450 "parse.ml"
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
# 464 "parse.ml"
               : 'action_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parse.mly"
                     ( ([], []) )
# 470 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'global_decl) in
    Obj.repr(
# 53 "parse.mly"
                         ( (List.rev (_2::fst _1), snd _1) )
# 478 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'action_decl) in
    Obj.repr(
# 54 "parse.mly"
                         ( (fst _1, List.rev (_2::snd _1)) )
# 486 "parse.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 57 "parse.mly"
                   ( (_1, _2) )
# 494 "parse.ml"
               : 'global_decl))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 60 "parse.mly"
                            ( _3 )
# 501 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 63 "parse.mly"
                                 ( [_1] )
# 508 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'params_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'param) in
    Obj.repr(
# 64 "parse.mly"
                                   ( _3::_1 )
# 516 "parse.ml"
               : 'params_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 67 "parse.mly"
                                   ( _1, _2 )
# 524 "parse.ml"
               : 'param))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 70 "parse.mly"
                                                                 ( Block(List.rev _4) )
# 531 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 73 "parse.mly"
                                          ( [_1] )
# 538 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "parse.mly"
                                             ( _2 :: _1 )
# 546 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 77 "parse.mly"
                                            ( _1 )
# 553 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 78 "parse.mly"
                                            ( Expr _1 )
# 560 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 80 "parse.mly"
                                            ( Return _2 )
# 567 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'if_stmt) in
    Obj.repr(
# 81 "parse.mly"
                                            ( _1 )
# 574 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 82 "parse.mly"
                                            ( For(_2, _4, _6) )
# 583 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 83 "parse.mly"
                                            ( While(_2, _4) )
# 591 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 84 "parse.mly"
                                            ( SeriesAdd(_1, _5))
# 599 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 87 "parse.mly"
                                                ( If(_2, _4, _5) )
# 608 "parse.ml"
               : 'if_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 88 "parse.mly"
                                                ( If(_2, _4, _5) )
# 617 "parse.ml"
               : 'if_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'elif_stmt) in
    Obj.repr(
# 91 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 626 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : 'expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_block) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'else_block_opt) in
    Obj.repr(
# 92 "parse.mly"
                                                    ( If(_2, _4, _5) )
# 635 "parse.ml"
               : 'elif_stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parse.mly"
                         ( Block([]) )
# 641 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'else_block) in
    Obj.repr(
# 96 "parse.mly"
                         ( _1 )
# 648 "parse.ml"
               : 'else_block_opt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 99 "parse.mly"
                                ( _3 )
# 655 "parse.ml"
               : 'else_block))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parse.mly"
                        ( Int       )
# 661 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "parse.mly"
                        ( Bool      )
# 667 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 104 "parse.mly"
                        ( Float     )
# 673 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 105 "parse.mly"
                        ( String    )
# 679 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parse.mly"
                        ( None      )
# 685 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 107 "parse.mly"
                        ( Series(_3))
# 692 "parse.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 110 "parse.mly"
                                     ( _1 )
# 699 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 111 "parse.mly"
                                     ( Iliteral(_1) )
# 706 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 112 "parse.mly"
                                     ( Fliteral(_1) )
# 713 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 113 "parse.mly"
                                     ( Bliteral(_1) )
# 720 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 114 "parse.mly"
                                     ( Sliteral(_1) )
# 727 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 115 "parse.mly"
                                     ( Seriesliteral(_2) )
# 734 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 116 "parse.mly"
                                     ( SeriesGet(_1, _3) )
# 742 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "parse.mly"
                                     ( Id(_1) )
# 749 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 118 "parse.mly"
                                     ( Assign(_1, _3) )
# 757 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 119 "parse.mly"
                                     ( Binop(_1, Add,     _3) )
# 765 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 120 "parse.mly"
                                     ( Binop(_1, Sub,     _3) )
# 773 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 121 "parse.mly"
                                     ( Binop(_1, Mult,    _3) )
# 781 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parse.mly"
                                     ( Binop(_1, Div,     _3) )
# 789 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 123 "parse.mly"
                                     ( Binop(_1, And,     _3) )
# 797 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 124 "parse.mly"
                                     ( Binop(_1, Or,      _3) )
# 805 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 125 "parse.mly"
                                     ( Binop(_1, Equal,   _3) )
# 813 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 126 "parse.mly"
                                     ( Binop(_1, Neq,   _3) )
# 821 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 127 "parse.mly"
                                     ( Binop(_1, Less,    _3) )
# 829 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 128 "parse.mly"
                                     ( Binop(_1, Leq,     _3) )
# 837 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 129 "parse.mly"
                                     ( Binop(_1, Greater, _3) )
# 845 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parse.mly"
                                     ( Binop(_1, Geq,     _3) )
# 853 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 133 "parse.mly"
                                  ( [] )
# 859 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 134 "parse.mly"
                                  ( List.rev _1 )
# 866 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parse.mly"
                                    ( [_1] )
# 873 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "parse.mly"
                                    ( _3 :: _1 )
# 881 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 141 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 889 "parse.ml"
               : 'call_action))
; (fun __caml_parser_env ->
    Obj.repr(
# 144 "parse.mly"
                       ( Noexpr )
# 895 "parse.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 145 "parse.mly"
                       ( _1 )
# 902 "parse.ml"
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
