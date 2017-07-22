#!/bin/bash

echo 'find all in that are setuid and owned by root'
read -p "hit any key"
find /bin /sbin /usr/bin -user root -perm 4000

echo 'number 2'
read -p "hit key"
find /var -cmin -20

echo 'number 3'
read -p "hit key"
find /var -type f -size 0

echo 'number 4'
read -p "hit key"
find /dev -not -type f -and -not -type d -ls

echo 'number 5'
read -p "hit key"
find /home -type d -not -user root -exec chmod 711 {} \;

echo 'number 6'
read -p "hit key"
find /home -type f -not -user root -exec chmod 755 {} \;

echo 'number 7'
read -p "hit key"
find /etc -ctime -5 


