
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

# Check if a filename is passed in under parameter
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pokemon_file>"
    exit 1
fi

# Take the filname and assign it to variable from parameter
file_name="$1"

# Use awk to calculate the total number of mons in the file
total_mons=$(awk 'NR>1{count++} END{print count}' "$file_name")

# Use awk again to calcualte the mean hp values of the total pokemon
mean_hp=$(awk 'NR>1{sum+=$6} END{print sum/NR}' "$file_name")

# Use awk once again to calculate the mean attack values of the total pokemon
mean_attack=$(awk 'NR>1{sum+=$7} END{print sum/NR}' "$file_name")

# Print the computed data to match expected output using echo
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $file_name"
echo "   Total Pokemon: $total_mons"
echo "   Avg. HP: $mean_hp"
echo "   Avg. Attack: $mean_attack"
echo "===== END SUMMARY ====="
