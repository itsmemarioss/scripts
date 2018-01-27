for (( i=0; i < 10; i++)); do
	let result=1
	for (( j=i; j>=1; j--)); do
		let result='result * j'
	done
	echo "Facorial of $i is $result";
done
