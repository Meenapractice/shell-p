USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Please run the script as root user"
   exit 1
fi

dnf install nginx
if [ $? -ne 0 ]; then
   echo "Nginx installation...FAILURE"
else
   echo "Nginx installation..SUCCESS"
fi