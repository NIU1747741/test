#!/bin/bash

Tasca2-2 ()
{
echo "Introdueix el títol de la película"
read titol
cut -d, -f5 "$1" | tail +2 > titols

grep -i "$titol" titols > filtrat

cat filtrat

rm filtrat
rm titols

}
Tasca2-2 $1 $2
