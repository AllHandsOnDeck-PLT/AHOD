module L = Llvm
module A = Ast
open Sast
open Hashtbl

module StringMap = Map.Make(String)

let translate (globals, action_decls, main_stmt) =
	 let context    = L.global_context () in

	 let the_module = L.create_module context "AHOD" in

	 let str_format_str = L.define_global "str" (L.const_stringz context "%s\n") the_module  
	 and int_format_str =  L.define_global "str" (L.const_stringz context "%d\n") the_module 
	 and float_format_str = L.define_global "str" (L.const_stringz context "%g\n") the_module 
	 and bool_format_str = L.define_global "str" (L.const_stringz context "%d\n") the_module in

	 let i32_t       = L.i32_type    context
	 and i8_t        = L.i8_type     context
	 and i1_t        = L.i1_type     context
	 and float_t     = L.double_type context
	 and string_t    = L.pointer_type (L.i8_type context)
   and void_t      = L.void_type   context 
   and series_t t  = L.struct_type context [| L.pointer_type (L.i32_type context); (L.pointer_type t) |]
   and player_t  = L.struct_type context [| (L.pointer_type (L.i8_type context)); (L.i32_type context) |]
   (*struct_set_body  class_t *)
  in

   let rec ltype_of_typ = function
    | A.Int   -> i32_t
    | A.Bool  -> i1_t 
    | A.Float -> float_t
    | A.String -> string_t
    | A.None -> void_t
    | A.Series t -> series_t (ltype_of_typ t)
    | A.ClassID -> player_t 
    in
    let type_str t = match t with
        A.Int -> "int"
      | A.Bool -> "bool"
      | A.Float -> "float"
      | A.String -> "str"
      | _ -> raise (Failure "Invalid string map key type")
    in

  
    let main_func = 
      let ftype = L.function_type i32_t [| |]
      in
      L.define_function "main" ftype the_module
    in
    
    let builder = L.builder_at_end context (L.entry_block main_func) in

    let init_series builder series_ptr series_type = 
      (* initialize size to 0 *)
      let sizePtrPtr = L.build_struct_gep series_ptr 0 "series_size_ptr" builder in 
          let sizePtr = L.build_alloca i32_t "series_size" builder in
          let _ = L.build_store (L.const_int i32_t 0) sizePtr builder in
          ignore(L.build_store sizePtr sizePtrPtr builder);
      (* initialize array *)
      let series_array_ptr = L.build_struct_gep series_ptr 1 "series.arry" builder in 
        (* TODO: allocate nothing and have series grow dynamically as necessary when pushing into the series *)
        let p = L.build_array_alloca (ltype_of_typ series_type) (L.const_int i32_t 1028) "p" builder in
        ignore(L.build_store p series_array_ptr builder);
    in

    (*
    create the  struct 
     *)
     (* THINK ABOUT HOW TO ALLOCATE MEMORY FOR ATTRIBUTES, CHANGE build_ *)
(* ======================== initialized the class ========================= *)

     let init_class builder class_struct_ptr class_type = 
      let class_struct_ptr = L.build_struct_gep class_struct_ptr 1 "class" builder in 
        let p = L.build_array_alloca (ltype_of_typ class_type) (L.const_int i32_t 1028) "p" builder in
        ignore(L.build_store p class_struct_ptr builder);

    in
(* ======================================================================= *)

 let global_vars : L.llvalue StringMap.t = (* type:  L.llvalue StringMap.t *)
  let global_var m (t, n) = (*t: type, n:name*)
    (* let global = L.build_alloca (ltype_of_typ t) n builder in   *)
    let init = match t with
        A.Float -> L.const_float (ltype_of_typ t) 0.0
      | A.String -> L.const_pointer_null (ltype_of_typ t)
      | A.Series series_type -> L.const_struct context ([| L.const_pointer_null (L.pointer_type(ltype_of_typ series_type)); L.const_pointer_null (L.pointer_type(ltype_of_typ series_type))|])
      (* ======================== initialized the class ========================= *)
      (* unsure about class_type *)
      | A.Player -> L.const_struct context ([|L.const_pointer_null (L.pointer_type(L.i8_type context)) ; L.const_pointer_null (L.i32_type context)|])
      (* ======================== initialized the class ========================= *)
      | _ -> L.const_int (ltype_of_typ t) 0
    in StringMap.add n (L.define_global n init the_module) m in
  List.fold_left global_var StringMap.empty globals in



