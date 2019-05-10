#!/bin/bash
#
# File:  test_all_dirs.sh
# Author:  mikolas
# Created on:  Fri May 3 17:20:36 DST 2019
# Copyright (C) 2019, Mikolas Janota
#
if [ $# -lt 1 ] ; then
    echo "Usage: $0 <src-file1> <src-file2> ..."
    echo "Example: ${0} *.c"
    exit 1
fi

for d in tests-basic tests-p tests-e tests-r tests-a_r tests-c tests-mix tests-big ; do
    if ./test.sh ${d} $*; then
        echo "=== directory completed: ${d} ==="
    else
        echo "=== problem with directory: ${d} ==="
        break
     fi
 done
