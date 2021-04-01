(* Semantic checking for the MicroC compiler *)

open Ast
open Sast

module StringMap = Map.Make(String)

(* Semantic checking of the AST. Returns an SAST if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (functions) =

  (**** Check global variables ****)

  (* check_binds "global" globals; *)

  (**** Check functions ****)

  (* Collect function declarations for built-in functions: no bodies *)
  let built_in_decls = 
    let add_bind map (name, ty) = StringMap.add name {
      entitytyp = None;
      entityid = ""; 
      aname = name;
      aparams = [(ty, "x")]; 
      abody = Block([]) } map
    in List.fold_left add_bind StringMap.empty [ ("print", String) ]
  in

  (* Add function name to symbol table *)
  let add_func map fd = 
    let built_in_err = "function " ^ fd.aname ^ " may not be defined"
    and dup_err = "duplicate function " ^ fd.aname
    and make_err er = raise (Failure er)
    and n = fd.aname (* Name of the function *)
    in match fd with (* No duplicate functions or redefinitions of built-ins *)
         _ when StringMap.mem n built_in_decls -> make_err built_in_err
       | _ when StringMap.mem n map -> make_err dup_err  
       | _ ->  StringMap.add n fd map 
  in

  (* Collect all function names into one symbol table *)
  let function_decls = List.fold_left add_func built_in_decls functions
  in
  
  (* Return a function from our symbol table *)
  let find_func s = 
    try StringMap.find s function_decls
    with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = find_func "main" in (* Ensure "main" is defined *)

  let check_function func =
       (* Raise an exception if the given rvalue type cannot be assigned to
       the given lvalue type *)
    (*check_binds "aparams" func.aparams;*)
    let check_assign lvaluet rvaluet err =
       if lvaluet = rvaluet then lvaluet else raise (Failure err)
    in    

    (* Build local symbol table of variables for this function *)
    (* let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
	                StringMap.empty (globals @ func.formals @ func.locals )
    in *)

    (* Return a variable from our local symbol table *)
    (* let type_of_identifier s =
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in *)

    let rec expr = function
	| ActionCall(aname, args) as call -> 
          let fd = find_func aname in (*whether function is defined*)
          let param_length = List.length fd.aparams in
          if List.length args != param_length then (*checking # of args*)
            raise (Failure ("expecting " ^ string_of_int param_length ^ 
                            " arguments in " ^ string_of_expr call))
          else let check_call (ft, _) e = 
            let (et, e') = expr e in 
            let err = "illegal argument found " ^ string_of_typ et ^
              " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e
            in (check_assign ft et err, e')
          in 
          let args' = List.map2 check_call fd.aparams args
          in (fd.entitytyp, SActionCall(aname, args'))
    in

     (* Return a semantically-checked statement i.e. containing sexprs *)
    let rec check_stmt = function
        Expr e -> SExpr (expr e) 
        (* | Return e -> let (t, e') = expr e in
        if t = func.typ then SReturn (t, e') 
        else raise (
	  Failure ("return gives " ^ string_of_typ t ^ " expected " ^
		   string_of_typ func.typ ^ " in " ^ string_of_expr e))
	     *)
	    (* A block is correct if each statement is correct and nothing
	       follows any Return statement.  Nested blocks are flattened. *)
      | Block sl -> 
          let rec check_stmt_list = function
           (*   [Return _ as s] -> [check_stmt s]
            | Return _ :: _   -> raise (Failure "nothing may follow a return")*)
            | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
            | s :: ss         -> check_stmt s :: check_stmt_list ss
            | []              -> []
            | _ -> raise ( Failure ("not supported"))
          in 
          SBlock(check_stmt_list sl)
      | _ -> raise ( Failure ("not supported"))
    in (* body of check_function *)
    { sentitytyp = func.entitytyp;
      sentityid = func.entityid;
      saname = func.aname;
      saparams  = func.aparams;
      sabody = match check_stmt (Block func.abody) with
	SBlock(sl) -> sl
      | _ -> raise (Failure ("internal error: block didn't become a block?"))
    }

  in (List.map check_function functions)