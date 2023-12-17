#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
  echo "Error: please run this script with root user"
  exit 1
else 
   echo "your are a root user"
fi

yum install mysql -y 

if [ $? -ne 0 ]
then 
   echo "Error: Installing mysql failed"
   exit 1
else 
   echo "Installing Mysql is success"
fi

yum install git -y

if [ $? -ne 0 ]
then
   echo "Error Installing Git failed"
   exit 1
else 
   echo "Installing Git is success"
fi

