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

test_dir="${1}"
shift
prog_name=foo_${RANDOM}
DIFF="diff"
CC="gcc -ansi -Wall -Wextra -pedantic"

${CC} -o ${prog_name} $*
rv_compile=$?
if [ ${rv_compile} != 0 ]; then
    echo "ERROR: Compilation failed!"
    exit 1
else
    echo "Program successfully compiled..."
fi

if  ( which `cut <<<time -f1 -d\ ` >/dev/null 2>&1 ) ; then
    time_cmd="time"
fi

if  [ -f /usr/bin/time ] ; then
    if /usr/bin/time -f "%e%M" echo 2>/dev/null >/dev/null; then
        time_cmd='/usr/bin/time'
        time_args=(-f "Resources: real:%es mem:%MKB")
    fi
fi

okay=1
for test_in in `ls -rS ${test_dir}/*.in`; do
    echo "Test:" "${test_in}"
    test_out="${test_in%.in}.out"
    stamp="${RANDOM}${RANDOM}"
    student_out=/tmp/in_${stamp}
    ( ${time_cmd} "${time_args[@]}" ./${prog_name} <${test_in} >${student_out} )
    rv_student=$?

    if [ ! -f "${student_out}" ]; then
        echo "ERROR: The output of the exercise was not created (file ${student_out})!"
        okay=0
        break
    fi

    if [ ${rv_student} != 0 ]; then
        echo "ERROR: Program did not return 0!"
        rm -f ${student_out}
        okay=0
        break
    else
        echo "Program successfully ran..."
    fi

    ${DIFF} ${student_out} ${test_out}
    rv_diff=$?
    rm -f ${student_out}

    if [ ${rv_diff} == 0 ]; then
        echo "Test ${test_in} PASSED!"
    else
        echo "Test ${test_in} FAILURE!"
        okay=0
        break
    fi
done
if [ ${okay} == 1 ]; then
    echo "+++++++++++++++++++"
    echo "+All Tests PASSED!+"
    echo "+++++++++++++++++++"
fi

rm -f ${student_out}
rm -f ${prog_name}
