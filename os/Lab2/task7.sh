#!/bin/bash

start_time=$(date +%s)
sleep 60
end_time=$(date +%s)

for pid_dir in /proc/[0-9]*/;
do
    pid=$(basename $pid_dir)

    read_bytes=$(grep -s "read_bytes" $pid_dir/io | awk '{print $2}')

    ans=$(( ($read_bytes / ($end_time - $start_time)) * 60 ))

    if [ $ans -gt 0 ]; then
        cmd=$(tr -d '\0' < $pid_dir/cmdline)
        echo "$pid : $cmd : $ans"
    fi
done

