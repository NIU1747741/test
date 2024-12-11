#!/bin/bash

# Comprobamos que los argumentos o parámetros sean suficientes
if [[ $# -lt 1 ]]; then
  echo "Error: Uso correcto: $0 <archivo_actor.csv> [<año> <nueva_película> <nuevo_nombre> <nueva_edad>]"
  exit 1
fi

actor_file="$1"

esperarPulsarTecla() {
  echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
  read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar
}

clear

# Verificar que el archivo proporcionado existe
if [[ ! -f "$actor_file" ]]; then
  echo "Error: El archivo $actor_file no existe."
  exit 1
fi

# Si se pasan todos los parámetros requeridos, ejecutamos directamente la modificación
if [[ $# -ge 5 ]]; then
  year="$2"
  new_movie="$3"
  new_name="$4"
  new_age="$5"

  # Buscar la línea que contiene el año indicado
  line=$(grep -m 1 "^.*, *$year,.*" "$actor_file")
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

  # Mantener los valores actuales si los nuevos datos son "="
  if [[ "$new_movie" == "=" ]]; then
    new_movie="$actual_movie"
  fi

  if [[ "$new_name" == "=" ]]; then
    new_name="$actual_name"
  fi

  if [[ "$new_age" == "=" ]]; then
    new_age="$actual_age"
  fi

  # Crear la nueva línea con los datos modificados
  new_line="$index, $year, $new_age, $new_name, $new_movie"

  # Reemplazar la línea en el archivo
  if sed -i "s|^$line$|$new_line|" "$actor_file"; then
    echo "Modificació realitzada amb èxit!"
    echo "Nou registre després de la modificació:"
    echo "  Índex: $index"
    echo "  Any: $year"
    echo "  Edat: $new_age anys"
    echo "  Nom: $new_name"
    echo "  Pel·lícula: $new_movie"
  else
    echo "Error: No s'ha pogut dur a terme la modificació."
  fi

  esperarPulsarTecla
  exit 0
fi

# Si no se pasan todos los parámetros, se utiliza el modo interactivo
# Pedir el año como campo obligatorio
echo "Introdueix l'any de la pel·lícula que vols modificar:"
read year

# Buscar la línea que contiene el año indicado
line=$(grep -m 1 "^.*, *$year,.*" "$actor_file")
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

# Crear la nueva línea con los datos modificados
new_line="$index, $year, $new_age, $new_name, $new_movie"

# Reemplazar la línea en el archivo
if sed -i "s|^$line$|$new_line|" "$actor_file"; then
  echo "Modificació realitzada amb èxit!"
  echo "Nou registre després de la modificació:"
  echo "  Índex: $index"
  echo "  Any: $year"
  echo "  Edat: $new_age anys"
  echo "  Nom: $new_name"
  echo "  Pel·lícula: $new_movie"
else
  echo "Error: No s'ha pogut dur a terme la modificació."
fi

esperarPulsarTecla
