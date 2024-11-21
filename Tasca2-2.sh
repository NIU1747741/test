#!/bin/bash

Tasca2-2 () 
{
    echo "Introdueix el títol de la película"
    read titol
    
    trobat=false
    numlineas=$(wc -l < "$1")


    for (( i=2; i<=numlineas; i++ )); 
    do
        linea=$(head -n $i "$1" | tail -n 1)
        peli=$(echo "$linea" | cut -d, -f5)
        if [[ "${peli,,}" == *"${titol,,}"* ]]; 
        then
        echo "$linea" >> filtrar
        trobat=true
        fi
    done
    
     for (( i=2; i<=numlineas; i++ )); 
    do
        linea=$(head -n $i "$2" | tail -n 1)
        peli=$(echo "$linea" | cut -d, -f5)
        if [[ "${peli,,}" == *"${titol,,}"* ]]; 
        then
        echo "$linea" >> filtrar
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
}
Tasca2-2 "$1" "$2"
