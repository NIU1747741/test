#!/bin/bash

ACTORS=$1
ACTRIUS=$2

MostrarMenu () {
	clear
	echo -e "-------------------------------------------------- \n"
	echo -e " 4 - Gestió del catàleg. \n "
	echo -e "-------------------------------------------------- \n"
	echo -e "4-1.	Donar d'alta"
	echo -e "4-2.	Donar de baixa"
	echo -e "4-3.	Fer una modificació"
	echo -e "0.	Tornar al menú anterior"
	echo -e "\nSeleccioneu una opció: "
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
	
	case $num in 
		1) 
			clear
			bash tasca4-1.sh $ACTORS $ACTRIUS
			;;
		2)	
			clear
			bash tasca4-2.sh $ACTORS $ACTRIUS
			;;
		3)
			clear
			bash tasca4-3.sh $ACTORS $ACTRIUS
			;;
		0)
			exit
			;;
		*)
			mostrarOpcioNoValida;;
	esac
done

