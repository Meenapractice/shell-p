#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-p/"
LOGS_FILE="$LOGS_FOLDER/$(basename $0).log"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

mkdir -p $LOGS_FOLDER

log(){

    echo -e "$(date "+%Y-%m-%d %H-%M-%S") | $1 | tee -a $LOGS_FILE"
}

if [ $USERID -ne 0 ]; then
   echo "Please riun with root access" | tee -a $LOGS_FILE
   exit 1
fi

USAGE(){

   echo "Usage: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>"
   exit 1

}

if [ $# -lt 2 ]; then
  USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
   echo "$SOURCE_DIR not exists" | tee -a $LOGS_FILE
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo "$DEST_DIR not exists" | tee -a $LOGS_FILE
   exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

echo $FILES

