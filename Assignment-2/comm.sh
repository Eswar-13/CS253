#!/bin/bash

if [ $# -ne 3 ]; then
  echo "You should input 3 files"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo " File '$1' does not exist"
  exit 1
fi

if [ ! -f "$2" ]; then
  echo " File '$2' does not exist"
  exit 1
fi

arr1=()
arr2=()

# To make sure last line does not miss out
echo " " >> $1
echo " " >> $2

while IFS= read -r line ; 
do
if [[ "$line" =~ [^[:space:]] ]]; then
  arr1+=("$line")
fi
done < $1

while IFS= read -r line ; 
do   
if [[ "$line" =~ [^[:space:]] ]]; then
  arr2+=("$line")
fi
done < $2

for line1 in "${arr1[@]}"
do
    for line2 in "${arr2[@]}"; do
    if [[ "$line1" == "$line2" ]]; then
      echo "$line1"
    fi
  done
done > $3
