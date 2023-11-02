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

#!/bin/bash -F'\t'-f

# Takes the first positional parameter as the file name
filename=$1 

# Using awk to calculate the total number of pokemon is equal to the number of lines minus the first because that belongs to the name 
total=$(awk 'END {print NR-1}' $filename) 

# Using awk to sum all of row 6 (the hp of the pokemon) and dividing that by the total
avg_hp=$(awk '{sum += $6} END {print sum / (NR-1)}' $filename) 

# Using awk to sum all of row 7 (the attack of the pokemon) and dividing that by the total
avg_attack=$(awk '{sum += $7} END {print sum / (NR-1)}' $filename) 

# print the above header using my variables
echo "===== SUMMARY OF DATA FILE =====" 
echo "# File name: $filename"
echo "# Total Pokemon: $total"
echo "# Avg. HP: $avg_hp"
echo "# Avg. Attack: $avg_attack"
echo "===== END SUMMARY =====" 
