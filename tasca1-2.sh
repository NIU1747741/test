#!/bin/bash

echo "**********************************************************************************"
echo -e "******************* 	LLISTAT ALFABETIC DE PEL·LICULES. 	************** \n"

echo -e "*****	 LLISTAT OSCARS A MILLOR ACTOR: \n"
i=1

tail +2 $1 > temp1
cut -d, -f2-5 temp1 > temp2
sort -t, -k4 temp2 > temp3

lin=`cat temp3 | wc -l`

while [ $i -le $lin ]
do
	pel=`head -$i temp3 | tail -1 | cut -d, -f4`
	nom=`head -$i temp3 | tail -1 | cut -d, -f3`
	edat=`head -$i temp3 | tail -1 | cut -d, -f2`
	any=`head -$i temp3 | tail -1 | cut -d, -f1`
	
echo "$pel, guanyador $nom a $any amb $edat anys"

let i=i+1
done

rm temp1 temp2 temp3

echo ""
