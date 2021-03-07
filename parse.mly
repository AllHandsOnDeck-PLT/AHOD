/* Ocamlyacc parser for AHOD */

%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE LBRACK RBRACK COLON COMMA PLUS MINUS MULT DIVIDE ASSIGN MOD POWER FLOOR DOTDOT DOTDOTDOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR IN
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING RANGE WHEN DO LET BE WITH PASS MAIN TIMES CONST
%token <int> ILIT
%token <bool> BLIT
%token <string> ID ACTIONID CLASSID FLIT
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

// x or (y do something)
// x or y do something
//(x=y) do something
//x=(y do something)

//hi():
//  return 5

//hi(): 5

//hi():5

program:
      newline_list_opt main_decl decls EOF { $2 }

newline_list_opt:
      /* nothing */      {}
      | newline_list     {}

newline_list:
      NEWLINE     {}
      | newline_list NEWLINE  {}

decls:
     /* nothing */      {}
    | decls NEWLINE     {}
    | decls class_decl  {}
    | decls action_decl {}
    | decls helper_decl {}

main_decl:
      MAIN COLON stmt_block {} 

class_decl:
    LET CLASSID BE typ                               {}
    | LET CLASSID BE typ WITH COLON class_block        {} 
    | LET CLASSID LPAREN params_list_opt RPAREN BE typ LPAREN args_list_opt RPAREN     {} 
    | LET CLASSID LPAREN params_list_opt RPAREN BE typ LPAREN args_list_opt RPAREN WITH COLON class_block     {} 

action_decl:
    WHEN DO ACTIONID COLON stmt_block             {}
    | WHEN DO ACTIONID LPAREN params_list RPAREN COLON stmt_block          {}
    | WHEN typ ID DO ACTIONID COLON stmt_block               {}
    | WHEN typ ID DO ACTIONID LPAREN params_list RPAREN COLON stmt_block   {} 

helper_decl:
    | ID LPAREN params_list_opt RPAREN COLON expr NEWLINE {}
    | ID LPAREN params_list_opt RPAREN COLON stmt_block {}

params_list_opt:
     /*nothing */                  {  }
    | params_list          {}

params_list:
      param                        {}
    | params_list COMMA param      {}

param:
      typ_opt ID     { }

args_list_opt:
     /*nothing */                  {  }
    | args_list          {}

args_list:
     arg                          {}
    | args_list COMMA arg         {}

arg:
    non_assign_expr    {}
    | ID ASSIGN non_assign_expr    {}

attr_decl:
    //const_opt typ_opt ID COLON stmt_block {}
    //| const_opt typ_opt ID COLON expr NEWLINE {}  
    | ID COLON stmt_block {}
    | typ ID COLON stmt_block {}
    | CONST ID COLON stmt_block {}
    | CONST typ ID COLON stmt_block {}
    | ID COLON expr NEWLINE {}
    | typ ID COLON expr NEWLINE {}
    | CONST ID COLON expr NEWLINE {}
    | CONST typ ID COLON expr NEWLINE {}

stmt_block:
    NEWLINE LBRACE stmt_list RBRACE              {}

stmt_list:
    stmt              {}
    | stmt_list NEWLINE {}
    | stmt_list stmt {}

class_block:
    NEWLINE LBRACE class_decl_list RBRACE {}

class_decl_list:
  | helper_decl {}
  | attr_decl {}
  | class_decl_list helper_decl {}
  | class_decl_list attr_decl {}

//const_opt: 
//     /* nothing */      {}
//    | CONST   {}

typ_opt:
     /* nothing */      {}
    | typ   {}

typ:
    | prim_typ {}
    | CLASSID     {}
    | template_class {}
    
prim_typ:
      INT           { Int }
    | FLOAT         { Float }
    | BOOL          { Bool  }
    // SLIT

template_class:
     CLASSID LBRACK typ RBRACK { }

