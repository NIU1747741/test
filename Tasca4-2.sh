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

#Començem el bucle per trobar la linia amb l'any introduit
trobat=false
i=1
Tany=`head -"$i" Tanys| tail -1`
anyMax=`tail -1 Tanys`

while [ "$trobat" = false ] && [ "$Tany" -ne "$anyMax" ];
do
	if [ "$Tany" -eq "$any" ];
	then
	trobat=true
	else
	let i=i+1
	Tany=`head -"$i" Tanys| tail -1`
	fi
done

#Una vegada acabat el bucle, comprobem si s'ha trobat la linea y demanem confirmació per eliminarla si s'ha trobat (bucle while per assegurar resposta es S o N)
if [ "$trobat" = false ];
then
echo "Any no trobat. No s'ha pogut eliminar la pel·lícula."
else
head -1 $1 | tail -1
head -$i Tact | tail -1
echo "Estas realment segur/a de que vols borrar aquesta pel·lícula? (S/N)"
read resposta
while [ $resposta != "S" ] && [ $resposta != "N" ]
do
echo "Error: Introdueix S (Sí) o N (No)"
echo "Estas realment segur/a de que vols borrar aquesta pel·lícula? (S/N)"
read resposta
done
fi

#Si s'ha confirmat l'eliminació, procedim a treure la linia del any del fitxer (Si es del fitxer actors o actrius dependrà de l'opcio del principi del codi)
if [ $resposta = "S" ] && [ $opcio -eq 1 ];
then
let i=i-1
head -"$i" Tact > tmp11
let i=i+2
tail +"$i" Tact >> tmp11
else
if [ $resposta = "S" ] && [ $opcio -eq 2 ];
then
let i=i-1
head -"$i" Tact > tmp12
let i=i+2
tail +"$i" Tact >> tmp12
else
if [ $resposta = "N" ]
then
echo "No es borrará la pel·lícula"
fi
fi
fi

echo "********************************* PREM QUALSEVOL TECLA PER CONTINUAR **************************************"

rm Tanys Tact
