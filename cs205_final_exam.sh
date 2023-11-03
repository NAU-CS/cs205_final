#!/bin/bash

# Check if the user provided a file as a command line argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# Get the filename from the command line argument
data_file="$1"

# Use awk to calculate the total, average HP, and average Attack values
awk -F'\t' '
    BEGIN {
        # Initialize variables
        total_pokemon = 0
        total_hp = 0
        total_attack = 0
    }
    NR > 1 {
        # Skip the header line
        total_pokemon++
        total_hp += $6  # HP column
        total_attack += $7  # Attack column
    }
    END {
        if (total_pokemon > 0) {
            # Calculate the averages
            avg_hp = total_hp / total_pokemon
            avg_attack = total_attack / total_pokemon
        } else {
            avg_hp = 0
            avg_attack = 0
        }

        # Print the summary report
        printf("===== SUMMARY OF DATA FILE =====\n")
        printf("   File name: %s\n", ARGV[1])
        printf("   Total Pokemon: %d\n", total_pokemon)
        printf("   Avg. HP: %.2f\n", avg_hp)
        printf("   Avg. Attack: %.2f\n", avg_attack)
        printf("===== END SUMMARY =====\n")
    }
' "$data_file"

