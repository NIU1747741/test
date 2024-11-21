#!/bin/bash

Tasca1-3 ()
{

cut -d, -f2- $1 > temp1 
sort -n -t, -k 2 temp1 > OrdenatBestActor
cat OrdenatBestActor
rm temp1
rm OrdenatBestActor

cut -d, -f2- $2 > temp1 
sort -n -t, -k 2 temp1 > OrdenatBestActress
cat OrdenatBestActress
rm temp1
rm OrdenatBestActress

}
Tasca1-3 $1 $2

echo "************************** PREMI UNA TECLA PER CONTINUAR *************************"
read -n 1 -s  # Esperar a que el usuario pulse una tecla para continuar
