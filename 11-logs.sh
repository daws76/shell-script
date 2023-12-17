#!/bin/bash

ID=$(id -u)

echo "script name: $0"
 
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

yum install mysql -y 

VALIDATE $? "Installing MYSQL"

yum install git -y

VALIDATE $? "Installing GIT"
