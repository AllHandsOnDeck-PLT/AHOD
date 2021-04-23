#!/bin/sh

if [ $# -ne 1 ] 
then 
	echo "AHOD Compiler Script Usage:" 
	echo "./ahod_comp.sh program.ah" 
	exit 1
fi

program=${1::-4}
./AHOD.native < $1 \
                > $program.ll && llc $program.ll \
		> $program.s && gcc -o $program $program.s \
