#!/bin/bash

host=${1:?Please enter the hostmane}

until ssh $host; do
	echo "Machine not ready... retrying"
done
