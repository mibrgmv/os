#!/bin/bash
grep -E -s -h -i -o '[a-z0-9.-]+@[a-z0-9.-]+\.[a-z.]+' /etc/* | tr '\n' ', ' > emails.lst