(*
let local_vars : L.llvalue StringMap.t =
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
       
       (*let lookup n = try StringMap.find n local_vars
            with Not_found -> StringMap.find n global_vars
       in*)

       let lookup n = StringMap.find n global_vars
       in
(*
       let lookup_class n = StringMap.find n global_vars
       in
*)  

let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
let printf_func : L.llvalue = 
    L.declare_function "printf" printf_t the_module in

let playercall_t : L.lltype =
      L.function_type player_t [| string_t ; i32_t |] in (*what to use for type?*)
  let playercall_func : L.llvalue =
      L.declare_function "playercall" playercall_t the_module in

let series_add : L.llvalue StringMap.t = 
  let series_add_ty m typ =
    let ltype = (ltype_of_typ typ) in 
    let def_name = (type_str typ) in
    let def = L.define_function ("series_add" ^ def_name) (L.function_type void_t [| L.pointer_type (series_t ltype); ltype |]) the_module in
    let build = L.builder_at_end context (L.entry_block def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t ltype)) "series_ptr_alloc" build in
    ignore(L.build_store (L.param def 0) series_ptr build);
    let valPtr = L.build_alloca ltype "val_alloc" build in
    ignore(L.build_store (L.param def 1) valPtr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_array_ptr = L.build_struct_gep series_load 1 "series_array_ptr" build in
    let series_array_load = L.build_load series_array_ptr "series_array_load" build in
    let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
    let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
    let series_size = L.build_load series_size_ptr "series_size" build in
    let next_index = series_size in
    let next_element_ptr = L.build_gep series_array_load [| next_index |] "series_arry_next_element_ptr" build in
    let next_size = L.build_add series_size (L.const_int i32_t 1) "inc_size" build in
    let _ = L.build_store next_size series_size_ptr build in
    let _ = L.build_store (L.build_load valPtr "val" build) next_element_ptr build in
    let _ = L.build_ret_void build in
    StringMap.add def_name def m in 
List.fold_left series_add_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

let series_get : L.llvalue StringMap.t = 
  let series_get_ty m typ = 
      let ltype = (ltype_of_typ typ) in 
      let def_name = (type_str typ) in
      let def = L.define_function ("series_get" ^ def_name) (L.function_type ltype [| L.pointer_type (series_t ltype); i32_t |]) the_module in
      let build = L.builder_at_end context (L.entry_block def) in
      let series_ptr = L.build_alloca (L.pointer_type (series_t ltype)) "series_ptr_alloc" build in
      let _ = L.build_store (L.param def 0) series_ptr build in
      let idx_ptr = L.build_alloca i32_t "idx_alloc" build in
      let _ = L.build_store (L.param def 1) idx_ptr build in
      let series_load = L.build_load series_ptr "series_load" build in
      let series_array_ptr = L.build_struct_gep series_load 1 "series_array_ptr" build in
      let series_array_load = L.build_load series_array_ptr "array_load" build in
      let idx = L.build_load idx_ptr "idx_load" build in
      let series_array_element_ptr = L.build_gep series_array_load [| idx |] "series_arry_element_ptr" build in
      let element_val = L.build_load series_array_element_ptr "series_array_element_ptr" build in
      let _ = L.build_ret element_val build in
      StringMap.add def_name def m in
List.fold_left series_get_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String ] in

