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
# 70 "parse.ml"
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
\001\000\003\000\002\000\004\000\005\000\005\000\006\000\006\000\
\007\000\007\000\009\000\009\000\010\000\010\000\008\000\000\000"

let yylen = "\002\000\
\003\000\000\000\003\000\006\000\001\000\002\000\001\000\002\000\
\001\000\001\000\000\000\001\000\001\000\003\000\005\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\016\000\002\000\000\000\000\000\000\000\
\003\000\001\000\000\000\000\000\000\000\010\000\007\000\000\000\
\005\000\000\000\009\000\000\000\000\000\006\000\008\000\000\000\
\004\000\013\000\000\000\000\000\015\000\000\000\014\000"

let yydgoto = "\002\000\
\004\000\005\000\007\000\015\000\016\000\017\000\018\000\019\000\
\027\000\028\000"

let yysindex = "\003\000\
\209\254\000\000\253\254\000\000\000\000\241\254\008\000\007\255\
\000\000\000\000\245\254\235\254\210\254\000\000\000\000\252\254\
\000\000\247\254\000\000\013\255\249\254\000\000\000\000\212\254\
\000\000\000\000\014\255\009\255\000\000\212\254\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\018\255\
\000\000\000\000\000\000\019\255\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\016\000\000\000\007\000\235\255\000\000\
\000\000\000\000"

let yytablesize = 57
let yytable = "\021\000\
\008\000\013\000\026\000\001\000\003\000\006\000\008\000\010\000\
\031\000\011\000\012\000\020\000\023\000\024\000\025\000\029\000\
\014\000\008\000\030\000\011\000\012\000\009\000\022\000\000\000\
\013\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\014\000\
\000\000\013\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\014\000"

let yycheck = "\004\001\
\022\001\046\001\024\000\001\000\052\001\009\001\022\001\000\000\
\030\000\003\001\022\001\058\001\022\001\001\001\022\001\002\001\
\061\001\022\001\010\001\002\001\002\001\006\000\016\000\255\255\
\046\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\061\001\
\255\255\046\001\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\061\001"

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
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'action_decls) in
    Obj.repr(
# 19 "parse.mly"
                               ( (_1,_2) )
# 270 "parse.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 22 "parse.mly"
                 ([])
# 276 "parse.ml"
               : 'action_decls))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 25 "parse.mly"
                            ( _3 )
# 283 "parse.ml"
               : 'main_decl))
; (fun __caml_parser_env ->
    let _4 = (Parsing.peek_val __caml_parser_env 2 : 'stmt_list) in
    Obj.repr(
# 28 "parse.mly"
                                                                ( Block(List.rev _4) )
# 290 "parse.ml"
               : 'stmt_block))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 31 "parse.mly"
                                          ( [_1] )
# 297 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 32 "parse.mly"
                                             ( _2 :: _1 )
# 305 "parse.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'stmt_block) in
    Obj.repr(
# 35 "parse.mly"
                                            ( _1 )
# 312 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 36 "parse.mly"
                                            ( Expr _1 )
# 319 "parse.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'call_action) in
    Obj.repr(
# 39 "parse.mly"
                       ( _1 )
# 326 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 40 "parse.mly"
                   ( Sliteral(_1) )
# 333 "parse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 43 "parse.mly"
                                  ( [] )
# 339 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 44 "parse.mly"
                                  ( List.rev _1 )
# 346 "parse.ml"
               : 'args_list_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 47 "parse.mly"
                                ( [_1] )
# 353 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 48 "parse.mly"
                                    ( _3 :: _1 )
# 361 "parse.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'args_list_opt) in
    Obj.repr(
# 51 "parse.mly"
                                                     ( ActionCall(_2, _4) )
# 369 "parse.ml"
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
