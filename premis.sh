#!/bin/bash

HM_Funcio ()
{
echo -e "\n---------------------------------------------------------\n"
echo "Catàleg de guanyadors i guanyadores d’Oscars"
echo -e "\n---------------------------------------------------------\n"
echo "1 Llistats del catàleg."
echo "2 Cerca al catàleg."
echo "3 Com ets d'Expert?."
echo "4 Gestió del catáleg."
echo "0 Sortir."

enDesenvolupament ()
{
read intro

case $intro in
1)
clear
echo "En desenvolupament";;
2)
clear
echo "En desenvolupament";;
3)
clear
echo "En desenvolupament";;
4)
clear
echo "En desenvolupament";;
0)
exit;;
esac
}
enDesenvolupament

}
HM_Funcio BestActor.csv BestActress.csv
