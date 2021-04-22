module L = Llvm
module A = Ast
open Sast

module StringMap = Map.Make(String)

let translate (globals, action_decls, main_stmt) =
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
   and none_t     = L.void_type context  
  (*rather than storing type specifically, add to StringMap*)

   (*and class_t = L.struct_type context [|L.pointer_type i8_t; L.i32_type context |]*)
  (* add definition uf classes [for user defined classes] that would also work for our built in ones*)
  (* note: ltype_oftyp AST type, what ll type should you get. For typ of class, what does that type look like, 
  pull out of StringMap, get struct type that you get for that*)

  in

let ltype_of_typ = function
	| A.Int   -> i32_t
	| A.Bool  -> i1_t
	| A.Float -> float_t
  | A.String -> string_t
  | A.None -> none_t 
  (* with named class, ensure lookup from StringMap to get llvm type generated above*)
in

 let global_vars : L.llvalue StringMap.t =
    let global_var m (t, n) = 
      let init = match t with
          A.Float -> L.const_float (ltype_of_typ t) 0.0
        | _ -> L.const_int (ltype_of_typ t) 0
      in StringMap.add n (L.define_global n init the_module) m in
    List.fold_left global_var StringMap.empty globals in
(*Define action (just with arguments)*)
(* let action_decls : (L.llvalue * saction_decl) StringMap.t = 
  let action_decl m adecl = 
    let name = adecl.saname 
    and param_types = 
Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) adecl.saparams)
  in let atype = L.function_type (ltype_of_typ None) param_types in (*actually pass in adecl.satyp*)
  StringMap.add name (L.define_function name atype the_module, adecl) m in
List.fold_left action_decl StringMap.empty action_decls in *)


let main_func = 
	let ftype = L.function_type i32_t [| |]
	in
	L.define_function "main" ftype the_module
in

let builder = L.builder_at_end context (L.entry_block main_func) in

(* Construct the function's "locals": formal arguments and locally
       declared variables.  Allocate each on the stack, initialize their
       value, if appropriate, and remember their values in the "locals" map *)


(*let local_vars : L.llvalue StringMap.t =
(* Function Locals *)
  let add_local m (t,n) =  
    let local_var = L.build_alloca (ltype_of_typ t) n builder in
    StringMap.add n local m 
 in*)

 (* Variable Lookup *)
 (*let lookup n m = StringMap.find n m
in*)
(*
let local_vars =

      (* Allocate space for any locally declared variables and add the
       * resulting registers to our map *)
      let add_local m (t, n) =
  let local_var = L.build_alloca (ltype_of_typ t) n builder
  in StringMap.add n local_var m 
      in

      List.fold_left add_local formals fdecl.slocals 
    in
*)
    (* Return the value for a variable or formal argument.
       Check local names first, then global names *)
    let lookup n = StringMap.find n global_vars
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

(* LLVM insists each basic block end with exactly one "terminator" 
    instruction that transfers control.  This function runs "instr builder"
    if the current block does not already have a terminator.  Used,
    e.g., to handle the "fall off the end of the function" case. *)
    let add_terminal builder instr =
    match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (instr builder) in

let rec stmt builder = function
	| SBlock stmt_list -> List.fold_left stmt builder stmt_list 
  | SExpr e -> ignore(expr builder e); builder
  | SIf (predicate, then_stmt, else_stmt) ->
    let bool_val = expr builder predicate in
    let merge_bb = L.append_block context "merge" main_func in
    let build_br_merge = L.build_br merge_bb in (* partial function *)

    let then_bb = L.append_block context "then" main_func in
        add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
        build_br_merge;

    let else_bb = L.append_block context "else" main_func in
        add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
        build_br_merge;
    ignore(L.build_cond_br bool_val then_bb else_bb builder);
    L.builder_at_end context merge_bb


in


let builder = stmt builder main_stmt 
in 

let _ = L.build_ret (L.const_int i32_t 0) (builder) 
in
the_module
