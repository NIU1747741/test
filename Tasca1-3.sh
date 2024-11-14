#!/bin/bash

Tasca1-3 ()
{

cut -d, -f2- $1 > temp1 
sort -n -t, -k 2 temp1 > OrdenatBestActor
cat OrdenatBestActor
rm temp1
rm OrdenatBestActor

cut -d, -f2- $2 >> temp2
rm temp2

}
Tasca1-3 $1 $2
