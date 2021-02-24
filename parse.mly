/* Ocamlyacc parser for AHOD */

%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE STICK COLON COMMA PLUS MINUS TIMES DIVIDE ASSIGN MOD POWER FLOOR DOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING ACTOR OBJECT STACK SERIES COLLECTION RANGE WHEN DO LET BE WITH NEW MAIN /* think about TIMES */
%token <int> LITERAL
%token <bool> BLIT
%token <string> ID ACTIONID FLIT
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
    | params_list args_list      {}

action_decl:
      WHEN DO {}

helper_decl:
      ID COLON {}

attr_decl:
      CONST typ COLON {}

stmt_block:
      LBRACE stmt RBRACE {}

class_block:
      LPAREN RPAREN {}

typ:
      typ prim_typ {}
    | typ clas     {}
    | typ template_class {}
    
prim_typ:
     INT            { Int }
    | FLOAT         { Float }
    | BOOL          { Bool  }

clas:
     OBJECT         {  }

template_class:
     STICK typ STICK { }

param:
      typ ID     {}

params_list:
      param       {}

arg:
      ID expr    {}

args_list:
      arg       {}

stmt:
      RETURN expr     {}
    | stmt ID ASSIGN expr      {}
    | stmt if_stmt          {}
    | stmt for_stmt         {}
    | stmt while_stmt       {}

if_stmt:
    //  IF                 {}
    | IF expr elif_stmt  {}
    | IF expr else_stmt  {}

elif_stmt:
      ELIF      {}

else_stmt:
      ELSE      {}

for_stmt:
      FOR ID    {}

while_stmt:
      WHILE expr    {}

expr:
     LITERAL           {}
    |  ID              {                 }
    | expr PLUS        {    }
    | call_action      {}
    /*| expr MINUS  expr {    }
    | expr TIMES  expr {    }
    | expr DIVIDE expr {    }
    | expr EQ     expr { Binop($1, Equal, $3)   }
    | expr NEQ    expr { Binop($1, Neq,   $3)   }
    | expr LT     expr { Binop($1, Less,  $3)   }
    | expr LEQ    expr { Binop($1, Leq,   $3)   }
    | expr GT     expr { Binop($1, Greater, $3) }
    | expr GEQ    expr { Binop($1, Geq,   $3)   }
    | expr AND    expr { Binop($1, And,   $3)   }
    | expr OR     expr { Binop($1, Or,    $3)   }
    | MINUS expr %prec NOT { Unop(Neg, $2)      }
    | NOT expr         { Unop(Not, $2)          }
    | ID ASSIGN expr   { Assign($1, $3)         }
    | ID LPAREN args_opt RPAREN { Call($1, $3)  }
    | LPAREN expr RPAREN { $2                   }
    | expr MOD    expr {Binop($1, Mod,    $3)   }
    | expr POWER  expr {Binop($1, Power,    $3) }
    | expr FLOOR  expr {Binop($1, Floor,    $3) }
    | DO ID args_opt   { Call($2, $3)           }*/

call_action:
    ID DO ACTIONID    {}