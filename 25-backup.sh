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

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

echo $FILES

log "Backup started"
log "SOurce file exists"
log "Destination file exists"

if [ -z "$FILES" ]; then
 echo "No files to archive"
else
  echo "Files found for archieving"
  TIMESTAMP=$(date +%F-%H-%M-%S)
  ZIP_FILE_NAMES="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
  echo "Archiving $ZIP_FILE_NAMES"
  tar -zcvf $ZIP_FILE_NAMES $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

    if [ -f "$ZIP_FILE_NAMES" ]; then
      echo "Archive is SUCCESS"
       while IFS= read -r filepath; do
        # Process each line here
        log "Deleting file: $filepath"
        rm -f $filepath
        log "Deleted file: $filepath"
        done <<< $FILES
    else
        log "Archeival is ... $R FAILURE $N"
        exit 1
    fi
fi