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

# Mostrar los datos actuales
IFS=',' read -r index actual_year actual_age actual_name actual_movie <<< "$line"
echo "S'ha trobat el registre:"
echo "  Índex: $index"
echo "  Any: $actual_year"
echo "  Edat: $actual_age anys"
echo "  Nom: $actual_name"
echo "  Pel·lícula: $actual_movie"

# Pedir nuevos datos o mantener los existentes
echo "Introdueix el nou títol (o = per mantenir el títol actual: $actual_movie):"
read new_movie
if [[ "$new_movie" == "=" ]]; then
  new_movie="$actual_movie"
fi

echo "Introdueix el nou nom (o = per mantenir el nom actual: $actual_name):"
read new_name
if [[ "$new_name" == "=" ]]; then
  new_name="$actual_name"
fi

echo "Introdueix la nova edat (o = per mantenir l'edat actual: $actual_age):"
read new_age
if [[ "$new_age" == "=" ]]; then
  new_age="$actual_age"
fi



esperarPulsarTecla
