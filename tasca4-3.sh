#!/bin/bash

# Comprobamos que los archivos BestActor.csv y BestActress.csv se pasen como argumentos
if [[ $# -ne 2 ]]; then
  echo "Error: Se requieren dos archivos .csv como argumentos (BestActor.csv y BestActress.csv)"
  exit 1
fi

actor_file="$1"
actress_file="$2"

# Preguntar si se quiere modificar actor o actriz
echo "¿Quieres modificar un actor o una actriu? (actor/actriu)"
read tipo

if [[ "$tipo" == "actor" ]]; then
  selected_file="$actor_file"
elif [[ "$tipo" == "actriu" ]]; then
  selected_file="$actress_file"
else
  echo "Error: Opción no válida. Debes escribir 'actor' o 'actriu'."
  exit 1
fi

