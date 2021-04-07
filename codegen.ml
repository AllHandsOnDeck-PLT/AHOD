module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)

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

let main_func = 
	let ftype = L.function_type i32_t [| |]
	in
	L.define_function "main" ftype the_module
in

let builder = L.builder_at_end context (L.entry_block main_func) in

let local_vars =
(* Function Locals *)
  let add_local m (t,n) n builder =   
  let local = L.build_alloca (ltype_of_typ t) n builder in
  ignore(L.build_store p local builder);
  StringMap.add n local m 
 in

 (* Variable Lookup *)
 let lookup n = StringMap.find n local_vars 
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
  | SId s       -> L.build_load (lookup s) s builder
  | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'
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
  | SBinop ((A.Float,_ ) as e1, op, e2) ->
    let e1' = expr builder e1
    and e2' = expr builder e2 in
    (match op with 
      A.Add     -> L.build_fadd
    | A.Sub     -> L.build_fsub
    | A.Mult    -> L.build_fmul
    | A.Div     -> L.build_fdiv 
    | A.Equal   -> L.build_fcmp L.Fcmp.Oeq
    | A.Neq     -> L.build_fcmp L.Fcmp.One
    | A.Less    -> L.build_fcmp L.Fcmp.Olt
    | A.Leq     -> L.build_fcmp L.Fcmp.Ole
    | A.Greater -> L.build_fcmp L.Fcmp.Ogt
    | A.Geq     -> L.build_fcmp L.Fcmp.Oge
    | A.And | A.Or ->
        raise (Failure "internal error: semant should have rejected and/or on float")
    ) e1' e2' "tmp" builder
  | SBinop (e1, op, e2) ->
    let e1' = expr builder e1
    and e2' = expr builder e2 in
    (match op with
      A.Add     -> L.build_add
    | A.Sub     -> L.build_sub
    | A.Mult    -> L.build_mul
    | A.Div     -> L.build_sdiv
    | A.And     -> L.build_and
    | A.Or      -> L.build_or
    | A.Equal   -> L.build_icmp L.Icmp.Eq
    | A.Neq     -> L.build_icmp L.Icmp.Ne
    | A.Less    -> L.build_icmp L.Icmp.Slt
    | A.Leq     -> L.build_icmp L.Icmp.Sle
    | A.Greater -> L.build_icmp L.Icmp.Sgt
    | A.Geq     -> L.build_icmp L.Icmp.Sge
    ) e1' e2' "tmp" builder
		
in

let rec stmt builder = function
	| SBlock stmt_list -> List.fold_left stmt builder stmt_list 
	| SExpr e -> ignore(expr builder e); builder
in


let builder = stmt builder main_stmt 
in 

let _ = L.build_ret (L.const_int i32_t 0) (builder) 
in
the_module