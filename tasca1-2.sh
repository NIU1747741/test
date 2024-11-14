#!/bin/bash

echo -e "Llistat alfabètic de pel·licules d'actors nominats a l'OSCAR: \n"
tail +2 BestActor.csv > temp1
cut -d, -f2-5 temp1 > temp2

