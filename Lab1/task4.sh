#!/bin/bash
if [[ $PWD =~ $HOME/* ]]; then
  echo $HOME/*
  exit 0
else
  echo "Error Message"
  exit 1
fi
