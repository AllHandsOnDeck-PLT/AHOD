open Ast
open Sast

let check (main_stmt, action_decls) =

	let rec check_expr = function
		(*need to figure out typ, if name is defined*)
		ActionCall(aname, aparams) -> (String, SActionCall(aname, List.map check_expr aparams))
		| Sliteral s -> (String, SSliteral(s))
		| Iliteral i -> (Int, SIliteral(i))
		| Fliteral f -> (Float, SFliteral(f))
		| Bliteral b -> (Bool, SBliteral(b))

	in

	let rec check_stmt = function
		Expr e -> SExpr (check_expr e) 

		| Block sl -> 
         SBlock(List.map check_stmt sl)

    in


	(check_stmt main_stmt, [])