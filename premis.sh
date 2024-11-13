#!/bin/bash

# Función para mostrar el menú
mostrarMenu() {
  echo -e "\n---------------------------------------------------------\n"
  echo "Catàleg de guanyadors i guanyadores d’Oscars"
  echo -e "\n---------------------------------------------------------\n"
  echo "1 Llistats del catàleg."
  echo "2 Cerca al catàleg."
  echo "3 Com ets d'Expert?."
  echo "4 Gestió del catáleg."
  echo "0 Sortir."
}

# Función para manejar opciones no válidas
mostrarOpcioNoValida() {
  clear
  echo "Opcio NO VÀLIDA"
  sleep 2
  clear
  mostrarMenu
}

# Función para opciones en desarrollo
mostrarEnDesarrollo() {
  clear
  echo "En desenvolupament"
  read -p "Prem qualsevol tecla per continuar..." -n1
  clear
}

# Función principal que controla el flujo del menú
HM_Funcio() {
  local intro=""
  
  while true; do
    mostrarMenu
    read intro

    case $intro in
      1|2|3|4)
        mostrarEnDesarrollo
        ;;
      0)
        clear
        echo "Gràcies per la vostra visita a Amor pel Setè Art"
        exit 0
        ;;
      *)
        mostrarOpcioNoValida
        ;;
    esac
  done
}

# Llama a la función principal
HM_Funcio BestActor.csv BestActress.csv

