#!/bin/bash

Tasca2-2 () 
{
let vols=1
while [[ $vols != 2 ]] 
do
    echo "Pel·lícula"
    
    trobat=false
    numlineas=$(wc -l < "$1")


    for (( i=2; i<=numlineas; i++ )); 
    do
        linea=$(head -n $i "$1" | tail -n 1)
        peli=$(echo "$linea" | cut -d, -f5)
        if [[ "${peli,,}" == *"${3,,}"* ]]; 
        then
        echo "$linea" "- Millor Actor" >> filtrar
        trobat=true
        fi
    done
    
     for (( i=2; i<=numlineas; i++ )); 
    do
        linea=$(head -n $i "$2" | tail -n 1)
        peli=$(echo "$linea" | cut -d, -f5)
        if [[ "${peli,,}" == *"${3,,}"* ]]; 
        then
        echo "$linea" "- Millor Actriu" >> filtrar
        trobat=true
        fi
    done
    
    if [ "$trobat" = false ]; 
    then
        echo "Pel·lícula no present al catàleg" 
    fi

sort -k5 -t, filtrar | cut -d, -f2- > filtrar1 
cat filtrar1
rm filtrar
rm filtrar1

echo " "
echo "Vols:"
echo "1. Tornar a buscar "
echo "2. Tornar al menu anterior"
read vols

if [ $vols -eq 2 ];
then
clear
echo "bash Opcio2.sh"
fi

done
}
Tasca2-2 "$1" "$2" "$3"
