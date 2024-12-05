#!/bin/bash

echo "******************************************************************************************"
echo "******************************* 4-2 DONAR DE BAIXA ***************************************"
echo " "

#Preguntem si vol eliminar una pel·lícula de actors o de actrius i Passem els anys dels documents a fitxers temporals per poder-los identificar
echo "Escull de quin fitxer vols borrar una pel·lícula"
echo "(1) Actors"
echo "(2) Dones"
echo ""
read opcio
case $opcio in 
	1)
	

#Demanem l'any a eliminar
echo "Introdueix l'any de la pel·lícula a eliminar"
read any


cut -d, -f2 $1 > TanysM
cut -d, -f2 $2 > TanysF

i=1
Tany=`head -1 | tail -1 | 
while [ "$any" -ne "" ]
if [


rm TanysM TanysF
