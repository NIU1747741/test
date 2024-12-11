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
			# Preguntar si se quiere modificar actor o actriz
			echo "¿Quieres modificar un actor o una actriu? (actor/actriu)"
			read tipo

			if [[ "$tipo" == "actor" ]]; then
				selected_file="$actor_file"
			elif [[ "$tipo" == "actriu" ]]; then
				selected_file="$actress_file"
			else
				echo "Error: Opción no válida. Debes escribir 'actor' o 'actriu'."
				esperarPulsarTecla
				exit 1
			fi
			read -p "Any: " any
			read -p "Títol: " titol
			read -p "Nom: " nom
			read -p "Edat: " edat
			bash tasca4-3.sh $selected_file $any $titol $nom $edat
			;;
		0)
			exit
			;;
		*)
			mostrarOpcioNoValida;;
	esac
done

