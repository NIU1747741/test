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
		clear
		echo "Introdueix un any d'inici i un de final:  "

		read anyI anyF

		while [ "$anyI" -gt "$anyF" ]
		do

		if [ "$anyI" -gt "$anyF" ] ;
		then
		echo "error: Introdueix any inicial igual o més petit a any final"
		echo "Introdueix un any d'inici i un de final: "
		read anyI anyF
		fi
	
		done

		
		        bash tasca2-1.sh "$BD_ACTORS" "$BD_ACTRIUS" "$anyI" "$anyF"
			;;
		2)
		clear
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

