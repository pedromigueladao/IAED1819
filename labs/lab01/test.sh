#!/bin/bash
#
# File:  test.sh
# Author:  mikolas
# Created on:  Sun Feb 17 13:31:59 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
if [[ $# != 1 ]] ; then
    echo "Usage: $0 <exercise-name>"
    echo "Example: ./${0} ex01"
    exit 100
fi

prog_name="${1}"
cfile="${1}".c
test_in="tests/${1}.in"
test_out="tests/${1}.out"
diff_opts="--ignore-space-change --ignore-blank-lines"
#--color --ignore-trailing-space

if [ ! -f "${cfile}" ]; then
    echo "ERROR: file ${cfile} not found!"
    exit 100
fi

gcc -ansi -Wall -Wextra -pedantic -o ${prog_name} ${cfile}
rv=$?
if [ ${rv} != 0 ]; then
    echo "ERROR: Compilation failed!"
    exit 100
else
    echo "Program successfully compiled..."
fi

stamp=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1`
student_out=/tmp/in_${stamp}
./${prog_name} <${test_in} | sed -e 's/\r$//' > ${student_out}
rv1=$?
if [ ${rv} != 0 ]; then
    echo "ERROR: Program did not return 0!"
    exit 100
else
    echo "Program successfully ran..."
fi

if [ ! -f "${student_out}" ]; then
    echo "ERROR: The output of the exercise was not created (file ${student_out})!"
    exit 100
fi
if diff ${diff_opts} ${student_out} ${test_out}; then
    echo "Test PASSED!"
else
    echo "Test FAILURE!"
fi

rm -f ${student_out}
