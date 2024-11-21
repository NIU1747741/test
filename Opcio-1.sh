#!/bin/bash

# Almacena los nombres de los archivos CSV
BD_ACTORS="$1"
BD_ACTRIUS="$2"

mostrarMenu() {
	clear
	echo -e "\n---------------------------------------------------------\n"
	echo -e "1 - Llistats del catàleg"
	echo -e "\n---------------------------------------------------------\n"
	echo -e "1. Llistat d'actors i actrius per data del premi."
	echo -e "2. Llistat alfabètic de pel·lícules."
	echo -e "3. Llistat per edat d'actors i actrius."
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

while true; do
	mostrarMenu
	read intro

	case $intro in
		1)
			bash tasca1-1.sh $BD_ACTORS $BD_ACTRIUS
			;;
		2)
			bash tasca1-2.sh $BD_ACTORS $BD_ACTRIUS
			;;
		3)
			bash Tasca1-3.sh $BD_ACTORS $BD_ACTRIUS
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

