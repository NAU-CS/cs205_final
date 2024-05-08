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

#get filename
filename=$1

#variables to holding needed values
atk_poke_total=$(awk -v '{atk_poke_total+=$7} END {print atk_poke_total}' "$filename")
hp_poke_total=$(awk -v '{hp_poke_total+=$6} END {print hp_poke_total' "$filename")
poke_count=$(awk -v 'BEGIN {poke_count=0} {poke_count++} END {print poke_count}' "$filename")

#variables that hold our avg values
avg_hp=$((hp_poke_total / poke_count))
avg_atk=$((atk_poke_total / poke_count))

#print everything
echo "Filename: $filename"
echo "Total Pokemon: $poke_count"
echo "Avg. HP: $avg_hp"
echo "Avg. Attack: $avg_atk"
