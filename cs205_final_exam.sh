#!/bin/bash

# Ensure that a file path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Error: No input file provided."
    echo "Usage: $0 <input_file>"
    exit 1
fi

# Extract the input file path from command line arguments
input_file="$1"

# Calculate summary statistics using awk
summary=$(awk -F',' '
    BEGIN {
        total_pokemon = 0
        total_hp = 0
        total_attack = 0
    }
    NR > 1 {
        total_pokemon++
        total_hp += $2  # Assuming HP is in the second column
        total_attack += $3  # Assuming Attack is in the third column
    }
    END {
        avg_hp = (total_hp / total_pokemon)
        avg_attack = (total_attack / total_pokemon)

        # Print the summary report
        printf("# ===== SUMMARY OF DATA FILE =====\n")
        printf("#    File name: %s\n", FILENAME)
        printf("#    Total Pokemon: %d\n", total_pokemon)
        printf("#    Avg. HP: %.2f\n", avg_hp)
        printf("#    Avg. Attack: %.2f\n", avg_attack)
        printf("# ===== END SUMMARY =====\n")
    }
' "$input_file")

# Print the summary
echo "$summary"
