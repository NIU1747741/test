#!/bin/bash

# Comprobamos que los archivos BestActor.csv y BestActress.csv se pasen como argumentos
if [[ $# -ne 2 ]]; then
  echo "Error: Se requieren dos archivos .csv como argumentos (BestActor.csv y BestActress.csv)"
  exit 1
fi

actor_file="$1"
actress_file="$2"

# Mostrar el listado de premios
echo "**********************************************************************************"
echo "******************* LLISTAT D’ACTORS I ACTRIUS PER DATA DEL PREMI. **************"

# Listado de actores
echo "***** LLISTAT OSCARS A MILLOR ACTOR:"
tail -n +2 "$actor_file" | awk -F',' '{print "* " $2 ", amb " $3 " anys " $4 " per " $5}' | sort

# Línea de separación
echo

# Listado de actrices
echo "***** LLISTAT OSCARS A MILLOR ACTRIU:"
tail -n +2 "$actress_file" | awk -F',' '{print "* " $2 ", amb " $3 " anys " $4 " per " $5}' | sort

echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar
