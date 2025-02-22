#!/bin/bash

ps -u root | wc -l > 1.txt
ps -u root -o pid,cmd >> 1.txt
