(* Semantically-checked Abstract Syntax Tree and functions for printing it *)

open Ast

type styp = typ | STemplateClass of string * typ

type sexpr =
  | SIliteral of int
  | SSeriesliteral of expr list
  (* | Comprehension of expr * string * expr *)
  | SDottedrange of expr * expr * bool
  | SFliteral of string
  | SBoollit of bool
  | SId of string
  | SBinop of expr * op * expr
  | SUnop of uop * expr
  | SAssign of string * expr
  | SClassCall of string * expr list
  | SHelperCall of string * expr list
  | SActionCall of string * expr list
  | SExprActionCall of expr * string * expr list
  | SNoexpr

type sstmt =
  | SBlock of stmt list
  | SExpr of expr
  | SReturn of expr
  | SIf of expr * stmt * stmt 
  | SFor of string * expr * stmt 
  | SWhile of expr * stmt
  | SNoexpr

type shelper_decl = 
  | SOneHdecl of string * bind list * expr 
  | SMultiHdecl of string * bind list * stmt

type sattr_decl = 
  | SMultiAdecl of typ option * string * stmt
  | SOneAdecl of typ option * string * expr 

type saction_decl = {
  sentitytyp : typ option;
  sentityid : string option;
  saname : string;
  saparams : bind list;
  sabody: stmt;
}

type sclass_decl = {
  scname : string;
  scparams : bind list;
  sctyp : typ;
  scargs : expr list;
  shelpers : helper_decl list;
  sattributes : attr_decl list;
}

(* can we have 2 cases of records *)

type sprogram = {
  smain : stmt;
  sclasses : class_decl list;
  sactions : action_decl list;
  shelpers : helper_decl list;
}