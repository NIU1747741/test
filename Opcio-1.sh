#!/bin/bash

clear

echo --------------------------------------------------

echo -e "\n \t 1 - Llistats del catàleg. \t \n"

echo --------------------------------------------------

echo -e "\n1 Llistat d'actors i actrius per data del premi.\n"

echo -e "2 Llistat alfabètic de pel·lícules.\n"

echo -e "3 Llistat per edat d'actors i actrius.\n"

echo -e "0 Tornar al menú anterior."



read numero

case $numero in

1)

echo "Tasca 1-1 en desenvolupament";;

2)

echo "Tasca 1-2 en desenvolupament";;

3)

echo "Tasca 1-3 en desenvolupament";;

0)

exit;;

*)

echo "Opcio incorrecta";;

esac

