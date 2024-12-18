#!/bin/bash

# Verifica que se hayan pasado dos argumentos
if [ "$#" -ne 2 ]; then
  echo "Ús: $0 <nom-BD-actors> <nom-BD-actrius>"
  exit 1
fi

# Almacena los nombres de los archivos CSV
BD_ACTORS="$1"
BD_ACTRIUS="$2"

# Función para mostrar el menú
mostrarMenu() {
  clear
  echo -e "\n---------------------------------------------------------\n"
  echo "Catàleg de guanyadors i guanyadores d’Oscars"
  echo -e "\n---------------------------------------------------------\n"
  echo "1. Llistats del catàleg."
  echo "2. Cerca al catàleg."
  echo "3. Com ets d'Expert?"
  echo "4. Gestió del catàleg."
  echo "0. Sortir."
  echo -e "\nSeleccioneu una opció: "
}

# Función para manejar opciones no válidas
mostrarOpcioNoValida() {
  clear
  echo "Opció NO VÀLIDA"
  sleep 2
  clear
}

# Función para las opciones en desarrollo
mostrarEnDesarrollo() {
  clear
  echo "En desenvolupament."
  read -p "Prem qualsevol tecla per continuar..." -n1
  clear
}

# Bucle principal del menú
local intro=""

while true; do
	mostrarMenu
	read intro

	case $intro in
		1)
			bash Opcio-1.sh $BD_ACTORS $BD_ACTRIUS
			;;
		2)	
			bash Opcio-2.sh $BD_ACTORS $BD_ACTRIUS
			;;
		3)
			bash Opcio-3.sh $BD_ACTORS $BD_ACTRIUS
			;;
		4)
			bash opcio-4.sh $BD_ACTORS $BD_ACTRIUS
			;;
		0)
			clear
			echo "Gràcies per la vostra visita a Amor pel Setè Art."
			exit 0
			;;
		*)
			mostrarOpcioNoValida
			;;
	esac
done

echo ""
