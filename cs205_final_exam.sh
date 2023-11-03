#!/bin/bash

# Assign the file name to a variable
DATA_FILE="$1"

# Calculate the total number of Pokemon, average HP, and average Attack using awk
TOTAL_POKEMON=$(awk -F, 'NR>1 { total+=1 } END { print total }' "$DATA_FILE")
AVG_HP=$(awk -F, 'NR>1 { sum+=$6 } END { printf "%.2f", sum/NR-1 }' "$DATA_FILE")
AVG_ATTACK=$(awk -F, 'NR>1 { sum+=$7 } END { printf "%.2f", sum/NR-1 }' "$DATA_FILE")

# Output the summary
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $DATA_FILE"
echo "   Total Pokemon: $TOTAL_POKEMON"
echo "   Avg. HP: $AVG_HP"
echo "   Avg. Attack: $AVG_ATTACK"
echo "===== END SUMMARY ====="





