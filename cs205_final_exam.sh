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

# Check if filename provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi
input_file="$1"

# Assign the data file name and check if exists
if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found."
    exit 1
fi

# Use awk to sum the 7th and 8th columns and divide by number of rows
attack_avg=$(awk -F'\t' 'NR > 1 { total += $7 } END { print total/(NR-1) }' "$input_file")
hp_avg=$(awk -F'\t' 'NR > 1 { total += $6 } END { print total/(NR-1) }' "$input_file")

# Grabs the file name and counted total number of Pokemon, do not count the first line
file_name=$(basename "$input_file")
total_pokemon=$(wc -l < <(tail -n +2 "$input_file"))



echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $file_name"
echo "    Total Pokemon: $total_pokemon"
echo "    Avg. HP: $hp_avg"
echo "    Avg. Attack: $attack_avg"
echo "===== END SUMMARY ====="
