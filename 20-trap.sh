#!/bin/bash
set -e
trap 'echo "The error occured as $LINENO : $BASH_COMMAND"' ERR
USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0"

mkdir -p $LOGS_FOLDER

if [ $? -ne 0 ]; then
  echo "Please run the script with root access" 
  exit 1
fi

for package in $@
do 
  dnf install $package -y
done
