echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: $1"
TOTAL= wc --lines 
HEALTH= echo | awk {FS="\t"}/^[0-9]/{sum += $6}END{print sum/(NR -1)} $1 
ATTACK= echo | awk {FS="\t"}/^[0-9]/{sum += $7}END{print sum/(NR -1)} $1


echo "   Total pokemon:$TOTAL " 
# print NR -1 since first line was titles

echo "   Avg. HP: $HEALTH "
# We need the $6 field for health
echo "   Avg. Attack: $ATTACK"
echo"===== END SUMMARY ====="


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
