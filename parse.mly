%{
	open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE COLON COMMA PLUS MINUS MULT DIVIDE ASSIGN MOD POWER FLOOR DOT DOTDOT DOTDOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING RANGE WHEN DO EXTERNAL LET BE WITH PASS MAIN TIMES CONST
%token <int> ILIT
%token <bool> BLIT
%token <string> ID ACTIONID CLASSID FLIT SLIT
%token EOF

%start program
%type <Ast.program> program

%nonassoc FOR IN
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ 
%nonassoc DO
%nonassoc DOTDOT DOTDOTDOT
%nonassoc COLON
%left PLUS MINUS
%left MOD 
%left FLOOR 
%left MULT DIVIDE
%left POWER
%right NOT

%%

program:
    main_decl action_decls EOF { ($1,$2) }

action_decls:
	/* nothing */			{[]} 

main_decl:
      MAIN COLON stmt_block { $3 } 

stmt_block:
    NEWLINE LBRACE NEWLINE stmt_list RBRACE NEWLINE             { Block(List.rev $4) }

stmt_list: 
    stmt                                  { [$1] }
    | stmt_list stmt                         { $2 :: $1 }

stmt:
    | stmt_block                            { $1 }
    | expr NEWLINE                          { Expr $1 } 

expr:
    | call_action                    { $1 } 
    | ILIT                           { Iliteral($1) } 
    | FLIT                           { Fliteral($1) } 
    | BLIT                           { Bliteral($1) } 
    | SLIT 	                         { Sliteral($1) }
    | LSQUARE args_list_opt RSQUARE  { Seriesliteral($2) }
    | ID                             { Id($1) } 
    | ID ASSIGN expr                 { Assign($1, $3) }
    | expr PLUS   expr               { Binop($1, Add,     $3) } 
    | expr MINUS  expr               { Binop($1, Sub,     $3) }
    | expr MULT   expr               { Binop($1, Mult,    $3) }
    | expr DIVIDE expr               { Binop($1, Div,     $3) }
    | expr AND    expr               { Binop($1, And,     $3) }
    | expr OR     expr               { Binop($1, Or,      $3) }
    | expr EQ     expr               { Binop($1, Equal,   $3) }
    | expr NEQ    expr               { Binop($1, Neq,   $3) }
    | expr LT     expr               { Binop($1, Less,    $3) }
    | expr LEQ    expr               { Binop($1, Leq,     $3) }
    | expr GT     expr               { Binop($1, Greater, $3) }
    | expr GEQ    expr               { Binop($1, Geq,     $3) }
    

args_list_opt:
    /*nothing */                  { [] }
    | args_list                   { List.rev $1 }

args_list:
    expr                        { [$1] } 
    | args_list COMMA expr          { $3 :: $1 }

call_action:
    | DO ACTIONID LPAREN args_list_opt RPAREN        { ActionCall($2, $4) } 
