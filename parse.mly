/* Ocamlyacc parser for AHOD */

%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE LBRACK RBRACK COLON COMMA PLUS MINUS TIMES DIVIDE ASSIGN MOD POWER FLOOR DOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING ACTOR OBJECT STACK SERIES COLLECTION RANGE WHEN DO LET BE WITH NEW MAIN /* think about TIMES */
%token <int> LITERAL
%token <bool> BLIT
%token <string> ID ACTIONID CLASSID FLIT
%token CONST
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOT
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ 
%left PLUS MINUS
%left MOD 
%left FLOOR 
%left TIMES DIVIDE
%left POWER

%%

program:
      main_decl decls EOF { $1 }

decls:
     /* nothing */      {}
    | decls class_decl  {}
    | decls action_decl {}
    | decls helper_decl {}

main_decl:
      MAIN COLON stmt_block {} 

class_decl:
      LET clas BE typ WITH COLON class_block        {} //WITH COLON class_block: opt
    | LET clas BE typ                               {}
    | LET clas LPAREN params_opt RPAREN BE typ LPAREN args_opt RPAREN WITH COLON class_block     {} 

action_decl:
      WHEN typ ID DO ACTIONID LPAREN params_list RPAREN COLON stmt_block                           {} //typ ID: opt
    | WHEN DO ACTIONID LPAREN params_list RPAREN COLON stmt_block                                  {}
    //| WHEN typ ID DO ACTIONID params_list COLON stmt_block                           {}
    //| WHEN DO ACTIONID params_list COLON stmt_block                                  {}

helper_decl:
      ID LPAREN params_list RPAREN COLON stmt_block {}

helper_decl_list:
      helper_decl_list helper_decl {}  

attr_decl:
      const_opt typ_opt ID COLON stmt_block {}
    // | const_opt typ_opt ID COLON expr {}  distinction between stmt_block and expr within functions?
    // Can expressions be standalone rn?

attr_decl_list:
      attr_decl_list attr_decl {}   

stmt_block:
      /* nothing */      {} //shift/reduce conflict with ln 54 and 64, related to ID 
    | LBRACE stmt_block stmt RBRACE {}

class_block:
    LBRACE class_decl_list RBRACE {}

class_decl_list:
  | helper_decl_list {}
  | attr_decl_list {}
  | class_decl_list helper_decl_list {}
  | class_decl_list attr_decl_list {}

const_opt: 
     /* nothing */      {}
    | CONST   {}

typ_opt:
     /* nothing */      {}
    | typ   {}

typ:
      typ prim_typ {}
    | typ clas     {}
    | typ template_class {}
    
prim_typ:
      INT            { Int }
    | FLOAT         { Float }
    | BOOL          { Bool  }

clas:
     OBJECT         { }

template_class:
     LBRACK typ RBRACK { }

param:
      typ ID     { }

params_opt:
     /*nothing */                  {  }
    | params_list          {}

params_list:
      param                        {}
    | params_list COMMA  param      {}

arg:
      expr    {}

args_opt:
     /*nothing */                  {  }
    | args_list          {}

args_list:
     arg                          {}
    | args_list COMMA arg         {}

stmt:
      expr                    {} 
    | RETURN expr             {} 
    | if_stmt                 {}
    | for_stmt                {}
    | while_stmt              {}
 
if_stmt:
    //  IF               {} //maybe need to account for associativity here %left stuff
    | IF expr elif_stmt  {}
    | IF expr else_stmt  {}

elif_stmt:
      ELIF expr COLON stmt_block elif_stmt     {}
    | ELIF expr COLON stmt_block else_stmt     {}

else_stmt:
      ELSE COLON stmt_block     {}

for_stmt:
      FOR ID IN expr COLON stmt_block   {}

while_stmt:
      WHILE expr COLON stmt_block else_stmt   {}

expr:
    | expr PLUS   expr {} //binop 
    | expr MINUS  expr {}
    | expr TIMES  expr {}
    | expr DIVIDE expr {}
    | expr EQ     expr {}
    | expr NEQ    expr {}
    | expr LT     expr {}
    | expr LEQ    expr {}
    | expr GT     expr {}
    | expr GEQ    expr {}
    | expr AND    expr {}
    | expr OR     expr {}
    | expr MOD    expr {}
    | expr POWER  expr {}
    | expr FLOOR  expr {} //end of binop 
    | ID ASSIGN expr   {}
    | NOT expr         {}
    | LPAREN expr RPAREN {}
    | call_action      {}
    | call_class       {}
    | call_helper      {} 
    | LITERAL          {} //literals
    | FLIT             {} 
    | BLIT             {} 
    | Series_literal   {} 
    | ID               {} 
    | NONE             {}
//    | comprehension    {} 
//    | slice {}
//    | index {}

call_action:
      ID DO ACTIONID    {}
    | ID DO ACTIONID LPAREN args_opt RPAREN   {}

call_class: 
      clas LPAREN args_opt RPAREN {} 

call_helper: 
      ID LPAREN args_opt RPAREN {} 

Series_literal:
      LBRACK list_args_opt RBRACK {}

list_args_opt:
      /* nothing */      {}
      | expr items      {}

items:
      /* nothing */      {}
      | items COMMA expr  {}

//comprehension:
//    expr FOR ID IN expr {}

//slice:
//    | expr {}
//    | expr_opt

