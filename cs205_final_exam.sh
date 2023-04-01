#!/bin/bash

filename=$(basename "$1")
total_pokemon=$(awk 'END{print NR}' "$1")
avg_hp=$(awk '{total += $6} END{print total/NR}' "$1")
avg_attack=$(awk '{total += $7} END{print total/NR}' "$1")

echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $filename"
echo "Total Pokemon: $total_pokemon"
echo "Avg. HP: $avg_hp"
echo "Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="


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
