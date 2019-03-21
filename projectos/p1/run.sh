#!/bin/bash  

SOLUCAO="$1"

gcc -Wall -Wextra -ansi -pedantic $SOLUCAO -o bla
shift

for arg in "$@"
do
	echo ""
  	echo "Running ${arg%.*}.in"
  	time ./bla < "${arg%.*}".in > "${arg%.*}".out.bla
  	diff -q "${arg%.*}".out "${arg%.*}".out.bla
	rm "${arg%.*}".out.bla
done

rm bla