#!/bin/bash

#A partir d'aqui els anys son $3 y $4
echo "**********************************************************************************************************************************"
echo "****************************************** Qui va guanyar durant els anys $3 a $4 ? ******************************************"
echo ""

tail +2 BestActor.csv | cut -d, -f2-5 > Tactors
tail +2 BestActress.csv | cut -d, -f2-5 > Tactress

for i in $(seq $2 $3) ;
do
	grep $i Tactors > tmp1
	grep $i Tactress > tmp2
	Act_m=`cut -d"," -f3 tmp1`
	Pel_m=`cut -d, -f4 tmp1`
	Edat_m=`cut -d, -f2 tmp1`
	Act_f=`cut -d, -f3 tmp2`
	Pel_f=`cut -d, -f4 tmp2`
	Edat_f=`cut -d, -f2 tmp2`
	
	if [ $i -lt 1929 ] || [ $i -gt 2016 ];
	then 
		echo "ANY NO TROBAT AL CATÀLEG"
		continue
	fi
	
	if [ -n "$Act_m" ] && [ -n "$Act_f" ];
	then
	echo "$i, El premi al millor actor va ser$Act_m amb$Edat_m anys per$Pel_m i el premi a la millor actriu$Act_f amb$Edat_f anys per$Pel_f"
	elif [ -z "$Act_m" ] && [ -n "$Act_f" ];
	then 
	echo "Al $i, El premi a la millor actriu va ser$Act_f amb$Edat_f anys per$Pel_f"
	elif [ -n "$Act_m" ] && [ -z "$Act_f" ];
	then
	echo "Al $i, El premi al millor actor va ser$Act_m amb$Edat_m anys per$Pel_m"
	else
	echo "ANY NO TROBAT AL CATÀLEG"
	fi
done

echo "********************************************** PREMI UNA TECLA PER CONTINUAR **********************************************"

rm Tactors Tactress tmp1 tmp2

echo " "
echo "Selecciona una opció: "
echo "1. Tornar a buscar "
echo "2. Tornar al menu anterior"
read seleccio

if [ $seleccio -eq 2 ];
then
clear
bash Opcio-2.sh
fi

if [ $seleccio -eq 1 ];
then
clear
clear
		echo "Introdueix un any d'inici i un de final:  "

		read anyI anyF

		while [ "$anyI" -gt "$anyF" ]
		do

		if [ "$anyI" -gt "$anyF" ] ;
		then
		echo "error: Introdueix any inicial igual o més petit a any final"
		echo "Introdueix un any d'inici i un de final: "
		read anyI anyF
		fi
	
		done

		
		        bash tasca2-1.sh "$BD_ACTORS" "$BD_ACTRIUS" "$anyI" "$anyF"
fi