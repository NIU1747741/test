#!/bin/bash

echo -e "-------------------------------------------------- \n"
echo -e "3-2 – Qui va guanyar l’Oscar? \n"
echo -e "-------------------------------------------------- \n"

# Determinar si es hombres o mujeres
homeodona=$(($RANDOM % 2))

# Elegir el archivo adecuado
archivo=$1
if [[ $homeodona -eq 0 ]]; then
    archivo=$2
fi

# Calcular el número de líneas en el archivo (sin contar el encabezado)
total_lines=$(($(wc -l < "$archivo") - 1))

# Generar índices aleatorios
random=$(($RANDOM % total_lines + 2))  # Comienza en la línea 2
random2=$(($RANDOM % total_lines + 2))
random3=$(($RANDOM % total_lines + 2))

# Extraer información usando los índices
pelirandom=$(awk -F, "NR==$random {print \$5}" "$archivo")
anyrandom=$(awk -F, "NR==$random {print \$2}" "$archivo")
actor1=$(awk -F, "NR==$random {print \$4}" "$archivo")
actor2=$(awk -F, "NR==$random2 {print \$4}" "$archivo")
actor3=$(awk -F, "NR==$random3 {print \$4}" "$archivo")

# Mostrar pregunta
correcta=3
echo -e "L'oscar a millor $( [[ $homeodona -eq 1 ]] && echo 'actor' || echo 'actriu' ) amb $pelirandom el va guanyar al $anyrandom \n"
echo "1 - $actor3"
echo "2 - $actor2"
echo "3 - $actor1"
echo -e "\n-------------------------------------------------- \n"
echo "Selecciona una opció [1,2,3]: "

# Leer respuesta y verificar
read Opcio
if [[ $Opcio -eq $correcta ]]; then
    echo "Felicitats"
else
    echo "No felicitats"
fi

echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar
