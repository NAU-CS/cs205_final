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
#!/bin/bash

# Set the file name based on the positional parameter
file_name=$1

# Print the header of the report
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $file_name"

# Count the total number of Pokemon (excluding the header)
total_pokemon=$(awk 'NR>1 {count++} END {print count}' "$file_name")
echo "   Total Pokemon: $total_pokemon"

# Calculate the average HP
avg_hp=$(awk 'NR>1 {total_hp += $2} END {print total_hp/NR}' "$file_name")
echo "   Avg. HP: $avg_hp"

# Calculate the average Attack
avg_attack=$(awk 'NR>1 {total_attack += $3} END {print total_attack/NR}' "$file_name")
echo "   Avg. Attack: $avg_attack"

# Print the footer of the report
echo "===== END SUMMARY ====="
