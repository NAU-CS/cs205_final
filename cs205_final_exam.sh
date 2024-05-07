# TODO: Modify this file to create a shell script that is able to use awk to go through a file formatted like best_pokemon.dat and provides a printed report in the following format (where your script correctly calculates the values that go into the [VALUE] placeholders):
# ===== SUMMARY OF DATA FILE =====
#    File name: [VALUE]
#    Total Pokemon: [VALUE]
#    Avg. HP: [VALUE]
#    Avg. Attack: [VALUE]
# ===== END SUMMARY =====

# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.

# Ensure a file name is provided as a command line argument
if [ -z "$1" ]; then
  echo "Error: No input file provided. Please provide a data file."
  exit 1
fi

# Assign the input file to a variable for easier reference
input_file="$1"

# Calculate the total number of Pokemon entries in the input file
total_pokemon=$(awk 'END {print NR}' "$input_file")

# Calculate the average HP from the third column
avg_hp=$(awk '{ sum += $3 } END { print sum / NR }' "$input_file")

# Calculate the average Attack from the fourth column
avg_attack=$(awk '{ sum += $4 } END { print sum / NR }' "$input_file")

# Generate the report with the correct formatting
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $input_file"
echo "   Total Pokemon: $total_pokemon"
printf "   Avg. HP: %.2f\n" "$avg_hp"
printf "   Avg. Attack: %.2f\n" "$avg_attack"
echo "===== END SUMMARY ====="

