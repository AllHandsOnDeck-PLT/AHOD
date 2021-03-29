(* Top-level of the MicroC compiler: scan & parse the input,
   check the resulting AST and generate an SAST from it, generate LLVM IR,
   and dump the module *)

   type action = Ast | Sast | LLVM_IR | Compile

   let () =
     let action = ref Compile in
     let set_action a () = action := a in
     let speclist = [
       ("-a", Arg.Unit (set_action Ast), "Print the AST");
       ("-s", Arg.Unit (set_action Sast), "Print the SAST");
     ] in  
     let usage_msg = "usage: ./microc.native [-a|-s|-l|-c] [file.mc]" in
     let channel = ref stdin in
     Arg.parse speclist (fun filename -> channel := open_in filename) usage_msg;
     
     let lexbuf = Lexing.from_channel !channel in
     let ast = Parse.expr Scanner.token lexbuf in  
     match !action with
       Ast -> print_string (Ast.string_of_expr ast)
     
     Llvm_analysis.assert_valid_module m;
   