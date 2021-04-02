module L = Llvm
module A = Ast
open Sast 

let translate (main_stmt, action_decls) =
	 let context    = L.global_context () in

	 let the_module = L.create_module context "AHOD" in

	 let str_format_str = L.define_global "str" (L.const_stringz context "%s\n") the_module  
	 and int_format_str =  L.define_global "str" (L.const_stringz context "%d\n") the_module 
	 and float_format_str = L.define_global "str" (L.const_stringz context "%g\n") the_module 
	 and bool_format_str = L.define_global "str" (L.const_stringz context "%d\n") the_module in

	 let i32_t      = L.i32_type    context
	 and i8_t       = L.i8_type     context
	 and i1_t       = L.i1_type     context
	 and float_t    = L.double_type context
	 and string_t   = L.pointer_type (L.i8_type context)
in

let ltype_of_typ = function
	| A.Int   -> i32_t
	| A.Bool  -> i1_t
	| A.Float -> float_t
  | A.String -> string_t
in

let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = 
      L.declare_function "printf" printf_t the_module in




let rec expr builder ((_, e) : sexpr) = match e with
	SSliteral s -> L.define_global "str" (L.const_stringz context s) the_module
	| SBliteral b  -> L.const_int i1_t (if b then 1 else 0)
	| SIliteral i -> L.const_int i32_t i 
	| SFliteral f -> L.const_float_of_string float_t f
	| SActionCall("PRINT", [e]) ->
		(match fst e with 
		A.String -> L.build_call printf_func [| L.const_in_bounds_gep str_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|] ; (expr builder e) |]
		"printf" builder
		| A.Int -> L.build_call printf_func [| L.const_in_bounds_gep int_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
		"printf" builder
		| A.Float -> L.build_call printf_func [| L.const_in_bounds_gep float_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
		"printf" builder
		| A.Bool -> L.build_call printf_func [| L.const_in_bounds_gep bool_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
		"printf" builder
		)   
		
in

let rec stmt builder = function
	| SBlock stmt_list -> List.fold_left stmt builder stmt_list 
	| SExpr e -> ignore(expr builder e); builder
in


let main_func = 
	let ftype = L.function_type i32_t [| |]
	in
	L.define_function "main" ftype the_module
in

let builder = L.builder_at_end context (L.entry_block main_func) in


let builder = stmt builder main_stmt in 

let _ = L.build_ret (L.const_int i32_t 0) (builder) in

the_module