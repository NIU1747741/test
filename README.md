[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/p2VM4YAs)

Oscar Marcos Ruiz 1748165
Miguel Gil Alcaraz 1747741
David Caballero Ogazón 1745463

----------------------------------

FUNCIONAMENT DE LA PRÀCTICA

Aquesta part de la pràctica segueix funcionant amb codi bash script, el qual ens ha permès crear diferents opcions per realitzar el model de la web anomenada amor pel setè art.

La realització d'aquesta pàgina s'ha fet de forma grupal amb GitHub, ja que permetia poder fusionar el treball individual per poder acabar duent a terme una única tasca que sortia mitjançant el merge de les branques

El que buscava aquesta part de la tasca era realitzar unes certes opcions que permetessin posar a proba el nivell de coneixements de cinema de la persona que entrava a la pàgina de diferents maneres (preguntar per l'any de la película, el nombre d'un actor guanyador a x any...) o també que permetessin realitzar canvis a l'arxiu que contenia les dades dels actors i les actrius.

Tota aquesta part de la pràctica culmina amb la recopilació de tot en un menú que va per les diferents parts de la pàgina web creada.

----------------------------------------------------------------------

EXPLICACIÓ DE COM EXECUTAR EL CODI

Per executar el codi del repositori s'ha de fer bash premis.sh BestActor.csv BestActress.csv

Fent això el programa començarà a funcionar i es podran seleccionar totes les opcions disponibles, les quals donaran informació basada en els fitxers "BestActor.csv" i "BestActress.csv".

Cada execució dins del menu seleccionarà arguments diferents moltes vegades, però això ja ho gestiona el propi menú, que està configurat per afegir aquests arguments.

----------------------------------------

PROBLEMES I SOLUCIONS

Sense cap mena de dubte el pitjor problema que vam tenir va ser amb la tasca3-2, ja que a l'hora de barrejar l'opció correcta el shuffle separava el cognom del nom i no hi havia cap manera de poder solucionar això. Es a dir, es mostraven les opcions com:

1- "Leonardo
2 - DiCaprio"

Per solucionar això vam crear una array per barrejar les opcions, encara això ens va costar moltíssim poder fer-la correctament.

També algun company (David) va tenir algun problema per culpa de no fer pull, i va haver de esborrar tot el repositori git local i fer un clone, ja que no podia fer cap push

Un altre problema que vam tenr va ser a l'hora d'implementar els scripts al menu de la tasca3, ja que ens van deixar de funcionar correctament, ja que es repetien correctament, però ho vam poder arreglar ràpid modificant el menú.



------------------------

CONCLUSIONS

Realitzar aquesta pràctica ens ha ajudat moltíssim per entendre com funciona GitHub, quines son les commandes i com no tenir errors que afectin al procés de la tasca. Gràcies a això hem pogut veure que treballar en grup per fer aquest tipus de feines es essencial i ens estalvia moltíssim de temps, sobretot quan hi ha bona comprensió entre els companys.


També la realització de les tasques ens ha permés desenvolupar una certa creativitat resolutiva, ja que moltes vegades per solucionar el que ens proposava la tasca hem fet algun arranjament bastant curiós, però efectiu. A més que també ens ha siguit útil per adaptar-nos a millor al llenguatge bash script, el qual pot ser poc intuitiu algunes vegades
