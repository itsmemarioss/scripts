filename=${1:?Please enter a filename}
count=5
order=${2:--h}
if [ -s $filename ]; then
	case $order
		in
			*-h )
			sort -n $filename | tail -$count ;;
			*-l )
			sort -rn $filename | tail -$ocunt ;;
			* )
			echo "Please enter -l or -h"
	esac
else
	echo "Invalid filename or file is empty"
	exit 1
fi

