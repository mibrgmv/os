#!/bin/bash

N=300000
K=30

for i in $(seq 1 $K); do
  ./newmem.sh $N &
  sleep 1
done
