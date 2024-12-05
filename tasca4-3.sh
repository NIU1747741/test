#!/bin/bash

# Comprobamos que los archivos BestActor.csv y BestActress.csv se pasen como argumentos
if [[ $# -ne 2 ]]; then
  echo "Error: Se requieren dos archivos .csv como argumentos (BestActor.csv y BestActress.csv)"
  exit 1
fi

actor_file="$1"
actress_file="$2"

esperarPulsarTecla() {
	echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
	read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar
}

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

# Pedir el año como campo obligatorio
echo "Introdueix l'any de la pel·lícula que vols modificar:"
read year

# Buscar la línea que contiene el año indicado
line=$(grep -m 1 "^.*, *$year,.*" "$selected_file")
if [[ -z "$line" ]]; then
  echo "Error: No s'ha trobat cap registre amb l'any $year."
  esperarPulsarTecla
  exit 1
fi

esperarPulsarTecla
