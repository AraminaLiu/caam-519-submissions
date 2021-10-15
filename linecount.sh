#!/bin/bash
#define function
function linecount()
{
	path=$1 
        shopt -s globstar nullglob dotglob
	#if the path does not exist
        if [[ "$1" != "" ]];then
		#get all the existing directory
		directory=`ls -R $path | grep ":$"| sed "s/://g" `
		#start counting.
		cnt=0
		#visit every directory
		for subdir in $directory; do
			#use path/* to list all the files.
			files=`echo $subdir/*`
			#check whether this directory has files, if has
			#count the line
			if (( ${#files} ));then
				no=`cat $files|wc -l`				
				#for file in files;do
				#	cnt1=`wc -l < $file`
				#	no=$(($cnt1+$no))
				#done
			#else, only count as 0
			else
				no=0
			fi
			#sum it up
			cnt=$(($cnt+$no))
		done
	
		printf "this directory has %s lines" "$cnt"

	else
		echo 0
	fi
}
#call the function
linecount $1


