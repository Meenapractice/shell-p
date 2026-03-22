#!/bin/bash

LOGS_FOLDER=/home/ec2-user/repos/app-logs/
LOGS_FILE="$LOGS_FOLDER/$(basename $0).log"

if [ ! -d $LOGS_FOLDER ]; then
    echo "Folder doesnot exist"
    exit 1
fi

FILES_TO_DELETE=$(find $LOGS_FOLDER -name "*.log" -mtime +14)       

echo $FILES_TO_DELETE

while IFS= read -r filepath
do
 echo "Deleting the file $filepath"
 rm -f $filepath
 echo "Delete $filepath"
 done <<< $FILES_TO_DELETE
