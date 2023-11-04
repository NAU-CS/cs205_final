# Store input file 
input_file="$1"

# Determine the first number of the final line in text file
total_pokemon=$(awk -F'\t' 'END {print $1}' "$input_file")


# Initialize total_hp to 0
total_hp=0

# Calculate total hp of all Pokemon
total_hp=$(awk -F'\t' 'NR > 1 {total += $6} END {print total}' "$input_file")

# Calculate average hp of all Pokemon
average_hp=$((total_hp/total_pokemon))


# Initialize total_atk to 0
total_atk=0

# Calculate total atk of all Pokemon
total_atk=$(awk -F'\t' 'NR > 1 {total += $7} END {print total}' "$input_file")

# Calculate average atk of all Pokemon
average_atk=$((total_atk/total_pokemon))

# Print summary
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name:" $input_file
echo "   Total Pokemon:" $total_pokemon
echo "   Avg. HP:" $average_hp
echo "   Avg. Attack:" $average_atk
echo "===== END SUMMARY ====="
