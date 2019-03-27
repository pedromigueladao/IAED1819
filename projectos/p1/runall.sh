#!/bin/bash

if [[ $# != 2 ]] ; then
    echo "Usage: $0 <solucao> <pasta-de-testes>"
    echo "Example: ${0} p1.c testes_enunciado"
    exit 1
fi

SOLUCAO="$1"
FOLDER_TESTES="$2"


./run.sh $SOLUCAO $FOLDER_TESTES/*.in
