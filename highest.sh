filename=${1:?Please enter the file name}
count=${2:-5}

if [ $count -lt 0 ]; then
	echo "Pleas enter a valid count value"
fi

if [ -s $filename ]; then
	sort -n $filename | tail -$count 2>/dev/null
else
	echo "Please enter a valid,non empty filename"
	echo "Thanks"
	exit 1
fi

