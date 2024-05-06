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

# Check if a file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# Assign filename from the argument
file="$1"

# Print header for the summary
echo "===== SUMMARY OF DATA FILE ====="

# Print filename
echo "   File name: $file"

# Count total number of Pokemon
total_pokemon=$(awk 'NR > 1 {print}' "$file" | wc -l)
echo "   Total Pokemon: $total_pokemon"

# Calculate average HP
avg_hp=$(awk 'NR > 1 {total += $6; count++} END {if (count > 0) print total/count; else print "N/A"}' "$file")
if [[ "$avg_hp" == "N/A" ]]; then
    echo "   Avg. HP: N/A"
else
    echo "   Avg. HP: $avg_hp"
fi

# Calculate average Attack
avg_attack=$(awk 'NR > 1 {total += $7; count++} END {if (count > 0) print total/count; else print "N/A"}' "$file")
if [[ "$avg_attack" == "N/A" ]]; then
    echo "   Avg. Attack: N/A"
else
    echo "   Avg. Attack: $avg_attack"
fi

# Print footer for the summary
echo "===== END SUMMARY ====="
