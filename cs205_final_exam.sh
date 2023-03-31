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
#Here, our file is our first variable, in this case being pokemon.dat
TOTAL=$(awk 'END {print NR-1}' $FILE)
#NR-1 ensures that the first row is not counted when displaying the total amount of lines in the file
HP=$(awk -F'\t'  '{ sum += $6} END { print sum / (NR-1) }' $FILE)
#Here, the field separator is identified as tab, with -F'\t'. The sum of the sixth column is tracked, then divided by the number of lines, excluding the first.
ATTACK=$(awk -F'\t' '{ sum += $7} END { print sum / (NR-1) }' $FILE)
#This is the same as the other average, with the 6th column being replaced by the 7th

echo "===== SUMMARY OF DATA FILE ====="
echo "	File name: $FILE"
echo "	Total Pokemon: ${total}"
echo "	Avg. HP: ${HP}"
echo "	Avg. Attack: ${ATTACK}"

#Each of our variables are echoed in the correct format.
