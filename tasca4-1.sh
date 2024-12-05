#!/bin/bash

BESTACTOR=$1
BESTACTRESS=$2

echo "Que vols afegir?:"
echo "1 - Actor"
echo "2 - Actriu"

read actoroactriu

if [[ $actoroactriu -eq 1 ]];
then
echo "Dona l'any"
read any
echo "Dona el títol"
read titol
echo "Dona el nom"
read nom
echo "Dona l'edat"
read edat

awk -F, 'BEGIN {}
$2 == a {print "true" > tof}
END {}' a=$any tof="tof" $BESTACTOR

if [[ 'cat tof' == true ]];
then
echo "Any repetit"
rm tof
else
numlineas=$(wc -l < $BESTACTOR)
numlineas=$((numlineas+2))
echo $numlineas > dlineas
echo $any > dany
echo $titol > dtitol
echo $nom > dnom
echo $edat > dedat

paste -d, dlineas dany dedat dnom dtitol >> $BESTACTOR
rm dlineas
rm dany
rm dnom
rm dedat
rm dtitol

fi

#mujeres
else
echo "Dona l'any"
read any
echo "Dona el títol"
read titol
echo "Dona el nom"
read nom
echo "Dona l'edat"
read edat

awk -F, 'BEGIN {}
$2 == a {print "true" > tof}
END {}' a=$any tof="tof" $BESTACTRESS

if [[ 'cat tof' == true ]];
then
echo "Any repetit"
rm tof
else
numlineas=$(wc -l < $BESTACTRESS)
numlineas=$((numlineas+2))
echo $numlineas > dlineas
echo $any > dany
echo $titol > dtitol
echo $nom > dnom
echo $edat > dedat

paste -d, dlineas dany dedat dnom dtitol >> $BESTACTRESS
rm dlineas
rm dany
rm dnom
rm dedat
rm dtitol

fi
fi