stmt:
      expr NEWLINE                         {} 
    | PASS NEWLINE                         {}
    | RETURN expr_opt NEWLINE              {} 
    | if_stmt                              {}
    | for_stmt                             {}
    | WHILE expr COLON stmt_block          {} 
 
for_stmt:
    | FOR ID IN expr COLON stmt_block      {} 
    | FOR expr TIMES COLON stmt_block      {}

if_stmt:
    | IF expr COLON stmt_block elif_stmt  {}
    | IF expr COLON stmt_block else_block_opt  {}

elif_stmt:
    | ELIF expr COLON stmt_block elif_stmt     {}
    | ELIF expr COLON stmt_block else_block_opt     {}

else_block_opt:
      /* nothing */      {}
      | else_block       {}

else_block:
      ELSE COLON stmt_block     {}

expr:
    non_assign_expr    { $1 }
    | ID ASSIGN expr   { Assign($1, $3)}

non_assign_expr: // distinction between non_assign_expr and expr due to reduce/reduce ambiguity with arg ID ASSIGN expr and assignment
    | ID               { Id($1)} 
    | NONE             { Noexpr}
    | ILIT          { Iliteral($1)} 
    | FLIT             { Fliteral($1)} 
    | BLIT             { Boollit($1) } 
    | Series_literal   { $1 }
    | NOT expr         { Unop(Not, $2)}
    | LPAREN expr RPAREN { $2}

    | expr PLUS   expr { Binop($1, Add,     $3)} 
    | expr MINUS  expr { Binop($1, Sub,     $3)}
    | expr MULT  expr { Binop($1, Mult,    $3)}
    | expr DIVIDE expr { Binop($1, Div,     $3)}
    | expr MOD    expr { Binop($1, Mod,     $3)}
    | expr POWER  expr { Binop($1, Power,   $3)}
    | expr FLOOR  expr { Binop($1, Floor,   $3) } 
    | expr AND    expr { Binop($1, And,     $3)}
    | expr OR     expr { Binop($1, Or,      $3)}

    | expr EQ     expr { Binop($1, Equal,   $3)}
    | expr NEQ    expr { Binop($1, Equal,   $3)}
    | expr LT     expr { Binop($1, Less,    $3)}
    | expr LEQ    expr { Binop($1, Leq,     $3)}
    | expr GT     expr { Binop($1, Greater, $3)}
    | expr GEQ    expr { Binop($1, Geq,     $3)}

    // augassign

    | call_class       { Noexpr}
    | call_helper      { Noexpr} 
    | call_action      { Noexpr} //lines 178-180: look at decls in microc? 

    | dotted_range     { $1 }
    | comprehension    { $1 } 
    //    | index {}
    | slice            { $1 }


//not (expr for id in expr)
//(not expr) for id in expr

call_class: 
      CLASSID LPAREN args_list_opt RPAREN     {} 

call_helper: 
      ID LPAREN args_list_opt RPAREN      {} 

call_action:
    | DO ACTIONID    {}
    | expr DO ACTIONID    {}
    | DO ACTIONID LPAREN args_list_opt RPAREN   {}
    | expr DO ACTIONID LPAREN args_list_opt RPAREN   {}

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

slice:
    | expr_colon_opt            { Slice(fst $1) }
    | expr_colon_opt COLON expr { }

    //[x:y:z] z is the step

    //| expr_opt COLON expr_opt     {}
    //| expr_opt COLON expr_opt COLON expr     {}
    // ^ the grammar, but expr_opt gave 32 shift/reduce and 38 reduce/reduce conflicts,
    // so I made a expr_colon_opt and wrote out all the cases instead
    // and somehow that got rid of most of the conflicts (with 1 shift/reduce conflict remaining)

expr_colon_opt:
    | COLON expr { (0, $2, false)}
    | expr COLON { ($1, 0, true)} // 0 is an unused variable, true means unbounded end, in order to reference the end of a list, design problem
    | COLON { (0, 0, true) }
    | expr COLON expr { ($1, $3, false)}

expr_opt:
    /* nothing */      {}
    | expr             {}


