#!/bin/bash

echo "******************************************************************************************"
echo "******************************* 4-2 DONAR DE BAIXA ***************************************"
echo " "


#Preguntem si vol eliminar una pel·lícula de actors o de actrius i Passem els anys dels documents a fitxers temporals per poder-los identificar
echo "Escull de quin fitxer vols borrar una pel·lícula"
echo "(1) Actors"
echo "(2) Actrius"
echo ""
read opcio
while [ $opcio -ne 1 ] || [ $opcio -ne 2 ];
do
case $opcio in 
	1) echo "Has escollit Actors"
	tail +2 $1 > Tact
	cut -d, -f2 Tact > Tanys
	break
	;;
	2) echo "Has escollit Actrius"
	tail +2 $2 > Tact
	cut -d, -f2 Tact > Tanys
	break
	;;
	*) echo "Error:Introdueix 1 o 2"
	echo "Escull de quin fitxer vols borrar una pel·lícula"
	echo "(1) Actors"
	echo "(2) Actrius"
	echo ""
	read opcio
	clear
	;;
esac
done

#Demanem l'any a eliminar
echo "Introdueix l'any de la pel·lícula a eliminar"
read any

trobat=false
i=1
Tany=`head -"$i" Tanys| tail -1`
anyMax=`tail -1 Tanys`

while [ "$trobat" = false ] && [ "$Tany" -ne "$anyMax" ];
do
	if [ "$Tany" -eq "$anys" ];
	then
	trobat=true
	else
	i=i+1
	fi
done

if [ "$trobat" = false ];
then
echo "Any no trobat"
else
head -"$i" 

rm Tanys
