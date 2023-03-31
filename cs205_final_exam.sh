#!/bin/bash

# Get the filename from the first positional parameter
filename=$1

# Calculate the total number of Pokemon
total_pokemon=$(awk 'END {print NR}' $filename)

# Calculate the average HP and attack using awk
avg_hp=$(awk '{sum+=$4} END {print sum/NR}' $filename)
avg_attack=$(awk '{sum+=$5} END {print sum/NR}' $filename)

# Print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $filename"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="