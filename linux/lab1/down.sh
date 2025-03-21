#!/bin/bash

userdel -r u1 2>/dev/null
userdel -r u2 2>/dev/null

groupdel g1 2>/dev/null
groupdel test13grp 2>/dev/null

rm -rf /home/test13 /home/test14 /home/test15

rm -f work3.log
