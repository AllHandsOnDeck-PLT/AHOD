open Ast
open Sast

module StringMap = Map.Make(String)

let classIndices: (string, int) Hashtbl.t = Hashtbl.create 10

let createClassIndices class_decls =
  let classHandler index class_decl = 
  Hashtbl.add classIndices class_decl.cname index in 
  List.iteri classHandler class_decls 

(*look up in map, information for type. Shortcut: rather than lookup in map, 
will always return particular information for type

built in struct, generate and try to access that 
*)

let check (globals, action_decls, main) = (*changed from class_decls to action_decls*)
  
  (* Verify a list of bindings has no none types or duplicate names *)
  let check_binds (kind : string) (binds : bind list) =
    List.iter (function
      | (None, b) -> raise (Failure ("illegal None " ^ kind ^ " " ^ b))
      | _ -> ()) binds;
    let rec dups = function
        [] -> ()
      | ((_,n1) :: (_,n2) :: _) when n1 = n2 -> raise (Failure ("duplicate " ^ kind ^ " " ^ n1))
      | _ :: t -> dups t
    in dups (List.sort (fun (_,a) (_,b) -> compare a b) binds)
  in

  (**** Check global variables ****)
  check_binds "global" globals;
    
  let built_in_decls = 
    let add_bind map (name, ty) = StringMap.add name {
      atyp = None;
      aname = name; 
      aparams = [(ty, "x")];
      alocals = []; abody = [] } map
    in List.fold_left add_bind StringMap.empty [ ("PRINT", Int)]
  in
 
  let add_action map ad = 
    let built_in_err = "function " ^ ad.aname ^ " may not be defined"
    and dup_err = "duplicate function " ^ ad.aname
    and make_err er = raise (Failure er)
    and n = ad.aname (* Name of the function *)
    in match ad with (* No duplicate functions or redefinitions of built-ins *)
        _ when StringMap.mem n built_in_decls -> make_err built_in_err
      | _ when StringMap.mem n map -> make_err dup_err  
      | _ ->  StringMap.add n ad map 
  in

  (* Collect all function names into one symbol table *)
  let action_decls_map = List.fold_left add_action built_in_decls action_decls 
  in

  let find_act s = 
    try StringMap.find s action_decls_map
    with Not_found -> raise (Failure ("unrecognized action " ^ s))
  in

    (* Raise an exception if the given rvalue type cannot be assigned to
  the given lvalue type *)
  let check_assign lvaluet rvaluet err =
    if lvaluet = rvaluet then lvaluet else raise (Failure err)
  in  

  (* Build local symbol table of variables for this action *)
  let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
                StringMap.empty (globals)
  in

  (* Return a variable from our local symbol table *)
  let type_of_identifier s =
    try StringMap.find s symbols
    with Not_found -> raise (Failure ("undeclared identifier " ^ s))
  in

  let check_list_type id = 
    match (type_of_identifier id) with 
      Series t -> t
    | t -> raise (Failure ("check list type error, typ: " ^ string_of_typ t))
  in

  let rec check_expr = function
    (*need to figure out typ, if name is defined*)
      (* | ActionCall(aname, aparams) -> (String, SActionCall(aname, List.map check_expr aparams)) *)
      | Sliteral s -> (String, SSliteral(s))
      | Iliteral i -> (Int, SIliteral(i))
      | Fliteral f -> (Float, SFliteral(f))
      | Bliteral b -> (Bool, SBliteral(b))
      | Noexpr     -> (None, SNoexpr)
      | Id s       -> (type_of_identifier s, SId s)
      | Assign(var, e) as ex -> 
        let lt = type_of_identifier var
        and (rt, e') = check_expr e in
        let err = "illegal assignment " ^ string_of_typ lt ^ " = " ^ 
              string_of_typ rt 
        in (check_assign lt rt err, SAssign(var, (rt, e')))
      | Binop(e1, op, e2) as e -> 
            let (t1, e1') = check_expr e1 
            and (t2, e2') = check_expr e2 in
            (* All binary operators require operands of the same type *)
            let same = t1 = t2 in
            (* Determine expression type based on operator and operand types *)
            let ty = match op with
              Add | Sub | Mult | Div when same && t1 = Int   -> Int
            | Add | Sub | Mult | Div when same && t1 = Float -> Float
            | Equal | Neq            when same               -> Bool
            | Less | Leq | Greater | Geq
                      when same && (t1 = Int || t1 = Float) -> Bool
            | And | Or when same && t1 = Bool -> Bool
            | _ -> raise (
          Failure ("illegal binary operator " ))
            in (ty, SBinop((t1, e1'), op, (t2, e2')))
      | ActionCall(aname, args) as acall -> 
        let ad = find_act aname in
        let param_length = List.length ad.aparams in
        if List.length args != param_length then
          raise (Failure ("expecting " ^ string_of_int param_length ^ 
                          " arguments in " ^ string_of_expr acall))
        else let check_call (at, _) e = 
          let (et, e') = check_expr e in 
          let err = "illegal argument found " ^ string_of_typ et ^
            " expected " ^ string_of_typ at ^ " in " ^ string_of_expr e
          in (check_assign at et err, e')
        in 
        let args' = List.map2 check_call ad.aparams args
        in (ad.atyp, SActionCall(aname, args'))
      | Seriesliteral vals ->
          let (t', _) = check_expr (List.hd vals) in
          let map_func lit = check_expr lit in
          let vals' = List.map map_func vals in
          (* TODO: check if all vals are same type *)
          (Series t', SSeriesliteral(t', vals'))
      | SeriesGet (var, e) -> 
          let (t, e') = check_expr e in
          let ty = match t with 
              Int -> Int
              | _ -> raise (Failure ("list_get index must be integer, not " ^ string_of_typ t)) 
          in let list_type = check_list_type var
          in (list_type, SSeriesGet(list_type, var, (ty, e')))
  in
  
  let check_match_list_type_expr l e = 
    let (t', e') as e'' = check_expr e
    in let err = "list type and expression type do not match " ^ (string_of_typ t') ^ ", " ^ (string_of_sexpr e'')
    in if t' != (check_list_type l) then raise (Failure err) else (t', e') 
  in

  let rec check_stmt = function (*currently only suuports one input -- support for map *)
    Expr e -> SExpr (check_expr e) 
    | SeriesAdd (var, e) -> 
        let _ = check_list_type var in
        SSeriesAdd(var, check_match_list_type_expr var e) 
    | If(p, b1, b2) -> SIf(check_expr p, check_stmt b1, check_stmt b2)
    | While(p, s) -> SWhile(check_expr p, check_stmt s)
    | For(e1, e2, e3, st) ->
      SFor(check_expr e1, check_expr e2, check_expr e3, check_stmt st)
    (*| Return e -> let (t, e') = check_expr e in
      if t = act.typ then SReturn (t, e') 
      else raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
      string_of_typ act.typ ^ " in " ^ string_of_expr e)) *)
    | Block sl -> 
      let rec check_stmt_list = function
          [Return _ as s] -> [check_stmt s]
        | Return _ :: _   -> raise (Failure "nothing may follow a return")
        | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
        | s :: ss         -> check_stmt s :: check_stmt_list ss
        | []              -> []
      in  SBlock(List.map check_stmt sl)
    in

  let check_action act =
    (* Make sure no params or locals are void or duplicates *)
    check_binds "aparams" act.aparams;
    check_binds "alocals" act.alocals;

    (* Raise an exception if the given rvalue type cannot be assigned to
    the given lvalue type *)
    let check_assign lvaluet rvaluet err =
      if lvaluet = rvaluet then lvaluet else raise (Failure err)
    in  

    (* Build local symbol table of variables for this action *)
    let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
                  StringMap.empty (globals @ act.aparams @ act.alocals )
    in

    (* Return a variable from our local symbol table *)
    let type_of_identifier s =
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let check_list_type id = 
      match (type_of_identifier id) with 
        Series t -> t
      | t -> raise (Failure ("check list type error, typ: " ^ string_of_typ t))
    in

    let rec check_expr = function
      (*need to figure out typ, if name is defined*)
        (* | ActionCall(aname, aparams) -> (String, SActionCall(aname, List.map check_expr aparams)) *)
        | Sliteral s -> (String, SSliteral(s))
        | Iliteral i -> (Int, SIliteral(i))
        | Fliteral f -> (Float, SFliteral(f))
        | Bliteral b -> (Bool, SBliteral(b))
        | Noexpr     -> (None, SNoexpr)
        | Id s       -> (type_of_identifier s, SId s)
        | Assign(var, e) as ex -> 
          let lt = type_of_identifier var
          and (rt, e') = check_expr e in
          let err = "illegal assignment " ^ string_of_typ lt ^ " = " ^ 
                string_of_typ rt 
          in (check_assign lt rt err, SAssign(var, (rt, e')))
        | Binop(e1, op, e2) as e -> 
              let (t1, e1') = check_expr e1 
              and (t2, e2') = check_expr e2 in
              (* All binary operators require operands of the same type *)
              let same = t1 = t2 in
              (* Determine expression type based on operator and operand types *)
              let ty = match op with
                Add | Sub | Mult | Div when same && t1 = Int   -> Int
              | Add | Sub | Mult | Div when same && t1 = Float -> Float
              | Equal | Neq            when same               -> Bool
              | Less | Leq | Greater | Geq
                        when same && (t1 = Int || t1 = Float) -> Bool
              | And | Or when same && t1 = Bool -> Bool
              | _ -> raise (
            Failure ("illegal binary operator " ))
              in (ty, SBinop((t1, e1'), op, (t2, e2')))
        | ActionCall(aname, args) as acall -> 
          let ad = find_act aname in
          let param_length = List.length ad.aparams in
          if List.length args != param_length then
            raise (Failure ("expecting " ^ string_of_int param_length ^ 
                            " arguments in " ^ string_of_expr acall))
          else let check_call (at, _) e = 
            let (et, e') = check_expr e in 
            let err = "illegal argument found " ^ string_of_typ et ^
              " expected " ^ string_of_typ at ^ " in " ^ string_of_expr e
            in (check_assign at et err, e')
          in 
          let args' = List.map2 check_call ad.aparams args
          in (ad.atyp, SActionCall(aname, args'))
        | Seriesliteral vals ->
            let (t', _) = check_expr (List.hd vals) in
            let map_func lit = check_expr lit in
            let vals' = List.map map_func vals in
            (* TODO: check if all vals are same type *)
            (Series t', SSeriesliteral(t', vals'))
        | SeriesGet (var, e) -> 
            let (t, e') = check_expr e in
            let ty = match t with 
                Int -> Int
                | _ -> raise (Failure ("list_get index must be integer, not " ^ string_of_typ t)) 
            in let list_type = check_list_type var
            in (list_type, SSeriesGet(list_type, var, (ty, e')))
    in
    
    let check_match_list_type_expr l e = 
      let (t', e') as e'' = check_expr e
      in let err = "list type and expression type do not match " ^ (string_of_typ t') ^ ", " ^ (string_of_sexpr e'')
      in if t' != (check_list_type l) then raise (Failure err) else (t', e') 
    in

    let rec check_stmt = function (*currently only suuports one input -- support for map *)
      Expr e -> SExpr (check_expr e) 
      | SeriesAdd (var, e) -> 
          let _ = check_list_type var in
          SSeriesAdd(var, check_match_list_type_expr var e) 
      | If(p, b1, b2) -> SIf(check_expr p, check_stmt b1, check_stmt b2)
      | While(p, s) -> SWhile(check_expr p, check_stmt s)
      | For(e1, e2, e3, st) ->
        SFor(check_expr e1, check_expr e2, check_expr e3, check_stmt st)
      (*| Return e -> let (t, e') = check_expr e in
        if t = act.typ then SReturn (t, e') 
        else raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
        string_of_typ act.typ ^ " in " ^ string_of_expr e)) *)
      | Block sl -> 
        let rec check_stmt_list = function
            [Return _ as s] -> [check_stmt s]
          | Return _ :: _   -> raise (Failure "nothing may follow a return")
          | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
          | s :: ss         -> check_stmt s :: check_stmt_list ss
          | []              -> []
        in  SBlock(List.map check_stmt sl)
      in
    { 
      (* sentitytyp = act.entitytyp;
      sentityid  = act.entityid; *)
      saname = act.aname; 
      satyp = act.atyp;
      saparams = act.aparams;
      salocals  = act.alocals;
      sabody = match check_stmt (Block act.abody) with
      SBlock(sl) -> sl
          | _ -> raise (Failure ("internal error: block didn't become a block?"))
      (* let _ = List.map check_stmt (Block act.abody) in match (Block act.abody) with
      SBlock(sl) -> sl
      | _ -> raise (Failure ("internal error: block didn't become a block?")) *)
      (* sabody = check_stmt (act.abody);  *)
        
    }
    (*(check_stmt main_stmt, list.map checsk_func action_decl) *)
   
  in (globals, List.map check_action action_decls, check_stmt main)
    (* (globals, [], check_stmt main_stmt) <- in case w/classes*)


