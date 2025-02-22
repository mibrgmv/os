#!/bin/bash
bash --help | grep -o "[A-Za-z]\{4,\}" | sort | uniq -c | sort -nr | head -n3
