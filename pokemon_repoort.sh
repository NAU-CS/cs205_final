#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

# Assign the filename provided as the argument to a variable
file="$1"

# Use awk to process the file and calculate summary statistics
awk -F '\t' 'BEGIN {
    totalPokemon = 0
    totalHP = 0
    totalAttack = 0
}

# Process each row of the file
{
    totalPokemon++
    totalHP += $6    
    totalAttack += $7    
}

END {
    # Calculate average values
    avgHP = totalHP / totalPokemon
    avgAttack = totalAttack / totalPokemon

    # Print the summary report
    printf("===== SUMMARY OF DATA FILE =====\n")
    printf("    File name: %s\n", FILENAME)
    printf("    Total Pokemon: %d\n", totalPokemon)
    printf("    Avg. HP: %.2f\n", avgHP)
    printf("    Avg. Attack: %.2f\n", avgAttack)
    printf("===== END SUMMARY =====\n")
}' "$file"

