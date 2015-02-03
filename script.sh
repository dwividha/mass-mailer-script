#!/bin/bash
echo 'mail script starting!';
myArray=($(cat mailinglist))
total=${#myArray[*]}
touch tempfile
for (( i=0; i<=$(( $total -1 )); i++ ))
do
	echo ${myArray[i]} > tempfile
	EMAILTRUE=`grep '@' tempfile`
	if [[ "$EMAILTRUE" > "" ]]; then
	echo "sending mail to email: ${myArray[i]} with name ${myArray[i-1]}";
    perl send_mail_uni.pl -n ${myArray[i-1]} -e ${myArray[i]} 
    fi
done
echo -n '';

 
