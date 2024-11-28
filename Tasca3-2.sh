#!/bin/bash

echo -e "-------------------------------------------------- \n"
echo -e "3-2 – Qui va guanyar l’Oscar? \n"
echo -e "-------------------------------------------------- \n"

random=$(echo $(($RANDOM%88)))
pelirandom=$(cut -d, -f5 $1 | head -$random | tail -1)
anyrandom=$(cut -d, -f2 $1 | head -$random | tail -1)

echo "L'oscar a millor actriu amb $pelirandom el va guanyar al $anyrandom"

