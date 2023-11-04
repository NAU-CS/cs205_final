if [ $# -ne 1 ]; then
	echo "Usage: $0 <best_pokemon.dat>"
	exit 1
fi
data_file="$1"
total_pokemon=$(awk 'NR>1 { count++; hp_sum+=$3; attack_sum+=$4 } END { printf("%d", count) }' "best_pokemon.dat")
avg_hp=$(awk 'NR>1 { count++; hp_sum+=$3; attack_sum+=$4 } END { printf("%.2f", hp_sum/ count) }' "best_pokemon.dat")
avg_attack=$(awk 'NR>1 { count++; hp_sum+=$3; attack_sum+=$4 } END { printf("%.2f", attack_sum/ NR) }' "best_pokemon.dat")
echo "===== SUMMARY OF DATA FILE ====="
echo "   File name: best_pokemon.dat"
echo "   Total Pokemon: $total_pokemon"
echo "   Avg. HP: $avg_hp"
echo "   Avg. Attack: $avg_attack"
echo "===== END SUMMARY ====="

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
