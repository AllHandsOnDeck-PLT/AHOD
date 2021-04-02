%{
	open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE LBRACK RBRACK COLON COMMA PLUS MINUS MULT DIVIDE ASSIGN MOD POWER FLOOR DOT DOTDOT DOTDOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING RANGE WHEN DO EXTERNAL LET BE WITH PASS MAIN TIMES CONST
%token <int> ILIT
%token <bool> BLIT
%token <string> ID ACTIONID CLASSID FLIT SLIT
%token EOF

%start program
%type <Ast.program> program

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
    | call_action      { $1 } 
    | ILIT             { Iliteral($1) } 
    | FLIT             { Fliteral($1) } 
    | BLIT             { Bliteral($1) } 
    | SLIT 	       { Sliteral($1) }
    

args_list_opt:
    /*nothing */                  { [] }
    | args_list                   { List.rev $1 }

args_list:
    expr                        { [$1] } 
    | args_list COMMA expr          { $3 :: $1 }

call_action:
    | DO ACTIONID LPAREN args_list_opt RPAREN        { ActionCall($2, $4) } 
  