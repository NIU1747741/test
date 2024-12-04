#!/bin/bash

# Comprobamos que los archivos BestActor.csv y BestActress.csv se pasen como argumentos
if [[ $# -ne 2 ]]; then
  echo "Error: Se requieren dos archivos .csv como argumentos (BestActor.csv y BestActress.csv)"
  exit 1
fi

actor_file="$1"
actress_file="$2"

# Selección aleatoria de si usar actores o actrices
if (( RANDOM % 2 == 0 )); then
  selected_file="$actor_file"
  tipo="actor"
else
  selected_file="$actress_file"
  tipo="actriu"
fi

# Limpiamos la pantalla al inicio
clear

# Extraer tres líneas aleatorias diferentes del archivo seleccionado
lines=$(tail -n +2 "$selected_file" | shuf -n 3)

# Procesar las líneas seleccionadas y extraer datos
peliculas=()
years=()

while IFS=',' read -r index year age name movie; do
  peliculas+=("$name amb $age anys va guanyar l’Oscar a millor $tipo amb $movie")
  years+=("$year")
done <<< "$lines"

# Mostrar las películas seleccionadas
clear
echo "--------------------------------------------------"
echo "3-3 - Ordena cronològicament"
echo "--------------------------------------------------"
for i in {0..2}; do
  echo "$((i+1))-${peliculas[$i]}"
done
echo "------------------------------------------------------------------"

# Pedir al usuario que ordene las películas cronológicamente
echo "Escriu el número de la pel·lícula més antiga de les tres:"
read oldest
echo "Escriu el número de la pel·lícula intermèdia de les tres:"
read middle
echo "Escriu el número de la pel·lícula més nova de les tres:"
read newest

# Calcular el orden correcto de los índices según los años
sorted_indices=($(for i in "${!years[@]}"; do echo "$i ${years[$i]}"; done | sort -k2n | awk '{print $1}'))

# Convertimos los índices ordenados en las respuestas correctas
orden_correcto=("${peliculas[${sorted_indices[0]}]}" "${peliculas[${sorted_indices[1]}]}" "${peliculas[${sorted_indices[2]}]}")

# Verificar la respuesta del usuario
if [[ "${peliculas[$((oldest-1))]}" == "${orden_correcto[0]}" && \
      "${peliculas[$((middle-1))]}" == "${orden_correcto[1]}" && \
      "${peliculas[$((newest-1))]}" == "${orden_correcto[2]}" ]]; then
  echo "Correcte! Bona feina!"
else
  echo "Incorrecte. L’ordre correcte és:"
  for pelicula in "${orden_correcto[@]}"; do
    echo "$pelicula"
  done
fi

echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar

