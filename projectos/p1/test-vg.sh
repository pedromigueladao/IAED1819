#!/bin/bash
#
# File:  test.sh
# Author:  mikolas
# Created on:  Sun Feb 17 13:31:59 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
if [ $# -lt 2 ] ; then
    echo "Usage: $0 <test-dir> <src-file1> <src-file2> ..."
    echo "Example: ${0} testes_enunciado *.c"
    exit 1
fi

if  ! ( which `cut <<<valgrind -f1 -d\ ` >/dev/null 2>&1 ) ; then
    echo "Looks like valgrind can't be run. Make sure it's installed."
    exit 2
fi

test_dir="${1}"
shift
prog_name=foo_${RANDOM}
DIFF="diff"
CC="gcc -ansi -Wall -Wextra -pedantic"
vg_pref='^==[0-9]*==\s\+'

${CC} -o ${prog_name} $*
rv_compile=$?
if [ ${rv_compile} != 0 ]; then
    echo "ERROR: Compilation failed!"
    exit 1
else
    echo "Program successfully compiled..."
fi

rv=0

for test_in in "${test_dir}"/*.in ; do
    echo "Test:" "${test_in}"
    test_out="${test_in%.in}.out"
    stamp="${RANDOM}${RANDOM}"
    student_out=/tmp/out_${stamp}
    vg_out=/tmp/vg_${stamp}
    valgrind ./${prog_name} <${test_in} 2>${vg_out} >${student_out}
    rv_student=$?

    if [ ! -f "${student_out}" ]; then
        echo "ERROR: The output of the exercise was not created (file ${student_out})!"
        rv=1
        break
    fi

    if [ ${rv_student} != 0 ]; then
        echo "ERROR: Program did not return 0!"
        rm -f ${student_out}
        rv=1
        break
    else
        echo "Program successfully ran..."
    fi

    ${DIFF} ${student_out} ${test_out}
    rv_diff=$?

    if grep -q "${vg_pref}"'ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)' ${vg_out}; then
        noerrs=1
    else
        noerrs=0
    fi


    rm -f ${student_out} ${vg_out}

    if [ ${rv_diff} == 0 ]; then
        echo "Test ${test_in} PASSED!"
    else
        echo "Test ${test_in} FAILURE!"
        rv=1
        break
    fi

    if [ ${noerrs} != 1 ]; then
        echo "STOP: Looks like there's an issue reported by valgrind!"
        rv=1
        break
    fi
done

rm -f ${student_out} ${vg_out} # just to make sure
rm -f ${prog_name}
exit $rv
