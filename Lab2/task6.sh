#!/bin/bash

max_mem=0
max_mem_pid=0

for pid_dir in /proc/[0-9]*/; do
    pid=$(basename $pid_dir)

    mem=$(grep -s "VmSize:" $pid_dir/status | awk '{print $2}')

    if [ $mem -gt $max_mem ]; then
        max_mem=$mem
        max_mem_pid=$pid
    fi
done

echo "$max_mem_pid"
