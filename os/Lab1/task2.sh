#!/bin/bash
read string
ans=""
while [[ $string != "q" ]]
do
  ans+=$string
  read string
done
echo $ans
