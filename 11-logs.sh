#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script name: $0"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
     if [ $1 -ne 0 ]
     then
       echo -e "Error $2 ... $R Failed $N"
       exit 1
    else 
       echo "$2 ... $G Success $N"
    fi   
}

if [ $ID -ne 0 ]
then 
  echo -e "$R Error please run with root user $N"
  exit 1
else  
  echo "You are root user"
fi 

yum install mysql -y &>> $LOGFILE

VALIDATE $? "Installing MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "Installing GIT"
