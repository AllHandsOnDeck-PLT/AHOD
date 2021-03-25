# "ocamlbuild test.native" will also build 

# test : parse.cmo scanner.cmo ast.cmo sast.cmo # test.cmo
# 	ocamlc -o test $^

prettyPrint : parse.cmo scanner.cmo prettyPrint.cmo
	ocamlc -o prettyPrint $^

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

scanner.ml : scanner.mll
	ocamllex $^

parse.ml parse.mli : parse.mly
	ocamlyacc $^

# Depedencies from ocamldep
# test.cmo : scanner.cmo parse.cmi ast.cmi
# test.cmx : scanner.cmx parse.cmx ast.cmi

prettyPrint.cmo : scanner.cmo parse.cmi ast.cmi
prettyPrint.cmx : scanner.cmx parse.cmx ast.cmi

parse.cmo : ast.cmo parse.cmi
parse.cmx : ast.cmo parse.cmi
scanner.cmo : parse.cmi
scanner.cmx : parse.cmx

# sast.cmo : ast.cmo sast.ml 
# 	ocamlc -c $^

# sast.cmi : ast.cmi sast.ml
# 	ocamlc -c $^

# parse.output : parse.mly
# 	ocamlyacc -v parse.mly
##############################

TARFILES = README Makefile \
	scanner.mll ast.ml parse.mly prettyPrint.ml 

hw1.tar.gz : $(TARFILES)
	cd .. && tar zcf hw1/hw1.tar.gz $(TARFILES:%=hw1/%)

.PHONY : clean
clean :
	rm -rf \
	*.cmi *.cmo parse.ml parse.mli parse.output scanner.ml a.out test 