#!/bin/bash

ps -Ao pid,start --sort=start | tail -n 1 
