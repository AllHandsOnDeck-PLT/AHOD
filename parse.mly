/* Ocamlyacc parser for AHOD */

%{
open Ast

let frst (a,_,_) = a;;
let scnd (_,b,_) = b;;
let trd (_,_,c) = c;;

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
    main_decl action_decl EOF { ($1,$2) }
/*
    newline_list_opt main_decl action_decl EOF

    {{ 
    	main = $2;
	action = $3
    }}*/

newline_list_opt:
      /* nothing */      {}
      | newline_list     {}

newline_list:
      NEWLINE     {}
      | newline_list NEWLINE  {}

main_decl:
      MAIN COLON stmt_block { $3 } 

action_decl:
    WHEN DO ACTIONID COLON stmt_block             
    {{ 
      entitytyp = None;
      entityid = "";
      aname = $3;
      aparams = [];
      abody = $5 }}

    | WHEN DO ACTIONID LPAREN params_list RPAREN COLON stmt_block          
    {{ 
      entitytyp = None;
      entityid = "";
      aname = $3;
      aparams = $5;
      abody = $8 }}

    | WHEN typ ID DO ACTIONID COLON stmt_block               
    {{ 
      entitytyp = $2;
      entityid = $3;
      aname = $5;
      aparams = [];
      abody = $7 }}

    | WHEN typ ID DO ACTIONID LPAREN params_list RPAREN COLON stmt_block   
    {{ 
      entitytyp = $2;
      entityid = $3;
      aname = $5;
      aparams = $7;
      abody = $10 }}

params_list_opt:
     /*nothing */                  { [] }
    | params_list                  { List.rev $1 }

params_list:
    param                        { [$1] } 
    | params_list COMMA param      { $3::$1 }

param:
      typ ID                       { $1, $2 }

stmt_block: //called in for, while
    NEWLINE LBRACE stmt_list RBRACE              { Block(List.rev $3) }

stmt_list: //called by stmt_block
    stmt                                  { [$1] }
    // | stmt_list NEWLINE                   { $1 }
    | stmt_list stmt                         { $2 :: $1 }

args_list_opt:
    /*nothing */                  { [] }
    | args_list                   { List.rev $1 }

args_list:
    arg                        { [$1] } 
    | args_list COMMA arg          { $3 :: $1 }

arg:
    non_assign_expr               { $1 }

typ:
    | prim_typ          { $1 }
    | CLASSID           { ClassID } 
    | template_class    { $1 }

prim_typ:
    | INT               { Int    }
    | BOOL              { Bool   }
    | FLOAT             { Float  }
    | STRING            { String  }
    | NONE              { None   }

template_class:
     CLASSID LBRACK typ RBRACK {TemplateClass($1, $3) }  

stmt:
    | stmt_block                            { $1 }
    | expr NEWLINE                          { Expr $1 } 

expr:
    non_assign_expr    { $1 }

non_assign_expr:     
    | call_action      { $1 } 
    | SLIT 	       { Sliteral($1) }

call_action:
    | DO ACTIONID                                    { ActionCall($2, []) } 
    | expr DO ACTIONID                               { ExprActionCall($1, $3, []) } 
    | DO ACTIONID LPAREN args_list_opt RPAREN        { ActionCall($2, $4) } 
    | expr DO ACTIONID LPAREN args_list_opt RPAREN   { ExprActionCall($1, $3, $5) } 
