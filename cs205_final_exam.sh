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

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Get the input file name
input_file="$1"
file_name=$(basename "$input_file")

# Print the header
echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $file_name"

# awk to process the file
awk '
BEGIN {
    total_hp = 0
    total_attack = 0
    total_defense = 0
    total_speed = 0
    total_count = 0
}

# Process lines of the file
NR > 1 {
    # Assuming the format of each line in the input file is: #,Name,Type 1,Type 2,...,Speed,Generation,Legendary
    # Split the line by tabs
    split($0, fields, "\t")

    # Extract the values of interest
    hp = fields[5]
    attack = fields[6]
    defense = fields[7]
    speed = fields[11]

    # Calculate cumulative totals
    total_hp += hp
    total_attack += attack
    total_defense += defense
    total_speed += speed
    total_count++
}

END {
    # Check if total_count is zero to avoid division by zero
    if (total_count == 0) {
        print "No data found in the input file."
        exit 1
    }

    # Calculate averages
    avg_hp = total_hp / total_count
    avg_attack = total_attack / total_count
    avg_defense = total_defense / total_count
    avg_speed = total_speed / total_count

    # Print the report
    printf("Total Pokemon: %d\n", total_count)
    printf("Avg. HP: %.2f\n", avg_hp)
    printf("Avg. Attack: %.2f\n", avg_attack)
    printf("Avg. Defense: %.2f\n", avg_defense)
    printf("Avg. Speed: %.2f\n", avg_speed)
}' "$input_file"

echo "===== END SUMMARY ====="
