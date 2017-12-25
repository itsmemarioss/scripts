IFS=$'\n' #consider a new line
for user in $(cat /etc/passwd); do 
	username=$(echo $user | cut -d : -f 1)
	home=$(echo $user | cut -d : -f 7)
	echo "Username:" $username "Home directory:" $home
done

# $@ i will iterate over arguments passed to the script
for i; do
	echo $i
done
