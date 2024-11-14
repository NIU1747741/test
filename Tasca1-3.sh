#!/bin/bash

Tasca1-3 ()
{

cut -d: -f2- $1 >> temp1 

cut -d: -f2- $2 >> temp2

}
Tasca 1-3 $1 $2
