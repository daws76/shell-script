#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File')
DISK_THRESHOLD=1
message=""

while IFS= read line
do 
   usage=$(echo $line | awk '{print $6F}'| cut -d % -f1)
   partition=$(echo $line | awk '{print $1F}')
   if [ $usage -ge $DISK_THRESHOLD ]
   then 
      message+="High Disk Usage on  $partition: $usage <br>"
   fi
done <<< $DISK_USAGE

echo -e "message $message"

#echo "$message" | mail -s "message" chandra090985@gmail.com 

sh mail.sh "Devops Team" "High Disk Usage" "$message" "schandradba9@gmail.com" "Alert High Disk Usage"