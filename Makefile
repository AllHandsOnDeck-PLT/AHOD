# "ocamlbuild test.native" will also build 

test : parse.cmo scanner.cmo #test.cmo
	#ocamlc -o test $^

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

scanner.ml : scanner.mll
	ocamllex $^

parse.ml parse.mli : parse.mly
	ocamlyacc $^

# Depedencies from ocamldep
#test.cmo : scanner.cmo parse.cmi ast.cmi
#test.cmx : scanner.cmx parse.cmx ast.cmi
parse.cmo : ast.cmi parse.cmi
parse.cmx : ast.cmi parse.cmi
scanner.cmo : parse.cmi
scanner.cmx : parse.cmx


##############################

#TARFILES = README Makefile \
#	scanner.mll ast.mli parse.mly test.ml 

#hw1.tar.gz : $(TARFILES)
#	cd .. && tar zcf hw1/hw1.tar.gz $(TARFILES:%=hw1/%)

.PHONY : clean
clean :
	rm -rf \
	*.cmi *.cmo parse.ml parse.mli scanner.ml test