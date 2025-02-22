#!/bin/bash

pid=$(ps -ef | grep "loop" | awk 'NR==1 { print $2 }')
sudo renice 10 -p $pid

kill $(ps -ef | grep "loop" | awk 'NR==3 { print $2 }')
