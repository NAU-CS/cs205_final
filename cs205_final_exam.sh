#!/bin/bash

# Purpose: Check if a file is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# Purpose: Store the file name passed as argument
file_name="$1"

# Purpose: Print the header for the summary
echo "===== SUMMARY OF DATA FILE ====="
echo -n "   File name: "
echo "[${file_name}]"

# Purpose: Calculate and print total number of Pokemon
total_pokemon=$(awk 'END {print NR}' "$file_name")
echo "   Total Pokemon: ${total_pokemon}"

# Purpose: Calculate and print average HP
avg_hp=$(awk '{sum += $5} END {print sum/NR}' "$file_name")
echo "   Avg. HP: ${avg_hp}"

# Purpose: Calculate and print average Attack
avg_attack=$(awk '{sum += $4} END {print sum/NR}' "$file_name")
echo "   Avg. Attack: ${avg_attack}"

# Purpose: Print end of summary
echo "===== END SUMMARY ====="