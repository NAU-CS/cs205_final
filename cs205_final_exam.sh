filename="best_pokemon.dat"

if [ ! -f "$filename" ]; then
   echo "File not found: $filename"
   exit 1
fi

total_pokemon=$(wc -l < "$filename")

avg_hp=$(awk -F ',' '{total += $3} END {print total/NR}' "$filename")
avg_attack=$(awk -F ',' '{total += $4} END {print total/NR}' "$filename")

echo "===== SUMMARY OF DATA FILE ====="
echo "      File name: $filename"
echo "      Total Pokemon: $total_pokemon"
echo "      Avg HP: $avg_hp"
echo "      Avg Attack: $avg_attack"
echo "===== END SUMMARY ====="

