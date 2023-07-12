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


# read line < $1
echo "full_name,nationality,position,goals_overall" > $2

for goal in $goals; do
awk -F, -v goal="$goal" 'BEGIN{pos["Goalkeeper"]=1;pos["Defender"]=2;pos["Midfielder"]=3;pos["Forward"]=4} $16 == goal {print pos[$7]","$1","$12","$7","$16}' "$1" | sort -t, -k1 | uniq | cut -d ',' -f 2- >> "$2"
done 



