#!/bin/bash  
if [ $# -lt 2 ] ; then
    echo "Usage: $0 <solucao> <test-name1> <test-name2> ..."
    echo "Example: ./run.sh p1.c testes_enunciado/teste01-adiciona-evento.in"
    exit 1
fi

RED='\033[0;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

SOLUCAO="$1"
prog_name=bla_${RANDOM}

gcc -Wall -Wextra -ansi -pedantic $SOLUCAO -o ${prog_name} 2> ${prog_name}.warnings

rv_compile=$?
if [ ${rv_compile} != 0 ]; then
    echo -e "${RED}[--] ERROR: Compilation failed!${NC}"
    rm -f ${prog_name}.warnings
    exit 1
elif [ -s ${prog_name}.warnings ]; then
    echo -e "${YELLOW}[--] Program compiled with warnings...${NC}"
    cat ${prog_name}.warnings
else
    echo -e "${GREEN}[++] Program successfully compiled...${NC}"
fi

shift

failures=0

for arg in "$@"
do
	echo -e ""
  	echo -e "[*] Running ${arg%.*}.in"
  	time ./${prog_name} < "${arg%.*}".in > "${arg%.*}".out.${prog_name}

  	diff -q "${arg%.*}".out "${arg%.*}".out.${prog_name}
    rv_diff=$?
	
    rm -f "${arg%.*}".out.${prog_name}

    if [ ${rv_diff} == 0 ]; then
        echo -e "${GREEN}[++] Test ${arg%.*}.in PASSED!${NC}"
    else
        echo -e "${RED}[--] Test ${arg%.*}.in FAILURE!${NC}"
        let failures="1+${failures}"
    fi
done

rm -f ${prog_name}

if [ ${failures} -gt 0 ]; then
    echo -e ""
    echo -e "${RED}FAILURES: $failures${NC}"
else
    echo -e ""
    echo -e "${GREEN}FAILURES: $failures${NC}"
fi

if [ ${failures} == 0 ]; then
    echo -e "${GREEN}************************************"
    echo -e "* All tests passed! Great success! *"
    echo -e "************************************${NC}"
fi

if [ -s ${prog_name}.warnings ]; then
    echo -e "${YELLOW}*********************************************************************"
    echo -e "[--] Program compiled with warnings! Fix before submitting to Mooshak."
    echo -e "**********************************************************************${NC}"
else
    echo -e "${GREEN}***********************************"
    echo -e "[++] Program successfully compiled."
    echo -e "***********************************${NC}"
fi

rm -f ${prog_name}.warnings
