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

# Assign the filename provided as a positional parameter to a variable
file_name=$1

# Extract the file name from the full path
file_name_only=$(basename "$file_name")

# Use awk to calculate the total number of Pokemon
total_pokemon=$(awk 'END {print NR}' "$file_name")

# Use awk to calculate the average HP
avg_hp=$(awk '{total_hp += $2} END {print total_hp/NR}' "$file_name")

# Use awk to calculate the average Attack
avg_attack=$(awk '{total_attack += $3} END {print total_attack/NR}' "$file_name")

# Print the summary report with calculated values
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $file_name_only"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
