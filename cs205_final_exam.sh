#!/bin/bash

# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way pokemon.dat is formatted.

#Get the file name as the first positional parameter
FILE=$1

#Print the data summary header
echo " ==== SUMMARY OF DATA FILE ====="
#Echo the name of the file to the console
echo "    File name: $FILE"

#Awk command to get the total pokemon, (counting each line besides the first)
awk 'END{print "    Total Pokemon: " (NR-1)}' $FILE
#Awk command to get the average HP of all the pokemon,
# skip over the first line, and sum up the 6th field (HP) and divide it by the total pokemon
awk 'NR > 1 {sum += $6} END{print "    Avg. HP: " (sum/(NR-1))}' $FILE
#Awk command to get the average Attack of all the pokemon,
# skip over the first line, and sum up the 7th field (Attack) and divide it by the total pokemon 
awk 'NR > 1 {sum += $7} END{print "    Avg. Attack: " (sum/(NR-1))}' $FILE

#Print the data summary tail
echo " ===== END SUMMARY ====="
