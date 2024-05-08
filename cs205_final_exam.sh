
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

if [ -z "$1" ]; then
    echo "Usage: $0 datafile.dat"
    exit 1
fi

# store the input file name in a variable
data_file="$1"

# Use awk to calculate the results
read total_pokemon avg_hp avg_attack <<< $(awk 'NR > 1 && $1 != "#" {total++; sum_hp += $6; sum_attack += $7} 
    END {print total, sum_hp/total, sum_attack/total}' "$data_file")

# print the results
echo "===== SUMMARY OF DATA FILE ====="
echo
echo "   File name: $data_file"
echo
echo "   Total Pokemon: $total_pokemon"
echo
printf "   Avg. HP: %.2f\n" "$avg_hp"
echo
printf "   Avg. Attack: %.2f\n" "$avg_attack"
echo
echo "===== END SUMMARY ====="
