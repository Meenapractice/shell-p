#!/bin/bash

count=1

# while [ $count -le 5 ]
# do
#   echo "Count is: $count"
#   ((count++))
# done

while IFS= read -r line
echo $line
do < ./21-script-1.sh