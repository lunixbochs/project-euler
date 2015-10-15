#!/bin/bash
a=0
b=1
total=0
while [[ "$b" -lt 4000000 ]]; do
    tmp=$a
    a=$b
    b=$((tmp + b))
    if [[ $((b % 2)) -eq 0 ]]; then
        total=$((total + b))
    fi
done
echo "$total"
