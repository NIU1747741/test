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
Pel_inc=`sort -R Tactors | head -n 1 | cut -d, -f4-5`
Pel_rand1=`sort -R Tactors | head -n 1 | cut -d, -f4-5`
Pel_rand2=`sort -R Tactors | head -n 1 | cut -d, -f4-5`

rm Lactors Lactress Tactors
