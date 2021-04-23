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

let check (globals, action_decls, main_stmt) = (*changed from class_decls to action_decls*)

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
      let param_length = List.length ad.params in
      if List.length args != param_length then
        raise (Failure ("expecting " ^ string_of_int param_length ^ 
                        " arguments in " ^ string_of_expr acall))
      else let check_call (at, _) e = 
        let (et, e') = expr e in 
        let err = "illegal argument found " ^ string_of_typ et ^
          " expected " ^ string_of_typ at ^ " in " ^ string_of_expr e
        in (check_assign at et err, e')
      in 
      let args' = List.map2 check_call ad.params args
      in (ad.typ, SActionCall(aname, args'))
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
    | For(e1, e2, e3, st) ->
      SFor(check_expr e1, check_expr e2, check_expr e3, check_stmt st)
  | Block sl -> 
    let rec check_stmt_list = function
        [Return _ as s] -> [check_stmt s]
      | Return _ :: _   -> raise (Failure "nothing may follow a return")
      | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
      | s :: ss         -> check_stmt s :: check_stmt_list ss
      | []              -> []
  in  SBlock(List.map check_stmt sl)
in

let find_act s = 
  try StringMap.find s action_decls
  with Not_found -> raise (Failure ("unrecognized action " ^ s))
in

  let check_action act =
      { sentitytyp = act.entitytyp;
        sentityid  = act.entityid;
        saname = act.aname; 
        satyp = act.atyp;
        saparams = act.aparams;
        sabody = match check_stmt (Block act.abody) with
        SBlock(sl) -> sl
            | _ -> raise (Failure ("internal error: block didn't become a block?"))
        (* let _ = List.map check_stmt (Block act.abody) in match (Block act.abody) with
        SBlock(sl) -> sl
        | _ -> raise (Failure ("internal error: block didn't become a block?")) *)
        (* sabody = check_stmt (act.abody);  *)
        
    }
  (*(check_stmt main_stmt, list.map check_func action_decl) *)
   
  in (globals, List.map check_action action_decls, check_stmt main_stmt)
    (* (globals, [], check_stmt main_stmt) <- in case w/classes*)


