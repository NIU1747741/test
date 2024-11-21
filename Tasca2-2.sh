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
        echo "$linea"
        trobat=true
        fi
    done
    
    if [ "$trobat" = false ]; 
    then
        echo "Pel·lícula no present al catàleg"
    fi
}

Tasca2-2 "$1" "$2"
