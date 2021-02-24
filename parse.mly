/* Ocamlyacc parser for AHOD */

%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE COLON COMMA PLUS MINUS TIMES DIVIDE ASSIGN MOD POWER FLOOR DOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING ACTOR OBJECT STACK SERIES COLLECTION RANGE WHEN DO LET BE WITH NEW MAIN /* think about TIMES */
%token <int> LITERAL
%token <bool> BLIT
%token <string> ID FLIT
%token CONST
%token EOF

%start program
%type <Ast.program> program


%%

program:
    decls EOF { $1 }

decls:
     /* nothing */      {}
    | decls main_decl   {}
    | decls class_decl  {}
    | decls action_decl {}
    | decls helper_decl {}
    | decls attr_decl {}

main_decl:
    MAIN COLON stmt_block {} 

class_decl:
    LET BE class_block {}


action_decl:
    WHEN DO {}

helper_decl:
    ID COLON {}

attr_decl:
    CONST COLON {}

stmt_block:
    LBRACE RBRACE {}

class_block:
    LPAREN RPAREN {}

