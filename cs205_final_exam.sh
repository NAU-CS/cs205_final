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

#Create the variable
FILE="$1"
#Calculate everything. HP is the 6th field, attack is the 7th separated by TAB
#First line does not count, so do NR-1 and NR>1
#Total pokemon is all the lines in the file except for the first one.
meanHP=$(awk -F'\'t 'NR > 1 { total += $6 } END {print total/(NR-1) }' "$FILE")
meanAttack=$(awk -F'\t' 'NR > 1 { total += $7 } END { print total/(NR-1) }' "$FILE")
pkmn=$(wc -l < <(tail -n +2 "$FILE"))
#Display the outputs
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $FILE"
echo "    Total Pokemon: $pkmn"
echo "    Avg. HP: $meanHP"
echo "    Avg. Attack: $meanAttack"
echo "===== END SUMMARY ====="

