open Ast
open Sast

module StringMap = Map.Make(String)

let check (main_stmt, globals, action_decls) =

  (**** Check global variables ****)

  

  let check_assign lvaluet rvaluet err =
       if lvaluet = rvaluet then lvaluet else raise (Failure err)
  in   

  (* Build local symbol table of variables for this function *)
  let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
    StringMap.empty ([])
  in
(*
  (* Return a variable from our local symbol table *)
  let type_of_identifier s =
    try StringMap.find s symbols
    with Not_found -> raise (Failure ("undeclared identifier " ^ s))
  in
*)
	let rec check_expr = function
		(*need to figure out typ, if name is defined*)
		  ActionCall(aname, aparams) -> (String, SActionCall(aname, List.map check_expr aparams))
		| Sliteral s -> (String, SSliteral(s))
		| Iliteral i -> (Int, SIliteral(i))
		| Fliteral f -> (Float, SFliteral(f))
    | Bliteral b -> (Bool, SBliteral(b))
  (*  | Assign(var, e) as ex -> 
      let lt = type_of_identifier var
      and (rt, e') = check_expr e in
      let err = "illegal assignment " ^ string_of_typ lt ^ " = " ^ 
             string_of_typ rt 
      in (check_assign lt rt err, SAssign(var, (rt, e')))*)
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

	in

	let rec check_stmt = function
		Expr e -> SExpr (check_expr e) 

		| Block sl -> 
         SBlock(List.map check_stmt sl)

    in


	(check_stmt main_stmt, [], [])


