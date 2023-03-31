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


#!/bin/bash

FILE="$1"
#set the file as a variable
total=$(awk 'END {print NR-1}' $FILE)
#find all the lines in the $FILE
hp=$(awk -F'\t' '{ sum += $6} END { print sum / (NR-1) }' $FILE)
#sums the column and divides by the number of lines - 1
attack=$(awk -F'\t' '{ sum += $7} END { print sum / (NR-1) }' $FILE)
#sums the attack column and divides by NR-1

echo " ===== SUMMARY OF DATA FILE ====="
#first line of output
echo "    File name: $FILE"
#second line with file name
echo "    Total Pokemon: ${total}"
#third line with total pokemon
echo "    Avg. HP: ${hp}"
#fourth line with average HP
echo "    Avg. Attack: ${attack}"
#fifth line with average attack
echo " ===== END SUMMARY ====="
#print last line

