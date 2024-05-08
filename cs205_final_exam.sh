#!/bin/bash

# Read first positional paramete into a varible
input="$1"

#Get The count of rows
#PLAN: Use AWK, use NR to get row count, -1 for the header
pokecount=$( awk 'END{print (NR-1)}' "$input")

#Get Avg health
#PLAN: access row 6 sum it, devide by poke count, skip header
pokehealth=$( awk -F '\t' ' NR > 1 {sumhp += $6} END {print sumhp/'$pokecount'}' "$input")

#Get AVG atk
# Same as before, focus row 7
#PLAN: access row 6 sum it, devide by poke count, skip header
pokeatk=$( awk -F '\t' ' NR > 1 {sumatk += $7} END {print sumatk/'$pokecount'}' "$input")

# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):

# ehco title
echo "===== SUMMARY OF DATA FILE ====="
# Echo the file name
echo "    File name: $input"
# Echo the count
echo "    Total Pokemon: $pokecount"
# Echo the HP
echo "    Avg. HP: $pokehealth"
# Echo the avg attack
echo "    Avg. Attack: $pokeatk"
#echo summary
echo "===== END SUMMARY ====="

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
