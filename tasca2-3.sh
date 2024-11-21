#!/bin/bash

# Comprobamos que los archivos BestActor.csv y BestActress.csv se pasen como argumentos
if [[ $# -ne 3 ]]; then
  echo "Error: Se requieren dos archivos .csv como argumentos (BestActor.csv y BestActress.csv) y un string"
  exit 1
fi

actor_file="$1"
actress_file="$2"
search_name="$3"

# Variables temporales para guardar resultados
temp_file=$(mktemp)

# Buscar coincidencias en el archivo de actores
tail -n +2 "$actor_file" | awk -F',' -v search="$search_name" '
tolower($4) ~ tolower(search) {
  print $4 ", " $2 ", con " $3 " años, premio a MEJOR ACTOR, por " $5
}' >> "$temp_file"


