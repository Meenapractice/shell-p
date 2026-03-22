#!/bin/bash

USER_ID=$(id -u)
LOGS_FOLDER="var/log/shell-practice/"
LOGS_FILE="$LOGS_FOLDER/$0"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then
    echo -e "$R Please run the script with root user $N" | tee -a $LOGS_FILE
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo -e "$2 ... $R FAILURE $N" | tee -a $LOGS_FILE
       exit 1
    else
       echo -e "$2 .. $G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
  dnf list installed $package &>>$LOGS_FILE
   if [ $? -ne 0 ]; then
     echo -e "$package not installed... $G installing now $N" | tee -a $LOGS_FILE
     dnf install $package -y &>>$LOGS_FILE
     VALIDATE $? "$package installation"
   else
     echo -e "$package already installed $Y SKIPPING $N" | tee -a $LOGS_FILE
   fi
done