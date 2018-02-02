#!/bin/bash

patern=$1:
for arg in "$@"
do
	if [[ $arg == -* ]]
	then
		if [ $arg = "-c" ]
		then
			patern="begin:"
			sed -i 1a$2: $3
			exit 0
		fi
	fi
done
file=$2
while read thing
do
	if [ "$thing" ]
	then
		if [ "$data" ]
		then
			data=$data'\n''\t''\t'$thing
		else
			data="--->"'\n''\t'"$thing":
		fi	
	else
		break
	fi
done
sed -i /$patern/a"$data" $file

