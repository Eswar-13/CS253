#!/bin/bash

if [ $# -ne 2 ]; then
  echo "You should input 2 files"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo " File '$1' does not exist"
  exit 1
fi

goals=$(awk -F, 'NR>1{print $16}' "$1" | sort -rn | uniq)

i=0

read line < $1
echo "$line" > $2

for goal in $goals; do
  if (($i < 10)); then
    awk -F, -v goal="$goal" '$16 == goal' "$1" >> "$2"
    i=$((i+1))
  fi
done



