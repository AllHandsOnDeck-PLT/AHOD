module L = Llvm
module A = Ast
open Sast
open Hashtbl

module StringMap = Map.Make(String)

let translate (globals, action_decls, main_decl) =
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
   and player_t    = L.struct_type context [| (L.pointer_type (L.i8_type context)); (L.i32_type context) |]
   and card_t      = L.struct_type context [| (L.pointer_type (L.i8_type context)); (L.i1_type context) |]
   (*struct_set_body  class_t *)
  in

  let rec ltype_of_typ = function
    | A.Int   -> i32_t
    | A.Bool  -> i1_t 
    | A.Float -> float_t
    | A.String -> string_t
    | A.None -> void_t
    | A.Series t -> series_t (ltype_of_typ t)
    | A.Player -> player_t 
    | A.Card -> card_t 
  in

  let type_str t = match t with
    | A.Int -> "int"
    | A.Bool -> "bool"
    | A.Float -> "float"
    | A.String -> "str"
    | A.Card -> "card"
    | A.Player -> "player"
    | _ -> raise (Failure "Invalid string map key type")
  in

 let global_vars : L.llvalue StringMap.t = (* type:  L.llvalue StringMap.t *)
  let global_var m (t, n) = (*t: type, n:name*)
    (* let global = L.build_alloca (ltype_of_typ t) n builder in   *)
    let init = match t with
        A.Float -> L.const_float (ltype_of_typ t) 0.0
      | A.String -> L.const_pointer_null (ltype_of_typ t)
      | A.Series series_type -> L.const_struct context ([| L.const_pointer_null (L.pointer_type(L.i32_type context)); L.const_pointer_null (L.pointer_type(ltype_of_typ series_type))|])
      (* ======================== initialized the class ========================= *)
      (* unsure about class_type *)
      | A.Player -> L.const_struct context ([|L.const_pointer_null (L.pointer_type(L.i8_type context)) ; L.const_pointer_null (L.i32_type context)|])
      | A.Card -> L.const_struct context ([|L.const_pointer_null (L.pointer_type(L.i8_type context)) ; L.const_pointer_null (L.i1_type context)|])
      (* ======================== initialized the class ========================= *)
      | _ -> L.const_int (ltype_of_typ t) 0
    in StringMap.add n (L.define_global n init the_module) m in
  List.fold_left global_var StringMap.empty globals in

    let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
    let printf_func : L.llvalue = 
      L.declare_function "printf" printf_t the_module in

  (* ------------------------------------------------------------- *)
  let playercall_t : L.lltype =
        L.function_type player_t [| string_t ; i32_t |] in 
  let playercall_func : L.llvalue =
      L.declare_function "playercall" playercall_t the_module in

  let getplayername_t : L.lltype =
        L.function_type string_t [| player_t |] in 
  let getplayername_func : L.llvalue =
      L.declare_function "getplayername" getplayername_t the_module in

  let getplayerscore_t : L.lltype =
        L.function_type i32_t [| player_t |] in 
  let getplayerscore_func : L.llvalue =
      L.declare_function "getplayerscore" getplayerscore_t the_module in

  let setplayername_t : L.lltype =
        L.function_type void_t [| player_t ; string_t |] in 
  let setplayername_func : L.llvalue =
      L.declare_function "setplayername" setplayername_t the_module in

  let setplayerscore_t : L.lltype =
        L.function_type void_t [| player_t ; i32_t |] in 
  let setplayerscore_func : L.llvalue =
      L.declare_function "setplayerscore" setplayerscore_t the_module in

  (* ------------------------------------------------------------- *)

  let cardcall_t : L.lltype =
        L.function_type card_t [| string_t ; i1_t |] in 
  let cardcall_func : L.llvalue =
      L.declare_function "cardcall" cardcall_t the_module in

  let getcardtype_t : L.lltype =
        L.function_type string_t [| card_t |] in 
  let getcardtype_func : L.llvalue =
      L.declare_function "getcardtype" getcardtype_t the_module in

  let getcardfaceup_t : L.lltype =
        L.function_type i1_t [| card_t |] in 
  let getcardfaceup_func : L.llvalue =
      L.declare_function "getcardfaceup" getcardfaceup_t the_module in

