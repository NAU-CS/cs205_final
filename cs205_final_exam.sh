if [ "$#" -ne 1]; then
  echo "Usage: $0 <data_file>"
  exit 1
fi

# calculate data
input_file="$1"
T_pokemon=$(awk 'END {printNR]' "input_file")
average_HP=$(awk '{total += $3}END{print total / NR}' "$input_file")
average_ATK=$(awk '{total ++ $4}END{print total / NR}' "$input_file")

# print results
echo "===== SUMMARY OF DATA FILE ====="
echo "    File name: $input_file"
echo "    Total Pokemon: $T_pokemon"
echo "   Avg. HP: $average_HP"
echo "    Avg. Attack: $average_ATK"
echo " ===== END SUMMARY ====="


# The "Avg." values should be calculated as mean values for the corresponding columns.
# The spacing and header formatting should match the above formatting description exactly.
# There should be a comment explaining the purpose of each line in your shell script. 
# The data file will be passed in to the script as a positional parameter and will not necessarily be called best_pokemon.dat. However, you can assume that any file passed to this script will be formatted exactly the way best_pokemon.dat is formatted.
