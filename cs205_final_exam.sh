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


#!/bin/bash

# Check if a file name is provided
if [ $# -eq 0 ]; then
    echo "No file provided. Usage: $0 filename"
    exit 1
fi

FILENAME="$1"

echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $FILENAME"

# Calculate the total number of Pokemon, subtracting 1 to skip the header
TOTAL_POKEMON=$(awk 'NR > 1 {count++} END {print count}' $FILENAME)
echo "Total Pokemon: $TOTAL_POKEMON"

# Calculate the average HP, considering HP is the 5th column
AVG_HP=$(awk 'NR > 1 {sum += $5} END {if (NR > 1) print sum/count; else print 0}' $FILENAME)
echo "Avg. HP: $AVG_HP"

# Calculate the average Attack, considering Attack is the 6th column
AVG_ATTACK=$(awk 'NR > 1 {sum += $6} END {if (NR > 1) print sum/count; else print 0}' $FILENAME)
echo "Avg. Attack: $AVG_ATTACK"

echo "===== END SUMMARY ====="
