#!/bin/bash

# Check if the correct number of arguments (1) is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# Extract the data file name from the command-line argument
data_file="$1"

# Calculate the summary statistics using awk
total_pokemon=$(awk 'END { print NR }' "$data_file")
avg_hp=$(awk '{ sum += $2 } END { printf("%.2f", sum/NR) }' "$data_file")
avg_attack=$(awk '{ sum += $3 } END { printf("%.2f", sum/NR) }' "$data_file")

# Print the summary report
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $data_file"
echo "    Total Pokemon: $total_pokemon"
echo "    Avg. HP: $avg_hp"
echo "    Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="
