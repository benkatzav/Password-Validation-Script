#!/bin/bash

# reading password
password=$1

while getopts 'f' option
	do
		case $option in
			f)
			myfile=$2
			password=`cat ${myfile}`;;
		esac
	done

# color code variables
red='\033[0;31m'          # Red
green='\033[0;32m'        # Green

# validation bit while equals to 1 means that the password still meets the requirements through the checks
validation_bit=1

# checks if password contains at least 10 characters
if ! [ ${#password} -gt 9 ];
then
	validation_bit=0
	echo -e "${red}Password must contain at least 10 characters"
fi

# checks if password contains uppercase letters
if ! [[ $password =~ [A-Z] ]];
then
	validation_bit=0
	echo -e "${red}Password must contain a minimum of 1 upper case letter"
fi

# checks if password contains lowercase letters
if ! [[ $password =~ [a-z] ]];
then
	validation_bit=0
	echo -e "${red}Password must contain a minimum of 1 lower case letter"
fi

# checks if password also contains numeric characters
if ! [[ $password =~ [0-9] ]];
then
	validation_bit=0
	echo -e "${red}Password must contain a minimum of 1 numeric character"
fi

# checks if the password met all of the requirements and prints an output accordingly
if [ $validation_bit == 1 ];
then
	echo -e "${green}Password Valid"
	exit 0
fi

# else if the password is NOT valid the program will end up reaching the next line with exit code 1
exit 1
