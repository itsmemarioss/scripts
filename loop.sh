IFS=$'\n' #consider a new line
for user in $(cat /etc/passwd); do 
	username=$(echo $user | cut -d : -f 1)
	home=$(echo $user | cut -d : -f 7)
	echo "Username:" $username "Home directory:" $home
done

count=5
# $@ i will iterate over arguments passed to the script
for f in "$@"; do
	if ! [ -s $f ]; then
		echo "$f is an invalid file or is empty"
		exit 1
	fi
done
container=$(cat "$@")
echo "$container" | sort -n | tail -$count
