#!/bin/bash
if [[ $PWD =~ /home/* ]]; then
  echo /home/*
  exit 0
else
  echo "Error Message"
  exit 1
fi
