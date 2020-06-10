#!/bin/bash

TO_PROCESS="[
<CONTRACT_METADATAS>
]"

arr="${TO_PROCESS:1:-1}"

SAVEIFS=$IFS   # Save current IFS
IFS=$'\n'      # Change IFS to new line
arr=($arr) # split to array $names
IFS=$SAVEIFS   # Restore IFS


for i in ${!arr[@]}; do
	element=${arr[i]}
	if [ $i != $(( ${#arr[@]} - 1 )) ]; then
		element=${element::-1}
	fi

  	echo $element > metadata-$i.json

  	curl -X POST "http://<SERVER_URL>/api/metadata" -H "accept: */*" -H "Content-Type: multipart/form-data" -F "file=@metadata-$i.json;type=application/json"
done
