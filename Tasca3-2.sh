#!/bin/bash

echo -e "-------------------------------------------------- \n"
echo -e "3-2 – Qui va guanyar l’Oscar? \n"
echo -e "-------------------------------------------------- \n"

#HOMES

random=$(echo $(($RANDOM%88)))
pelirandom=$(cut -d, -f5 $1 | head -$random | tail -1)
anyrandom=$(cut -d, -f2 $1 | head -$random | tail -1)
random2=$(echo $(($RANDOM%88)))
random3=$(echo $(($RANDOM%88)))

#ACTORSRANDOM
actor1=$(cut -d, -f4 $1 | head -$random | tail -1)
echo "2 - " 
actor2=$(cut -d, -f4 $1 | head -$random2 | tail -1)
echo "3 - " 
actor3=$(cut -d, -f4 $1 | head -$random3 | tail -1)

#PREGUNTA

# He buscat informació, i la millor forma de fer aquesta part, és una barreja amb shuf, si la professora necessita explicació per la meva part de com utilitzar això se la puc donar

opcions=("$actor1" "$actor2" "$actor3")
correcta=1
opcions=($(shuf -e "${opcions[@]}"))

for (( i=0; i<${#opcions[@]}; i++))
do
 if [[ "${opciones[$i]}" == "$actor1" ]]; 
 then
    correcta=$((i + 1))
    break
 fi
done

echo -e "L'oscar a millor actriu amb$pelirandom el va guanyar al$anyrandom \n"
echo -e "\n-------------------------------------------------- \n "
echo "Selecciona una opció [1,2,3]: "

read Opcio

if [[ $opcio == $correcta ]];
then
echo "Felicitats"
else 
echo "No felicitats"
fi


#DESPRÉS DONES I RANDOM ENTRE 1 i 2

