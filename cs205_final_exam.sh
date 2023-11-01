#!/bin/bash

# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

IFS="\t"; # set tabs as delimiter
FILE="$1"; # get file input from user
declare -i TOTAL=0; # set total of lines
declare -i HP=0; # initialize HP to 0
declare -i ATTACK=0; # initialize attack to 0

while read line
do
	TOTAL+=1; # increment line count
	HP+=$5; # add next HP total HP
	ATTACK+=$6; # add next attack total attack
done < $FILE

declare -i AVGHP=$HP/$TOTAL; # calculate average HP
declare -i AVGATT=$ATTACK/$TOTAL; # calculate average attack

echo "===== SUMMARY OF DATA FILE =====" #print tile
echo "   File name: $FILE" # print file name
echo "   Total Pokemon: $TOTAL" # print total pokemon
echo "   Avg. HP: $AVGHP" # print average HP
echo "   Avg. Attack: $AVGATT" # print average attack
echo "===== END SUMMARY =====" # print bottom line
