open Ast
open Sast

module StringMap = Map.Make(String)

let check (globals, action_decls, main_stmt) =

  (**** Check global variables ****)

  

  let check_assign lvaluet rvaluet err =
       if lvaluet = rvaluet then lvaluet else raise (Failure err)
  in   

  (* Build local symbol table of variables for this function *)
  let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
    StringMap.empty (globals)
  in

  (* Return a variable from our local symbol table *)
  let type_of_identifier s =
    try StringMap.find s symbols
    with Not_found -> raise (Failure ("undeclared identifier " ^ s))
  in

  (* Check if id is a list and return list type *)
  let check_list_type id = 
    match (type_of_identifier id) with 
       Series t -> t
     | t -> raise (Failure ("check list type error, typ: " ^ string_of_typ t))
  in

	let rec check_expr = function
		(*need to figure out typ, if name is defined*)
		| ActionCall(aname, aparams) -> (String, SActionCall(aname, List.map check_expr aparams))
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

	let rec check_stmt = function
		Expr e -> SExpr (check_expr e) 
    | SeriesAdd (var, e) -> 
        let _ = check_list_type var in
        SSeriesAdd(var, check_match_list_type_expr var e) 
    | If(p, b1, b2) -> SIf(check_expr p, check_stmt b1, check_stmt b2)
    | While(p, s) -> SWhile(check_expr p, check_stmt s)
    (*| For(e1, e2, e3, st) ->
     SFor(expr e1, check_expr e2, expr e3, check_stmt st)*)
    | Block sl -> 
         SBlock(List.map check_stmt sl)
    in


	(globals, [], check_stmt main_stmt)


