IFS=$'\n'
protocol=${1:?Please enter the protocol number}
for line in $(cat /etc/services | grep -v '^#' | head -n +1024); do
	number=$(echo $line | awk '{print $2}')
	value=$(echo $line | awk '{print $1}')
	protocols[${number%/*}]=$value
done
echo ${protocols[$protocol]}
