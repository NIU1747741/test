#!/bin/bash

HM_Funcio ()


{
Menu ()
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
echo "En desenvolupament"
read otro
clear
Menu;;
2)
clear
echo "En desenvolupament"
read otro
clear
Menu;;
3)
read otro
clear
Menu;;
4)
read otro
clear
Menu;;
0)
exit;;
esac
}
enDesenvolupament
}
Menu


}
HM_Funcio BestActor.csv BestActress.csv
