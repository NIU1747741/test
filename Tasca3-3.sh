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

