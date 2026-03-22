#!/bin/bash

count=1

# while [ $count -le 5 ]
# do
#   echo "Count is: $count"
#   ((count++))
# done

while IFS= read -r line
do
echo $line
done < './21-script-1.sh'