#!/bin/bash

Tasca2-2 ()
{
echo "Introdueix el títol de la película"
read titol
cut -d, -f5 "$1" | tail +2 > titols

grep -i "$titol" titols > filtrat

let numlineas=wc -l < $1

for (( i=1; i<$numlineas; i++))
do
if ((filtrat ~= $valor ));
then
cut -d, -f5 "$1" | head -$i | tail -1 > filtrattotal
cat filtrattotal
else
echo "Pel·lícula no present al catàleg"
fi
done



rm filtrat
rm titols

}
Tasca2-2 $1 $2
