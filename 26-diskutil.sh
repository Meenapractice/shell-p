#!/bin/bash

Message=""
USAGE_THRESHOLD=3

DISK_USAGE=$(df -ht | grep -v Filesystem)

while IFS= read -r line
do
 USAGE=$(echo $line | awk  '{print$6}' | cut -d "%" -f1)
 PARTITION=$(echo $line | awk  '{print$7}')
   if [ "$USAGE" -gt "$USAGE_THRESHOLD" ]; then
         MESSAGE+="High Disk usage on $PARTITION: $USAGE% <br>"
    fi
done <<< $DISK_USAGE

echo -e "$MESSAGE"


