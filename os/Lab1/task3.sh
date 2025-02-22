#!/bin/bash
echo -e "Options:\n1-run vim\n2-run nano\n3-exit"
read a

case $a in
  1)
    vi
    ;;
  2)
    nano
    ;;
  3)
    exit 1
    ;;
esac

