#!/bin/bash

echo "*********************************************************"
echo "***************** 1 - Endevina l any ********************"
echo "*********************************************************"

#Quitamos la primera linea de los 2 ficheros
tail +2 $1 > Lactors
tail +2 $2 > Lactress

cat Lactors > Tactors
cat Lactress >> Tactors

#Generamos Película incógnita y las otras 2
Pel_inc=`sort -R Tactors | head -1 | cut -d, -f5`
Pel_rand1=`sort -R Tactors | head -1 | cut -d, -f5`
Pel_rand2=`sort -R Tactors | head -1 | cut -d, -f5`

while [ "$Pel_rand1" = "$Pel_inc" ] || [ "$Pel_rand2 = $Pel_inc" ] || [ "$Pel_rand1 = $Pel_rand2" ]
do
	if [ $Pel_rand1 = $Pel_inc ] ;
	then
		Pel_rand1=`sort -R Tactors | head -1 | cut -d, -f5`
	fi
	
	if [ $Pel_rand2 = $Pel_inc ] ;
	then
		Pel_rand2=`sort -R Tactors | head -1 | cut -d, -f5`
	fi
	
	if [ $Pel_rand1 = $Pel_rand2 ] ;
	then
		Pel_rand1=`sort -R Tactors | head -1 | cut -d, -f5`
	fi
done

echo $Pel_inc
echo $Pel_rand1
echo $Pel_rand2

rm Lactors Lactress Tactors
