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

# Buscar coincidencias en el archivo de actrices
tail -n +2 "$actress_file" | awk -F',' -v search="$search_name" '
tolower($4) ~ tolower(search) {
  print $4 ", " $2 ", con " $3 " años, premio a MEJOR ACTRIZ, por " $5
}' >> "$temp_file"

# Ordenamos alfabéticamente por nombre y mostramos los resultados
echo "**********************************************************************************"
echo "****************** RESULTADOS DE LA BÚSQUEDA PARA \"$search_name\" ******************"
sort "$temp_file"
echo "**********************************************************************************"

# Eliminamos el archivo temporal
rm "$temp_file"

# Opción de volver a buscar o salir
while true; do
  echo "¿Quieres realizar otra búsqueda (si/no)?"
  read -r respuesta
  if [[ "$respuesta" == "si" ]]; then
    echo "Introduce una nueva cadena de caracteres para buscar:"
    read -r new_search_name
    bash "$0" "$actor_file" "$actress_file" "$new_search_name"
    break
  elif [[ "$respuesta" == "no" ]]; then
    echo "Volviendo al menú anterior."
    break
  else
    echo "Respuesta no válida. Escribe 'si' o 'no'."
  fi
done
