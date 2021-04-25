# "make test" Compiles everything and runs the regression tests

.PHONY : test
test : all testall.sh
	./testall.sh

# "make all" builds the executable as well as the "printbig" library designed
# to test linking external code

.PHONY : all
all : AHOD.native playercall.o

# "make microc.native" compiles the compiler
#
# The _tags file controls the operation of ocamlbuild, e.g., by including
# packages, enabling warnings
#
# See https://github.com/ocaml/ocamlbuild/blob/master/manual/manual.adoc

AHOD.native :
	opam config exec -- \
	ocamlbuild -use-ocamlfind AHOD.native

# "make clean" removes all generated files

playercall : playercall.c
	cc -o playercall -DBUILD_TEST playercall.c

.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log ocamlllvm *.diff .ll .native *.o