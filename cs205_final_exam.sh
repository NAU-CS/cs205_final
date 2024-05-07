#!/bin/bash


# Assign the filename passed as argument to a variable
file="$1"

# Calculate the total number of Pokemon
total_pokemon=$(awk 'END {print NR}' "$file")

# Calculate the average HP
avg_hp=$(awk '{ total += $6 } END { print total/NR }' "$file")

# Calculate the average Attack
avg_attack=$(awk '{ total += $7 } END { print total/NR }' "$file")

# Print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $file"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
