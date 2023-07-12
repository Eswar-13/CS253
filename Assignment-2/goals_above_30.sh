#!/bin/bash

if [ $# -ne 2 ]; then
  echo "You should input 2 files"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo " File '$1' does not exist"
  exit 1
fi

awk -F, '$2 > 30 && $16 >= 1' "$1" > "$2"

