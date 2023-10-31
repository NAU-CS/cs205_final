
# Set the input filename as the first argument to the script
file=$1

# Extract the necessary values using awk
totpok=$(awk 'END {print NR}' $file)
avghp=$(awk '{sum+=$7} END {print sum/NR}' $file)
avgat=$(awk '{sum+=$8} END {print sum/NR}' $file)

# Print the report with the calculated values
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $file"
echo "    Total Pokemon: $totpok"
echo "    Avg. HP: $avghp"
echo "    Avg. Attack: $avgat"
echo "===== END SUMMARY ====="
