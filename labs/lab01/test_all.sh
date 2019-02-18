#!/bin/bash
#
# File:  test_all.sh
# Author:  mikolas
# Created on:  Mon Feb 18 14:00:31 STD 2019
# Copyright (C) 2019, Mikolas Janota
#
for e in ex01 ex02; do
    echo '====' "${e}"
    ./test.sh "${e}"
    echo '===='
done
