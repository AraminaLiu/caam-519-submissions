#!/bin/bash
function Poetry_table()
{
	if [ $1=="-h" ]; then
		printf "Poetry.sh program generates a table that contains student ID,student's favorite poem and its first 7 characters."
		exit 1
		
	else
		
		#make a temporary file
		res_file=$(mktemp)
		params=2
		sep='      '
		#replace the files 10th line, 16th line and 44's line by NA"
		#sed -i -e '10s/^/Poem:NA /' -e '16s/^/Poem:NA /' -e '44s/^/Poem:NA/' $1
		#eliminate all the empty lines and assign it to result.
		result=`awk "NF" $1`
		#make table's title
		echo -n "student_ID           Favorite_Poem                   First_7_Chars_of_poem  " >> $res_file
		#printf "%-4s %4s %20s\n" student_ID Favorite_Poen First_7_Chars_of_poem >>$res_file
		sed "s/\n/$sep/g">>$res_file
		#make a new empty line to seperate the content and
		echo "   " >>$res_file
		#transform each line into the array elements
		IFS=$'\n' lines=($result)
		#use for loop to pick up student ID, poems and 7 characters
		for i in {0..24};do
			if [ $(($i%2)) -eq 0 ];then
				#add it and also begin at a new line
				printf "${lines[$i]}">>$res_file
			else
				if [ "${line[$i]}" == "Poem:NA" ];then
					#pick NA's case.
					echo -n -e "\t\t\t\t\t\tNA\t\t\t\t\t\t\t\t\t\t\t\tNA"  >> $res_file
				else
					#add poem and the selected characters into res_file
					echo -n -e "\t\t${lines[$i]:5}\t\t\t${lines[$i]:5:8}\n">>$res_file
					#echo -n -e "   " >> $res_file
					#echo -n -e "${lines[$i]:5:8}\n" >>$res_file

				fi
			fi
		done
		#show table and remove res_file
		poetry_table=`cat $res_file| column`
		printf "%-50s" "$poetry_table"
		rm -f $res_file
	fi
}
Poetry_table $1


	
	
	

















