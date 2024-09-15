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
#sh file using awk for all codes

filename=$(awk 'FNR == 1{print FILENAME}' $1)
#^ Finds and prints the filename once.

total_pokemon=$(awk -F'\t' 'END {print NR-1}' $filename)
#^ Organizes the columns with tab separator and counts each line which have a pokemon to include the megas since it wasn't specified, and prints the result number. Exluded the first line that is the hea>

avg_hp=$(awk -F'\t' '{sum += $6} END {print sum/NR}' $filename)
#^ Organizes the columns with tab separator and calculates the sum in column 6 of the file, which have the pokemons HP value, and prints the results as an average.

avg_attack=$(awk -F'\t' '{sum += $7} END {print sum/NR}' $filename)
#^ Organizes the columns with tab separator and calculates the sum in column 7 of the file, which has the pokemons attack value, and prints the results as an average.

echo "#===== SUMMARY OF DATA FILE ====="
echo "#   File Name: $filename"
echo "#   Total Pokemon: $total_pokemon"
echo "#   Avg. HP: $avg_hp"
echo "#   Avg. Attack: $avg_attack"
echo "#===== END SUMMARY ====="
