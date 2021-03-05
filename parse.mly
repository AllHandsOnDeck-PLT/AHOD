/* Ocamlyacc parser for AHOD */

%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE LBRACK RBRACK COLON COMMA PLUS MINUS TIMES DIVIDE ASSIGN MOD POWER FLOOR DOTDOT DOTDOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING RANGE WHEN DO LET BE WITH MAIN /* think about TIMES */
%token <int> LITERAL
%token <bool> BLIT
%token <string> ID ACTIONID CLASSID FLIT
%token CONST
%token EOF

%start program
%type <Ast.program> program


%nonassoc FOR IN
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ 
%nonassoc DOTDOT DOTDOTDOT
%nonassoc COLON
%left PLUS MINUS
%left MOD 
%left FLOOR 
%left TIMES DIVIDE
%left POWER
%right NOT

%%

//hi():
//  return 5

//hi(): 5

//hi():5

program:
      main_decl decls EOF { $1 }
      //| main_decl decls EOF { $1, $2 }

decls:
     /* nothing */      {}
    | decls class_decl  {}
    | decls action_decl {}
    | decls helper_decl {}

main_decl:
      MAIN COLON stmt_block {} 

class_decl:
    LET clas BE typ                               {}
    | LET clas BE typ WITH COLON class_block        {} 
    | LET clas LPAREN params_list_opt RPAREN BE typ LPAREN args_list_opt RPAREN     {} 
    | LET clas LPAREN params_list_opt RPAREN BE typ LPAREN args_list_opt RPAREN WITH COLON class_block     {} 

action_decl:
    WHEN DO ACTIONID COLON stmt_block             {}
    | WHEN DO ACTIONID LPAREN params_list RPAREN COLON stmt_block          {}
    | WHEN typ ID DO ACTIONID COLON stmt_block               {}
    | WHEN typ ID DO ACTIONID LPAREN params_list RPAREN COLON stmt_block   {} 

helper_decl:
      ID LPAREN params_list RPAREN COLON stmt_block {}

helper_decl_list:
      helper_decl_list helper_decl {}  

params_list_opt:
     /*nothing */                  {  }
    | params_list          {}

params_list:
      param                        {}
    | params_list COMMA param      {}

param:
      typ ID {}
//      typ_opt ID     { }

args_list_opt:
     /*nothing */                  {  }
    | args_list          {}

args_list:
     arg                          {}
    | args_list COMMA arg         {}

arg:
      expr    {}

//typ_opt:
//      /*nothing */        {}
//      | typ               {}

attr_decl:
      const_opt typ_opt ID COLON stmt_block {}
    // | const_opt typ_opt ID COLON expr {}  distinction between stmt_block and expr within functions?
    // Can expressions be standalone rn?

attr_decl_list:
      attr_decl_list attr_decl {}   

stmt_block:
    LBRACE stmt_list RBRACE              {}

stmt_list:
    stmt              {}
    | stmt_list stmt {}

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
      INT           { Int }
    | FLOAT         { Float }
    | BOOL          { Bool  }

clas:
     CLASSID        { }

template_class:
     LBRACK typ RBRACK { }

stmt:
      expr NEWLINE                                          {} 
    | RETURN expr NEWLINE                                   {} 
    | if_stmt                                        {}
    | FOR ID IN expr COLON stmt_block                {} //Christi 
    | WHILE expr COLON stmt_block else_stmt          {} //Christi
 
if_stmt:
    | IF expr elif_stmt  {}
    | IF expr else_stmt  {}

elif_stmt:
      ELIF expr COLON stmt_block elif_stmt     {}
    | ELIF expr COLON stmt_block else_stmt     {}

else_stmt:
      ELSE COLON stmt_block     {}

expr:
    | expr PLUS   expr { Binop($1, Add,     $3)} //binop 
    | expr MINUS  expr { Binop($1, Sub,     $3)}
    | expr TIMES  expr { Binop($1, Mult,    $3)}
    | expr DIVIDE expr { Binop($1, Div,     $3)}
    | expr EQ     expr { Binop($1, Equal,   $3)}
    | expr NEQ    expr { Binop($1, Equal,   $3)}
    | expr LT     expr { Binop($1, Less,    $3)}
    | expr LEQ    expr { Binop($1, Leq,     $3)}
    | expr GT     expr { Binop($1, Greater, $3)}
    | expr GEQ    expr { Binop($1, Geq,     $3)}
    | expr AND    expr { Binop($1, And,     $3)}
    | expr OR     expr { Binop($1, Or,      $3)}
    | expr MOD    expr { Binop($1, Mod,     $3)}
    | expr POWER  expr { Binop($1, Power,   $3)}
    | expr FLOOR  expr { Binop($1, Floor,   $3) } //end of binop */
    | LITERAL          { Literal($1)} //literals
    | Series_literal   { $1 }
    | dotted_range     { $1 }
    | FLIT             { Fliteral($1)} 
    | BLIT             { BoolLit($1) } 
    | ID               { Id($1)} 
    | NONE             { Noexpr}
    | ID ASSIGN expr   { Assign($1, $3)}
    | NOT expr         { Unop(Not, $2)}
    | LPAREN expr RPAREN { $2}
    | call_action      { Noexpr} //lines 178-180: look at decls in microc? 
    | call_class       { Noexpr}
    | call_helper      { Noexpr} 
    | comprehension    { $1 } 
//    | slice            { $1 }
//    | index {}

//not (expr for id in expr)
//(not expr) for id in expr

call_action:
      ID DO ACTIONID    {}
    | ID DO ACTIONID LPAREN args_list_opt RPAREN   {}

call_class: 
      clas LPAREN args_list_opt RPAREN {} 

call_helper: 
      ID LPAREN args_list_opt RPAREN {} 

Series_literal:
      LBRACK list_args_opt RBRACK { Seriesliteral($2)}

list_args_opt:
      /* nothing */      {[]}
      | items      {$1}

items:
      expr      {[$1]}
      | items COMMA expr  {$3::$1}

dotted_range:
      | expr DOTDOT expr  { Dottedrange($1, $3, true)} // true for inclusive of end value, false for exclusive
      | expr DOTDOTDOT expr { Dottedrange($1, $3, false)}

// 3*3..4*4
// 3...9 for id in

comprehension:
    expr FOR ID IN expr { Comprehension($1, $3, $5)}

//slice:
//    //| expr {}
//    | expr_opt COLON expr_opt {}
//    | expr_opt COLON expr_opt COLON expr {}

//expr_opt:
//    /* nothing */      {}
//    | expr             {}


