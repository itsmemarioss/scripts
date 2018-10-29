dir=${1:?Please enter a directory}
size=${2?Please enter the size in kilobytes}
timestamp=$(date +%Y%m%d-%H%M%S)

find $dir -type f -name "*.log" -size +${size}k -print | while read line; do
# [[ $(du -k data.log | awk '{print $1}') -gt 100 ]]; do
#	cp -p data.log data.log.$timestamp
#	> data.log
	cp -p $line ${line}.${timestamp}
	> $line
done
