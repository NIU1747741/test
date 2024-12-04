#!/bin/bash

ACTORS=$1
ACTRIUS=$2

MostrarMenu () {
	clear
	echo -e "-------------------------------------------------- \n"
	echo -e " 3 - Com ets d'Expert \n "
	echo -e "-------------------------------------------------- \n"
	echo -e "1.	Endevina l'any"
	echo -e "2.	Qui va guanyar l'Oscar"
	echo -e "3.	Ordena cronològicament"
	echo -e "0.	Tornar al menú anterior"
	echo " "
}

mostrarOpcioNoValida() {
  clear
  echo "Opció NO VÀLIDA"
  sleep 2
  clear
}

#Bucle principal del menú
while true; do

MostrarMenu

read num

while true;
do
case $num in 
	1) 
		bash tasca3-1.sh $ACTORS $ACTRIUS;;
	2)
		bash Tasca3-2.sh $ACTORS $ACTRIUS;;
	3)
		bash tasca3-3.sh $ACTORS $ACTRIUS;;
	0)
		bash premis.sh $ACTORS $ACTRIUS;;
	*)
		mostrarOpcioNoValida;;
esac

done

echo ""
done
