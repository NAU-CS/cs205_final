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

# This script generates a summary report of a data file formatted like best_pokemon.dat using awk.

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# Assign the filename provided as a positional parameter to a variable
data_file="$1"

# Print the header of the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $data_file"

# Calculate the total number of Pokemon (total lines in the file)
total_pokemon=$(wc -l < "$data_file")
echo "   Total Pokemon: $total_pokemon"

# Calculate the average HP using awk to extract the HP column and calculate the mean
avg_hp=$(awk '{ total += $2 } END { printf "%.2f", total/NR }' "$data_file")
echo "   Avg. HP: $avg_hp"

# Calculate the average Attack using awk to extract the Attack column and calculate the mean
avg_attack=$(awk '{ total += $3 } END { printf "%.2f", total/NR }' "$data_file")
echo "   Avg. Attack: $avg_attack"

# Print the end of the summary report
echo "===== END SUMMARY ====="


