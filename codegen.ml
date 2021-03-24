

(* Code generation: translate takes a semantically checked AST and
produces LLVM IR

LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/

*)

module L = Llvm
module A = Ast
open Sast 

module StringMap = Map.Make(String)

(* translate : Sast.program -> Llvm.module *)
let translate (globals, functions) =
  let context    = L.global_context () in


  (* Create the LLVM compilation module into which
     we will generate code *)
     let the_module = L.create_module context "AHOD" in

     (* Get types from the context *)
     let i32_t      = L.i32_type    context
     and i8_t       = L.i8_type     context
     and i1_t       = L.i1_type     context
     and float_t    = L.double_type context
     and string_t   = L.pointer_type (L.i8_type context)

     (*
     (* should we have these as actual data types in scanner/ parser?*)
     and none_t     = L.void_type   context
     
     *)
in

(* Return the LLVM type for a AHOD type *)
let ltype_of_typ = function
  A.Int   -> i32_t
  | A.Bool  -> i1_t
  | A.Float -> float_t
  (* | A.typ -> typ *)
  (*| A.None  -> none_t
  | A.String -> string_t
  | A.Seriesliteral(t) -> L.pointer_type (ltype_of_typ t)
  *)

in

(* look into *)
(* Create a map of global variables after creating each *)
(* Create a map of global variables after creating each *)


let global_vars : L.llvalue StringMap.t =
  let global_var m (t, n) =
    let init = match t with
        A.Float -> L.const_float (ltype_of_typ t) 0.0
      | _ -> L.const_int (ltype_of_typ t) 0
    in StringMap.add n (L.define_global n init the_module) m in
  List.fold_left global_var StringMap.empty globals in


  let printf_t : L.lltype =
    L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue =
    L.declare_function "printf" printf_t the_module in

  let main_t : L.lltype =
    L.function_type i32_t [|  |]  in 
  let main_func : L.define_function "main" main_t the_module in 

  let builder = L.builder_at_end context (L.entry_block main_func) in 

  let char_format_str = L.build_global_stringptr "%c" "fmt" builder  
  and int_format_str = L.build_global_stringptr "%d\n" "fmt" builder 
  and str_format_str = L.build_global_stringptr "%s" "fmt" builder 
  in 

  let build_main st = 
    let output e b = 
      let str= L.build_global_stringptr st "str" builder in 
      L.build_call printf_func [| str_format_str ; str|] "printf" builder 
    in output (List.hd exp_list ) builder 

  (* let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in *)


  (* in let _ = List.map build_main (List.rev statements ) in  *)
  (* in let _ = L.build_ret (L.const_int i32_t 0 ) builder in *)
the_module
