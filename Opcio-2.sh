#!/bin/bash

# Almacena los nombres de los archivos CSV
BD_ACTORS="$1"
BD_ACTRIUS="$2"

mostrarMenu() {
	clear
	echo -e "\n---------------------------------------------------------\n"
	echo -e "2 - Cerca al catàleg"
	echo -e "\n---------------------------------------------------------\n"
	echo -e "1. Qui va guanyar durant els anys ...?"
	echo -e "2. Qui va guanyar amb la pel·lícula ...?"
	echo -e "3. Pel·lícules guanyades per ...?"
	echo -e "0. Tornar al menú anterior."
  echo -e "\nSeleccioneu una opció: "
}

# Función para manejar opciones no válidas
mostrarOpcioNoValida() {
  clear
  echo "Opció NO VÀLIDA"
  sleep 2
  clear
}

# Bucle principal del menú
local intro=""
local txt=""

while true; do
	mostrarMenu
	read intro

	case $intro in
		1)
		echo "Introdueix dos anys"
		read any1
		read any2
		
		        bash tasca2-1.sh "$BD_ACTORS" "$BD_ACTRIUS" "$any1" "$any"
			;;
		2)
		echo "Introdueix el nom de la pel·lícula"
		read nom
		
			bash Tasca2-2.sh "$BD_ACTORS" "$BD_ACTRIUS" "$nom"
			;;
		3)
			clear
			echo -e "\nIntroduïu el nom de la persona per cercar: "
			read txt
			bash tasca2-3.sh "$BD_ACTORS" "$BD_ACTRIUS" "$txt"
			;;
		0)
			exit
			;;
		*)
			mostrarOpcioNoValida
			;;
	esac
done

echo ""

