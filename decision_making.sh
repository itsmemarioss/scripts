#!/bin/bash
# $? last exit code
filename=${1:?Please enter the file name}
count=${2:-5} #if not typed by the user use 5 

#file exists and is not empty
if [ -s $filename ]; then
	sort -n $filename | tail -$count
else
	echo "Please, enter a valid and non empty file"
	exit 1
fi

# -n String is not null
# -z string is null or empty
# [ "test" = "test" ] && echo "correct"
# [[ "test" < "uest" ]] && echo "correct"
# ![ -z "hello" ] && echo "correct"
