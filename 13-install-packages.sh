#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then 
  echo -e "$R Error please run with root user $N"
  exit 1
else
  echo "you are root user"
fi

echo "All alrguments passed: $@"


    