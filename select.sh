#!/bin/bash
PS3="Your choice? " #used by select 
select s in "Print loginid" "Change password" "Exit"; do
case $s in 
	*loginid )
		echo "Your login ID is " $(id -u)
		break ;;
	*password )
		passwd
		break ;;
	Exit )
		break ;;
	* )
		echo "Invalid selection"
	esac
done
