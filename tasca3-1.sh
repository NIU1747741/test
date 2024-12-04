#!/bin/bash

echo "*******************************************************************************"
echo "**************************** 1 - Endevina l any *******************************"
echo "*******************************************************************************"

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
		Pel_rand1=`echo $linia_rand1 | cut -d, -f6`
		any_rand1=`echo $linia_rand1 | cut -d, -f3`
		act_rand1=`echo $linia_rand1 | cut -d, -f5`
	fi
	
	if [ "$any_rand2" -eq "$any_inc" ] ;
	then
		linia_rand2=`sort -R Tactors | head -1`
		Pel_rand2=`echo $linia_rand2 | cut -d, -f6`
		any_rand2=`echo $linia_rand2 | cut -d, -f3`
		act_rand2=`echo $linia_rand2 | cut -d, -f5`
	fi
	
	if [ "$any_rand1" -eq "$any_rand2" ] ;
	then
		linia_rand1=`sort -R Tactors | head -1`
		Pel_rand1=`echo $linia_rand1 | cut -d, -f6`
		any_rand1=`echo $linia_rand1 | cut -d, -f3`
		act_rand1=`echo $linia_rand1 | cut -d, -f5`
	fi
done

#imprimimos pregunta y pedimos respuesta, pregunta cambia dependiendo de si es actor o actriz
if [ "$eti_inc" = "Actor" ] ;
then	
	echo ""
	echo "Quin any va guanyar l'Oscar a millor actor $act_inc amb la Pel·lícula $Pel_inc?"
	echo ""
else
	echo ""
	echo "Quin any va guanyar l'Oscar a millor actriu $act_inc amb la Pel·lícula $Pel_inc?"
	echo ""
fi

echo $any_inc > tmpA
echo $any_rand1 >> tmpA
echo $any_rand2 >> tmpA

echo "Opcions:"

sort -n tmpA

echo ""

read resposta

if [ "$resposta" -eq "$any_inc" ] ;
then
	echo "Felicitats! Has acertat!"
else
	echo "Quina pena! No has acertat. "
	echo "La resposta correcta era $any_inc"
fi

echo "************************* PRESIONA UNA TECLA PER CONTINUAR ************************"
read -n 1 -s  #Esperar a que el usuario pulse una tecla para continuar
rm Lactors Lactress Tactors tmpA
