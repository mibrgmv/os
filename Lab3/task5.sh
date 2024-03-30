#!/bin/bash

mkfifo pipe
sh han.sh&sh gen.sh
rm pipe
