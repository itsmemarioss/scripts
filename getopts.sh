 #getopts n:c myoption
#echo $myoption
#echo $OPTARG

while getopts ":hln:" opt; do
	case $opt in 
		h ) echo "Getting the highest rated" ;;
		l ) echo "Gettine the lowest rated" ;;
		n ) echo "Returning $OPTARG results only" ;;
		\? ) echo "Invalid option"
		exit 1
	esac
done
