# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
# The data file will be passed into the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.


#!/bin/bash

# Check if a file argument is provided
if [ "$#" -ne 1 ]; then
    echo "$0 requires 1 file as an argument."
    exit 1
fi

# Assign the file name from the argument
file_name="$1"

# Print the summary header
echo "====SUMMARY OF DATA FILE ===="
echo "File name: $file_name"

# Find the total number of lines
total_pokemon=$(awk 'NR > 1 { count++ } END { print count }' "$file_name")
echo "Total Pokemon: $total_pokemon"

# Calculate the average HP
avg_hp=$(awk 'NR > 1 { sum += $5 } END { if (NR > 1) printf "%.2f", sum / (NR - 1) }' "$file_name")
echo "Avg. HP: $avg_hp"

# Calculate the average Attack
avg_attack=$(awk 'NR > 1 { sum += $6 } END { if (NR > 1) printf "%.2f", sum / (NR - 1) }' "$file_name")
echo "Avg. Attack: $avg_attack"

# Print the summary footer
echo "==== END SUMMARY ===="



