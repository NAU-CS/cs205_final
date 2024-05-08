#!/bin/bash

# FInd correct number of arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Input file name
input_file="$1"
file_name=$(basename "$input_file")

# Print the header
echo "===== SUMMARY OF DATA FILE ====="
echo "File name: $file_name"

# awk process
awk '
BEGIN {
    total_hp = 0
    total_attack = 0
    total_defense = 0
    total_speed = 0
    total_count = 0
}

# Process file
NR > 1 {
    # Give format
    split($0, fields, "\t")

    # Input columns from data
    hp = fields[5]
    attack = fields[6]
    defense = fields[7]
    speed = fields[11]

    # Calculate totals
    total_hp += hp
    total_attack += attack
    total_defense += defense
    total_speed += speed
    total_count++
}

END {
    # Total count =0
    if (total_count == 0) {
        print "No data found in the input file."
        exit 1
    }

    # Averages
    avg_hp = total_hp / total_count
    avg_attack = total_attack / total_count
    avg_defense = total_defense / total_count
    avg_speed = total_speed / total_count

    # The final report
    printf("Total Pokemon: %d\n", total_count)
    printf("Avg. HP: %.2f\n", avg_hp)
    printf("Avg. Attack: %.2f\n", avg_attack)
    printf("Avg. Defense: %.2f\n", avg_defense)
    printf("Avg. Speed: %.2f\n", avg_speed)
}' "$input_file"

echo "===== END SUMMARY ====="
