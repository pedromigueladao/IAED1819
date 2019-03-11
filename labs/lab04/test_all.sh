#!/bin/bash
#
# File:  test_all.sh
# Author:  mikolas
# Created on:  Sat Feb 23 13:04:25 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
failures=0
for e in ex01 ex02 ex03 ex04 ex05 ex06 ex07 ex08; do
    ./test.sh ${e}
    let failures="$?+${failures}"
done
echo FAILURES: $failures
if [ ${failures} == 0 ]; then
    echo "**********************************"
    echo "*All tests passed! Great success!*"
    echo "**********************************"
fi
