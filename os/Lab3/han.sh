#!/bin/bash

command="+"
echo "HANDLER +"
result=1
tail -f pipe |
while true;
do
    read line
    case $line in
	"+")
	    command="$line"
	    echo "HANDLER +"
	;;
	"*")
	    command="$line"
	    echo "HANDLER *"
	;;
	"QUIT")
	    killall tail
	    echo "HANDLER q"
	    exit 0
	;;
	[0-9])
	    case $command in
	    "+")
	        result=$(($result + $line))
		echo $result
	        ;;
	    "*")
		result=$(($result * $line))
		echo $result
	        ;;
	    esac
	;;
	*)
	    killall tail
	    echo "HANDLER ERROR"
	    exit 1
	;;
    esac
done
