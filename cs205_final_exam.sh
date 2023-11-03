#!/bin/bash

#This is just printing all lines of the dat file which in turn prints the total amount of pokemon.
all_pokemon=$(awk 'END {print NR}' "$1")

#Since I have done average hp from module 1, this is a simple way to collect the sum of all values in the 6th column which is the HP column and then of course calculate the mean.
average_hp=$(awk '{sum += $6} END {print sum/NR}' "$1")

#Same thing and same code but I simply changed the postional parameter to the 7th column of the dat file to 7 which is the attack column, very simple and gets the desired result.
average_attack=$(awk '{sum += $7} END {print sum/NR}' "$1")

#And this is just printing all my data in the format in the correct way while $1 is the parameter that best_pokemon.dat or any file is gonna use it as it gets echoed.
echo "# ===== SUMMARY OF DATA FILE ====="
echo "#    File name: [$1]"
echo "#    Total Pokemon: [$all_pokemon]"
echo "#    Avg. HP: [$average_hp]"
echo "#    Avg. Attack: [$average_attack]"
echo "# ===== END SUMMARY ====="
