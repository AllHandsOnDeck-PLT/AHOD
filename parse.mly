%{
open Ast
%}

%token LPAREN RPAREN LBRACE RBRACE LSQUARE RSQUARE SERIESSIZE SERIESPUSH SERIESPOP SERIES COLON SEMI COMMA PLUS MINUS MULT DIVIDE ASSIGN FLOOR DOT NEWLINE
%token NOT EQ NEQ LT LEQ GT GEQ AND OR
%token RETURN IF ELIF ELSE FOR WHILE INT BOOL FLOAT NONE STRING RANGE WHEN DO LET BE WITH MAIN PRINT TIMES CONST
%token CEND
%token <int> ILIT
%token <bool> BLIT
%token <string> ID ACTIONID FLIT SLIT
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOELSE
%nonassoc FOR IN
%right ASSIGN
%left OR
%left AND
%left EQ NEQ
%left LT GT LEQ GEQ 
%nonassoc DO
%nonassoc COLON
%left PLUS MINUS
%left MULT DIVIDE
%right NOT

%%
/*cend_opt?  stuff, look */ 
program:
    decls main_decl EOF { (fst $1, snd $1, $2) }

decls:
    /*nothing*/      { ([], []) }
    | decls global_decl  { (List.rev ($2::fst $1), snd $1) }
    // | decls class_decl { (fst $1, List.rev ($2::snd $1)) }
    | decls action_decl { (fst $1, List.rev ($2::snd $1)) }

cend_opt: /*comment */ 
    /*nothing */ { Noexpr } 
    | CEND       { Noexpr }

global_decl:
    typ ID cend_opt NEWLINE { ($1, $2)}
    
main_decl:/*cend_opt? */ 
    MAIN COLON cend_opt NEWLINE LBRACE NEWLINE locals_list stmt_wrap RBRACE NEWLINE {{ 
    mtyp = None; 
    mparams = [];
    mlocals = $7;
    mbody = [$8] }}

action_decl: 
    WHEN DO typ ACTIONID LPAREN params_list_opt RPAREN COLON NEWLINE LBRACE NEWLINE locals_list stmt_wrap RBRACE NEWLINE 
    {{ 
      atyp = $3;
      aname = $4;
      aparams = List.rev $6; 
      alocals = List.rev $12;
      abody = [$13] }}

/*add locals into action _decl and main */
class_block:
    NEWLINE LBRACE NEWLINE class_decl_list RBRACE NEWLINE { $4 }

class_decl_list:
  | action_decl                     { ([$1], []) }
  | attr_decl                       { ([], [$1]) }
  | class_decl_list action_decl     { (List.rev ($2::fst $1), snd $1) }
  | class_decl_list attr_decl       { (fst $1, List.rev ($2::snd $1)) }

attr_decl:
    | typ ID COLON expr NEWLINE { OneAdecl($1, $2, $4)}

params_list_opt: 
    |params_list    {$1}
    | /*Nothing*/   {[]}

params_list:
    param                          { [$1] } 
    | params_list COMMA param      { $3::$1 }

param:
      typ ID                       { $1, $2 }

stmt_block: /* doesn't have comment optional before first newline, causes reduce reduce but added cend_opt btwn most instances of stmt_block*/
    NEWLINE LBRACE cend_opt NEWLINE stmt_list RBRACE cend_opt NEWLINE              { Block(List.rev $5) }

locals_list:
    | /*nothing */                         {[]}
    | locals_list global_decl              {$2 :: $1 }

stmt_wrap: 
    stmt_list                               { Block(List.rev $1) }

stmt_list: 
    stmt                                     { [$1] }
    | stmt_list stmt                         { $2 :: $1 }

stmt:
    | stmt_block                                { $1 }
    | expr cend_opt NEWLINE                     { Expr $1} 
    | RETURN expr_opt NEWLINE               { Return $2} /* doesn't have comment optional causes shift reduce*/
    | if_stmt                               { $1 }
    | FOR LPAREN expr SEMI expr SEMI expr RPAREN COLON cend_opt stmt_block  { For($3, $5, $7, $11)   }
    /* | FOR ID IN expr COLON stmt_block       { ForLit($2, $4, $6) }  */
    | WHILE expr COLON cend_opt stmt_block           { While($2, $5) } 
    | ID DOT SERIESPUSH LPAREN expr RPAREN cend_opt NEWLINE { SeriesPush($1, $5)}
    
if_stmt:
    | IF expr COLON cend_opt stmt_block elif_stmt        { If($2, $5, $6) }
    | IF expr COLON cend_opt stmt_block else_block_opt   { If($2, $5, $6) }

elif_stmt:
    | ELIF expr COLON cend_opt stmt_block elif_stmt          { If($2, $5, $6) }
    | ELIF expr COLON cend_opt stmt_block else_block_opt     { If($2, $5, $6) }

else_block_opt:
      /* nothing */      { Block([]) }
      | else_block       { $1 }

else_block:
      ELSE COLON cend_opt stmt_block     { $4 }

typ:
    | INT               { Int       }
    | BOOL              { Bool      }
    | FLOAT             { Float     }
    | STRING            { String    }
    | NONE              { None      }
    | SERIES LT typ GT  { Series($3)}

expr:
    | call_print                    { $1 } 
    | call_action                    { $1 } 
    | call_attr        { $1 }
    | ILIT                           { Iliteral($1) } 
    | FLIT                           { Fliteral($1) } 
    | BLIT                           { Bliteral($1) } 
    | SLIT 	                         { Sliteral($1) }
    | LSQUARE args_list_opt RSQUARE  { Seriesliteral($2) }
    | ID LSQUARE expr RSQUARE        { SeriesGet($1, $3) }
    | ID DOT SERIESSIZE LPAREN RPAREN { SeriesSize($1)}
    | ID DOT SERIESPOP LPAREN RPAREN { SeriesPop($1)}
    | ID                             { Id($1) } 
    | ID ASSIGN expr                 { Assign($1, $3) }
    | CEND                           { Noexpr }
    | expr PLUS   expr               { Binop($1, Add,     $3) } 
    | expr MINUS  expr               { Binop($1, Sub,     $3) }
    | expr MULT   expr               { Binop($1, Mult,    $3) }
    | expr DIVIDE expr               { Binop($1, Div,     $3) }
    | expr AND    expr               { Binop($1, And,     $3) }
    | expr OR     expr               { Binop($1, Or,      $3) }
    | expr EQ     expr               { Binop($1, Equal,   $3) }
    | expr NEQ    expr               { Binop($1, Neq,   $3)   }
    | expr LT     expr               { Binop($1, Less,    $3) }
    | expr LEQ    expr               { Binop($1, Leq,     $3) }
    | expr GT     expr               { Binop($1, Greater, $3) }
    | expr GEQ    expr               { Binop($1, Geq,     $3) }
    | MINUS expr %prec NOT           { Unop(Neg, $2)          }
    | NOT expr                       { Unop(Not, $2)          }

args_list_opt:
    /*nothing */                  { [] }
    | args_list                   { List.rev $1 }

args_list:
    expr                            { [$1] } 
    | args_list COMMA expr          { $3 :: $1 }

call_print:
    | DO PRINT LPAREN expr RPAREN        { PrintCall($4) } 

call_action:
    | DO ACTIONID LPAREN args_list_opt RPAREN        { ActionCall($2, $4) } 
    | expr DO ACTIONID LPAREN args_list_opt RPAREN   { ExprActionCall($1, $3, $5) } 

call_attr:
    ID DOT ID      { AttrCall($1, $3) }
  
expr_opt:
    /* nothing */      { Noexpr }
    | expr             { $1 }
