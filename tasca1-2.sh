#!/bin/bash

echo "**********************************************************************************"
echo -e "******************* 	LLISTAT ALFABETIC DE PEL·LICULES. 	************** \n"

echo -e "*****	 LLISTAT OSCARS A MILLOR ACTOR: \n"
tail +2 $1 > temp1
cut -d, -f2-5 temp1 > temp2
sort -t, -k4 temp2 > temp3
cat temp3

rm temp1 temp2 temp3

echo ""

echo -e "*****	 LLISTAT OSCARS A MILLOR ACTRIU: \n"
tail +2 $2 > temp1
cut -d, -f2-5 temp1 > temp2
sort -t, -k4 temp2 > temp3
cat temp3

rm temp1 temp2 temp3

echo -e "\n ************************** PREMI UNA TECLA PER CONTINUAR *************************"
