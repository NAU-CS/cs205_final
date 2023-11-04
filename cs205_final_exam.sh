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

# This script takes a file formatted like pokemon.dat as input and calculates summary statistics using awk.

# Get the filename from the first positional parameter
filename=$1

# Use awk to calculate the total number of Pokemon and store it in a variable
total=$(awk 'END {print NR}' $filename)

# Use awk to calculate the average HP and store it in a variable
avg_hp=$(awk '{sum += $5} END {print sum / NR}' $filename)

# Use awk to calculate the average Attack and store it in a variable
avg_attack=$(awk '{sum += $6} END {print sum / NR}' $filename)

# Print the summary report
echo "======= SUMMARY OF $filename ======"
echo "# File name: $filename"
echo "# Total Pokemon: $total"
echo "# Avg. HP: $avg_hp"
echo "# Avg. Attack: $avg_attack"
echo "# ======= END SUMMARY =======#"