(* ------------------------------------------------------------- *)

  (*series generation*)
  let init_series builder series_ptr series_type = 
    (* size to 0 *)
    let sizePtrPtr = L.build_struct_gep series_ptr 0 "series_size_ptr" builder in 
        let sizePtr = L.build_alloca i32_t "series_size" builder in
        let _ = L.build_store (L.const_int i32_t 0) sizePtr builder in
        ignore(L.build_store sizePtr sizePtrPtr builder);
    (* init series *)
    let series_array_ptr = L.build_struct_gep series_ptr 1 "series.arry" builder in 
      (* ERROR: when there's nothing so like a = [] *)
      let p = L.build_array_alloca (ltype_of_typ series_type) (L.const_int i32_t 1028) "p" builder in
      ignore(L.build_store p series_array_ptr builder);
  in

	(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ define actions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
  let action_decls_map : (L.llvalue * saction_decl) StringMap.t =
    let action_decl m adecl =
      let name = adecl.saname
        and param_types = Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) adecl.saparams) in 
      let atype = L.function_type (ltype_of_typ adecl.satyp) param_types in 
    StringMap.add name (L.define_function name atype the_module, adecl) m in 
  List.fold_left action_decl StringMap.empty action_decls in 

  (*~~~~~~~~~~~~~~~~~~~~~~~~~ action generation top-level ~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
  let build_action_body adecl =
    let (the_action, _) = StringMap.find adecl.saname action_decls_map in
    let builder = L.builder_at_end context (L.entry_block the_action) in

    let local_vars =
      let add_param m (t, n) p = L.set_value_name n p;
      let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore(
          match t with 
            A.Series series_type -> init_series builder local series_type
          | _ -> ()
        );
        ignore (L.build_store p local builder);
      StringMap.add n local m 

      (* Allocate space for any locally declared variables and add the
        * resulting registers to our map *)
      and add_local m (t, n) =
      let local_var = L.build_alloca (ltype_of_typ t) n builder in 
        ignore(
          match t with 
            A.Series series_type -> init_series builder local_var series_type
          | _ -> ()
        );
        StringMap.add n local_var m 
      in

      let params = List.fold_left2 add_param StringMap.empty adecl.saparams
          (Array.to_list (L.params the_action)) in
      List.fold_left add_local params adecl.salocals 
      in


      let lookup n = try StringMap.find n local_vars 
      with Not_found -> StringMap.find n global_vars 
      in
(*for the series stuff, referenced past projects + clang *)
let init_series builder series_ptr series_type = 
  let size_ptr_ptr = L.build_struct_gep series_ptr 0 "series_size_ptr" builder in 
      let size_ptr = L.build_alloca i32_t "series_size" builder in
      ignore(L.build_store (L.const_int i32_t 0) size_ptr builder);
      ignore(L.build_store size_ptr size_ptr_ptr builder);
  let series_ptr = L.build_struct_gep series_ptr 1 "series" builder in (* init array (series) *)
    (* TODO: allocate nothing and have series grow dynamically as necessary when pushing into the series *)
    let p = L.build_array_alloca (ltype_of_typ series_type) (L.const_int i32_t 1028) "p" builder in (*change number?*)
    ignore(L.build_store p series_ptr builder);
in

let series_push : L.llvalue StringMap.t = 
  let series_push_ty m typ =
    let series_push_def = L.define_function ("series_push" ^ (type_str typ)) (L.function_type void_t [| L.pointer_type (series_t (ltype_of_typ typ)); (ltype_of_typ typ) |]) the_module in
    let build = L.builder_at_end context (L.entry_block series_push_def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
    ignore(L.build_store (L.param series_push_def 0) series_ptr build);
    let valPtr = L.build_alloca (ltype_of_typ typ) "val_alloc" build in
    ignore(L.build_store (L.param series_push_def 1) valPtr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_ptr_2 = L.build_struct_gep series_load 1 "series_ptr_2" build in
    let series_load_2 = L.build_load series_ptr_2 "series_load_2" build in
    let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
    let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
    let series_size = L.build_load series_size_ptr "series_size" build in
    let next_el_ptr = L.build_gep series_load_2 [| series_size |] "series_next_el_ptr" build in
    let next_size = L.build_add series_size (L.const_int i32_t 1) "next_size" build in
    ignore(L.build_store next_size series_size_ptr build);
    ignore(L.build_store (L.build_load valPtr "val" build) next_el_ptr build);
    ignore(L.build_ret_void build);
    StringMap.add (type_str typ) series_push_def m in 
    List.fold_left series_push_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in (*change ordering*)

let series_get : L.llvalue StringMap.t =
  let series_get_ty m typ = 
    let def = L.define_function ("series_get" ^ (type_str typ)) (L.function_type (ltype_of_typ typ) [| L.pointer_type (series_t (ltype_of_typ typ)); i32_t |]) the_module in
    let build = L.builder_at_end context (L.entry_block def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
    ignore(L.build_store (L.param def 0) series_ptr build);
    let idx_ptr = L.build_alloca i32_t "idx_alloc" build in
    ignore(L.build_store (L.param def 1) idx_ptr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_ptr_2 = L.build_struct_gep series_load 1 "series_ptr_2" build in
    let series_load_2 = L.build_load series_ptr_2 "array_load" build in
    let idx = L.build_load idx_ptr "idx_load" build in
    let series_el_ptr = L.build_gep series_load_2 [| idx |] "series_el_ptr" build in
    let element_val = L.build_load series_el_ptr "series_el_ptr" build in
    ignore(L.build_ret element_val build);
  StringMap.add (type_str typ) def m in
List.fold_left series_get_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in

let series_size : L.llvalue StringMap.t = 
  let series_size_ty m typ =
    let series_size_def = L.define_function ("series_size" ^ (type_str typ)) (L.function_type i32_t [| L.pointer_type (series_t (ltype_of_typ typ)) |]) the_module in
    let build = L.builder_at_end context (L.entry_block series_size_def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
    ignore(L.build_store (L.param series_size_def 0) series_ptr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
    let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
    let series_size = L.build_load series_size_ptr "series_size" build in
    ignore(L.build_ret series_size build);
  StringMap.add (type_str typ) series_size_def m in 
List.fold_left series_size_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in

let series_pop : L.llvalue StringMap.t = (*referenced from ap++*)
let series_pop_ty m typ =
 let def = L.define_function ("series_pop" ^ (type_str typ)) (L.function_type (ltype_of_typ typ) [| L.pointer_type (series_t (ltype_of_typ typ)) |]) the_module in
 let build = L.builder_at_end context (L.entry_block def) in
 let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
 ignore(L.build_store (L.param def 0) series_ptr build);
 let series_load = L.build_load series_ptr "series_load" build in
 let series_arr_ptr = L.build_struct_gep series_load 1 "series_arr_ptr" build in
 let series_arr_load = L.build_load series_arr_ptr "series_arr_load" build in
 let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
 let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
 let series_size = L.build_load series_size_ptr "series_size" build in
 let series_sizeMin = L.build_sub series_size (L.const_int i32_t 1) "dec_size" build in
 let last_el_ptr = L.build_gep series_arr_load [| series_sizeMin |] "series_next_el_ptr" build in
 let last_el_val = L.build_load last_el_ptr "series_arry_next_element" build in
 let _ = L.build_store series_sizeMin series_size_ptr build in
 let _ = L.build_ret last_el_val build in
StringMap.add (type_str typ) def m in
List.fold_left series_pop_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in

    (*expression generation*)
    let rec expr builder ((_, e) : sexpr) = match e with
    | SSliteral s   -> L.build_global_stringptr s "str" builder
    | SBliteral b -> L.const_int i1_t (if b then 1 else 0)
    | SIliteral i -> L.const_int i32_t i 
    | SFliteral f -> L.const_float_of_string float_t f
    | SId s       -> L.build_load (lookup s) s builder
    | SNoexpr     -> L.const_int i32_t 0
    | SAssign (s, e) -> let e' = expr builder e in
                    ignore(L.build_store e' (lookup s) builder); e'

    | SAttrAssign (objname, attr, e) -> let e' = expr builder e in
                    ignore(L.build_store e' (L.build_call setplayername_func [|(L.build_load (lookup objname) objname builder) ; L.const_pointer_null (L.pointer_type(L.i8_type context))|] "setplayername" builder) builder); e'

    | SPrintCall(e) ->
    (*don't do match here do SprintCall, makes sure it doesn't have list of args, pattern match on type
    do different versions 4-5 patterns for each type. don't need the PRINT, comes with type expression pair
    match in 1st element of *)
    (match fst e with 
    A.String -> L.build_call printf_func [| L.const_in_bounds_gep str_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|] ; (expr builder e) |]
    "printf" builder
    | A.Int | A.None -> L.build_call printf_func [| L.const_in_bounds_gep int_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
    "printf" builder
    | A.Float -> L.build_call printf_func [| L.const_in_bounds_gep float_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
    "printf" builder
    | A.Bool -> L.build_call printf_func [| L.const_in_bounds_gep bool_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
    "printf" builder
    | _ -> raise (Failure "Print of this type is not supported") (* Potentially need to support Class, Series, and None cases *)
    )
    | SActionCall(a, args) ->
    let (adef, main_func) = StringMap.find a action_decls_map in
    let llargs = List.rev (List.map (expr builder) (List.rev args)) in
    let result = (match main_func.satyp with 
                  A.None -> ""
                | _ -> a ^ "_result") 
    in L.build_call adef (Array.of_list llargs) result builder

    | SPlayerClassCall(e) ->
    L.build_call playercall_func (Array.of_list (List.map (expr builder) (e))) "playercall" builder

    | SCardClassCall(e) ->
    L.build_call cardcall_func (Array.of_list (List.map (expr builder) (e))) "cardcall" builder

    | SAttrCall(objname, attr) -> 
      (match attr with
      "name" -> L.build_call getplayername_func [|(L.build_load (lookup objname) objname builder)|] "getplayername" builder
      | "score" -> L.build_call getplayerscore_func [|(L.build_load (lookup objname) objname builder)|] "getplayerscore" builder
      | "type" -> L.build_call getcardtype_func [|(L.build_load (lookup objname) objname builder)|] "getcardtype" builder
      | "faceup" -> L.build_call getcardfaceup_func [|(L.build_load (lookup objname) objname builder)|] "getcardfaceup" builder
      )

    | SExprActionCall(exp, a, args) -> raise (Failure "Need to implement this class-dependent expression")

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
    and e2' = expr builder e2 
    in
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
  | SUnop(op, ((t, _) as e)) ->
    let e' = expr builder e in
    (match op with
      | A.Neg when t = A.Float -> L.build_fneg 
      | A.Neg                  -> L.build_neg
      | A.Not                  -> L.build_not) 
    e' "tmp" builder
  | SSeriesliteral (series_type, literals) ->
    let ltype = (ltype_of_typ series_type) in (*gets type of elements in arr *) 
    let new_series_ptr = L.build_alloca (series_t ltype) "new_series_ptr" builder in
    let _ = init_series builder new_series_ptr series_type in
    let map_func literal = 
       ignore(L.build_call (StringMap.find (type_str series_type) series_push) [| new_series_ptr; (expr builder literal) |] "" builder);
    in
    let _ = List.rev (List.map map_func literals) in
    L.build_load new_series_ptr "new_series" builder
  | SSeriesGet (series_type, id, e) ->
      L.build_call (StringMap.find (type_str series_type) series_get) [| (lookup id); (expr builder e) |] "series_get" builder 
  | SSeriesSize (series_type, id) -> 
      L.build_call ((StringMap.find (type_str series_type)) series_size) [| (lookup id) |] "series_size" builder
  | SSeriesPop (series_type, id) -> 
      L.build_call ((StringMap.find (type_str series_type)) series_pop) [| (lookup id) |] "series_pop" builder
in

    let add_terminal builder instr =
    match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (instr builder) in

let rec stmt builder = function
	| SBlock stmt_list -> List.fold_left stmt builder stmt_list 
  | SExpr e -> ignore(expr builder e); builder
  | SSeriesPush (id, e) -> 
      ignore(L.build_call (StringMap.find (type_str (fst e)) series_push) [| (lookup id); (expr builder e) |] "" builder); builder 
  | SIf (predicate, then_stmt, else_stmt) ->
    let bool_val = expr builder predicate in
    let merge_bb = L.append_block context "merge" the_action in
    let build_br_merge = L.build_br merge_bb in (* partial function *)
    let then_bb = L.append_block context "then" the_action in
    add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
    build_br_merge;
    let else_bb = L.append_block context "else" the_action in
    add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
    build_br_merge;
    ignore(L.build_cond_br bool_val then_bb else_bb builder);
    L.builder_at_end context merge_bb
    | SWhile (predicate, body) ->
    let pred_bb = L.append_block context "while" the_action in
    ignore(L.build_br pred_bb builder);

    let body_bb = L.append_block context "while_body" the_action in
    add_terminal (stmt (L.builder_at_end context body_bb) body)
    (L.build_br pred_bb);
    let pred_builder = L.builder_at_end context pred_bb in
    let bool_val = expr pred_builder predicate in

    let merge_bb = L.append_block context "merge" the_action in
    ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
    L.builder_at_end context merge_bb
    | SFor (e1, e2, e3, body) -> stmt builder
    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
    (*| SForLit ( e1, e2, body) -> stmt builder
    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e]) ] ) *)
    in


    let _ = stmt builder (SBlock adecl.sabody) in 
      add_terminal builder (match adecl.satyp with
              A.None -> L.build_ret_void
            | A.Float -> L.build_ret (L.const_float float_t 0.0)
            | t -> L.build_ret (L.const_int (ltype_of_typ t) 0));
    
    () 
  in
  let _ = List.iter build_action_body action_decls in 
  
  (*~~~~~~~~~~~~~~~~~~~~  main function generation top-level ~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
  let build_main main_func =
	  let fty = L.function_type i32_t[||] in 
		let f = L.define_function "main" fty the_module in 	
		let builder = L.builder_at_end context (L.entry_block f) in
		
    let local_vars =
      let add_param m (t, n) p = L.set_value_name n p;
      let local = L.build_alloca (ltype_of_typ t) n builder in
        ignore(
          match t with 
            A.Series series_type -> init_series builder local series_type
          | _ -> ()
        );
        ignore (L.build_store p local builder);
      StringMap.add n local m 

      (* Allocate space for any locally declared variables and add the
        * resulting registers to our map *)
      and add_local m (t, n) =
      let local_var = L.build_alloca (ltype_of_typ t) n builder in 
        ignore(
          match t with 
            A.Series series_type -> init_series builder local_var series_type
          | _ -> ()
        );
        StringMap.add n local_var m 
      in

      let params = List.fold_left2 add_param StringMap.empty main_func.smparams
          (Array.to_list (L.params f)) in (*not sure about this f *) 
      List.fold_left add_local params main_func.smlocals 
    in

    let lookup n = try StringMap.find n local_vars 
      with Not_found -> StringMap.find n global_vars 
    in
(*for the series stuff, referenced past projects + clang *)
let init_series builder series_ptr series_type = 
  let size_ptr_ptr = L.build_struct_gep series_ptr 0 "series_size_ptr" builder in 
      let size_ptr = L.build_alloca i32_t "series_size" builder in
      ignore(L.build_store (L.const_int i32_t 0) size_ptr builder);
      ignore(L.build_store size_ptr size_ptr_ptr builder);
  let series_ptr = L.build_struct_gep series_ptr 1 "series" builder in (* init array (series) *)
    (* TODO: allocate nothing and have series grow dynamically as necessary when pushing into the series *)
    let p = L.build_array_alloca (ltype_of_typ series_type) (L.const_int i32_t 1028) "p" builder in (*change number?*)
    ignore(L.build_store p series_ptr builder);
in

let series_push : L.llvalue StringMap.t = 
  let series_push_ty m typ =
    let series_push_def = L.define_function ("series_push" ^ (type_str typ)) (L.function_type void_t [| L.pointer_type (series_t (ltype_of_typ typ)); (ltype_of_typ typ) |]) the_module in
    let build = L.builder_at_end context (L.entry_block series_push_def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
    ignore(L.build_store (L.param series_push_def 0) series_ptr build);
    let valPtr = L.build_alloca (ltype_of_typ typ) "val_alloc" build in
    ignore(L.build_store (L.param series_push_def 1) valPtr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_ptr_2 = L.build_struct_gep series_load 1 "series_ptr_2" build in
    let series_load_2 = L.build_load series_ptr_2 "series_load_2" build in
    let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
    let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
    let series_size = L.build_load series_size_ptr "series_size" build in
    let next_el_ptr = L.build_gep series_load_2 [| series_size |] "series_next_el_ptr" build in
    let next_size = L.build_add series_size (L.const_int i32_t 1) "next_size" build in
    ignore(L.build_store next_size series_size_ptr build);
    ignore(L.build_store (L.build_load valPtr "val" build) next_el_ptr build);
    ignore(L.build_ret_void build);
    StringMap.add (type_str typ) series_push_def m in 
    List.fold_left series_push_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in (*change ordering*)

let series_get : L.llvalue StringMap.t =
  let series_get_ty m typ = 
    let def = L.define_function ("series_get" ^ (type_str typ)) (L.function_type (ltype_of_typ typ) [| L.pointer_type (series_t (ltype_of_typ typ)); i32_t |]) the_module in
    let build = L.builder_at_end context (L.entry_block def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
    ignore(L.build_store (L.param def 0) series_ptr build);
    let idx_ptr = L.build_alloca i32_t "idx_alloc" build in
    ignore(L.build_store (L.param def 1) idx_ptr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_ptr_2 = L.build_struct_gep series_load 1 "series_ptr_2" build in
    let series_load_2 = L.build_load series_ptr_2 "array_load" build in
    let idx = L.build_load idx_ptr "idx_load" build in
    let series_el_ptr = L.build_gep series_load_2 [| idx |] "series_el_ptr" build in
    let element_val = L.build_load series_el_ptr "series_el_ptr" build in
    ignore(L.build_ret element_val build);
  StringMap.add (type_str typ) def m in
List.fold_left series_get_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in

let series_size : L.llvalue StringMap.t = 
  let series_size_ty m typ =
    let series_size_def = L.define_function ("series_size" ^ (type_str typ)) (L.function_type i32_t [| L.pointer_type (series_t (ltype_of_typ typ)) |]) the_module in
    let build = L.builder_at_end context (L.entry_block series_size_def) in
    let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
    ignore(L.build_store (L.param series_size_def 0) series_ptr build);
    let series_load = L.build_load series_ptr "series_load" build in
    let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
    let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
    let series_size = L.build_load series_size_ptr "series_size" build in
    ignore(L.build_ret series_size build);
  StringMap.add (type_str typ) series_size_def m in 
List.fold_left series_size_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in

let series_pop : L.llvalue StringMap.t = (*referenced from ap++*)
let series_pop_ty m typ =
 let def = L.define_function ("series_pop" ^ (type_str typ)) (L.function_type (ltype_of_typ typ) [| L.pointer_type (series_t (ltype_of_typ typ)) |]) the_module in
 let build = L.builder_at_end context (L.entry_block def) in
 let series_ptr = L.build_alloca (L.pointer_type (series_t (ltype_of_typ typ))) "series_ptr_alloc" build in
 ignore(L.build_store (L.param def 0) series_ptr build);
 let series_load = L.build_load series_ptr "series_load" build in
 let series_arr_ptr = L.build_struct_gep series_load 1 "series_arr_ptr" build in
 let series_arr_load = L.build_load series_arr_ptr "series_arr_load" build in
 let series_size_ptr_ptr = L.build_struct_gep series_load 0 "series_size_ptr_ptr" build in 
 let series_size_ptr = L.build_load series_size_ptr_ptr "series_size_ptr" build in
 let series_size = L.build_load series_size_ptr "series_size" build in
 let series_sizeMin = L.build_sub series_size (L.const_int i32_t 1) "dec_size" build in
 let last_el_ptr = L.build_gep series_arr_load [| series_sizeMin |] "series_next_el_ptr" build in
 let last_el_val = L.build_load last_el_ptr "series_arry_next_element" build in
 let _ = L.build_store series_sizeMin series_size_ptr build in
 let _ = L.build_ret last_el_val build in
StringMap.add (type_str typ) def m in
List.fold_left series_pop_ty StringMap.empty [ A.Bool; A.Int; A.Float; A.String; A.Card; A.Player ] in

    (*expression generation*)
    let rec expr builder ((_, e) : sexpr) = match e with
    | SSliteral s   -> L.build_global_stringptr s "str" builder
    | SBliteral b -> L.const_int i1_t (if b then 1 else 0)
    | SIliteral i -> L.const_int i32_t i 
    | SFliteral f -> L.const_float_of_string float_t f
    | SId s       -> L.build_load (lookup s) s builder
    | SNoexpr     -> L.const_int i32_t 0
    | SAssign (s, e) -> let e' = expr builder e in
                    ignore(L.build_store e' (lookup s) builder); e'
    | SPrintCall(e) ->
    (*don't do match here do SprintCall, makes sure it doesn't have list of args, pattern match on type
    do different versions 4-5 patterns for each type. don't need the PRINT, comes with type expression pair
    match in 1st element of *)
      (match fst e with 
      A.String -> L.build_call printf_func [| L.const_in_bounds_gep str_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|] ; (expr builder e) |]
      "printf" builder
      | A.Int | A.None -> L.build_call printf_func [| L.const_in_bounds_gep int_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
      "printf" builder
      | A.Float -> L.build_call printf_func [| L.const_in_bounds_gep float_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
      "printf" builder
      | A.Bool -> L.build_call printf_func [| L.const_in_bounds_gep bool_format_str [|L.const_int i32_t 0; L.const_int i32_t 0|]  ; (expr builder e) |]
      "printf" builder
      | _ -> raise (Failure "Print of this type is not supported") (* Potentially need to support Class, Series, and None cases *)
      )
    | SAttrAssign (objname, attr, e) -> let e' = expr builder e in
                    ignore(L.build_store e' (L.build_call setplayername_func [|(L.build_load (lookup objname) objname builder) ; L.const_pointer_null (L.pointer_type(L.i8_type context))|] "setplayername" builder) builder); e'
    | SPlayerClassCall(e) ->
    L.build_call playercall_func (Array.of_list (List.map (expr builder) (e))) "playercall" builder

    | SCardClassCall(e) ->
    L.build_call cardcall_func (Array.of_list (List.map (expr builder) (e))) "cardcall" builder

    | SAttrCall(objname, attr) -> 
      (match attr with
      "name" -> L.build_call getplayername_func [|(L.build_load (lookup objname) objname builder)|] "getplayername" builder
      | "score" -> L.build_call getplayerscore_func [|(L.build_load (lookup objname) objname builder)|] "getplayerscore" builder
      | "type" -> L.build_call getcardtype_func [|(L.build_load (lookup objname) objname builder)|] "getcardtype" builder
      | "faceup" -> L.build_call getcardfaceup_func [|(L.build_load (lookup objname) objname builder)|] "getcardfaceup" builder
      )

    | SActionCall(a, args) ->
    let (adef, main_func) = StringMap.find a action_decls_map in
    let llargs = List.rev (List.map (expr builder) (List.rev args)) in
    let result = (match main_func.satyp with 
                  A.None -> ""
                | _ -> a ^ "_result") 
    in L.build_call adef (Array.of_list llargs) result builder
    | SExprActionCall(exp, a, args) -> raise (Failure "Need to implement this class-dependent expression")
    | SAttrCall(a, args) -> raise (Failure "Need to implement this class-dependent expression")
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
      and e2' = expr builder e2 
      in
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
    | SUnop(op, ((t, _) as e)) ->
      let e' = expr builder e in
      (match op with
        | A.Neg when t = A.Float -> L.build_fneg 
        | A.Neg                  -> L.build_neg
        | A.Not                  -> L.build_not) 
      e' "tmp" builder
    | SSeriesliteral (series_type, literals) ->
      let ltype = (ltype_of_typ series_type) in (*gets type of elements in arr *) 
      let new_series_ptr = L.build_alloca (series_t ltype) "new_series_ptr" builder in
      let _ = init_series builder new_series_ptr series_type in
      let map_func literal = 
         ignore(L.build_call (StringMap.find (type_str series_type) series_push) [| new_series_ptr; (expr builder literal) |] "" builder);
      in
      let _ = List.rev (List.map map_func literals) in
      L.build_load new_series_ptr "new_series" builder

    | SSeriesGet (series_type, id, e) ->
        L.build_call (StringMap.find (type_str series_type) series_get) [| (lookup id); (expr builder e) |] "series_get" builder 
    | SSeriesSize (series_type, id) -> 
        L.build_call ((StringMap.find (type_str series_type)) series_size) [| (lookup id) |] "series_size" builder
    | SSeriesPop (series_type, id) -> 
        L.build_call ((StringMap.find (type_str series_type)) series_pop) [| (lookup id) |] "series_pop" builder
  in

let add_terminal builder instr =
  match L.block_terminator (L.insertion_block builder) with
    Some _ -> ()
    | None -> ignore (instr builder) in

let rec stmt builder = function
	| SBlock stmt_list -> List.fold_left stmt builder stmt_list 
  | SExpr e -> ignore(expr builder e); builder
  | SSeriesPush (id, e) -> 
      ignore(L.build_call (StringMap.find (type_str (fst e)) series_push) [| (lookup id); (expr builder e) |] "" builder); builder 
  | SIf (predicate, then_stmt, else_stmt) ->
    let bool_val = expr builder predicate in
    let merge_bb = L.append_block context "merge" f in
    let build_br_merge = L.build_br merge_bb in (* partial function *)

    let then_bb = L.append_block context "then" f in
    add_terminal (stmt (L.builder_at_end context then_bb) then_stmt)
    build_br_merge;

    let else_bb = L.append_block context "else" f in
    add_terminal (stmt (L.builder_at_end context else_bb) else_stmt)
    build_br_merge;
    ignore(L.build_cond_br bool_val then_bb else_bb builder);
    L.builder_at_end context merge_bb
    | SWhile (predicate, body) ->
    let pred_bb = L.append_block context "while" f in
    ignore(L.build_br pred_bb builder);

    let body_bb = L.append_block context "while_body" f in
    add_terminal (stmt (L.builder_at_end context body_bb) body)
    (L.build_br pred_bb);

    let pred_builder = L.builder_at_end context pred_bb in
    let bool_val = expr pred_builder predicate in

    let merge_bb = L.append_block context "merge" f in
    ignore(L.build_cond_br bool_val body_bb merge_bb pred_builder);
    L.builder_at_end context merge_bb
    | SFor (e1, e2, e3, body) -> stmt builder
    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
    (*| SForLit ( e1, e2, body) -> stmt builder
    ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e]) ] ) *)
    in

    let builder = stmt builder (SBlock main_func.smbody) in 
  let _ = L.build_ret (L.const_int i32_t 0) (builder) 
  in
  () 
  in

	let _ = build_main main_decl in
  the_module; 
