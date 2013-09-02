#!/bin/bash
#
# Author: Pierre Edouard .
#
# Description: 
# A short program to quickly install what I need on Ubuntu
#

# List of all programs I usually have, uncomment the ones you don't need
progs=(
#	macchanger									# MAC address changer 
#	macchanger-gtk							# MAC address changer 
#	pgp													# PGP (Pretty Good Privacy) signatures program 
#	enigmail										# GPG extension for thunderbird 
	mysql-server
	apache2
	phpmyadmin
	libapache2-mod-auth-mysql
	python-mysqldb

)

DEFAULT="[0;39m"
GREEN="[0;32m"
RED="[0;31m"

# Get length of array
let number_of_progs=${#progs[@]}-1;


# Make one long list out of it
all_progs=""
echo "The program will install the following:${GREEN}"
for i in `seq 0 ${number_of_progs}`; do 
	echo "	${progs[$i]}"
	all_progs=" $all_progs ${progs[$i]}";
done

# Make sure User know which programs they are installing and confirm 
echo "${RED}Is the correct list above correct? [y/n]${DEFAULT}"
read CORRECT
while [[ "$CORRECT" != "y" && "$CORRECT" != "n" ]]
do
	echo "Please enter y or n, is the list above correct?"
	read CORRECT
done
if [ "$CORRECT" = "n" ]; then
	echo "Ok, Aborting install. Modify install script to suit your needs and try again"
	exit 1
fi

# Finally, install the programs
sudo apt-get install $all_progs
