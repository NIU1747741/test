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
actor_correct=$(awk -F, "NR==$random {print \$4}" "$archivo")
actor2=$(awk -F, "NR==$random2 {print \$4}" "$archivo")
actor3=$(awk -F, "NR==$random3 {print \$4}" "$archivo")

# Crear una lista de actores con la correcta y dos incorrectas
actors=("$actor_correct" "$actor2" "$actor3")

# Mezcla manual de los actores sin usar shuf
for i in {0..2}; do
    j=$(($RANDOM % 3))  # Genera un índice aleatorio entre 0 y 2
    # Intercambiar los elementos
    temp="${actors[$i]}"
    actors[$i]="${actors[$j]}"
    actors[$j]="$temp"
done

# Encontrar la posición de la respuesta correcta en la lista mezclada
correcta_index=0
for i in "${!actors[@]}"; do
    if [[ "${actors[$i]}" == "$actor_correct" ]]; then
        correcta_index=$((i + 1))  # Ajustar para opciones 1, 2, 3
        break
    fi
done

# Mostrar la pregunta con las opciones mezcladas
echo -e "L'oscar a millor $( [[ $homeodona -eq 1 ]] && echo 'actor' || echo 'actriu' ) amb $pelirandom el va guanyar al $anyrandom \n"
for i in "${!actors[@]}"; do
    echo "$((i + 1)) - ${actors[$i]}"
done
echo -e "\n-------------------------------------------------- \n"
echo "Selecciona una opció [1,2,3]: "

# Leer respuesta y verificar
read Opcio
if [[ $Opcio -eq $correcta_index ]]; then
    echo "Felicitats"
else
    echo "Oh, sembla que no és la resposta correcta..."
fi

echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar
