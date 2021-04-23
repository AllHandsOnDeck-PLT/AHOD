%{
open Ast

let frst (a,_,_) = a;;
let scnd (_,b,_) = b;;
let trd (_,_,c) = c;;

%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE SERIESADD SERIES COLON SEMI COMMA PLUS MINUS MULT DIVIDE ASSIGN MOD POWER FLOOR DOT DOTDOT DOTDOTDOT NEWLINE
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
    decls main_decl EOF { (fst $1, snd $1, $2) }
    /*main_decl decls EOF { ($1, fst $2, snd $2) }*/

decls:
    /*nothing*/      { ([], []) }
    | decls global_decl  { (List.rev ($2::fst $1), snd $1) }
    // | decls class_decl { (fst $1, List.rev ($2::snd $1)) }
    | decls action_decl { (fst $1, List.rev ($2::snd $1)) }


/*decls:
     nothing      { ([], []) }
    | decls global_decl { (List.rev ($2::frst $1), scnd $1, trd $1) }
    | decls class_decl  { (List.rev ($2::fst $1), snd $1) }
    | decls action_decl { (fst $1, List.rev ($2::snd $1)) }
*/
 
global_decl:
    typ ID NEWLINE { ($1, $2) }
    
main_decl:
    MAIN COLON stmt_block { $3 } 

class_decl:
    LET CLASSID LPAREN params_list RPAREN BE COLON class_block     
    {{
      cname = $2;
      cparams = $4; 
      actions = fst $8;
      attributes = snd $8 }}

    /*LET CLASSID LPAREN params_list RPAREN BE COLON class_block        
    {{ 
      cname = $2;
      cparams = $4;
      attributes = $8 }}*/

action_decl: 
    WHEN DO typ ACTIONID LPAREN params_list_opt RPAREN COLON stmt_block      
    {{ 
      entitytyp = None;
      entityid = "";
      atyp = $3;
      aname = $4;
      aparams = $6 ; 
      abody = [$9] }}

// Block([]) 
// action_decl: 
//     WHENDO ACTIONID LPAREN params_list RPAREN COLON stmt_block          
//     {{ 
//       entitytyp = None;
//       entityid = "";
//       aname = $2;
//       typ = None;
//       aparams = $4;
//       abody = $7 }}
      
/*add locals into action _decl and main */
class_block:
    NEWLINE LBRACE NEWLINE class_decl_list RBRACE NEWLINE { $4 }

class_decl_list:
  | action_decl                     { ([$1], []) }
  | attr_decl                       { ([], [$1]) }
  | class_decl_list action_decl     { (List.rev ($2::fst $1), snd $1) }
  | class_decl_list attr_decl       { (fst $1, List.rev ($2::snd $1)) }
  /*
  | attr_decl                       { [$1] }
  | class_decl_list attr_decl       { List.rev ($2::$1) }*/

attr_decl:
    | typ ID COLON expr NEWLINE { OneAdecl($1, $2, $4)}
params_list_opt: 
    |params_list    {$1}
    | /*Nothing*/   {[]}


params_list:
    param                        { [$1] } 
    | params_list COMMA param      { $3::$1 }

param:
      typ ID                       { $1, $2 }

stmt_block:
    NEWLINE LBRACE NEWLINE stmt_list RBRACE NEWLINE              { Block(List.rev $4) }

stmt_list: 
    stmt                                  { [$1] }
    | stmt_list stmt                         { $2 :: $1 }

stmt:
    | stmt_block                            { $1 }
    | expr NEWLINE                          { Expr $1 } 
    // | PASS NEWLINE                       { }
    | RETURN expr_opt NEWLINE               { Return $2 }
    | if_stmt                               { $1 }
    | FOR LPAREN expr SEMI expr SEMI expr RPAREN COLON stmt_block  { For($3, $5, $7, $10)   }
    | FOR ID IN expr COLON stmt_block       { ForLit($2, $4, $6) } 
    | WHILE expr COLON stmt_block          { While($2, $4) } 
    | ID DOT SERIESADD LPAREN expr RPAREN   { SeriesAdd($1, $5)}
if_stmt:
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

typ:
    | INT               { Int       }
    | BOOL              { Bool      }
    | FLOAT             { Float     }
    | STRING            { String    }
    | NONE              { None      }
    | SERIES LT typ GT  { Series($3)}
    | CLASSID           { ClassID } 

expr:
    | call_action                    { $1 } 
    | call_class       { $1 }
    | call_attr        { $1 }
    | ILIT                           { Iliteral($1) } 
    | FLIT                           { Fliteral($1) } 
    | BLIT                           { Bliteral($1) } 
    | SLIT 	                         { Sliteral($1) }
    | LSQUARE args_list_opt RSQUARE  { Seriesliteral($2) }
    | ID LSQUARE expr RSQUARE        { SeriesGet($1, $3) }
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
    expr                            { [$1] } 
    | args_list COMMA expr          { $3 :: $1 }

call_action:
    | DO ACTIONID LPAREN args_list_opt RPAREN        { ActionCall($2, $4) } 
    | expr DO ACTIONID LPAREN args_list_opt RPAREN   { ExprActionCall($1, $3, $5) } 

call_class: 
     CLASSID LPAREN args_list_opt RPAREN            { ClassCall($1, $3) } 

call_attr:
    ID DOT ID      { AttrCall($1, $3) }
  
expr_opt:
    /* nothing */      { Noexpr }
    | expr             { $1 }
