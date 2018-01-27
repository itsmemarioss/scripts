logfile=events.log
function logterm {
	echo $(date) "Process was killed using the TERM signal" >> $logfile
	exit 1
}

trap "logterm" TERM

while true; do 
	echo $(date) some data >> $logfile
	sleep 5
done
