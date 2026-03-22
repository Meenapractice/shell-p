#!/bin/bash

set -e

USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
   echo -e "$R Please run the script with root user $N" | tee -a $LOGS_FILE
   exit 1
fi

for package in $@
do
   dnf list installed $package &>>$LOGS_FILE
 if [ $? -ne 0 ]; then
   echo "$package not installed"
   dnf install $package -y &>>$LOGS_FILE
else
  echo "$package installed ... SKIPPING"
fi
done
