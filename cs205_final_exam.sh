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

# Prints the header 
echo "===== SUMMARY OF DATA FILE ====="
# Prints the file name, which is the first argument.
echo "   File name: $1"

# Count the number of Pokemon, skipping the header row. Then, print the total.
total_pokemon=$(awk 'NR>1 {count++} END {print count}' "$1")
echo "   Total Pokemon: $total_pokemon"

# Calculate average HP and print. Changes delimiter to tab. 
# Checks for numeric value with regex. 
avg_hp=$(awk 'BEGIN {FS="\t"} NR>1 {if ($6 ~ /^[0-9]+$/) total += $6; count++} END {if (count > 0) print total/count; else print "N/A"}' "$1")
echo "   Avg. HP: $avg_hp"

# Calculate average attack. Changes delimiter to tab. 
# Checks for numeric value with regex. 
avg_attack=$(awk 'BEGIN {FS="\t"} NR>1 {if ($7 ~ /^[0-9]+$/) total += $7; count++} END {if (count > 0) print total/count; else print "N/A"}' "$1")
echo "   Avg. Attack: $avg_attack"

echo "===== END SUMMARY ====="

