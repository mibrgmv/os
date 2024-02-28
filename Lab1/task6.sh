#!/bin/bash
grep -E "WARNING|INFO" /var/log/anaconda/syslog | sed -e 's/WARNING/Warning:/g' -e 's/INFO/Information:/g' > full.log
