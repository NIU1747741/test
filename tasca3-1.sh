#!/bin/bash

echo "*********************************************************"
echo "***************** 1 - Endevina l any ********************"
echo "*********************************************************"

#Quitamos la primera linea de los 2 ficheros
tail +2 $1 > Lactors
tail +2 $2 > Lactress

#Añadimos una etiqueta para saber si la linea es de hombres o mujeres y pasamos los ficheros a 1 solo
awk '{print "Actor," $0}' Lactors > Tactors
awk '{print "Actriz," $0}' Lactress >> Tactors

#Generamos Película incógnita y las otras 2 + los años y los actores (también la etiqueta)
linia_inc=`sort -R Tactors | head -1`
linia_rand1=`sort -R Tactors | head -1`
linia_rand2=`sort -R Tactors | head -1`

Pel_inc=`echo $linia_inc | cut -d, -f6`
any_inc=`echo $linia_inc | cut -d, -f3`
act_inc=`echo $linia_inc | cut -d, -f5`
eti_inc=`echo $linia_inc | cut -d, -f1`

Pel_rand1=`echo $linia_rand1 | cut -d, -f6`
any_rand1=`echo $linia_rand1 | cut -d, -f3`
act_rand1=`echo $linia_rand1 | cut -d, -f5`

Pel_rand2=`echo $linia_rand2 | cut -d, -f6`
any_rand2=`echo $linia_rand2 | cut -d, -f3`
act_rand2=`echo $linia_rand2 | cut -d, -f5`

while [ "$any_rand1" -eq "$any_inc" ] || [ "$any_rand2" -eq "$any_inc" ] || [ "$any_rand1" -eq "$any_rand2" ]
do
	if [ "$any_rand1" -eq "$any_inc" ] ;
	then
		linia_rand1=`sort -R Tactors | head -1`
		Pel_rand1=`echo $linia_rand1 | cut -d, -f5`
		any_rand1=`echo $linia_rand1 | cut -d, -f2`
		act_rand1=`echo $linia_rand1 | cut -d, -f4`
	fi
	
	if [ "$any_rand2" -eq "$any_inc" ] ;
	then
		linia_rand2=`sort -R Tactors | head -1`
		Pel_rand2=`echo $linia_rand2 | cut -d, -f5`
		any_rand2=`echo $linia_rand2 | cut -d, -f2`
		act_rand2=`echo $linia_rand2 | cut -d, -f4`
	fi
	
	if [ "$any_rand1" -eq "$any_rand2" ] ;
	then
		linia_rand1=`sort -R Tactors | head -1`
		Pel_rand1=`echo $linia_rand1 | cut -d, -f5`
		any_rand1=`echo $linia_rand1 | cut -d, -f2`
		act_rand1=`echo $linia_rand1 | cut -d, -f4`
	fi
done

#imprimimos pregunta y pedimos respuesta
if [ "$eti_inc" = "Actor" ] ;
then	
	echo ""
	echo "Quin any va guanyar l'Oscar a millor actor $act_inc en $any_inc?"
	echo ""

rm Lactors Lactress Tactors
