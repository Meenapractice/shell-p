#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Please run the script with root access"
   exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "$2.... FAILURE"
      exit 1
    else
      echo "$2...SUCCESS"
    fi
}

dnf install nginx -y
VALIDATE $? "Nginx installation"

dnf install mysql -y
VALIDATE $? "Mysql installation"

dnf install nodejs -y
VALIDATE $? "Nodejs installation"