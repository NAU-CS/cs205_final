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
# This script processes a file formatted like best_pokemon.dat using awk to generate a summary report.

# Validate that a file name has been provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

# Assign the file name to a variable
filename=$1

# Check if the file exists
if [ ! -f "$filename" ]; then
  echo "Error: File not found!"
  exit 1
fi

# Use awk to calculate average HP and average Attack
# Note: Adjusted to use tab as the delimiter and correct column numbers for HP and Attack
read avg_hp avg_attack total_pokemon <<< $(awk -F"\t" '{hp+=$5; atk+=$6; count++} END {print hp/count, atk/count, count}' "$filename")

# Print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $filename"
echo "   Total Pokemon: $total_pokemon"
printf "   Avg. HP: %.2f\n" $avg_hp
printf "   Avg. Attack: %.2f\n" $avg_attack
echo "===== END SUMMARY ====="


