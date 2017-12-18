#!/bin/bash
# $? last exit code
filename=${1:?Please enter the file name}
count=${2:-5} #if not typed by the user use 5 

if ls $filename > /dev/null 2>&1 && cat /etc/shadow 2>/dev/null; then
	sort -n $filename | tail -$count
else
	echo "Sorry, only root can do this"
	exit 1
fi