let rec expr builder ((_, e) : sexpr) = match e with
	SSliteral s   -> L.build_global_stringptr s "str" builder
	| SBliteral b -> L.const_int i1_t (if b then 1 else 0)
	| SIliteral i -> L.const_int i32_t i 
  | SFliteral f -> L.const_float_of_string float_t f
  | SId s       -> L.build_load (lookup s) s builder
  | SNoexpr     -> L.const_int i32_t 0
  | SAssign (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'

  (*| SPClassCall("Player", [e]) ->
    let e' = expr builder e in
                          ignore(L.build_store e' (lookup_class s) builder); e'*)
  | SPlayerClassCall(e) ->
    L.build_call playercall_func (Array.of_list (List.map (expr builder) (e))) "playercall" builder
  
  (*AttL.build_in_bounds_gep arr [|L.const_int i32_t 0; L.const_int i32_t 0|] "arrptr" builder*)
  | SPlayerAttrCall(objname, attr) -> L.build_in_bounds_gep playercall_func [|L.const_int i32_t 0; L.const_int i32_t 1|] "playercall" builder
  (*^ do lookup player*)


    (*
    let create_obj_gen e llbuilder = 
      let params = List.map (expr_gen llbuilder) el in
      let obj = L.build_call f (Array.of_list params) "tmp" llbuilder in
      obj
    in
      create_obj_gen id el d llbuilder

    (*what to do here? 
    - how would we assign each of the things in list of expression to player attributes
    *)
    L.build_call printf_func [| L.const_in_bounds_gep str_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|] ; (expr builder e) |]
		"printf" builder 

		)*)
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
  | SSeriesliteral (series_type, literals) ->
    let ltype = (ltype_of_typ series_type) in (*gets type of elements in arr *) 
    (* L.build_alloca (series_t ltype) "new_series_ptr" builder creates arr with that type *)
    let new_series_ptr = L.build_alloca (series_t ltype) "new_series_ptr" builder in
    let _ = init_series builder new_series_ptr series_type in
    let map_func literal = 
       ignore(L.build_call (StringMap.find (type_str series_type) series_add) [| new_series_ptr; (expr builder literal) |] "" builder);
    in
    let _ = List.rev (List.map map_func literals) in
    L.build_load new_series_ptr "new_series" builder

      (* ======================== class call ========================= *)
      (*
      global_vars -> object -> stringmap : (k,v) - (name_class, name), (value_class, value)
        
        *)
 (*  | SClassCall (name_class, value_class) ->
      

      (s, e) -> let e' = expr builder e in
                          ignore(L.build_store e' (lookup s) builder); e'


      let ltype = (ltype_of_typ class_type) in (*gets type of elements in arr *) 
      let new_class_ptr = L.build_alloca (class_t ltype) "new_class_ptr" builder in
      let _ = init_class builder new_class_ptr class_type in
      let map_func literal = 
         ignore(L.build_call (StringMap.find (type_str class_type)) [| new_class_ptr; (expr builder literal) |] "" builder);
      in
      let _ = List.rev (List.map map_func literals) in
      L.build_load new_class_ptr "new_class" builder
            (* ======================================================= *)*)
  | SSeriesGet (series_type, id, e) ->
      L.build_call (StringMap.find (type_str series_type) series_get) [| (lookup id); (expr builder e) |] "series_get" builder 
		
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
  | SSeriesAdd (id, e) -> 
      ignore(L.build_call (StringMap.find (type_str (fst e)) series_add) [| (lookup id); (expr builder e) |] "" builder); builder 
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
    | SWhile (predicate, body) ->
      let pred_bb = L.append_block context "while" main_func in
      ignore(L.build_br pred_bb builder);
  
      let body_bb = L.append_block context "while_body" main_func in
      add_terminal (stmt (L.builder_at_end context body_bb) body)
        (L.build_br pred_bb);
  
      let pred_builder = L.builder_at_end context pred_bb in
      let bool_val = expr pred_builder predicate in
  
      let merge_bb = L.append_block context "merge" main_func in
      ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
      L.builder_at_end context merge_bb
    

      (* Implement for loops as while loops *)
      | SFor (e1, e2, e3, body) -> stmt builder
      ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
      (*| SForLit ( e1, e2, body) -> stmt builder
	    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e]) ] )*)
    in


let builder = stmt builder main_stmt 
in 

let _ = L.build_ret (L.const_int i32_t 0) (builder) 
in
the_module
