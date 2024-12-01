#!/bin/bash

echo -e "-------------------------------------------------- \n"
echo -e "3-2 – Qui va guanyar l’Oscar? \n"
echo -e "-------------------------------------------------- \n"

#HOMES

random=$(($RANDOM%88))
pelirandom=$(awk -F, "NR==$random {print \$5}" $1)
anyrandom=$(awk -F, "NR==$random {print \$2}" $1)
random2=$(($RANDOM%88))
random3=$(($RANDOM%88))

#ACTORSRANDOM
actor1=$(awk -F, "NR==$random {print \$4}" $1)
actor2=$(awk -F, "NR==$random2 {print \$4}" $1)
actor3=$(awk -F, "NR==$random3 {print \$4}" $1)
#PREGUNTA

# He buscat informació, i la millor forma de fer aquesta part, és una barreja amb shuf, si la professora necessita explicació per la meva part de com utilitzar això se la puc donar

opcions=("$actor1" "$actor2" "$actor3")
correcta=1
opcions=($(shuf -e "${opcions[@]}"))

for (( i=0; i<${#opcions[@]}; i++))
do
 if [[ "${opcions[$i]}" == "$actor1" ]]; 
 then
    correcta=$((i + 1))
    break
 fi
done

echo -e "L'oscar a millor actriu amb$pelirandom el va guanyar al$anyrandom \n"
echo "1 - $actor1"  
echo "2 - $actor2"  
echo "3 - $actor3"  
echo -e "\n-------------------------------------------------- \n "
echo "Selecciona una opció [1,2,3]: "

read Opcio

if [[ $Opcio -eq $correcta ]];
then
echo "Felicitats"
else 
echo "No felicitats"
fi

#DESPRÉS DONES I RANDOM ENTRE 1 i 2

