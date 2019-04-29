#!/bin/bash
#
# File:  test.sh
# Author:  mikolas
# Created on:  Sun Feb 17 13:31:59 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
if [[ $# != 1 ]] ; then
    echo "Usage: $0 <exercise-name>"
    echo "Example: ${0} ex01"
    exit 1
fi

if  ! ( which `cut <<<valgrind -f1 -d\ ` >/dev/null 2>&1 ) ; then
    echo "Looks like valgrind can't be run. Make sure it's installed."
    exit 2
fi

prog_name="${1}"
cfile="${1}".c
DIFF="diff --ignore-space-change --ignore-blank-lines"
CC="gcc -g -ansi -Wall -Wextra -pedantic"

if [ ! -f "${cfile}" ]; then
    echo "ERROR: file ${cfile} not found!"
    exit 1
fi

${CC} -o ${prog_name} ${cfile}
rv_compile=$?
if [ ${rv_compile} != 0 ]; then
    echo "ERROR: Compilation failed!"
    exit 1
else
    echo "Program successfully compiled..."
fi

for test_in in tests/${1}_*.in ; do
    echo "Test:" "${test_in}"
    test_out="${test_in%.in}.out"
    stamp="${RANDOM}${RANDOM}"
    student_out=/tmp/in_${stamp}
    vg_out=/tmp/vg_${stamp}
    valgrind ./${prog_name} <${test_in} 2>${vg_out} >${student_out}
    rv_student=$?

    if [ ! -f "${student_out}" ]; then
        echo "ERROR: The output of the exercise was not created (file ${student_out})!"
        exit 1
    fi

    if [ ${rv_student} != 0 ]; then
        echo "ERROR: Program did not return 0!"
        rm -f ${student_out}
        exit 1
    else
        echo "Program successfully ran..."
    fi

    ${DIFF} ${student_out} ${test_out}
    rv_diff=$?

    noerrs='X'
    noleaks='X'
    killed='X'
    pref='^==[0-9]*==\s\+'

    if grep -q "${pref}"'ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)' ${vg_out}; then
        noerrs=1
    elif grep -q  "${pref}"'ERROR SUMMARY: [1-9][0-9]* errors from [0-9]* contexts' ${vg_out}; then
        noerrs=0
    elif grep -q  "${pref}"'Invalid write of size [1-9][0-9]*$' ${vg_out}; then
        noerrs=0
    elif grep -q  "${pref}"'Invalid read of size [1-9][0-9]*$' ${vg_out}; then
        noerrs=0
    fi

    if grep -q "${pref}"'All heap blocks were freed -- no leaks are possible' ${vg_out}; then
        noleaks=1
    elif grep -q "${pref}"'definitely lost: [1-9].* bytes in' ${vg_out}; then
        noleaks=0
    elif grep -q "${pref}"'still reachable: [1-9].* bytes in [1-9].* blocks$' ${vg_out}; then
        noleaks=0
    fi
    if grep -q 's.*\sKilled\s.*valgrind' ${vg_out}; then
        killed=1
    elif grep -q '^Time Limit Exceeded$' ${vg_out}; then
        killed=1
    fi

    score='?'
    if [[ $noerrs == 1 && $noleaks == 1 ]]; then score=1
    elif [[ $noerrs == 1 && $noleaks == 0 ]]; then score=0.5
    elif [[ $noerrs == 0 ]]; then score=0
    elif [[ $killed == 1 ]]; then score=0
    fi

    if grep -q '^valgrind: ./proj2: No such file or directory' ${vg_out}; then nofile=1;
    else nofile=0; fi

    obs=''
    if [[ $killed == 1 ]]; then obs="killed ${obs}"; fi
    if [[ $noerrs == 0 ]]; then obs="ERRS ${obs}"; fi
    if [[ $noleaks == 0 ]]; then obs="LEAKS ${obs}"; fi
    if [[ $nofile == 1 ]]; then obs="nofile ${obs}"; fi

    if [ ${rv_diff} == 0 ]; then
        echo "Test ${test_in} PASSED!"
    else
        echo "Test ${test_in} FAILURE!"
        exit 1
    fi

    if [ ${score} != 1 ]; then
        echo "STOP: Looks like there's an issue reported by valgrind!"
        echo "ISSUE:${obs}" 
        rv=1
        break
    fi
    rm -f ${student_out} ${vg_out}
done
rm -f ${student_out} ${vg_out}
