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

# Set variables to hold the column indices
NAME_COL=2
HP_COL=5
ATTACK_COL=6

# Use awk to calculate the values
FILENAME=$1
TOTAL=$(awk 'FNR > 1 {count++} END{print count}' $FILENAME) # count the number of lines (pokemon) after the first line
AVG_HP=$(awk 'FNR > 1 {total += $HP_COL} END{print total/(NR-1)}' HP_COL=$HP_COL $FILENAME) # sum HP column (excluding first line) and calculate mean
AVG_ATTACK=$(awk 'FNR > 1 {total += $ATTACK_COL} END{print total/(NR-1)}' ATTACK_COL=$ATTACK_COL $FILENAME) # sum ATTACK column (excluding first line) and calculate mean

# Print the summary
echo "# ===== SUMMARY OF DATA FILE ====="
echo "#    File name: $FILENAME"
echo "#    Total Pokemon: $TOTAL"
echo "#    Avg. HP: $AVG_HP"
echo "#    Avg. Attack: $AVG_ATTACK"
echo "# ===== END SUMMARY ====="
