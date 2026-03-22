#!/bin/bash

USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0"

if [ $USER_ID -ne 0 ]; then
  echo "Please run the script with root user" | tee -a $LOGS_FILE
  exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "$2 ...FAILURE" | tee -a $LOGS_FILE
      exit 1
    else
      echo "$2 ...SUCCESS" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
   dnf list installed $package &>>$LOGS_FILE
if [ $? -ne 0 ]; then
   echo "$package not installed...installing now"
   dnf install $package -y &>>$LOGS_FILE
   VALIDATE $? "$package installing"
else
   echo "$package already installed...SKIPPING"
fi
done