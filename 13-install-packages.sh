#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE 

VALIDATE()
{
  if [ $1 -ne 0 ]
  then 
    echo -e "$2 .. $R Failed $N"
  else 
    echo -e "$2 .. $G Success $N"  
   fi    
} 

if [ $ID -ne 0 ]
then 
  echo -e "$R Error please run with root user $N"
  exit 1
else
  echo "you are root user"
fi

#echo "All alrguments passed: $@"
# git mysql postfix 

for package in $@
do 
  yum list installed $package &>> $LOGFILE #pre checking 
  if [ $? -ne 0 ]
  then 
    yum installed $package -y &>> $LOGFILE
    VALIDATE $? "Installation of $package" # validate 
  else 
    echo -e "$package is already installed ... $Y SKIPPING $N"  &>> $LOGFILE  
  fi 
done  


    