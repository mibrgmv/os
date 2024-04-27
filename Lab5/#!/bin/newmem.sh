#!/bin/bash

N=$1 
arr=()

while [[ ${#arr[@]} -lt $N ]]; do
  arr+=(1)
done

exit 0
