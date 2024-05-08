#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pokemon_file>"
    exit 1
fi

# Assign the filename from the first argument
file="$1"

# Use awk to calculate the total number of pokemon
total_pokemon=$(awk 'NR>1{count++} END{print count}' "$file")

# Use awk to calculate the average HP and average Attack
avg_hp=$(awk 'NR>1{sum+=$6} END{print sum/NR}' "$file")
avg_attack=$(awk 'NR>1{sum+=$7} END{print sum/NR}' "$file")

# Print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $file"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="