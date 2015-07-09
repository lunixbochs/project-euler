#!/bin/bash
sum=0
for i in $(seq 1 999); do
    if [[ $((i % 5)) -eq 0 ]] || [[ $((i % 3)) -eq 0 ]]; then
        sum=$((sum + i))
    fi
done
echo "$sum"
