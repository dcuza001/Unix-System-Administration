#!/bin/bash

#dd: copies a file converting format of the data in the process
# copy contents from if to of
dd if=test1.txt of=test2.txt

#find: find files in directories
# find a specific text file in specific directory
find ./test1 -name "test1.txt"

#file: used to determine a file's type
#list all files of type .txt
find *.txt

#fuser: identifies processes using files or sockets
# display verbose info about every process using root directory
fuser -v /

#grep: tool for processing text line by line and prints any lines which match a specified pattern
# search /etc/passwd for dcuza001
grep dcuza001 /etc/passwd

#host: DNS lookup and reverse lookup
#lookup ip address
host 208.65.153.251

#ldd: prints shared libraries required by each program or shared library specified on the command line
# print shared library dependencies of /bin/bash
ldd /bin/bash

#lsof: lists info about open files on the system
# list all open files for user dcuza001
lsof -u dcuza001

#mount: mounts a storage device or filesystem
# displays all current mounts
mount

#ps: a snapshot of the status of currently running processes
# see every process running as root in user format
ps -U root -u root u

#pkill: sends a specified signal (default SIGTERM) to each process instead of listing them on standard output
# send SIGTERM to vi process
pkill vi

#netstat: used to print network connections, routing tables, interface statistcs, masquerade connections, and multicast memberships
# shows info about all active connections to the server
netstat -an

#renice: alter sthe priority of running processes
# increment priority +1 "nicer" of all processes owned by dcuza001
renice -u dcuza001

#rsync: fast, flexible file copying tool
# copy all .txt files into directory
rsync -t *.txt ./newtest

#time: reports how long it took for a command to execute
# calculates free disk space with df and reports time it took
time df

#ssh: program for logging into a remote machine and executing commands
# logs me into well
ssh -XY dcuza001@well.cs.ucr.edu

#stat: displays the detailed status of a particular file or a file system
# reports status of this script file
stat hw2.sh

#strace: debugging tool to troubleshoot issues
# trace the execution of ls
strace ls

#uname: prints certain system info
# print all system information
uname -a

#wget: command line utility which downloads files over a network
# download the youtube homepage
wget http://youtube.com/
 


















