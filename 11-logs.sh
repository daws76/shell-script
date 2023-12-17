#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

echo "script name: $0"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
     if [ $1 -ne 0 ]
     then
       echo "Error $2 ... Failed"
    else 
       echo "$2 ... Success"
    fi   
}

if [ $ID -ne 0 ]
then 
  echo "Error please run with root user"
else  
  echo "You are root user"
fi 

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"
