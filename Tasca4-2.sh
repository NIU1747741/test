#!/bin/bash


#Guardem la primera linia del fitxer per utilitzarla més endavant però que no interfereixi en el codi al buscar anys
LInfo=`head -1 $1`

#Començem el bucle per trobar la linia amb l'any introduit
tail +2 $1 > Tact
cut -d, -f2 Tact > Tanys

trobat=false
i=1
Tany=`head -"$i" Tanys| tail -1`
anyMax=`tail -1 Tanys`

while [ "$trobat" = false ] && [ "$Tany" -ne "$anyMax" ];
do
	if [ "$Tany" -eq "$2" ];
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
	echo "********************************* PREM QUALSEVOL TECLA PER CONTINUAR **************************************"
	read -n 1 -s  #Esperar a que l'usuari premi una tecla per continuar
	exit
else
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

#Si s'ha confirmat l'eliminació, procedim a treure la linia del any del fitxer
if [ $resposta = "S" ]; then
	echo $LInfo > $1
	let i=i-1
	head -"$i" Tact >> $1
	let i=i+2
	tail +"$i" Tact >> $1
else
if [ $resposta = "N" ]; then
	echo "No es borrará la pel·lícula"
fi
fi

echo "********************************* PREM QUALSEVOL TECLA PER CONTINUAR **************************************"
read -n 1 -s  #Esperar a que l'usuari premi una tecla per continuar

rm Tanys Tact
