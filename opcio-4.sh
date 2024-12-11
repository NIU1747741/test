#!/bin/bash

ACTORS=$1
ACTRIUS=$2

MostrarMenu () {
	clear
	echo -e "-------------------------------------------------- \n"
	echo -e " 4 - Gestió del catàleg. \n "
	echo -e "-------------------------------------------------- \n"
	echo -e "1.	Donar d'alta"
	echo -e "2.	Donar de baixa"
	echo -e "3.	Fer una modificació"
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
			echo "Introdueix el nom del fitxer, any, titol, nom, i edat"
			read -p "Nom del fitxer: " ACTORS
			read -p "Any: " any
			read -p "Títol: " titol
			read -p "Nom: " nom
			read -p "Edat: " edat
			bash tasca4-1.sh $ACTORS $any $titol $nom $edat
			;;
		2)	
			clear
			echo "******************************************************************************************"
			echo "******************************* 4-2 DONAR DE BAIXA ***************************************"
			echo " "
			#Pedim el fitxer del que es vol borrar la pel·lícula per poder iniciar el script amb els arguments adequats
			echo "Escull de quin fitxer vols borrar una pel·lícula"
			echo "(1) Actors"
			echo "(2) Actrius"
			echo ""
			read opcio2
			if [ $opcio2 -eq 1 ]; then
				echo "Has escollit Actors"
				echo "Introdueix l'any de la pel·lícula que vols borrar"
				read any
				bash Tasca4-2.sh $ACTORS $any
			else
			if [ $opcio2 -eq 2 ]; then 
				echo "Has escollit Actrius"
				echo "Introdueix l'any de la pel·lícula que vols borrar"
				read any
				bash Tasca4-2.sh $ACTRIUS $any
			else
				echo "Valor incorrecte(Ha de ser 1 o 2)"
				sleep 1
				break
			fi
			fi
			;;
		3)
			clear
			echo "******************************************************************************************"
			echo "******************************* 4-3 MODIFICAR ***************************************"
			echo " "
			echo "Escull de quin fitxer vols fer la modificació"
			echo "(1) Actors"
			echo "(2) Actrius"
			echo ""
			read opcio3
			if [ $opcio3 -eq 1 ]; then
				selected_file=$ACTORS
			elif [ $opcio3 -eq 2 ]; then
				selected_file=$ACTRIUS
			else
				echo "Valor incorrecte (Ha de ser 1 o 2)"
				sleep 1
				continue
			fi

			read -p "Any: " any
			read -p "Títol (o = per mantenir): " titol
			read -p "Nom (o = per mantenir): " nom
			read -p "Edat (o = per mantenir): " edat
			bash tasca4-3.sh $selected_file $any "$titol" "$nom" "$edat"
			;;
		0)
			exit
			;;
		*)
			mostrarOpcioNoValida;;
	esac
done

