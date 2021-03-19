/* Ocamlyacc parser for AHOD */

%{
open Ast

let fst (a,_,_) = a;;
let snd (_,b,_) = b;;
let trd (_,_,c) = c;;

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
      
      newline_list_opt main_decl decls EOF { Program($2, fst $3, snd $3, trd $3) }

      //newline_list_opt main_decl decls EOF { $2 }
      //newline_list_opt main_decl decls EOF { Program($2, $3) }

newline_list_opt:
      /* nothing */      {}
      | newline_list     {}

newline_list:
      NEWLINE     {}
      | newline_list NEWLINE  {}

decls:
     /* nothing */      { ([], [], []) }
    | decls class_decl  { (List.rev ($2::fst $1), snd $1, trd $1)}
    | decls action_decl { (fst $1, List.rev ($2::snd $1), trd $1) }
    | decls helper_decl { (fst $1, snd $1, List.rev ($2::trd $1)) }
    //| decls NEWLINE     {}

main_decl:
      MAIN COLON stmt_block { $3 } 

class_decl:
    LET CLASSID BE typ                               { Cdecl($2, [], $4, [], [], []) }
    | LET CLASSID BE typ WITH COLON class_block        { Cdecl($2, [], $4, [], [], []) } 
    | LET CLASSID LPAREN params_list_opt RPAREN BE typ LPAREN args_list_opt RPAREN     { Cdecl($2, $4, $7, $9, [], []) } 
    | LET CLASSID LPAREN params_list_opt RPAREN BE typ LPAREN args_list_opt RPAREN WITH COLON class_block     { Cdecl($2, $4, $7, $9, fst $13, snd $13) } 

action_decl:
    WHEN DO ACTIONID COLON stmt_block             { Nahadecl($3, [], $5) }
    | WHEN DO ACTIONID LPAREN params_list RPAREN COLON stmt_block          { Nahadecl($3, $5, $8) }
    | WHEN typ ID DO ACTIONID COLON stmt_block               { Yesadecl($2, $3, $5, [], $7) }
    | WHEN typ ID DO ACTIONID LPAREN params_list RPAREN COLON stmt_block   { Yesadecl($2, $3, $5, $7, $10) } 

helper_decl:
    | ID LPAREN params_list_opt RPAREN COLON expr NEWLINE { OneHdecl($1, $3, $6) }
    | ID LPAREN params_list_opt RPAREN COLON stmt_block { MultiHdecl($1,$3,$6)}

class_block:
    NEWLINE LBRACE class_decl_list RBRACE { $3 }

class_decl_list:
  | helper_decl                     { ([$1], [], []) }
  | attr_decl                       { ([], [$1], []) }
  | class_decl_list helper_decl     { (List.rev ($2::fst $1), snd $1, []) }
  | class_decl_list attr_decl       { (fst $1, List.rev ($2::snd $1), []) }

params_list_opt:
     /*nothing */                  {[]}
    | params_list                  {List.rev $1}

params_list:
    //  param                        {$1} //need to get first element of list 
    | params_list COMMA param      {$3::$1}

param:
      typ ID                       {$1, $2}


args_list_opt:
    /*nothing */                  { [] }
    | args_list                   { List.rev $1 }

args_list:
    //  arg                        { $1 } //need to get first element of list 
    | args_list COMMA arg          { $3 :: $1}

arg:
    non_assign_expr               { $1 }
    // | ID ASSIGN non_assign_expr     {}

// is there any way to make typ_opt without conflicts? 
attr_decl:
    //const_opt typ_opt ID COLON stmt_block {}
    //| const_opt typ_opt ID COLON expr NEWLINE {}  
    | ID COLON stmt_block { Adecl($1, $3) }
    | typ ID COLON stmt_block { TypAdecl($1, $2, $4) }
    | CONST ID COLON stmt_block { Adecl($2, $4) } //take account for const? 
    | CONST typ ID COLON stmt_block { TypAdecl($2, $3, $5) }
    | ID COLON expr NEWLINE { ExprAdecl($1, $3)}
    | typ ID COLON expr NEWLINE { TypExprAdecl($1, $2, $4)}
    | CONST ID COLON expr NEWLINE { ExprAdecl($2, $4) }
    | CONST typ ID COLON expr NEWLINE { TypExprAdecl($2, $3, $5) }

stmt_block: //called in for, while
    NEWLINE LBRACE stmt_list RBRACE              { Block(List.rev $3)}

stmt_list: //called by stmt_block
    /* nothing */                            { [] }
    // stmt                                  { $1 } //need to get head of list
    // | stmt_list NEWLINE                   { $1 }
    | stmt_list stmt                         { $2 :: $1 }

//const_opt: 
//     /* nothing */      {}
//    | CONST   {}

// typ_opt:
     /* nothing */      //{ None }
    //| typ   { $1 }

typ:
    | INT               { Int    }
    | BOOL              { Bool   }
    | FLOAT             { Float  }
    | NONE              { None   }
    | CLASSID           { ClassID } 
    | template_class    { $1 }

template_class:
     CLASSID LBRACK typ RBRACK {TemplateClass($1, $3)}  

stmt:
    | stmt_block                            { $1 }
    | expr NEWLINE                          { Expr $1} 
    // | PASS NEWLINE                       { }
    | RETURN expr_opt NEWLINE               { Return $2}
    | if_stmt                               { $1 }
    | FOR ID IN expr COLON stmt_block       { For($2, $4, $6)} 
    | WHILE expr COLON stmt_block          { While($2, $4)} 

 
// IF expr COLON stmt_block (ELIF expr COLON stmt_block)* (ELSE COLON stmt_block)?
// IF = expr * stmt * stmt

if_stmt:
    //| IF expr COLON stmt_block ELSE stmt_block

    | IF expr COLON stmt_block elif_stmt        { If($2, $4, $5) }
    | IF expr COLON stmt_block else_block_opt   { If($2, $4, $5) }

elif_stmt:
    | ELIF expr COLON stmt_block elif_stmt          { If($2, $4, $5) }
    | ELIF expr COLON stmt_block else_block_opt     { If($2, $4, $5) }

else_block_opt:
      /* nothing */      { Block([]) }
      | else_block       { $1 }

else_block:
      ELSE COLON stmt_block     { $3 }

expr:
    non_assign_expr    { $1 }
    | ID ASSIGN expr   { Assign($1, $3)}

non_assign_expr: // distinction between non_assign_expr and expr due to reduce/reduce ambiguity with arg ID ASSIGN expr and assignment
    | ID               { Id($1)} 
    | NONE             { Noexpr}
    | ILIT             { Iliteral($1)} 
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

    | call_class       { $1 }
    | call_helper      { $1 } 
    | call_action      { Noexpr} //lines 178-180: look at decls in microc? 

    | dotted_range     { $1 }

    //    | comprehension    { $1 } 
    //    | index {}
    //    | slice            { $1 }


//not (expr for id in expr)
//(not expr) for id in expr

call_class: 
     CLASSID LPAREN args_list_opt RPAREN            { Call($1, $3) } 

call_helper: 
      ID LPAREN args_list_opt RPAREN                { Call($1, $3) }

call_action:
    | DO ACTIONID                                    {} //{ $2 }
    | expr DO ACTIONID                               {} //{ ($1, $3) }
    | DO ACTIONID LPAREN args_list_opt RPAREN        {} // { Call($2, $4)}
    | expr DO ACTIONID LPAREN args_list_opt RPAREN   {} //{ ($1, Call($3, $5))}

Series_literal:
      LBRACK list_args_opt RBRACK { Seriesliteral($2)}

list_args_opt:
      /* nothing */      {[]}
      | items            {$1}

items:
      expr                {[$1]}
      | items COMMA expr  {$3::$1}

dotted_range:
      | expr DOTDOT expr    { Dottedrange($1, $3, true)} // true for inclusive of end value, false for exclusive
      | expr DOTDOTDOT expr { Dottedrange($1, $3, false)}

// 3*3..4*4
// 3...9 for id in

//comprehension:
//    expr FOR ID IN expr { Comprehension($1, $3, $5)}

//slice:
//    | expr {}
//    | expr_opt COLON expr_opt {}
//    | expr_opt COLON expr_opt COLON expr {}

expr_opt:
    /* nothing */      { Noexpr }
    | expr             { $1 }


