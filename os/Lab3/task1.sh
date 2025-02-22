#!/bin/bash

d=$(date '+%Y-%m-%d_%H:%M:%S')

mkdir ~/test && { echo "catalog was created successfully" > ~/report ; touch ~/test/$d ; }
ping net_nikogo.ru || echo "$d ERROR MESSAGE" >> ~/report
