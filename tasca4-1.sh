#!/bin/bash

BESTACTOR=$1
any=$2
titol=$3
nom=$4
edat=$5

awk -F, 'BEGIN {}
$2 == a {print "true" > tof}
END {}' a=$any tof="tof" $BESTACTOR

if [[ $(cat tof) == "true" ]];
then
echo "Any repetit"
rm tof
else
numlineas=$(wc -l < $BESTACTOR)
numlineas=$((numlineas+2))

#he fet millor per variables, ja que amb els arxius era poc òptim y no es podia separar correctament

nueva_linea="$numlineas, $any, $edat, \"$nom\", \"$titol\""
echo "$nueva_linea" >> "$BESTACTOR"


fi

