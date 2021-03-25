Members:
Caitlyn Chen: ckc2143
Christi Kim: cwk2109
Jang Hun Choi: jc5112
Mara Dimofte: md3713 
Tiffeny Chen: tc2963

Section 1: Compilation
Just run the make file:
usage:
	make

Section 2: Running testscript
From the same directory, just run the script
usage:
	./testall.sh

Current State:
Part 1: Parser/AST/Scanner/SAST --
We are working on fully implementing pretty printing of the AST and SAST (ParsingError)
Parser and Scanner compile successfully but unsure if it's fully functional

Upon completion of pretty printing, will be able to verify if Parsing correctly. 

Part 2: Semant and Codegen 
Unsure how to handle program as records for Semant check or how to support built in functions with our existing grammar (added in microc's funcdecl but unsure if that is necessary/correct)
Can't verify if Semant and Codegen are correct at the moment. 
AHOD.native currently unable to be created thus HelloWorld is currently not supported

With pretty printing properly implemented, AHOD.ml will be able to properly call Semant to debug our code.  