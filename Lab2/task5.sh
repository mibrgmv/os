#!/bin/bash

count=1
prev_pid=0
avgsum=0
avg=0

echo -e "$(<4.txt)\n" | sed "s/[^0-9.]\+/ /g" |
while read str; do
	pid=$(echo "$str" | awk '{print $1}')
        ppid=$(echo "$str" | awk '{print $2}')
        art=$(echo "$str" | awk '{print $3}')
	if [[ $ppid == $prev_ppid ]]; then
		avgsum=$(echo "$avgsum $art" | awk '{print $1 + $2}')
		count=$(($count+1))
	else
		avg=$(echo "$avgsum $count" | awk '{print $1 / $2}')
		echo "Average_Children_Running_Time_Of_ParentID="$prev_ppid" is "$avg""
		avgsum=$art
		prev_ppid=$ppid
		count=1
	fi
	if [[ -n $pid ]]; then
		echo "ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Running_Time="$art""
	fi
done > 5.txt
