USER_ID=$(id -u)
LOGS_FOLDER="/var/log/shell-script/"
LOGS_FILE="$LOGS_FOLDER/$0"

if [ $USER_ID -ne 0 ]; then
   echo "Please run the script with root user"
   exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
       echo "$2... FAILURE"
       exit 1
    else
       echo "$2...SUCCESS"
    fi
}

dnf install nginx -y &>>LOGS_FILE
VALIDATE $? "Nginx installation"

dnf install mysql -y &>>LOGS_FILE
VALIDATE $? "Mysql installation"

dnf install nodejs -y &>>LOGS_FILE
VALIDATE $? "Nodejs installation"
